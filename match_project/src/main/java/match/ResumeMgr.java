//ResumeMgr.Java
package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import match.resume.*;

public class ResumeMgr {
	private DBConnectionMgr pool;
	public ResumeMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public int insertResume(ResumeBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int generatedKey = 0;
		try {
			con = pool.getConnection();
			sql = "insert into resume values(null, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, bean.getUser_id());
			pstmt.setString(2, bean.getResume_name());
			pstmt.setString(3, bean.getSelf_intro1());
			pstmt.setString(4, bean.getSelf_intro2());
			pstmt.setString(5, bean.getSelf_intro3());
			pstmt.executeUpdate();
			
			rs = pstmt.getGeneratedKeys();
			if(rs.next())
				generatedKey = rs.getInt(1);
		} catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (con != null) pool.freeConnection(con);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return generatedKey;
	}
	
	public boolean insertEdu(EduBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into edu values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getResume_idx());
			pstmt.setString(2, bean.getEdu_type());
			pstmt.setString(3, bean.getEdu_school());
			pstmt.setString(4, bean.getEdu_major());
			pstmt.setString(5, bean.getEdu_syear());
			pstmt.setString(6, bean.getEdu_eyear());
			pstmt.setString(7, bean.getEdu_status());
			
			if(pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean insertCareer(CareerBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into career values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getResume_idx());
			pstmt.setString(2, bean.getCareer_cname());
			pstmt.setString(3, bean.getCareer_dep());
			pstmt.setString(4, bean.getCareer_job());
			pstmt.setString(5, bean.getCareer_syear());
			pstmt.setString(6, bean.getCareer_eyear());
			pstmt.setString(7, bean.getCareer_duty());
			if(pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean insertInternship(InternshipBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into internship values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getResume_idx());
			pstmt.setString(2, bean.getInternship_type());
			pstmt.setString(3, bean.getInternship_cname());
			pstmt.setString(4, bean.getInternship_syear());
			pstmt.setString(5, bean.getInternship_eyear());
			pstmt.setString(6, bean.getInternship_duty());
			
			if(pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean insertCurriculum(CurriculumBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into curriculum values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getResume_idx());
			pstmt.setString(2, bean.getCurriculum_name());
			pstmt.setString(3, bean.getCurriculum_cname());
			pstmt.setString(4, bean.getCurriculum_syear());
			pstmt.setString(5, bean.getCurriculum_eyear());
			pstmt.setString(6, bean.getCurriculum_content());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean insertSkill(SkillBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into skill values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getResume_idx());
			pstmt.setString(2, bean.getSkill_sname());
			
			if(pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean insertCertificate(CertificateBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into certificate values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getResume_idx());
			pstmt.setString(2, bean.getCertificate_sname());
			
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