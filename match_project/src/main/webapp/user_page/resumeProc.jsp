<!-- resumeProc.jsp -->
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="match.ResumeMgr"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="uBean" class="match.UserBean"/>
<jsp:useBean id="uMgr" class="match.UserMgr"/>
<jsp:useBean id="rBean" class="match.ResumeBean"/>
<jsp:useBean id="rMgr" class="match.ResumeMgr"/>

<jsp:useBean id="eBean" class="match.resume.EduBean"/>
<jsp:useBean id="caBean" class="match.resume.CareerBean"/>
<jsp:useBean id="iBean" class="match.resume.InternshipBean"/>
<jsp:useBean id="cuBean" class="match.resume.CurriculumBean"/>
<jsp:useBean id="sBean" class="match.resume.SkillBean"/>
<jsp:useBean id="ceBean" class="match.resume.CertificateBean"/>
<jsp:useBean id="aBean" class="match.resume.AwardBean"/>
<jsp:useBean id="gBean" class="match.resume.GlobalexBean"/>
<jsp:useBean id="lBean" class="match.resume.LanguageBean"/>
<jsp:useBean id="preBean" class="match.resume.PrefferBean"/>
<jsp:useBean id="proBean" class="match.resume.ProjectBean"/>
<jsp:useBean id="poBean" class="match.resume.PortfolioBean"/>

<jsp:setProperty property="*" name="uBean"/>
<jsp:setProperty property="*" name="rBean"/>
<jsp:setProperty property="*" name="eBean"/>
<jsp:setProperty property="*" name="caBean"/>
<jsp:setProperty property="*" name="iBean"/>
<jsp:setProperty property="*" name="cuBean"/>
<jsp:setProperty property="*" name="sBean"/>
<jsp:setProperty property="*" name="ceBean"/>
<jsp:setProperty property="*" name="aBean"/>
<jsp:setProperty property="*" name="gBean"/>
<jsp:setProperty property="*" name="lBean"/>
<jsp:setProperty property="*" name="preBean"/>
<jsp:setProperty property="*" name="proBean"/>
<jsp:setProperty property="*" name="poBean"/>

