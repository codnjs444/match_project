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
			sql = "insert manager values(?, ?, ?, ?, ?, ?)";
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
	
	public String getCompany_idx(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String company_idx = null;
		try {
			con = pool.getConnection();
			sql = "select company_idx from manager where manager_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
	        // ResultSet이 결과를 가지고 있는 경우에만 처리
	        if (rs.next()) {
	            company_idx = rs.getString("company_idx");
	        }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return company_idx;
	}
	
	public boolean updateManager(ManagerBean bean) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    boolean updateResult = false;
	    try {
	        con = pool.getConnection();
	        String sql = "UPDATE manager SET manager_name = ?, manager_email = ?, manager_phonenum = ? WHERE manager_id = ?";
	        pstmt = con.prepareStatement(sql);
	        
	        // ManagerBean에서 정보를 가져와 쿼리에 설정
	        pstmt.setString(1, bean.getManager_name());
	        pstmt.setString(2, bean.getManager_email());
	        pstmt.setString(3, bean.getManager_phonenum());
	        pstmt.setString(4, bean.getManager_id());
	        
	        int rowsAffected = pstmt.executeUpdate();
	        updateResult = (rowsAffected > 0); // 업데이트된 행이 있으면 true, 없으면 false
	    } catch (Exception e) {
	        e.printStackTrace();
	        updateResult = false;
	    } finally {
	        pool.freeConnection(con, pstmt);
	    }
	    return updateResult;
	}
	
	public boolean updateManagerPassword(String managerId, String newPassword) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    boolean updateResult = false;
	    try {
	        con = pool.getConnection();
	        String sql = "UPDATE manager SET manager_pwd = ? WHERE manager_id = ?";
	        pstmt = con.prepareStatement(sql);
	        
	        // 새로운 비밀번호를 쿼리에 설정
	        pstmt.setString(1, newPassword);
	        // manager_id를 쿼리에 설정
	        pstmt.setString(2, managerId);
	        
	        int rowsAffected = pstmt.executeUpdate();
	        updateResult = (rowsAffected > 0); // 업데이트된 행이 있으면 true, 없으면 false
	    } catch (Exception e) {
	        e.printStackTrace();
	        updateResult = false;
	    } finally {
	        pool.freeConnection(con, pstmt);
	    }
	    return updateResult;
	}

	public String getManagerPassword(String id) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String managerPassword = null; // 반환할 manager_pwd 값을 저장할 변수 선언
	    try {
	        con = pool.getConnection();
	        String sql = "SELECT manager_pwd FROM manager WHERE manager_id = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, id); // 매개변수로 받은 id를 쿼리에 설정
	        rs = pstmt.executeQuery(); // 쿼리 실행
	        
	        if (rs.next()) { // 결과 집합에서 첫 번째 행이 존재한다면
	            managerPassword = rs.getString("manager_pwd"); // manager_pwd 값을 변수에 저장
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 발생 시 스택 추적 정보 출력
	    } finally {
	        pool.freeConnection(con, pstmt, rs); // 리소스 해제
	    }
	    return managerPassword; // 조회된 manager_pwd 반환
	}


	
	
}