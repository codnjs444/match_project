package match.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import match.DBConnectionMgr;

public class categoryMgr {
	private DBConnectionMgr pool;
	public categoryMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<skillBean> skillList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<skillBean> vlist = new Vector<skillBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT skill_sname FROM skill_category;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				skillBean bean = new skillBean();
				bean.setSkill_sname(rs.getString("skill_sname"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public Vector<job_categoryBean> jobnameList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<job_categoryBean> vlist = new Vector<job_categoryBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT job_name FROM job_category;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				job_categoryBean bean = new job_categoryBean();
				bean.setJob_name(rs.getString("job_name"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// job_category의 sname가져오는 mgr 
	public Vector<job_categoryBean> jobsnameList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<job_categoryBean> vlist = new Vector<job_categoryBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT job_sname FROM job_category;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				job_categoryBean bean = new job_categoryBean();
				bean.setJob_sname(rs.getString("job_sname"));
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
