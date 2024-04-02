package match.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import match.DBConnectionMgr;

public class certificate_categoryMgr {
	private DBConnectionMgr pool;
	public certificate_categoryMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<certificate_categoryBean> certificatenameList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<certificate_categoryBean> vlist = new Vector<certificate_categoryBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT certificate_name FROM certificate_category;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				certificate_categoryBean bean = new certificate_categoryBean();
				bean.setCertificate_name(rs.getString("certificate_name"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
}
