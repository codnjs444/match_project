package match.category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import match.DBConnectionMgr;

public class skill_categoryMgr {
	private DBConnectionMgr pool;
	public skill_categoryMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<skill_categoryBean> skillList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<skill_categoryBean> vlist = new Vector<skill_categoryBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT skill_sname FROM skill_category;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				skill_categoryBean bean = new skill_categoryBean();
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
	
	
	// skill_category의 sname가져오는 mgr 
		public Vector<skill_categoryBean> skillsnameList(String name){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<skill_categoryBean> vlist = new Vector<skill_categoryBean>();
			try {
				con = pool.getConnection();
				sql = "SELECT skill_sname FROM skill_category where skill_name = ?;";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
				while(rs.next()){
					skill_categoryBean bean = new skill_categoryBean();
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
	
}
