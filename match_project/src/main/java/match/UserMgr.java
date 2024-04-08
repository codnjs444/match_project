package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserMgr {
	private DBConnectionMgr pool;
	public UserMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean loginUser(String user_id, String user_pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select user_id from user where user_id = ? and user_pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pwd);
			rs = pstmt.executeQuery();
			if(rs.next())
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("유저 로그인 " + flag);
		return flag;
	}
	
	public String getUserName(String user_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String user_name = "";
		try {
			con = pool.getConnection();
			sql = "select user_name from user where user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user_name = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return user_name;
	}
	
	public UserBean getUser(String user_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		UserBean bean = new UserBean();
		try {
			con = pool.getConnection();
			sql = "select * from user where user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setUser_name(rs.getString(1));
				bean.setUser_id(rs.getString(2));
				bean.setUser_pwd(rs.getString(3));
				bean.setUser_email(rs.getString(4));
				bean.setUser_phonenum(rs.getString(5));
				bean.setBirthday(rs.getString(6));
				bean.setUser_gender(rs.getBoolean(7));
				bean.setPostal_code(rs.getString(8));
				bean.setUser_address(rs.getString(9));
				bean.setSns(rs.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	public boolean signUpUser(UserBean bean){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert user values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUser_name());
			pstmt.setString(2, bean.getUser_id());
			pstmt.setString(3, bean.getUser_pwd());
			pstmt.setString(4, bean.getUser_email());
			pstmt.setString(5, bean.getUser_phonenum());
			pstmt.setString(6, bean.getBirthday());
			pstmt.setBoolean(7, bean.getUser_gender());
			pstmt.setString(8, bean.getPostal_code());
			pstmt.setString(9, bean.getUser_address());
			pstmt.setString(10, bean.getSns());
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