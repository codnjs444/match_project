//ResumeMgr.Java
package match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

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
			sql = "insert into resume values(null, ?, ?, ?, ?, ?, now())";
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
	
	public Vector<ResumeBean> getResumeIdxList(String user_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ResumeBean> vlist = new Vector<ResumeBean>();
		try {
			con = pool.getConnection();
			sql = "select resume_idx, resume_name, resume_datetime from resume where user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ResumeBean bean = new ResumeBean();
				bean.setResume_idx(rs.getInt("resume_idx"));
				bean.setResume_name(rs.getString("resume_name"));
				bean.setResume_datetime(rs.getString("resume_datetime"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public ResumeBean getResume(int resume_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ResumeBean bean = new ResumeBean();
		try {
			con = pool.getConnection();
			sql = "select resume_name, self_intro1, self_intro2, self_intro3 from resume where resume_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, resume_idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setResume_name(rs.getString("resume_name"));
				bean.setSelf_intro1(rs.getString("self_intro1"));
				bean.setSelf_intro2(rs.getString("self_intro2"));
				bean.setSelf_intro3(rs.getString("self_intro3"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	public List<EduBean> getEduList(int resume_idx) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<EduBean> eduList = new ArrayList<>(); // 결과를 저장할 리스트 초기화

	    try {
	        con = pool.getConnection();
	        String sql = "SELECT edu_type, edu_school, edu_major, edu_syear, edu_eyear, edu_status FROM edu WHERE resume_idx=?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, resume_idx);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            // 각 레코드(행)에 대해 EduBean 객체 생성 및 데이터 설정
	            EduBean edu = new EduBean();
	            edu.setResume_idx(resume_idx); // resume_idx 설정
	            edu.setEdu_type(rs.getString("edu_type"));
	            edu.setEdu_school(rs.getString("edu_school"));
	            edu.setEdu_major(rs.getString("edu_major"));
	            edu.setEdu_syear(rs.getString("edu_syear"));
	            edu.setEdu_eyear(rs.getString("edu_eyear"));
	            edu.setEdu_status(rs.getString("edu_status"));

	            // 설정된 EduBean 객체를 리스트에 추가
	            eduList.add(edu);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }

	    return eduList; // 조회된 교육 정보 리스트 반환
	}
	
	public List<CareerBean> getCareerList(int resume_idx){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CareerBean> careerList = new ArrayList<>();
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select career_cname, career_dep, career_job, career_syear, career_eyear, career_duty from career where resume_idx=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, resume_idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CareerBean career = new CareerBean();
				career.setResume_idx(resume_idx);
				career.setCareer_cname(rs.getString("career_cname"));
				career.setCareer_dep(rs.getString("career_dep"));
				career.setCareer_job(rs.getString("career_job"));
				career.setCareer_syear(rs.getString("career_syear"));
				career.setCareer_eyear(rs.getString("career_eyear"));
				career.setCareer_duty(rs.getString("career_duty"));
				
				careerList.add(career);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return careerList;
	}
	
	public List<InternshipBean> getInternList(int resume_idx){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<InternshipBean> internList = new ArrayList<>();
		try {
			con = pool.getConnection();
			sql = "select internship_type, internship_cname, internship_syear, internship_eyear, internship_duty from internship where resume_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, resume_idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				InternshipBean bean = new InternshipBean();
				bean.setResume_idx(resume_idx);
				bean.setInternship_type(rs.getString("internship_type"));
				bean.setInternship_cname(rs.getString("internship_cname"));
				bean.setInternship_syear(rs.getString("internship_syear"));
				bean.setInternship_eyear(rs.getString("internship_eyear"));
				bean.setInternship_duty(rs.getString("internship_duty"));
				
				internList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return internList;
	}
	
	public List<CurriculumBean> getCurriculumList(int resume_idx){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<CurriculumBean> curriculumList = new ArrayList<>();
		try {
			con = pool.getConnection();
			sql = "select curriculum_name, curriculum_cname, curriculum_syear, curriculum_eyear, curriculum_content from curriculum where resume_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, resume_idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CurriculumBean bean = new CurriculumBean();
				bean.setResume_idx(resume_idx);
				bean.setCurriculum_name(rs.getString("curriculum_name"));
				bean.setCurriculum_cname(rs.getString("curriculum_cname"));
				bean.setCurriculum_syear(rs.getString("curriculum_syear"));
				bean.setCurriculum_eyear(rs.getString("curriculum_eyear"));
				bean.setCurriculum_content(rs.getString("curriculum_content"));
				
				curriculumList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return curriculumList;
	}
	
	public List<SkillBean> getSkillList(int resume_idx){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<SkillBean> skillList = new ArrayList<>();
		try {
			con = pool.getConnection();
			sql = "select skill_sname from skill where resume_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, resume_idx);
			rs = pstmt.executeQuery();
			while(rs.next()){
				SkillBean bean = new SkillBean();
				bean.setResume_idx(resume_idx);
				bean.setSkill_sname(rs.getString("skill_sname"));
				
				skillList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return skillList;
	}
	
	public List<CertificateBean> getCertificateList(int resume_idx){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<CertificateBean> certificateList = new ArrayList<>();
		try {
			con = pool.getConnection();
			sql = "select certificate_sname from certificate where resume_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, resume_idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CertificateBean bean = new CertificateBean();
				bean.setResume_idx(resume_idx);
				bean.setCertificate_sname(rs.getString("certificate_sname"));
				certificateList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return certificateList;
	}
	
	public void updateResume(ResumeBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update resume set resume_name=?, self_intro1=?, self_intro2=?, self_intro3=? where resume_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getResume_name());
			pstmt.setString(2, bean.getSelf_intro1());
			pstmt.setString(3, bean.getSelf_intro2());
			pstmt.setString(4, bean.getSelf_intro3());
			pstmt.setInt(5, bean.getResume_idx());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	public void getResumeName(int Resume_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select resume_name from resume where resume_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Resume_idx);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
}