package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.sql.Types;

import match.posting.*;

public class PostingMgr {
	private DBConnectionMgr pool;
	public PostingMgr() {
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
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (con != null) pool.freeConnection(con);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return generatedKey; // 생성된 posting_idx 값을 반환
	}
	
	public void deletePost(String posting_idx) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    try {
	        con = pool.getConnection();
	        
	        // posting_idx를 외래키로 사용하는 테이블들의 데이터를 삭제
	        // 예: openposition, qualification, environment, welfare, application_period, procedure, adddocument, addquestion, application
	        // 이 명령어들은 외래 키의 종속성에 따라 순서가 중요할 수 있음
	        String[] sqlStatements = {
	            "DELETE FROM application WHERE posting_idx = ?",
	            "DELETE FROM addquestion WHERE posting_idx = ?",
	            "DELETE FROM adddocument WHERE posting_idx = ?",
	            "DELETE FROM `procedure` WHERE posting_idx = ?",
	            "DELETE FROM application_period WHERE posting_idx = ?",
	            "DELETE FROM welfare WHERE posting_idx = ?",
	            "DELETE FROM environment WHERE posting_idx = ?",
	            "DELETE FROM qualification WHERE posting_idx = ?",
	            "DELETE FROM openposition WHERE posting_idx = ?",
	            // 마지막으로, posting 테이블에서 레코드 삭제
	            "DELETE FROM posting WHERE posting_idx = ?"
	        };

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


	public void insertOpenposition(OpenPositionBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
	        sql = "INSERT INTO openposition (posting_idx, openposition_name, openposition_duty, openposition_num, openposition_sname, openposition_position) " +
	                "VALUES (?, ?, ?, ?, ?, ?)";
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
	        sql = "INSERT INTO qualification (posting_idx, qualification_edutype, qualification_gender, qualification_experience, qualification_skill, qualification_certificate) " +
	                "VALUES (?, ?, ?, ?, ?, ?)";
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
	        sql = "INSERT INTO environment (posting_idx, environment_minsalary, environment_maxsalary, environment_type, working_day, working_hour) " +
	                "VALUES (?, ?, ?, ?, ?, ?)";
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
	        sql = "INSERT INTO application_period (posting_idx, application_sdatetime, application_edatetime) " +
	                "VALUES (?, ?, ?)";
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
	        sql = "INSERT INTO application (posting_idx, resume_idx, user_id, application_datetime) " +
	                "VALUES (?, ?, ?, ?)";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, bean.getPosting_idx());

	        // resume_idx가 유효한 값인지 확인
	        if (bean.getResume_idx() > 0) {
	            pstmt.setInt(2, bean.getResume_idx());
	        } else {
	            pstmt.setNull(2, java.sql.Types.INTEGER); // resume_idx에 NULL 설정
	        }

	        // user_id가 유효한 값인지 확인
	        if(bean.getUser_id() != null && !bean.getUser_id().isEmpty()) {
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
	        if (rs != null) try { rs.close(); } catch (Exception e) {}
	        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
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
	        if (rs != null) try { rs.close(); } catch (Exception e) {}
	        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
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
	        if (rs != null) try { rs.close(); } catch (Exception e) {}
	        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
	        if (con != null) try { con.close(); } catch (Exception e) {}
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
	        if (rs != null) try { rs.close(); } catch (Exception e) {}
	        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
	        if (con != null) try { con.close(); } catch (Exception e) {}
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
	        if (rs != null) try { rs.close(); } catch (Exception e) {}
	        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
	        if (con != null) try { con.close(); } catch (Exception e) {}
	    }
	    return finalAcceptedCounts;
	}
	
	public ArrayList<Integer> getSortedPostIdxList(String manager_id, String posting_status, String sort) {
		    Connection con = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    ArrayList<Integer> sortedPostIdxList = new ArrayList<>();
		    String sql = "SELECT p.posting_idx FROM posting p ";
	
		    // 마감일순 정렬을 위한 JOIN
		    if ("deadline".equals(sort)) {
		        sql += "LEFT JOIN application_period ap ON p.posting_idx = ap.posting_idx ";
		    }
	
		    sql += "WHERE p.manager_id = ? AND p.posting_status = ? ";
	
		    // 정렬 조건 추가
		    if ("latest".equals(sort)) {
		        sql += "ORDER BY p.posting_datetime DESC";
		    } else if ("deadline".equals(sort)) {
		        sql += "ORDER BY ap.application_edatetime ASC";
		    } else {
		        // 기본 정렬(정렬 조건이 제공되지 않았을 때)
		        sql += "ORDER BY p.posting_datetime DESC";
		    }
	
		    try {
		        con = pool.getConnection();
		        pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, manager_id);
		        pstmt.setString(2, posting_status);
		        rs = pstmt.executeQuery();
	
		        while (rs.next()) {
		            int postingIdx = rs.getInt("posting_idx");
		            sortedPostIdxList.add(postingIdx);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        // 리소스 해제
		        if (rs != null) try { rs.close(); } catch (Exception e) { /* Ignored */ }
		        if (pstmt != null) try { pstmt.close(); } catch (Exception e) { /* Ignored */ }
		        if (con != null) try { con.close(); } catch (Exception e) { /* Ignored */ }
		    }
	
		    return sortedPostIdxList;
		}


}