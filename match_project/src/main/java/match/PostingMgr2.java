package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import match.posting.OpenPositionBean;
import match.posting.QualificationBean;
import match.posting.WelfareBean;
import match.posting.adddocumentBean;
import match.posting.addquestionBean;
import match.posting.applicationBean;
import match.posting.application_periodBean;
import match.posting.environmentBean;
import match.posting.procedureBean;

public class PostingMgr2 {
	private DBConnectionMgr pool;

	public PostingMgr2() {
		pool = DBConnectionMgr.getInstance();
	}

	// 공고 넣는 Mgr
	public int insertBpost(PostingBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 삽입된 행의 자동 생성된 키를 검색하기 위한 ResultSet
		String sql = null;
		int generatedKey = 0; // 생성된 posting_idx 값을 저장할 변수
		try {
			con = pool.getConnection();
			sql = "INSERT INTO posting VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
			pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, bean.getManager_id());
			pstmt.setString(2, bean.getPosting_type());
			pstmt.setString(3, bean.getPosting_cname());
			pstmt.setString(4, bean.getPosting_name());
			pstmt.setString(5, bean.getPosting_pcode());
			pstmt.setString(6, bean.getPosting_address());
			pstmt.setInt(7, bean.getPosting_view());
			pstmt.setString(8, bean.getPosting_status());
			pstmt.executeUpdate();

			rs = pstmt.getGeneratedKeys(); // 삽입된 행의 자동 생성된 키를 검색
			if (rs.next()) {
				generatedKey = rs.getInt(1); // 첫 번째 컬럼의 값을 가져옵니다.
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					pool.freeConnection(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return generatedKey; // 생성된 posting_idx 값을 반환
	}

	public void updateBpost(PostingBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			// 업데이트할 정보가 PostingBean 객체 안에 모두 포함되어 있다고 가정
			sql = "UPDATE posting SET manager_id=?, posting_type=?, posting_cname=?, posting_name=?, "
					+ "posting_pcode=?, posting_address=?, posting_view=?, posting_status=? " + "WHERE posting_idx=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getManager_id());
			pstmt.setString(2, bean.getPosting_type());
			pstmt.setString(3, bean.getPosting_cname());
			pstmt.setString(4, bean.getPosting_name());
			pstmt.setString(5, bean.getPosting_pcode());
			pstmt.setString(6, bean.getPosting_address());
			pstmt.setInt(7, bean.getPosting_view());
			pstmt.setString(8, bean.getPosting_status());
			pstmt.setInt(9, bean.getPosting_idx()); // posting_idx 값을 WHERE 조건에 사용

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					pool.freeConnection(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void deletePost(String posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = pool.getConnection();

			// posting_idx를 외래키로 사용하는 테이블들의 데이터를 삭제
			// 예: openposition, qualification, environment, welfare, application_period,
			// procedure, adddocument, addquestion, application
			// 이 명령어들은 외래 키의 종속성에 따라 순서가 중요할 수 있음
			String[] sqlStatements = { "DELETE FROM application WHERE posting_idx = ?",
					"DELETE FROM addquestion WHERE posting_idx = ?", "DELETE FROM adddocument WHERE posting_idx = ?",
					"DELETE FROM `procedure` WHERE posting_idx = ?",
					"DELETE FROM application_period WHERE posting_idx = ?", "DELETE FROM welfare WHERE posting_idx = ?",
					"DELETE FROM environment WHERE posting_idx = ?", "DELETE FROM qualification WHERE posting_idx = ?",
					"DELETE FROM openposition WHERE posting_idx = ?",
					// 마지막으로, posting 테이블에서 레코드 삭제
					"DELETE FROM posting WHERE posting_idx = ?" };

			for (String sql : sqlStatements) {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, posting_idx);
				pstmt.executeUpdate();
				pstmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	public String searchPostType(String posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String postingType = null;
		try {
			con = pool.getConnection();
			sql = "SELECT posting_type FROM posting WHERE posting_idx = ?\r\n" + "";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				postingType = rs.getString("posting_type");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return postingType;
	}

	public void insertOpenposition(OpenPositionBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "INSERT INTO openposition (posting_idx, openposition_name, openposition_duty, openposition_num, openposition_sname, openposition_position) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getPosting_idx());
			pstmt.setString(2, bean.getOpenposition_name());
			pstmt.setString(3, bean.getOpenposition_duty());
			pstmt.setInt(4, bean.getOpenposition_num());
			pstmt.setString(5, bean.getOpenposition_sname());
			pstmt.setString(6, bean.getOpenposition_position());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}

	public void insertQualification(QualificationBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "INSERT INTO qualification (posting_idx, qualification_edutype, qualification_gender, qualification_experience, qualification_skill, qualification_certificate) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getPosting_idx());
			pstmt.setString(2, bean.getQualification_edutype());
			pstmt.setString(3, bean.getQualification_gender());
			pstmt.setString(4, bean.getQualification_experience());
			pstmt.setString(5, bean.getQualification_skill());
			pstmt.setString(6, bean.getQualification_certificate());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}

	public void insertEnvironment(environmentBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "INSERT INTO environment (posting_idx, environment_minsalary, environment_maxsalary, environment_type, working_day, working_hour) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getPosting_idx());
			pstmt.setInt(2, bean.getEnvironment_minsalary());
			pstmt.setInt(3, bean.getEnvironment_maxsalary());
			pstmt.setString(4, bean.getEnvironment_type());
			pstmt.setString(5, bean.getWorking_day());
			pstmt.setString(6, bean.getWorking_hour());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}

	public void insertWelfare(WelfareBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO welfare (posting_idx, Welfare_content) VALUES (?, ?)";

		try {
			con = pool.getConnection();
			// PreparedStatement를 미리 준비합니다.
			pstmt = con.prepareStatement(sql);

			// WelfareBean에서 welfareContents 리스트를 가져옵니다.
			List<String> welfareContents = bean.getWelfareContents();
			int postingIdx = bean.getPosting_idx(); // 가정: WelfareBean에 posting_idx 필드가 존재한다고 가정

			// welfareContents 리스트의 각 항목에 대해 INSERT 작업을 수행합니다.
			for (String content : welfareContents) {
				pstmt.setInt(1, postingIdx);
				pstmt.setString(2, content);
				pstmt.executeUpdate(); // 각 welfareContent 항목에 대해 실행
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	public void insertApplication_period(application_periodBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "INSERT INTO application_period (posting_idx, application_sdatetime, application_edatetime) "
					+ "VALUES (?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getPosting_idx());
			pstmt.setString(2, bean.getApplication_sdatetime());
			pstmt.setString(3, bean.getApplication_edatetime());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}

	public void insertProcedure(List<procedureBean> procedures) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO `procedure` (posting_idx, procedure_num, procedure_name, procedure_sdatetime, procedure_edatetime) VALUES (?, ?, ?, ?, ?)";

		try {
			con = pool.getConnection();

			for (procedureBean bean : procedures) {
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, bean.getPosting_idx());
				pstmt.setInt(2, bean.getProcedure_num()); // procedure_num은 클라이언트에서 설정한 값입니다.
				pstmt.setString(3, bean.getProcedure_name());

				// procedure_sdatetime이 비어있는 경우 NULL 처리
				if (bean.getProcedure_sdatetime() == null || bean.getProcedure_sdatetime().trim().isEmpty()) {
					pstmt.setNull(4, Types.TIMESTAMP);
				} else {
					pstmt.setString(4, bean.getProcedure_sdatetime());
				}

				// procedure_edatetime이 비어있는 경우 NULL 처리
				if (bean.getProcedure_edatetime() == null || bean.getProcedure_edatetime().trim().isEmpty()) {
					pstmt.setNull(5, Types.TIMESTAMP);
				} else {
					pstmt.setString(5, bean.getProcedure_edatetime());
				}

				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	public void insertadddocument(adddocumentBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO adddocument (posting_idx, adddocument_document) VALUES (?, ?)";

		try {
			con = pool.getConnection();
			// PreparedStatement를 미리 준비합니다.
			pstmt = con.prepareStatement(sql);

			// WelfareBean에서 welfareContents 리스트를 가져옵니다.
			List<String> adddocument_document = bean.getAdddocument_document();
			int postingIdx = bean.getPosting_idx(); // 가정: WelfareBean에 posting_idx 필드가 존재한다고 가정

			// welfareContents 리스트의 각 항목에 대해 INSERT 작업을 수행합니다.
			for (String content : adddocument_document) {
				pstmt.setInt(1, postingIdx);
				pstmt.setString(2, content);
				pstmt.executeUpdate(); // 각 welfareContent 항목에 대해 실행
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	public void insertaddquestion(addquestionBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO addquestion (posting_idx, addquestion_question) VALUES (?, ?)";

		try {
			con = pool.getConnection();
			// PreparedStatement를 미리 준비합니다.
			pstmt = con.prepareStatement(sql);

			// WelfareBean에서 welfareContents 리스트를 가져옵니다.
			List<String> addquestion_question = bean.getAddquestion_question();
			int postingIdx = bean.getPosting_idx(); // 가정: WelfareBean에 posting_idx 필드가 존재한다고 가정

			// welfareContents 리스트의 각 항목에 대해 INSERT 작업을 수행합니다.
			for (String content : addquestion_question) {
				pstmt.setInt(1, postingIdx);
				pstmt.setString(2, content);
				pstmt.executeUpdate(); // 각 welfareContent 항목에 대해 실행
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	public void insertApplication(applicationBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "INSERT INTO application (posting_idx, resume_idx, user_id, application_datetime) "
					+ "VALUES (?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getPosting_idx());

			// resume_idx가 유효한 값인지 확인
			if (bean.getResume_idx() > 0) {
				pstmt.setInt(2, bean.getResume_idx());
			} else {
				pstmt.setNull(2, java.sql.Types.INTEGER); // resume_idx에 NULL 설정
			}

			// user_id가 유효한 값인지 확인
			if (bean.getUser_id() != null && !bean.getUser_id().isEmpty()) {
				pstmt.setString(3, bean.getUser_id());
			} else {
				pstmt.setNull(3, java.sql.Types.VARCHAR); // user_id에 NULL 설정
			}

			pstmt.setString(4, bean.getApplication_datetime());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}

	// 작성한 공고 총 개수 찾는 Mgr
	public int searchPost(String manager_id, String posting_status) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int postNum = 0;
		try {
			con = pool.getConnection();
			sql = "SELECT COUNT(posting_idx) AS total FROM posting WHERE manager_id = ? AND posting_status = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, manager_id);
			pstmt.setString(2, posting_status);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				postNum = rs.getInt("total");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return postNum;
	}

	// 작성한 공고의 posting_idx들을 저장하는 Mgr
	public ArrayList<Integer> savePostIdx(String manager_id, String posting_status) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<Integer> postIdxList = new ArrayList<>();
		try {
			con = pool.getConnection();
			sql = "SELECT posting_idx FROM posting WHERE manager_id = ? AND posting_status = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, manager_id);
			pstmt.setString(2, posting_status);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// ResultSet에서 posting_idx 값을 읽어와 ArrayList에 추가
				int postingIdx = rs.getInt("posting_idx");
				postIdxList.add(postingIdx);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return postIdxList;
	}

	public ArrayList<String> getPostingNames(ArrayList<Integer> postIdxList) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<String> postingNames = new ArrayList<>();
		try {
			con = pool.getConnection();
			// 각 posting_idx에 대응하는 posting_name을 조회하는 쿼리
			sql = "SELECT posting_name FROM posting WHERE posting_idx = ?;";

			for (Integer postingIdx : postIdxList) {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, postingIdx);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					String postingName = rs.getString("posting_name");
					postingNames.add(postingName); // 조회된 posting_name을 리스트에 추가
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			pool.freeConnection(con);
		}
		return postingNames;
	}

	public ArrayList<String> getPostingTypes(ArrayList<Integer> postIdxList) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<String> postingTypes = new ArrayList<>();
		try {
			con = pool.getConnection();
			// 각 posting_idx에 대응하는 posting_name을 조회하는 쿼리
			sql = "SELECT posting_type FROM posting WHERE posting_idx = ?;";

			for (Integer postingIdx : postIdxList) {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, postingIdx);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					String postingType = rs.getString("posting_type");
					postingTypes.add(postingType); // 조회된 posting_name을 리스트에 추가
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			pool.freeConnection(con);
		}
		return postingTypes;
	}

	// 작성한 공고의 시작 및 종료 날짜(년월일)를 저장하는 Mgr
	public ArrayList<String> getApplicationDates(ArrayList<Integer> postIdxList) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<String> dateList = new ArrayList<>();
		try {
			con = pool.getConnection();
			// MySQL의 DATE_FORMAT 함수를 사용하여 날짜 형식을 'YYYY-MM-DD'로 지정
			sql = "SELECT DATE_FORMAT(application_sdatetime, '%Y-%m-%d') AS start_date, "
					+ "DATE_FORMAT(application_edatetime, '%Y-%m-%d') AS end_date "
					+ "FROM application_period WHERE posting_idx = ?";
			for (Integer postingIdx : postIdxList) {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, postingIdx);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// 시작 날짜와 종료 날짜를 하나의 문자열로 결합하여 리스트에 추가
					String startDate = rs.getString("start_date");
					String endDate = rs.getString("end_date");
					String datePair = startDate + "~" + endDate;
					dateList.add(datePair);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
		}
		return dateList;
	}

	public HashMap<Integer, ArrayList<String>> getProceduresByPosting(ArrayList<Integer> postIdxList) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		HashMap<Integer, ArrayList<String>> proceduresMap = new HashMap<>();

		try {
			con = pool.getConnection();
			// 백틱(`)을 추가하여 `procedure` 테이블을 명시
			sql = "SELECT posting_idx, procedure_name FROM `procedure` WHERE posting_idx = ? ORDER BY procedure_num ASC;";
			pstmt = con.prepareStatement(sql);

			for (Integer postingIdx : postIdxList) {
				pstmt.setInt(1, postingIdx);
				rs = pstmt.executeQuery();

				ArrayList<String> procedureNames = new ArrayList<>();
				while (rs.next()) {
					String procedureName = rs.getString("procedure_name");
					procedureNames.add(procedureName);
				}
				proceduresMap.put(postingIdx, procedureNames);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
		}
		return proceduresMap;
	}

	// 작성한 공고의 posting_idx별로 최종 합격자 수를 저장하는 Mgr
	public ArrayList<Integer> countFinalAcceptedByPostIdx(ArrayList<Integer> postIdxList) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> finalAcceptedCounts = new ArrayList<>();
		try {
			con = pool.getConnection();
			// 각 posting_idx에 대해 최종 합격자의 수를 조회하는 쿼리
			String sql = "SELECT COUNT(*) AS final_accepted_count FROM application_result WHERE posting_idx = ? AND result_status = '최종 합격';";

			for (Integer postingIdx : postIdxList) {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, postingIdx);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// 조회된 최종 합격자 수를 ArrayList에 추가
					int finalAcceptedCount = rs.getInt("final_accepted_count");
					finalAcceptedCounts.add(finalAcceptedCount);
				} else {
					// 해당 posting_idx에 최종 합격자가 없는 경우 0을 추가
					finalAcceptedCounts.add(0);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 리소스 해제
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
		}
		return finalAcceptedCounts;
	}

	public ArrayList<Integer> getSortedPostIdxList(String posting_status, String[] env_types, String[] qual_edu_type, String[] qual_experience, String sort) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<Integer> sortedPostIdxList = new ArrayList<>();
	    ArrayList<String> parameters = new ArrayList<>();
	    String sql = "SELECT p.posting_idx FROM posting p LEFT JOIN environment e ON e.posting_idx = p.posting_idx LEFT JOIN qualification q ON q.posting_idx = p.posting_idx WHERE 1=1 ";

	    // posting_status 조건 추가
	    if (posting_status != null && !posting_status.isEmpty()) {
	        sql += "AND p.posting_status = ? ";
	        parameters.add(posting_status);
	    }
	    
	    // env_types 조건 추가
	    if (env_types != null && env_types.length > 0) {
	        sql += "AND e.environment_type IN (";
	        for (int i = 0; i < env_types.length; i++) {
	            sql += "?";
	            parameters.add(env_types[i]);
	            if (i < env_types.length - 1) {
	                sql += ", ";
	            }
	        }
	        sql += ") ";
	    }

	    // qual_edu_type 조건 추가
	    if (qual_edu_type != null && qual_edu_type.length > 0) {
	        sql += "AND q.qualification_edutype IN (";
	        for (int i = 0; i < qual_edu_type.length; i++) {
	            sql += "?";
	            parameters.add(qual_edu_type[i]);
	            if (i < qual_edu_type.length - 1) {
	                sql += ", ";
	            }
	        }
	        sql += ") ";
	    }

	    // qual_experience 조건 추가
	    if (qual_experience != null && qual_experience.length > 0) {
	        sql += "AND q.qualification_experience IN (";
	        for (int i = 0; i < qual_experience.length; i++) {
	            sql += "?";
	            parameters.add(qual_experience[i]);
	            if (i < qual_experience.length - 1) {
	                sql += ", ";
	            }
	        }
	        sql += ") ";
	    }

	    // 정렬 조건 추가
	    if ("latest".equals(sort)) {
	        sql += "ORDER BY p.posting_datetime DESC";
	    } else if ("views".equals(sort)) {
	        sql += "ORDER BY CAST(p.posting_view AS UNSIGNED) DESC";
	    } else {
	        sql += "ORDER BY p.posting_datetime DESC";
	    }

	    try {
	        con = pool.getConnection();
	        pstmt = con.prepareStatement(sql);
	        int index = 1;
	        for (String param : parameters) {
	            pstmt.setString(index++, param);
	        }
	        
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            int postingIdx = rs.getInt("posting_idx");
	            sortedPostIdxList.add(postingIdx);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 해제
	        if (rs != null) try { rs.close(); } catch (Exception e) { }
	        if (pstmt != null) try { pstmt.close(); } catch (Exception e) { }
	        if (con != null) try { con.close(); } catch (Exception e) { }
	    }

	    return sortedPostIdxList;
	}

	// 특정 posting_idx에 해당하는 posting 정보를 조회하는 메서드
	public PostingBean searchPostingInfo(String posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PostingBean posting = null; // 결과를 저장할 PostingBean 객체 초기화

		try {
			con = pool.getConnection();

			String sql = "SELECT posting_cname, posting_pcode, posting_address FROM posting WHERE posting_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				posting = new PostingBean(); // 결과가 있으면 새 PostingBean 객체 생성
				// ResultSet에서 데이터를 가져와 PostingBean 객체에 설정
				posting.setPosting_cname(rs.getString("posting_cname"));
				posting.setPosting_pcode(rs.getString("posting_pcode"));
				posting.setPosting_address(rs.getString("posting_address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return posting; // 조회된 PostingBean 객체 반환
	}

	// 특정 posting_idx에 해당하는 openposition 정보를 조회하는 메서드
	public OpenPositionBean searchOpenPositionInfo(String posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OpenPositionBean openPosition = null; // 결과를 저장할 OpenPositionBean 객체 초기화

		try {
			con = pool.getConnection();

			String sql = "SELECT openposition_name, openposition_duty, openposition_num, openposition_sname, openposition_position FROM openposition WHERE posting_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				openPosition = new OpenPositionBean(); // 결과가 있으면 새 OpenPositionBean 객체 생성
				// ResultSet에서 데이터를 가져와 OpenPositionBean 객체에 설정
				openPosition.setOpenposition_name(rs.getString("openposition_name"));
				openPosition.setOpenposition_duty(rs.getString("openposition_duty"));
				openPosition.setOpenposition_num(rs.getInt("openposition_num"));
				openPosition.setOpenposition_sname(rs.getString("openposition_sname"));
				openPosition.setOpenposition_position(rs.getString("openposition_position"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return openPosition; // 조회된 OpenPositionBean 객체 반환
	}

	public QualificationBean searchQualificationInfo(String posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QualificationBean qualification = null; // 결과를 저장할 OpenPositionBean 객체 초기화
		try {
			con = pool.getConnection();

			String sql = "SELECT qualification_edutype, qualification_gender, qualification_experience, qualification_skill, qualification_certificate FROM qualification WHERE posting_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				qualification = new QualificationBean(); // 결과가 있으면 새 OpenPositionBean 객체 생성
				// ResultSet에서 데이터를 가져와 OpenPositionBean 객체에 설정
				qualification.setQualification_edutype(rs.getString("qualification_edutype"));
				qualification.setQualification_gender(rs.getString("qualification_gender"));
				qualification.setQualification_experience(rs.getString("qualification_experience"));
				qualification.setQualification_skill(rs.getString("qualification_skill"));
				qualification.setQualification_certificate(rs.getString("qualification_certificate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return qualification; // 조회된 OpenPositionBean 객체 반환
	}

	public environmentBean searchEnvironmentInfo(String posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		environmentBean environment = null; // 결과를 저장할 OpenPositionBean 객체 초기화
		try {
			con = pool.getConnection();

			String sql = "SELECT environment_minsalary, environment_maxsalary, environment_type, working_day, working_hour FROM environment WHERE posting_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				environment = new environmentBean(); // 결과가 있으면 새 OpenPositionBean 객체 생성
				// ResultSet에서 데이터를 가져와 OpenPositionBean 객체에 설정
				environment.setEnvironment_minsalary(rs.getInt("environment_minsalary"));
				environment.setEnvironment_maxsalary(rs.getInt("environment_maxsalary"));
				environment.setEnvironment_type(rs.getString("environment_type"));
				environment.setWorking_day(rs.getString("working_day"));
				environment.setWorking_hour(rs.getString("working_hour"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return environment; // 조회된 OpenPositionBean 객체 반환
	}
	
	// 각 posting_idx에 대한 최소 급여 조회 메서드
    public ArrayList<String> getEnvironmentMinSalaries(ArrayList<Integer> postIdxList) {
        ArrayList<String> minSalaries = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = pool.getConnection();
            String sql = "SELECT environment_minsalary FROM environment WHERE posting_idx = ?";

            for (Integer postingIdx : postIdxList) {
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, postingIdx);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    minSalaries.add(String.valueOf(rs.getInt("environment_minsalary")));
                } else {
                    minSalaries.add("N/A"); // 데이터가 없는 경우 "N/A" 추가
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

        return minSalaries;
    }
    
 // 각 posting_idx에 대한 최대 급여 조회 메서드
    public ArrayList<String> getEnvironmentMaxSalaries(ArrayList<Integer> postIdxList) {
        ArrayList<String> maxSalaries = new ArrayList<>();
        // 이 메서드의 구현은 getEnvironmentMinSalaries 메서드와 유사합니다.
        // "SELECT environment_maxsalary FROM environment WHERE posting_idx = ?" 쿼리 사용
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = pool.getConnection();
            String sql = "SELECT environment_maxsalary FROM environment WHERE posting_idx = ?";

            for (Integer postingIdx : postIdxList) {
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, postingIdx);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    maxSalaries.add(String.valueOf(rs.getInt("environment_maxsalary")));
                } else {
                    maxSalaries.add("N/A"); // 데이터가 없는 경우 "N/A" 추가
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return maxSalaries;
    }

    // 각 posting_idx에 대한 고용 형태 조회 메서드
    public ArrayList<String> getEnvironmentTypes(ArrayList<Integer> postIdxList) {
        ArrayList<String> types = new ArrayList<>();
        // 이 메서드의 구현은 getEnvironmentMinSalaries 메서드와 유사합니다.
        // "SELECT environment_type FROM environment WHERE posting_idx = ?" 쿼리 사용
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = pool.getConnection();
            String sql = "SELECT environment_type FROM environment WHERE posting_idx = ?";

            for (Integer postingIdx : postIdxList) {
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, postingIdx);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    types.add(String.valueOf(rs.getString("environment_type")));
                } else {
                    types.add("N/A"); // 데이터가 없는 경우 "N/A" 추가
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return types;
    }

    // 각 posting_idx에 대한 근무일 조회 메서드
    public ArrayList<String> getWorkingDays(ArrayList<Integer> postIdxList) {
        ArrayList<String> workingDays = new ArrayList<>();
        // 이 메서드의 구현은 getEnvironmentMinSalaries 메서드와 유사합니다.
        // "SELECT working_day FROM environment WHERE posting_idx = ?" 쿼리 사용
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = pool.getConnection();
            String sql = "SELECT working_day FROM environment WHERE posting_idx = ?";

            for (Integer postingIdx : postIdxList) {
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, postingIdx);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    workingDays.add(String.valueOf(rs.getString("working_day")));
                } else {
                    workingDays.add("N/A"); // 데이터가 없는 경우 "N/A" 추가
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return workingDays;
    }

    // 각 posting_idx에 대한 근무 시간 조회 메서드
    public ArrayList<String> getWorkingHours(ArrayList<Integer> postIdxList) {
        ArrayList<String> workingHours = new ArrayList<>();
        // 이 메서드의 구현은 getEnvironmentMinSalaries 메서드와 유사합니다.
        // "SELECT working_hour FROM environment WHERE posting_idx = ?" 쿼리 사용
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = pool.getConnection();
            String sql = "SELECT working_hour FROM environment WHERE posting_idx = ?";

            for (Integer postingIdx : postIdxList) {
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, postingIdx);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    workingHours.add(String.valueOf(rs.getString("working_hour")));
                } else {
                    workingHours.add("N/A"); // 데이터가 없는 경우 "N/A" 추가
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return workingHours;
    }

	public List<WelfareBean> searchWelfareInfo(String posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<WelfareBean> welfareList = new ArrayList<>(); // 결과를 저장할 리스트 초기화

		try {
			con = pool.getConnection();
			String sql = "SELECT Welfare_content FROM welfare WHERE posting_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			rs = pstmt.executeQuery();

			// 단일 WelfareBean 객체 생성
			WelfareBean welfare = new WelfareBean();
			welfare.setPosting_idx(Integer.parseInt(posting_idx)); // posting_idx 설정

			List<String> contents = new ArrayList<>(); // 복리후생 내용을 담을 리스트 생성
			while (rs.next()) {
				// 결과 리스트에 각 Welfare_content 값을 추가
				contents.add(rs.getString("Welfare_content"));
			}
			// WelfareBean에 복리후생 내용 리스트 설정
			welfare.setWelfareContents(contents);

			// 모든 내용이 추가된 WelfareBean을 리스트에 추가
			welfareList.add(welfare);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return welfareList; // 조회된 복리후생 정보 리스트 반환
	}
	
	// PostingMgr2 클래스 내의 getPostingAddresses 메서드 구현
	public ArrayList<String> getPostingAddresses(ArrayList<Integer> postIdxList) {
	    ArrayList<String> addresses = new ArrayList<>();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        con = pool.getConnection();
	        String sql = "SELECT posting_address FROM posting WHERE posting_idx = ?";

	        for (Integer postingIdx : postIdxList) {
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, postingIdx);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                addresses.add(rs.getString("posting_address"));
	            } else {
	                addresses.add("N/A"); // 데이터가 없는 경우 "N/A" 추가
	            }
	            pstmt.close();
	            rs.close();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }

	    return addresses;
	}
	
	// PostingMgr2 클래스 내의 getPostingCnames 메서드 구현
	public ArrayList<String> getPostingCnames(ArrayList<Integer> postIdxList) {
	    ArrayList<String> cnames = new ArrayList<>();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        con = pool.getConnection();
	        String sql = "SELECT posting_cname FROM posting WHERE posting_idx = ?";

	        for (Integer postingIdx : postIdxList) {
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, postingIdx);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                cnames.add(rs.getString("posting_cname"));
	            } else {
	                cnames.add("N/A"); // 데이터가 없는 경우 "N/A" 추가
	            }
	            pstmt.close();
	            rs.close();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }

	    return cnames;
	}
	
	// PostingMgr2 클래스 내의 getPostingDatetimes 메서드 구현
	public ArrayList<String> getPostingDatetimes(ArrayList<Integer> postIdxList) {
	    ArrayList<String> datetimes = new ArrayList<>();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        con = pool.getConnection();
	        String sql = "SELECT DATE_FORMAT(posting_datetime, '%Y-%m-%d %H:%i:%s') AS formatted_datetime FROM posting WHERE posting_idx = ?";

	        for (Integer postingIdx : postIdxList) {
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, postingIdx);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                datetimes.add(rs.getString("formatted_datetime"));
	            } else {
	                datetimes.add("N/A"); // 데이터가 없는 경우 "N/A" 추가
	            }
	            pstmt.close();
	            rs.close();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }

	    return datetimes;
	}
	
	// PostingMgr2 클래스 내의 getApplicationEndDatetimes 메서드 구현
	public ArrayList<String> getApplicationEndDatetimes(ArrayList<Integer> postIdxList) {
	    ArrayList<String> endDatetimes = new ArrayList<>();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        con = pool.getConnection();
	        String sql = "SELECT DATE_FORMAT(application_edatetime, '%Y-%m-%d %H:%i:%s') AS formatted_end_datetime FROM application_period WHERE posting_idx = ?";

	        for (Integer postingIdx : postIdxList) {
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, postingIdx);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                endDatetimes.add(rs.getString("formatted_end_datetime"));
	            } else {
	                endDatetimes.add("N/A"); // 데이터가 없는 경우 "N/A" 추가
	            }
	            pstmt.close();
	            rs.close();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }

	    return endDatetimes;
	}
	
	// 각 posting_idx에 대한 조회수 조회 메서드
    public ArrayList<Integer> getPostingViews(ArrayList<Integer> postIdxList) {
        ArrayList<Integer> postingViews = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = pool.getConnection();
            String sql = "SELECT posting_view FROM posting WHERE posting_idx = ?";

            for (Integer postingIdx : postIdxList) {
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, postingIdx);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    postingViews.add(rs.getInt("posting_view"));
                } else {
                    postingViews.add(0); // 데이터가 없는 경우 조회수를 0으로 추가
                }
                pstmt.close();
                rs.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

        return postingViews;
    }

	public application_periodBean searchperiodInfo(String posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		application_periodBean period = null; // 결과를 저장할 OpenPositionBean 객체 초기화
		try {
			con = pool.getConnection();

			String sql = "SELECT application_sdatetime, application_edatetime FROM application_period WHERE posting_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				period = new application_periodBean();
				period.setApplication_sdatetime(rs.getString("application_sdatetime"));
				period.setApplication_edatetime(rs.getString("application_edatetime"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return period; // 조회된 OpenPositionBean 객체 반환
	}

	public int countProcedureNum(String posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0; // Initialize the count of procedure_num to 0

		try {
			con = pool.getConnection(); // Assume pool is previously defined and accessible

			String sql = "SELECT COUNT(procedure_num) AS count FROM `procedure` WHERE posting_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count"); // Retrieve the count from the ResultSet
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs); // Ensure resources are freed
		}
		return count; // Return the count of procedure_num
	}

	public List<procedureBean> getProcedure(String posting_idx, int procedureNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<procedureBean> procedures = new ArrayList<>(); // 결과를 저장할 리스트 초기화

		try {
			con = pool.getConnection(); // 커넥션 풀에서 커넥션을 가져옴

			// procedure_num이 0부터 procedureNum-1까지의 값들을 조회
			String sql = "SELECT procedure_name, procedure_sdatetime, procedure_edatetime FROM `procedure` WHERE posting_idx=? AND procedure_num >= 0 AND procedure_num < ? ORDER BY procedure_num ASC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			pstmt.setInt(2, procedureNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				procedureBean procedure = new procedureBean();
				procedure.setProcedure_name(rs.getString("procedure_name"));
				procedure.setProcedure_sdatetime(rs.getString("procedure_sdatetime"));
				procedure.setProcedure_edatetime(rs.getString("procedure_edatetime"));
				procedures.add(procedure); // 조회된 결과를 리스트에 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs); // 자원 해제
		}
		return procedures; // 조회된 ProcedureBean 객체들이 저장된 리스트 반환
	}

	public List<String> getAddQuestionQuestions(String posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> questions = new ArrayList<>(); // Initialize the list to store questions

		try {
			con = pool.getConnection(); // Assume pool is previously defined and accessible

			String sql = "SELECT addquestion_question FROM addquestion WHERE posting_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				questions.add(rs.getString("addquestion_question")); // Add each question to the list
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs); // Ensure resources are freed
		}
		return questions; // Return the list of questions
	}

	public List<String> getAddDuestionDuestions(String posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> documents = new ArrayList<>(); // Initialize the list to store questions

		try {
			con = pool.getConnection(); // Assume pool is previously defined and accessible

			String sql = "SELECT adddocument_document FROM adddocument WHERE posting_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				documents.add(rs.getString("adddocument_document")); // Add each question to the list
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs); // Ensure resources are freed
		}
		return documents; // Return the list of questions
	}

	public String getPostingName(String posting_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String postingName = ""; // Initialize the string to store the posting name

		try {
			con = pool.getConnection(); // Assume pool is previously defined and accessible

			String sql = "SELECT posting_name FROM posting WHERE posting_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posting_idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				postingName = rs.getString("posting_name"); // Retrieve the posting name
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs); // Ensure resources are freed
		}
		return postingName; // Return the posting name
	}
}