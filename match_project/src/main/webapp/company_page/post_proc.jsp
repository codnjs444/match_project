<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mMgr" class="match.ManagerMgr"/>
<jsp:useBean id="mBean" class="match.ManagerBean"/>

<jsp:useBean id="pMgr" class="match.PostingMgr"/>
<jsp:useBean id="pBean" class="match.PostingBean"/>

<jsp:useBean id="opBean" class="match.posting.OpenPositionBean"/>
<jsp:useBean id="qBean" class="match.posting.QualificationBean"></jsp:useBean>

<jsp:setProperty property="*" name="pBean"/>
<jsp:setProperty property="*" name="opBean"/>
<jsp:setProperty property="*" name="qBean"/>
<!DOCTYPE html>

<%
	String manager_id = (String)session.getAttribute("idKey");
	String company_idx = mMgr.getCompany_idx(manager_id);
	String posting_type = "블라인드";
	String posting_cname = request.getParameter("posting_cname");
	String posting_name = request.getParameter("posting_name");
	String posting_pcode = request.getParameter("posting_pcode");
	String posting_address = request.getParameter("posting_address");
	String posting_status = "진행중";
	int posting_view = 0;
	
	pBean.setManager_id(manager_id);
	pBean.setPosting_type(posting_type);
	pBean.setPosting_cname(posting_cname);
	pBean.setPosting_name(posting_name);
	pBean.setPosting_pcode(posting_pcode);
	pBean.setPosting_address(posting_address);
	pBean.setPosting_view(posting_view);
	pBean.setPosting_status(posting_status);
	/*--------------------------------------------------------------------------------*/
	int generatedKey = pMgr.insertBpost(pBean);
	/*--------------------------------------------------------------------------------*/
	String openposition_name = request.getParameter("openposition_name");
	String openposition_duty = request.getParameter("openposition_duty");
	
	String openposition_num_str = request.getParameter("openposition_num");
	int openposition_num = Integer.parseInt(openposition_num_str);

	String openposition_sname = request.getParameter("openposition_sname");
	String openposition_position = request.getParameter("openposition_position");

	opBean.setPosting_idx(generatedKey);
	opBean.setOpenposition_name(openposition_name);
	opBean.setOpenposition_duty(openposition_duty);
	opBean.setOpenposition_num(openposition_num);
	opBean.setOpenposition_sname(openposition_sname);
	opBean.setOpenposition_position(openposition_position);
	
	pMgr.insertOpenposition(opBean);
	/*--------------------------------------------------------------------------------*/
	String qualification_edutype = request.getParameter("qualification_edutype");
	String qualification_gender = request.getParameter("qualification_gender");
	String qualification_experience = request.getParameter("qualification_experience");
	String qualification_skill = request.getParameter("selectedSkills");
	/*수정 필요*/
 	String qualification_certificate = request.getParameter("qualification_certificate"); 
/*  	String[] skillsArray = qualification_skill.split(","); */

	
	qBean.setPosting_idx(generatedKey);
	qBean.setQualification_edutype(qualification_edutype);
	qBean.setQualification_gender(qualification_gender);
	qBean.setQualification_experience(qualification_experience);
	qBean.setQualification_skill(qualification_skill);
	qBean.setQualification_certificate(qualification_certificate);
	
	pMgr.insertQualification(qBean);
	
	String msg = "공고 등록이 완료 되었습니다.";
	String location = "company_home.jsp";
	
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
