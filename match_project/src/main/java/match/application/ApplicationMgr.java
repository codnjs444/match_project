package match.application;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import match.DBConnectionMgr;

public class ApplicationMgr {

	private DBConnectionMgr pool;

	public ApplicationMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	// 특정 관리자가 등록한 모든 공고에 대한 각각의 지원 이력서(resume_idx) 수를 ArrayList로 반환하는 Mgr
	public ArrayList<Integer> ResumeNum(String manager_id, String posting_status) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> resumeCounts = new ArrayList<>();

		try {
			con = pool.getConnection();
			// 모든 공고의 posting_idx를 조회하는 쿼리
			String sql = "SELECT p.posting_idx FROM posting p WHERE p.manager_id = ? AND p.posting_status = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, manager_id);
			pstmt.setString(2, posting_status);
			rs = pstmt.executeQuery();

			// 각 posting_idx에 대해 application 테이블에서 resume_idx의 개수를 카운트
			while (rs.next()) {
				int postingIdx = rs.getInt("posting_idx");
				PreparedStatement pstmtCount = con.prepareStatement(
						"SELECT COUNT(resume_idx) AS resume_count FROM application WHERE posting_idx = ?");
				pstmtCount.setInt(1, postingIdx);
				ResultSet rsCount = pstmtCount.executeQuery();

				if (rsCount.next()) {
					int resumeCount = rsCount.getInt("resume_count");
					resumeCounts.add(resumeCount); // 각 공고에 대한 지원 이력서 수를 리스트에 추가
				}
				rsCount.close();
				pstmtCount.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return resumeCounts;
	}

	// 특정 posting_idx에 해당하고 주어진 procedure 값인 user_id의 값을 조회하는 메서드
	public List<String> searchUserId(String posting_idx, int procedure) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> userIds = new ArrayList<>(); // 결과를 저장할 List 객체 초기화
		try {
			con = pool.getConnection();

			// SQL 쿼리에서 procedure를 매개변수로 받은 값으로 비교하도록 수정
			String sql = "SELECT user_id FROM application_result WHERE posting_idx=? AND procedure_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			pstmt.setInt(2, procedure); // procedure 매개변수 설정
			rs = pstmt.executeQuery();
			while (rs.next()) {
				userIds.add(rs.getString("user_id")); // ResultSet에서 user_id를 가져와 List에 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return userIds; // 조회된 user_id 목록 반환
	}

	public List<String> getSortedUserIdsByApplicationDate(String posting_idx, List<String> userIds) {
		if (userIds == null || userIds.isEmpty()) {
			// 유저 ID 리스트가 null이거나 비어 있을 경우, 비어 있는 리스트 반환
			return new ArrayList<>();
		}

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> sortedUserIds = new ArrayList<>();
		try {
			con = pool.getConnection();

			// SQL 쿼리 구성. IN 절에 사용자 ID 목록을 동적으로 삽입
			StringBuilder userIdParams = new StringBuilder();
			for (int i = 0; i < userIds.size(); i++) {
				userIdParams.append("?,");
			}
			userIdParams.deleteCharAt(userIdParams.length() - 1); // 마지막 쉼표 제거

			String query = "SELECT user_id FROM application WHERE posting_idx = ? AND user_id IN ("
					+ userIdParams.toString() + ") ORDER BY application_datetime ASC";

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, posting_idx);
			int index = 2; // 첫 번째 인덱스는 posting_idx에 할당됨
			for (String userId : userIds) {
				pstmt.setString(index++, userId);
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				sortedUserIds.add(rs.getString("user_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return sortedUserIds;
	}

	public List<Integer> getResumeIdxsByUserIds(String posting_idx, List<String> userIds) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Integer> resumeIdxs = new ArrayList<>(); // 결과를 저장할 List 객체 초기화
		try {
			con = pool.getConnection();

			// userIds 목록을 순회하며 각 userId에 대한 resume_idx를 조회
			for (String userId : userIds) {
				String sql = "SELECT resume_idx FROM application WHERE posting_idx=? AND user_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, posting_idx);
				pstmt.setString(2, userId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					resumeIdxs.add(rs.getInt("resume_idx")); // ResultSet에서 resume_idx를 가져와 List에 추가
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return resumeIdxs; // 조회된 resume_idx 목록 반환
	}

	public Map<String, String> getUserNamesByUserIds(List<String> userIds) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<String, String> userNames = new HashMap<>();

		if (userIds == null || userIds.isEmpty()) {
			return userNames; // 비어 있는 리스트로 메서드가 호출되면, 빈 Map을 반환
		}

		try {
			con = pool.getConnection();
			String placeholders = userIds.stream().map(id -> "?").collect(Collectors.joining(","));
			String sql = "SELECT user_id, user_name FROM user WHERE user_id IN (" + placeholders + ")";
			pstmt = con.prepareStatement(sql);

			int index = 1;
			for (String userId : userIds) {
				pstmt.setString(index++, userId);
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				userNames.put(rs.getString("user_id"), rs.getString("user_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return userNames;
	}

	public Map<String, String> getUserGendersByUserIds(List<String> userIds) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<String, String> userGenders = new HashMap<>();

		if (userIds == null || userIds.isEmpty()) {
			return userGenders; // 비어 있는 리스트로 메서드가 호출되면, 빈 Map을 반환
		}

		try {
			con = pool.getConnection();
			String placeholders = userIds.stream().map(id -> "?").collect(Collectors.joining(","));
			String sql = "SELECT user_id, user_gender FROM user WHERE user_id IN (" + placeholders + ")";
			pstmt = con.prepareStatement(sql);

			int index = 1;
			for (String userId : userIds) {
				pstmt.setString(index++, userId);
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				String gender = rs.getString("user_gender");
				userGenders.put(rs.getString("user_id"), "1".equals(gender) ? "남성" : "여성");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return userGenders;
	}

	public List<String> determineCareerStatusByResumeIdxs(List<Integer> resumeIdxs) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> careerStatusList = new ArrayList<>(); // 결과를 저장할 List 객체 초기화
		try {
			con = pool.getConnection();

			// resumeIdxs 목록을 순회하며 각 resume_idx에 대한 career_cname이 있는지 확인
			for (Integer resumeIdx : resumeIdxs) {
				String sql = "SELECT COUNT(*) AS count FROM career WHERE resume_idx=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, resumeIdx);
				rs = pstmt.executeQuery();
				if (rs.next() && rs.getInt("count") > 0) {
					// career 테이블에 해당 resume_idx에 대한 career_cname이 하나라도 있으면 "경력"
					careerStatusList.add("경력");
				} else {
					// career 테이블에 해당 resume_idx에 대한 정보가 없으면 "신입"
					careerStatusList.add("신입");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return careerStatusList; // 조회된 경력 상태 ("경력" 또는 "신입") 목록 반환
	}

	public List<String> getEduMajorsByResumeIdxs(List<Integer> resumeIdxs) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> eduMajorsList = new ArrayList<>(); // 결과를 저장할 List 객체 초기화

		try {
			con = pool.getConnection();

			// resumeIdxs 목록을 순회하며 각 resume_idx에 대한 edu_major 조회
			for (Integer resumeIdx : resumeIdxs) {
				String sql = "SELECT edu_major FROM edu WHERE resume_idx=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, resumeIdx);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// edu 테이블에 해당 resume_idx에 대한 edu_major 값이 있으면 추가
					String eduMajor = rs.getString("edu_major");
					eduMajorsList.add(eduMajor != null ? eduMajor : "고등학교 졸업"); // null 체크
				} else {
					// edu 테이블에 해당 resume_idx에 대한 edu_major 값이 없으면 "전공 없음"
					eduMajorsList.add("고등학교 졸업");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (con != null)
				pool.freeConnection(con);
		}

		return eduMajorsList; // 조회된 전공 목록 반환
	}

	public Map<Integer, List<String>> getCertificateSNamesByResumeIdxs(List<Integer> resumeIdxs) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 결과를 저장할 Map 객체 초기화 (resume_idx를 키로 하고, 해당 resume_idx의 모든 자격증 이름 리스트를 값으로 가짐)
		Map<Integer, List<String>> certificateSNameMap = new HashMap<>();

		try {
			con = pool.getConnection();
			// 모든 resumeIdx에 대해 반복
			for (Integer resumeIdx : resumeIdxs) {
				String sql = "SELECT certificate_sname FROM certificate WHERE resume_idx=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, resumeIdx);
				rs = pstmt.executeQuery();
				List<String> names = new ArrayList<>();
				while (rs.next()) {
					names.add(rs.getString("certificate_sname"));
				}
				// 해당 resumeIdx에 자격증이 없는 경우, "자격증 없음"으로 표시
				if (names.isEmpty()) {
					names.add("자격증 없음");
				}
				certificateSNameMap.put(resumeIdx, names);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (con != null)
				pool.freeConnection(con);
		}

		return certificateSNameMap; // 조회된 자격증 명칭 목록 반환
	}

	public Map<Integer, List<String>> getPortfolioNamesByResumeIdxs(List<Integer> resumeIdxs) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 결과를 저장할 Map 객체 초기화 (resume_idx를 키로 하고, 해당 resume_idx의 모든 포트폴리오 이름 리스트를 값으로
		// 가짐)
		Map<Integer, List<String>> portfolioNameMap = new HashMap<>();

		try {
			con = pool.getConnection();
			// 모든 resumeIdx에 대해 반복
			for (Integer resumeIdx : resumeIdxs) {
				String sql = "SELECT portfolio_name FROM portfolio WHERE resume_idx=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, resumeIdx);
				rs = pstmt.executeQuery();
				List<String> names = new ArrayList<>();
				while (rs.next()) {
					names.add(rs.getString("portfolio_name"));
				}
				// 해당 resumeIdx에 포트폴리오가 없는 경우, "포트폴리오 없음"으로 표시
				if (names.isEmpty()) {
					names.add("포트폴리오 없음");
				}
				portfolioNameMap.put(resumeIdx, names);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (con != null)
				pool.freeConnection(con);
		}

		return portfolioNameMap; // 조회된 포트폴리오 명칭 목록 반환
	}

	public Map<Integer, List<String>> getSkillSNamesByResumeIdxs(List<Integer> resumeIdxs) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<Integer, List<String>> skillSNameMap = new HashMap<>();

		if (resumeIdxs == null || resumeIdxs.isEmpty()) {
			return skillSNameMap; // 비어 있는 리스트로 메서드가 호출되면, 빈 Map을 반환
		}

		try {
			con = pool.getConnection();
			String inSql = String.join(",", Collections.nCopies(resumeIdxs.size(), "?"));
			String sql = "SELECT resume_idx, skill_sname FROM skill WHERE resume_idx IN (" + inSql + ")";
			pstmt = con.prepareStatement(sql);

			int index = 1;
			for (Integer resumeIdx : resumeIdxs) {
				pstmt.setInt(index++, resumeIdx);
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				int resumeIdx = rs.getInt("resume_idx");
				String skillSName = rs.getString("skill_sname");

				skillSNameMap.computeIfAbsent(resumeIdx, k -> new ArrayList<>()).add(skillSName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return skillSNameMap;
	}

	public List<String> getLanguageNamesByResumeIdxs(List<Integer> resumeIdxs) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> languageNameList = new ArrayList<>(); // 결과를 저장할 List 객체 초기화
		try {
			con = pool.getConnection();

			// resumeIdxs 목록을 순회하며 각 resume_idx에 대한 language_name 조회
			for (Integer resumeIdx : resumeIdxs) {
				String sql = "SELECT language_name FROM language WHERE resume_idx=? LIMIT 1";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, resumeIdx);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// language 테이블에 해당 resume_idx에 대한 language_name 값이 있으면 추가
					languageNameList.add(rs.getString("language_name"));
				} else {
					// language 테이블에 해당 resume_idx에 대한 정보가 없으면 "해당 사항 없음" 처리
					languageNameList.add("해당 사항 없음");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (con != null)
				pool.freeConnection(con);
		}
		return languageNameList; // 조회된 언어 명칭 목록 반환
	}

	public List<String> getApplicationLikesByResumeIdxs(List<Integer> resumeIdxs, int posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> applicationLikeList = new ArrayList<>(); // 결과를 저장할 List 객체 초기화
		try {
			con = pool.getConnection();

			// resumeIdxs 목록을 순회하며 각 resume_idx에 대한 application_like 조회
			for (Integer resumeIdx : resumeIdxs) {
				String sql = "SELECT application_like FROM application WHERE resume_idx=? AND posting_idx=? LIMIT 1";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, resumeIdx);
				pstmt.setInt(2, posting_idx); // posting_idx 조건 추가
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// application 테이블에 해당 resume_idx에 대한 application_like 값이 있으면 추가
					applicationLikeList.add(rs.getString("application_like"));
				} else {
					// application 테이블에 해당 resume_idx와 posting_idx에 대한 정보가 없으면 "없음" 처리
					applicationLikeList.add("없음");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (con != null)
				pool.freeConnection(con);
		}
		return applicationLikeList; // 조회된 application_like 목록 반환
	}

	public void updateApplicationLikeByResumeIdx(Integer resumeIdx, int posting_idx, String applicationLike) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = pool.getConnection();
			String sql = "UPDATE application SET application_like=? WHERE resume_idx=? AND posting_idx=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, applicationLike); // 새로운 application_like 상태
			pstmt.setInt(2, resumeIdx); // 대상 resume_idx
			pstmt.setInt(3, posting_idx);

			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected > 0) {
			} else {
				// 해당하는 resume_idx가 없는 경우, 로직에 따라 처리 (예: 로깅)
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (con != null)
				pool.freeConnection(con);
		}
	}

	public List<String> getApplicationIgnoreByResumeIdxs(List<Integer> resumeIdxs, int posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> applicationIgnoreList = new ArrayList<>(); // 결과를 저장할 List 객체 초기화
		try {
			con = pool.getConnection();

			// resumeIdxs 목록이 비어있는 경우를 처리
			if (resumeIdxs == null || resumeIdxs.isEmpty()) {
				// 목록이 비어 있다면 빈 결과를 반환합니다.
				return applicationIgnoreList;
			}

			// resumeIdxs 목록을 순회하며 각 resume_idx에 대한 application_ignore 조회
			for (Integer resumeIdx : resumeIdxs) {
				String sql = "SELECT application_ignored FROM application WHERE resume_idx=? AND posting_idx=? LIMIT 1";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, resumeIdx);
				pstmt.setInt(2, posting_idx); // posting_idx 조건 추가
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// application 테이블에 해당 resume_idx에 대한 application_ignore 값이 있으면 추가
					String ignore = rs.getString("application_ignored");
					applicationIgnoreList.add(ignore != null ? ignore : "no");
				} else {
					// application 테이블에 해당 resume_idx에 대한 정보가 없으면 "no" 처리
					applicationIgnoreList.add("no");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (con != null)
				pool.freeConnection(con);
		}
		return applicationIgnoreList; // 조회된 application_ignore 목록 반환
	}

	public void updateApplicationIgnoredByResumeIdx(Integer resumeIdx, int posting_idx, String applicationIgnored) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = pool.getConnection();
			String sql = "UPDATE application SET application_ignored=? WHERE resume_idx=? AND posting_idx=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, applicationIgnored); // 새로운 application_like 상태
			pstmt.setInt(2, resumeIdx); // 대상 resume_idx
			pstmt.setInt(3, posting_idx); // 대상 resume_idx

			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected > 0) {
			} else {
				// 해당하는 resume_idx가 없는 경우, 로직에 따라 처리 (예: 로깅)
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (con != null)
				pool.freeConnection(con);
		}
	}

	// 특정 게시물에 대한 지원서(이력서)의 개수를 찾는 매니저
	public int countResumesForPost(int posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int resumeCount = 0;

		try {
			con = pool.getConnection();
			String sql = "SELECT COUNT(resume_idx) AS total FROM application WHERE posting_idx = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, posting_idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				resumeCount = rs.getInt("total");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return resumeCount;
	}

	public List<String> getApplicationSResultByResumeIdxs(List<Integer> resumeIdxs, int posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> applicationSResultList = new ArrayList<>(); // 결과를 저장할 List 객체 초기화
		try {
			con = pool.getConnection();

			// resumeIdxs 목록이 비어있는 경우를 처리
			if (resumeIdxs == null || resumeIdxs.isEmpty()) {
				// 목록이 비어 있다면 빈 결과를 반환합니다.
				return applicationSResultList;
			}

			// resumeIdxs 목록을 순회하며 각 resume_idx에 대한 application_sresult 조회
			for (Integer resumeIdx : resumeIdxs) {
				String sql = "SELECT application_sresult FROM application WHERE resume_idx=? AND posting_idx=? LIMIT 1";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, resumeIdx);
				pstmt.setInt(2, posting_idx);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// application 테이블에 해당 resume_idx에 대한 application_sresult 값이 있으면 추가
					String sResult = rs.getString("application_sresult");
					applicationSResultList.add(sResult != null ? sResult : "미분류");
				} else {
					// application 테이블에 해당 resume_idx에 대한 정보가 없으면 "미분류" 처리
					applicationSResultList.add("미분류");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (con != null)
				pool.freeConnection(con);
		}
		return applicationSResultList; // 조회된 application_sresult 목록 반환
	}

	public void updateApplicationReultByResumeIdx(Integer resumeIdx, int posting_idx, String sresult) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = pool.getConnection();
			String sql = "UPDATE application SET application_sresult=? WHERE resume_idx=? AND posting_idx=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sresult); // 새로운 application_like 상태
			pstmt.setInt(2, resumeIdx); // 대상 resume_idx
			pstmt.setInt(3, posting_idx); // 대상 resume_idx

			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected > 0) {
			} else {
				// 해당하는 resume_idx가 없는 경우, 로직에 따라 처리 (예: 로깅)
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			if (con != null)
				pool.freeConnection(con);
		}
	}

	// 합격한 사용자의 ID 목록을 받아 해당 사용자들의 이메일 주소를 조회하는 메소드
	public List<String> searchPassedUserEmails(List<String> passedUserIds) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> userEmails = new ArrayList<>(); // 결과를 저장할 리스트 초기화

		try {
			con = pool.getConnection(); // 커넥션 풀에서 커넥션을 가져옴

			// IN 절에 들어갈 사용자 ID 목록 생성
			StringBuilder builder = new StringBuilder();
			for (int i = 0; i < passedUserIds.size(); i++) {
				builder.append("?");
				if (i < passedUserIds.size() - 1) {
					builder.append(",");
				}
			}

			String sql = "SELECT user_email FROM user WHERE user_id IN (" + builder.toString() + ")";
			pstmt = con.prepareStatement(sql);

			// PreparedStatement에 사용자 ID 값 설정
			int index = 1;
			for (String userId : passedUserIds) {
				pstmt.setString(index++, userId);
			}

			rs = pstmt.executeQuery(); // 쿼리 실행

			// 조회 결과 처리
			while (rs.next()) {
				userEmails.add(rs.getString("user_email")); // 결과 리스트에 이메일 주소 추가
			}
		} catch (Exception e) {
			e.printStackTrace(); // 예외 처리
		} finally {
			pool.freeConnection(con, pstmt, rs); // 리소스 반환
		}

		return userEmails; // 조회된 이메일 주소 리스트 반환
	}

	public void closePostingByPostingIdx(int postingIdx) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = pool.getConnection();
			String sql = "UPDATE posting SET posting_status='마감' WHERE posting_idx=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postingIdx); // 대상 posting_idx

			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected > 0) {
				// 성공적으로 업데이트 됐을 때의 로직 (예: 로깅 또는 사용자에게 성공 메시지 전달)
			} else {
				// 해당하는 posting_idx가 없는 경우, 로직에 따라 처리 (예: 로깅 또는 오류 메시지 전달)
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			}
			if (con != null)
				pool.freeConnection(con);
		}
	}

	public void insertApplicationResults(List<String> userIds, int postingIdx, int procedureNum) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = pool.getConnection();
			// application_result 테이블에 새로운 레코드를 삽입하는 SQL 쿼리
			String sql = "INSERT INTO application_result (user_id, posting_idx, procedure_num, result_status) VALUES (?, ?, ?, '심사중')";

			// Auto-commit을 비활성화하여 모든 삽입이 성공적으로 수행된 후에만 커밋될 수 있도록 함
			con.setAutoCommit(false);

			pstmt = con.prepareStatement(sql);

			// 각 사용자 ID마다 INSERT 쿼리 실행
			for (String userId : userIds) {
				pstmt.setString(1, userId);
				pstmt.setInt(2, postingIdx);
				pstmt.setInt(3, procedureNum + 1); // procedure_num의 +1

				pstmt.addBatch(); // 배치에 추가
			}

			int[] rowsAffected = pstmt.executeBatch(); // 배치 실행

			// 모든 삽입이 성공적으로 수행되었는지 확인
			boolean allInserted = true;
			for (int affected : rowsAffected) {
				if (affected != 1) { // 삽입되지 않은 레코드가 있다면
					allInserted = false;
					break;
				}
			}

			if (allInserted) {
				con.commit(); // 모든 삽입이 성공했다면 커밋
			} else {
				con.rollback(); // 하나라도 실패했다면 롤백
				// 삽입 실패 로직 처리 (예: 로깅)
			}
		} catch (Exception e) {
			try {
				if (con != null)
					con.rollback(); // 예외 발생 시 롤백
			} catch (SQLException ex) {
				// 롤백 실패 처리 (예: 로깅)
			}
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			}
			if (con != null) {
				try {
					pool.freeConnection(con);
				} catch (Exception e) {
					/* Ignored */ }
			}
		}
	}

	public void updateApplicationResultsToFinalSelection(List<String> userIds, int postingIdx, int procedureNum) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = pool.getConnection();
			// application_result 테이블의 레코드를 업데이트하는 SQL 쿼리
			String sql = "UPDATE application_result SET result_status='최종 합격' WHERE user_id=? AND posting_idx=? AND procedure_num=?";

			// Auto-commit을 비활성화하여 모든 업데이트가 성공적으로 수행된 후에만 커밋될 수 있도록 함
			con.setAutoCommit(false);

			pstmt = con.prepareStatement(sql);

			// 각 사용자 ID마다 UPDATE 쿼리 실행
			for (String userId : userIds) {
				pstmt.setString(1, userId);
				pstmt.setInt(2, postingIdx);
				pstmt.setInt(3, procedureNum);

				pstmt.addBatch(); // 배치에 추가
			}

			int[] rowsAffected = pstmt.executeBatch(); // 배치 실행

			// 모든 업데이트가 성공적으로 수행되었는지 확인
			boolean allUpdated = true;
			for (int affected : rowsAffected) {
				if (affected != 1) { // 업데이트되지 않은 레코드가 있다면
					allUpdated = false;
					break;
				}
			}

			if (allUpdated) {
				con.commit(); // 모든 업데이트가 성공했다면 커밋
			} else {
				con.rollback(); // 하나라도 실패했다면 롤백
				// 업데이트 실패 로직 처리 (예: 로깅)
			}
		} catch (Exception e) {
			try {
				if (con != null)
					con.rollback(); // 예외 발생 시 롤백
			} catch (SQLException ex) {
				// 롤백 실패 처리 (예: 로깅)
			}
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* Ignored */ }
			}
			if (con != null) {
				try {
					pool.freeConnection(con);
				} catch (Exception e) {
					/* Ignored */ }
			}
		}
	}

	// updateApplicationDate 메서드 정의
	public boolean updateApplicationDate(int postingIdx, String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean updateSuccess = false; // 업데이트 성공 여부를 저장할 변수

		try {
			con = pool.getConnection();

			// SQL 쿼리 작성
			String sql = "UPDATE application SET application_datetime = CURRENT_TIMESTAMP " + // 현재 시간을 직접 SQL에서 설정
					"WHERE posting_idx = ? AND user_id = ?";

			// PreparedStatement 객체 생성
			pstmt = con.prepareStatement(sql);

			// 매개변수 설정
			pstmt.setInt(1, postingIdx);
			pstmt.setString(2, userId);

			// 쿼리 실행
			int rowsAffected = pstmt.executeUpdate();

			// 업데이트 성공 여부 체크
			if (rowsAffected > 0) {
				System.out.println("application_date 업데이트 성공!");
				updateSuccess = true; // 성공 시 true 반환
			} else {
				System.out.println("해당하는 행이 없거나 업데이트가 실패했습니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 리소스 해제
			pool.freeConnection(con, pstmt);
		}
		return updateSuccess; // 업데이트 성공 여부 반환
	}

	public boolean updateApplicationDateUp(int postingIdx, String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean updateSuccess = false; // 업데이트 성공 여부를 저장할 변수

		try {
			con = pool.getConnection();

			String sql = "UPDATE application SET application_datetime = (" + "SELECT new_date FROM ("
					+ "SELECT DATE_SUB(MIN(application_datetime), INTERVAL 1 YEAR) AS new_date "
					+ "FROM application WHERE posting_idx = ?) AS sub) " + "WHERE posting_idx = ? AND user_id = ?";

			pstmt = con.prepareStatement(sql);

			// Set the first parameter in the subquery
			pstmt.setInt(1, postingIdx);
			// Set the second parameter in the WHERE clause
			pstmt.setInt(2, postingIdx);
			// Set the user_id
			pstmt.setString(3, userId);

			int rowsAffected = pstmt.executeUpdate();

			if (rowsAffected > 0) {
				updateSuccess = true;
				System.out.println("Application date updated successfully!");
			} else {
				System.out.println("No rows updated. Check if the user and posting index are correct.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					/* ignored */ }
			if (con != null)
				pool.freeConnection(con);
		}
		return updateSuccess;
	}

	public int getMaxProcedureNum(int postingIdx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxProcedureNum = 0; // 기본값 설정

		try {
			con = pool.getConnection(); // 커넥션 풀에서 연결 객체 얻기

			String query = "SELECT MAX(procedure_num) AS max_proc_num FROM application_result WHERE posting_idx = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, postingIdx);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxProcedureNum = rs.getInt("max_proc_num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs); // 자원 반납
		}

		return maxProcedureNum;
	}

	public String getProcedureNameByMaxNum(int postingIdx, int maxProcedureNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String procedureName = null; // 기본값은 null

		try {
			con = pool.getConnection(); // 커넥션 풀에서 연결 객체 얻기

			String query = "SELECT procedure_name FROM `procedure` " + "WHERE posting_idx = ? AND procedure_num = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, postingIdx);
			pstmt.setInt(2, maxProcedureNum);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				procedureName = rs.getString("procedure_name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs); // 자원 반납
		}

		return procedureName;
	}

	public void saveMemo(int postingIdx, String userId, String memo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection(); // 커넥션 풀에서 연결 객체를 얻어옵니다.

			// 기존 레코드 확인을 위한 SELECT 쿼리 실행
			String selectQuery = "SELECT * FROM application_memo WHERE posting_idx = ? AND user_id = ?";
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setInt(1, postingIdx);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) { // 기존 레코드가 존재한다면 업데이트
				String updateQuery = "UPDATE application_memo SET memo = ? WHERE posting_idx = ? AND user_id = ?";
				pstmt = con.prepareStatement(updateQuery);
				pstmt.setString(1, memo);
				pstmt.setInt(2, postingIdx);
				pstmt.setString(3, userId);
				pstmt.executeUpdate(); // SQL 문 실행
			} else { // 기존 레코드가 존재하지 않는다면 삽입
				String insertQuery = "INSERT INTO application_memo (posting_idx, user_id, memo) VALUES (?, ?, ?)";
				pstmt = con.prepareStatement(insertQuery);
				pstmt.setInt(1, postingIdx);
				pstmt.setString(2, userId);
				pstmt.setString(3, memo);
				pstmt.executeUpdate(); // SQL 문 실행
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					pool.freeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean checkMemoExists(int postingIdx, String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean exists = false;

		try {
			con = pool.getConnection(); // 커넥션 풀에서 연결 객체를 얻어옵니다.

			String query = "SELECT COUNT(*) FROM application_memo WHERE posting_idx = ? AND user_id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, postingIdx);
			pstmt.setString(2, userId);

			rs = pstmt.executeQuery(); // SQL 문 실행
			if (rs.next() && rs.getInt(1) > 0) {
				exists = true; // 결과가 존재하면 true
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs); // 커넥션 풀에 자원 반납
		}

		return exists;
	}

	public String getMemo(int postingIdx, String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String memo = null; // 메모가 없을 경우 기본값은 null

		try {
			con = pool.getConnection(); // 데이터베이스 커넥션 풀에서 커넥션 얻기

			String query = "SELECT memo FROM application_memo WHERE posting_idx = ? AND user_id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, postingIdx);
			pstmt.setString(2, userId);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				memo = rs.getString("memo"); // 결과가 있으면 메모 내용을 가져옴
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs); // 자원 반환
		}

		return memo; // 메모 내용 반환, 결과가 없으면 null 반환
	}

	public void deleteMemo(int postingIdx, String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = pool.getConnection(); // 커넥션 풀에서 연결 객체를 얻어옵니다.

			String query = "DELETE FROM application_memo WHERE posting_idx = ? AND user_id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, postingIdx);
			pstmt.setString(2, userId);

			pstmt.executeUpdate(); // SQL 문 실행
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt); // 커넥션 풀에 자원 반납
		}
	}

}
