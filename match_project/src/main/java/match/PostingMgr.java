package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import match.posting.OpenPositionBean;


public class PostingMgr {
	private DBConnectionMgr pool;
	public PostingMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
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

	
}