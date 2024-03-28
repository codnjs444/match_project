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
}