<%
	int generatedKey = 0;
	String user_id = (String)session.getAttribute("idKey");
	String resume_name = request.getParameter("resume_name");
	String self_intro1 = request.getParameter("intro1");
	String self_intro2 = request.getParameter("intro2");
	String self_intro3 = request.getParameter("intro3");
	
	rBean.setUser_id(user_id);
	rBean.setResume_name(resume_name);
	rBean.setSelf_intro1(self_intro1);
	rBean.setSelf_intro2(self_intro2);
	rBean.setSelf_intro3(self_intro3);
	
	generatedKey = rMgr.insertResume(rBean);
	
	// Process edu-box data
	String[] eduTypes = request.getParameterValues("edu_type[]");
	String[] eduSchools = request.getParameterValues("edu_school[]");
	String[] eduMajors = request.getParameterValues("edu_major[]");
	String[] eduStartYears = request.getParameterValues("edu_syear[]");
	String[] eduEndYears = request.getParameterValues("edu_eyear[]");
	String[] eduStatuses = request.getParameterValues("status[]");

	// Insert each edu-box entry into the database
	if (eduTypes != null && eduSchools != null && eduMajors != null && eduStartYears != null && eduEndYears != null && eduStatuses != null) {
	    for (int i = 0; i < eduTypes.length; i++) {
	        eBean.setResume_idx(generatedKey);
	        eBean.setEdu_type(eduTypes[i]);
	        eBean.setEdu_school(eduSchools[i]);
	        eBean.setEdu_major(eduMajors[i]);
	        if(eduStartYears[i].length() > 7)
	        	eBean.setEdu_syear(eduStartYears[i].substring(0,7));
	        if(eduEndYears[i].length() > 7)
	        	eBean.setEdu_eyear(eduEndYears[i].substring(0,7));
	        eBean.setEdu_status(eduStatuses[i]);

	        if(eduTypes[i] != ""){
	        	boolean edu_result = rMgr.insertEdu(eBean); // Insert edu-box entry into the database
	        }
	    }
	}
	
	String[] careerCnames = request.getParameterValues("career_cname[]");
	String[] careerDeps = request.getParameterValues("career_dep[]");
	String[] careerJobs = request.getParameterValues("career_job[]");
	String[] careerSyears = request.getParameterValues("career_syear[]");
	String[] careerEyears = request.getParameterValues("career_eyear[]");
	String[] careerDutys = request.getParameterValues("career_duty[]");
	
	if(careerCnames != null && careerDeps != null && careerJobs != null && careerSyears != null && careerEyears != null && careerDutys != null){
		for(int i = 0; i < careerCnames.length; i++){
			caBean.setResume_idx(generatedKey);
			caBean.setCareer_cname(careerCnames[i]);
			caBean.setCareer_dep(careerDeps[i]);
			caBean.setCareer_job(careerJobs[i]);
			if(careerSyears[i].length() > 7)
				caBean.setCareer_syear(careerSyears[i].substring(0,7));
			if(careerEyears[i].length() > 7)	
				caBean.setCareer_eyear(careerEyears[i].substring(0,7));
			caBean.setCareer_duty(careerDutys[i]);
			
			if(careerCnames[i] != ""){
				boolean career_result = rMgr.insertCareer(caBean);
			}
		}
	}
	
	String[] internTypes = request.getParameterValues("intern_type[]");
	String[] internCnames = request.getParameterValues("intern_cname[]");
	String[] internSyears = request.getParameterValues("intern_syear[]");
	String[] internEyears = request.getParameterValues("intern_eyear[]");
	String[] internDutys = request.getParameterValues("intern_duty[]");
	
	if(internTypes != null && internCnames != null && internSyears != null && internEyears != null && internDutys != null){
		for(int i = 0; i < internTypes.length; i++){
			iBean.setResume_idx(generatedKey);
			iBean.setInternship_type(internTypes[i]);
			iBean.setInternship_cname(internCnames[i]);
			iBean.setInternship_syear(internSyears[i]);
			iBean.setInternship_eyear(internEyears[i]);
			iBean.setInternship_duty(internDutys[i]);
			
			if(internTypes[i] != ""){
				boolean intern_result = rMgr.insertInternship(iBean);
			}
		}
	}
	
	String[] curriculumNames = request.getParameterValues("curriculum_name[]");
	String[] curriculumCnames = request.getParameterValues("curriculum_cname[]");
	String[] curriculumSyears = request.getParameterValues("curriculum_syear[]");
	String[] curriculumEyears = request.getParameterValues("curriculum_eyear[]");
	String[] curriculumContents = request.getParameterValues("curriculum_content[]");
	
	if(curriculumNames != null && curriculumCnames != null && curriculumSyears != null && curriculumEyears != null && curriculumContents != null){
		for(int i = 0; i < curriculumNames.length; i++){
			cuBean.setResume_idx(generatedKey);
			cuBean.setCurriculum_name(curriculumNames[i]);
			cuBean.setCurriculum_cname(curriculumCnames[i]);
			cuBean.setCurriculum_syear(curriculumSyears[i]);
			cuBean.setCurriculum_eyear(curriculumEyears[i]);
			cuBean.setCurriculum_content(curriculumContents[i]);
			
			if(curriculumNames[i] != ""){
				boolean curriculum_result = rMgr.insertCurriculum(cuBean);
			}
		}
	}
	
	String[] skillSnames = request.getParameterValues("skill_sname[]");
	
	if(skillSnames != null){
		for(int i = 0; i < skillSnames.length; i++){
			sBean.setResume_idx(generatedKey);
			sBean.setSkill_sname(skillSnames[i]);
			
			
			boolean skill_result = rMgr.insertSkill(sBean);
		}
	}
	
	String[] certificateSnames = request.getParameterValues("certificate_sname[]");
	
	if(certificateSnames != null){
		for(int i = 0; i < certificateSnames.length; i++){
			ceBean.setResume_idx(generatedKey);
			ceBean.setCertificate_sname(certificateSnames[i]);
			
			boolean certificate_result = rMgr.insertCertificate(ceBean);
		}
	}
	
	String[] awardNames = request.getParameterValues("award_name[]");
	String[] awardCnames = request.getParameterValues("award_cname[]");
	String[] awardSyears = request.getParameterValues("award_syear[]");
	String[] awardContents = request.getParameterValues("award_content[]");
	
	if(awardNames != null && awardCnames != null && awardSyears != null && awardContents != null){
		for(int i = 0; i < awardNames.length; i++){
			aBean.setResume_idx(generatedKey);
			aBean.setAward_name(awardNames[i]);
			aBean.setAward_cname(awardCnames[i]);
			aBean.setAward_syear(awardSyears[i]);
			aBean.setAward_content(awardContents[i]);
			
			if(awardNames[i] != ""){
				boolean award_result = rMgr.insertAward(aBean);
			}
		}
	}
	
	String[] globalexNames = request.getParameterValues("globalex_name[]");
	String[] globalexSyears = request.getParameterValues("globalex_syear[]");
	String[] globalexEyears = request.getParameterValues("globalex_eyear[]");
	String[] globalexContents = request.getParameterValues("globalex_content[]");
	
	if(globalexNames != null && globalexSyears != null && globalexEyears != null && globalexContents != null){
		for(int i = 0; i < globalexNames.length; i++){
			gBean.setResume_idx(generatedKey);
			gBean.setGlobalex_name(globalexNames[i]);
			gBean.setGlobalex_syear(globalexSyears[i]);
			gBean.setGlobalex_eyear(globalexEyears[i]);
			gBean.setGlobalex_content(globalexContents[i]);
			
			if(globalexNames[i] != ""){
				boolean globalex_result = rMgr.insertGlobalex(gBean);
			}
		}
	}
	
	String[] languageNames = request.getParameterValues("language_name[]");
	String[] languageLevels = request.getParameterValues("language_level[]");
	
	if(languageNames != null && languageLevels != null){
		for(int i = 0; i < languageNames.length; i++){
			lBean.setResume_idx(generatedKey);
			lBean.setLanguage_name(languageNames[i]);
			lBean.setLanguage_level(languageLevels[i]);
			
			if(languageNames[i] != ""){
				boolean language_result = rMgr.insertLanguage(lBean);
			}
		}
	}
	
	String checkbox1 = request.getParameter("checkbox1");
	String checkbox2 = request.getParameter("checkbox2");
	String checkbox3 = request.getParameter("checkbox3");
	String checkbox4 = request.getParameter("checkbox4");
	String checkbox5 = request.getParameter("checkbox5");
	String disable = request.getParameter("disabled");
	String military = request.getParameter("military");
	
	preBean.setResume_idx(generatedKey);
	// 체크박스 값이 "on"이면 "대상자", null이면 "대상자 아님"
	if(!(checkbox1 == null && checkbox2 == null && checkbox3 == null && checkbox4 == null && checkbox5 == null)){
		preBean.setPreffer_miliprotect(checkbox1 != null ? "대상자" : "대상자 아님");
		preBean.setPreffer_eprotect(checkbox2 != null ? "대상자" : "대상자 아님");
		preBean.setPreffer_sprotect(checkbox3 != null ? "대상자" : "대상자 아님");

		// 장애와 병역은 선택된 경우 해당 값을, 아니면 "대상자 아님"
		preBean.setPreffer_disabilitype(checkbox4 != null ? disable : "대상자 아님");
		preBean.setPreffer_militype(checkbox5 != null ? military : "대상자 아님");
		
		
		boolean preffer_result = rMgr.insertPreffer(preBean);
	}
	
	String[] projectNames = request.getParameterValues("project_name[]");
	String[] projectSyears = request.getParameterValues("project_syear[]");
	String[] projectEyears = request.getParameterValues("project_eyear[]");
	String[] projectDutys = request.getParameterValues("project_duty[]");
	String[] projectUrls = request.getParameterValues("project_url[]");
	String[] projectFnames = request.getParameterValues("project_fname[]");
	String[] projectExtensions = request.getParameterValues("project_extension[]");
	
	if(projectNames != null && projectSyears != null && projectEyears != null && projectDutys != null && projectUrls != null && projectFnames != null && projectExtensions != null){
		for(int i = 0; i < projectNames.length; i++){
			proBean.setResume_idx(generatedKey);
			proBean.setProject_name(projectNames[i]);
			if(projectSyears[i].length() > 0)
				proBean.setProject_syear(projectSyears[i].substring(0,10));
			if(projectEyears[i].length() > 0)
				proBean.setProject_eyear(projectEyears[i].substring(0,10));
			proBean.setProject_duty(projectDutys[i]);
			proBean.setProject_url(projectUrls[i]);
			proBean.setProject_fname(projectFnames[i]);
			proBean.setProject_extension(projectExtensions[i]);
			
			if(projectNames[i] != ""){
				boolean project_result = rMgr.insertProject(proBean);
			}
		}
	}
	
	// 파일 실제 이름 배열
	String[] portfolioFnameArray = request.getParameterValues("portfolio_fname[]");
	String[] portfolioExtensionArray = request.getParameterValues("portfolio_extension[]");
/* 	String[] portfolioUdateArray = request.getParameterValues("portfolio_udates[]"); */

	List<String> portfolioFnameList = (portfolioFnameArray != null) ? Arrays.asList(portfolioFnameArray) : new ArrayList<>();
	List<String> portfolioExtensionList = (portfolioExtensionArray != null) ? Arrays.asList(portfolioExtensionArray) : new ArrayList<>();
/* 	List<String> portfolioUdateList = (portfolioUdateArray != null) ? Arrays.asList(portfolioUdateArray) : new ArrayList<>(); */

	// poBean에 파일 정보 설정
	poBean.setResume_idx(generatedKey);
	poBean.setPortfolio_fname(portfolioFnameList);
	poBean.setPortfolio_extension(portfolioExtensionList);
/* 	poBean.setPortfolio_udate(portfolioUdateList); */

	rMgr.insertPortfolio(poBean);
	
	String msg = "이력서 등록에 성공했습니다.";
%>
<script>
	alert("<%=msg%>");
	location.href="../user_page/user_home.jsp";
</script>