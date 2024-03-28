package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CompanyMgr {
	private DBConnectionMgr pool;
	public CompanyMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean checkCompany(int company_rnum, String company_name, String company_head) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select company_idx from company where company_rnum = ? and company_name = ? and company_head = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, company_rnum);
			pstmt.setString(2, company_name);
			pstmt.setString(3, company_head);
			rs = pstmt.executeQuery();
			if(rs.next())
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
}