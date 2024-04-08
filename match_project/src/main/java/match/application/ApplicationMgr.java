package match.application;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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
	            PreparedStatement pstmtCount = con.prepareStatement("SELECT COUNT(resume_idx) AS resume_count FROM application WHERE posting_idx = ?");
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
	
	public List<Integer> getResumeIdxsByUserIds(String posting_idx, List<String> userIds) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Integer> resumeIdxs = new ArrayList<>(); // 결과를 저장할 List 객체 초기화
	    try {
	        con = pool.getConnection();
	        
	        // userIds 목록을 순회하며 각 userId에 대한 resume_idx를 조회
	        for(String userId : userIds) {
	            String sql = "SELECT resume_idx FROM application WHERE posting_idx=? AND user_id=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, posting_idx);
	            pstmt.setString(2, userId);
	            rs = pstmt.executeQuery();
	            if(rs.next()) {
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



}
