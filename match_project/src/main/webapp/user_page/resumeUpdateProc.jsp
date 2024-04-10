<%@page contentType="text/html; charset=UTF-8"%> 
<jsp:useBean id="uBean" class="match.UserBean"/>
<jsp:useBean id="uMgr" class="match.UserMgr"/>
<jsp:useBean id="rBean" class="match.ResumeBean"/>
<jsp:useBean id="rMgr" class="match.ResumeMgr"/>
<jsp:setProperty property="*" name="rBean"/>
<!DOCTYPE html>
<%
	String self_intro1 = request.getParameter("intro1");
	String self_intro2 = request.getParameter("intro2");
	String self_intro3 = request.getParameter("intro3");
	
	String resume_name = request.getParameter("resume_name");
	
	rBean.setResume_name(resume_name);
	rBean.setSelf_intro1(self_intro1);
	rBean.setSelf_intro2(self_intro2);
	rBean.setSelf_intro3(self_intro3);
	
	String resume_idx = request.getParameter("resume_idx");
	
	rMgr.updateResume(rBean);
	String msg = "이력서 수정이 완료되었습니다.";
	String location = "../login/applicationList.jsp";
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>