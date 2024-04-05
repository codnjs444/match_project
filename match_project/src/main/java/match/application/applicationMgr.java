package match.application;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import match.DBConnectionMgr;

public class applicationMgr {
	
	private DBConnectionMgr pool;	
	
	public applicationMgr() {
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

}
