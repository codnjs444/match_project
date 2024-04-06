<!-- resumeProc.jsp -->
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

<jsp:setProperty property="*" name="uBean"/>
<jsp:setProperty property="*" name="rBean"/>
<jsp:setProperty property="*" name="eBean"/>
<jsp:setProperty property="*" name="caBean"/>
<jsp:setProperty property="*" name="iBean"/>
<jsp:setProperty property="*" name="cuBean"/>
<jsp:setProperty property="*" name="sBean"/>
<jsp:setProperty property="*" name="ceBean"/>

<%
	String msg = "실패";
	int generatedKey = 0;
	String user_id = (String)session.getAttribute("idKey");
	String resume_name = "임시";
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

	        boolean edu_result = rMgr.insertEdu(eBean); // Insert edu-box entry into the database
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
			
			boolean career_result = rMgr.insertCareer(caBean);
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
			
			boolean intern_result = rMgr.insertInternship(iBean);
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
			
			boolean curriculum_result = rMgr.insertCurriculum(cuBean);
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
%>
<script>
	location.href("resume.jsp");
</script>