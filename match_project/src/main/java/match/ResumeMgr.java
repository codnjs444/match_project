//ResumeMgr.Java
package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import match.resume.*;

public class ResumeMgr {
	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = "C:/Jsp/match_project/match_project/src/main/webapp/fileupload";
	public static final String ENCODING = "UTF-8";
	public static final int MAXSIZE = 1024*1024*20;
	
	
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
			
			if(pstmt.executeUpdate() == 1)
				flag = true;;
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
	
	public boolean insertAward(AwardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into award values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getResume_idx());
			pstmt.setString(2, bean.getAward_name());
			pstmt.setString(3, bean.getAward_cname());
			pstmt.setString(4, bean.getAward_syear());
			pstmt.setString(5, bean.getAward_content());
			
			if(pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean insertGlobalex(GlobalexBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into globalex values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getResume_idx());
			pstmt.setString(2, bean.getGlobalex_name());
			pstmt.setString(3, bean.getGlobalex_syear());
			pstmt.setString(4, bean.getGlobalex_eyear());
			pstmt.setString(5, bean.getGlobalex_content());
			
			if(pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean insertLanguage(LanguageBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into language values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getResume_idx());
			pstmt.setString(2, bean.getLanguage_name());
			pstmt.setString(3, bean.getLanguage_level());
			
			if(pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean insertPreffer(PrefferBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into preffer values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getResume_idx());
			pstmt.setString(2, bean.getPreffer_miliprotect());
			pstmt.setString(3, bean.getPreffer_eprotect());
			pstmt.setString(4, bean.getPreffer_sprotect());
			pstmt.setString(5, bean.getPreffer_disabilitype());
			pstmt.setString(6, bean.getPreffer_militype());
			
			if(pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean insertProject(ProjectBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into project values(?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getResume_idx());
			pstmt.setString(2, bean.getProject_name());
			pstmt.setString(3, bean.getProject_syear());
			pstmt.setString(4, bean.getProject_eyear());
			pstmt.setString(5, bean.getProject_duty());
			pstmt.setString(6, bean.getProject_url());
			pstmt.setString(7, bean.getProject_fname());
			pstmt.setString(8, bean.getProject_extension());
			
			if(pstmt.executeUpdate() == 1)
				flag = true;;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public void insertPortfolio(PortfolioBean bean) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    
	    // 포트폴리오 정보를 삽입하는 SQL 쿼리
	    String sql = "INSERT INTO portfolio (resume_idx, portfolio_name, portfolio_url, portfolio_fname, portfolio_extension, portfolio_udate) VALUES (?, null, null, ?, ?, NOW())";
	    
	    try {
	        con = pool.getConnection(); // 데이터베이스 연결 획득
	        pstmt = con.prepareStatement(sql); // SQL 문을 준비

	        // PortfolioBean에서 각 리스트를 가져오기
	        List<String> fnames = bean.getPortfolio_fname();
	        List<String> extensions = bean.getPortfolio_extension();
	        
	        int resumeIdx = bean.getResume_idx(); // 이력서 인덱스 가져오기

	        // 리스트의 크기만큼 반복하여 각 항목을 데이터베이스에 삽입
	        for (int i = 0; i < fnames.size(); i++) {
	            pstmt.setInt(1, resumeIdx);
	            pstmt.setString(2, fnames.get(i));
	            pstmt.setString(3, extensions.get(i));
	            
	            // 삽입 실행
	            pstmt.executeUpdate();
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 발생 시 예외 내용 로깅
	    } finally {
            pool.freeConnection(con);
	    }
	}
}