package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

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
	
	
	
	
	
}
