package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CompanyMgr {
	private DBConnectionMgr pool;
	public CompanyMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public int getCompanyIdx(int company_rnum, String company_name, String company_head) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int company_idx = 0;
		try {
			con = pool.getConnection();
			sql = "select company_idx from company where company_rnum = ? and company_name = ? and company_head = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company_rnum);
			pstmt.setString(2, company_name);
			pstmt.setString(3, company_head);
			rs = pstmt.executeQuery();
			if(rs.next())
				company_idx = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return company_idx;
	}
	
	public CompanyBean getCompanyLocation(int company_idx) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    CompanyBean bean = new CompanyBean();
	    try {
	        // Assuming you have a similar connection pooling mechanism as in the previous method
	        con = pool.getConnection(); 
	        String sql = "SELECT company_name, company_type, company_head, company_address, company_latitude, company_longitude FROM company WHERE company_idx = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, company_idx);
	        rs = pstmt.executeQuery();
	        if(rs.next()) {
	        	bean.setCompany_name(rs.getString("company_name"));
	        	bean.setCompany_type(rs.getString("company_type"));
	        	bean.setCompany_head(rs.getString("company_head"));
	        	bean.setCompany_address(rs.getString("company_address"));
	            bean.setCompany_latitude(rs.getDouble("company_latitude"));
	            bean.setCompany_longitude(rs.getDouble("company_longitude"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (pool != null) {
	            pool.freeConnection(con, pstmt, rs);
	        }
	    }
	    return bean;
	}
	
	
	public void insertBookmark(String user_id, int posting_idx) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    String sql = "INSERT INTO bookmark_posting (user_id, posting_idx) VALUES (?, ?)";
	    try {
	        con = pool.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, user_id);
	        pstmt.setInt(2, posting_idx);
	        pstmt.executeUpdate(); // executeQuery() 대신 executeUpdate() 사용
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt);
	    }
	}
	
	public void deleteBookmark(String user_id, int posting_idx) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    String sql = "DELETE FROM bookmark_posting WHERE user_id = ? AND posting_idx = ?";
	    try {
	        con = pool.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, user_id);
	        pstmt.setInt(2, posting_idx);
	        pstmt.executeUpdate(); // executeQuery() 대신 executeUpdate() 사용
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt);
	    }
	}
	
	public boolean searchBookmark(String user_id, int posting_idx) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    boolean exists = false; // 즐겨찾기가 존재하는지 여부
	    try {
	        con = pool.getConnection();
	        String sql = "SELECT COUNT(*) FROM bookmark_posting WHERE user_id = ? AND posting_idx = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, user_id);
	        pstmt.setInt(2, posting_idx);

	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            // COUNT(*) 결과가 1 이상이면 해당 즐겨찾기가 존재함을 의미
	            exists = rs.getInt(1) > 0;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }
	    return exists;
	}




}