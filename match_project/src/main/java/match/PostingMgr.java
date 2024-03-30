package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PostingMgr {
	private DBConnectionMgr pool;
	public PostingMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public void insertBpost(PostingBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert posting values(null,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getManager_id());
			pstmt.setString(2, bean.getPosting_type());
			pstmt.setString(3, bean.getPosting_cname());
			pstmt.setString(4, bean.getPosting_name());
			pstmt.setString(5, bean.getPosting_pcode());
			pstmt.setString(6, bean.getPosting_address());
			pstmt.setInt(7, bean.getPosting_view());
			pstmt.setString(8, bean.getPosting_status());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
}