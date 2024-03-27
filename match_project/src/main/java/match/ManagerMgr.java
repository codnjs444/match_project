package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ManagerMgr {
	private DBConnectionMgr pool;
	public ManagerMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean loginManager(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select manager_id from manager where manager_id = ? and manager_pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next())
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("매니저 로그인 " + flag);
		return flag;
	}
	
	public ManagerBean getManager(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ManagerBean bean = new ManagerBean();
		try {
			con = pool.getConnection();
			sql = "select * from manager where manager_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setManager_id(rs.getString(1));
				bean.setCompany_idx(rs.getInt(2));
				bean.setManager_name(rs.getString(3));
				bean.setManager_pwd(rs.getString(4));
				bean.setManager_email(rs.getString(5));
				bean.setManager_phonenum(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	public boolean signUpManager(ManagerBean bean){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert user values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getManager_id());
			pstmt.setInt(2, bean.getCompany_idx());
			pstmt.setString(3, bean.getManager_name());
			pstmt.setString(4, bean.getManager_pwd());
			pstmt.setString(5, bean.getManager_email());
			pstmt.setString(6, bean.getManager_phonenum());
			if(pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
}