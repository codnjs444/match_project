<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="arBean" class="match.application.application_resultBean"/>
<jsp:useBean id="aMgr" class="match.application.ApplicationMgr2"/>
<jsp:useBean id="aBean" class="match.application.ApplicationBean"/>
<%
	int resume_idx = Integer.parseInt(request.getParameter("resume_idx"));
	int posting_idx = Integer.parseInt(request.getParameter("posting_idx"));
	String user_id = request.getParameter("user_id");
	
	aBean.setUser_id(user_id);
	aBean.setResume_idx(resume_idx);
	aBean.setPosting_idx(posting_idx);
	
	aMgr.insertApplication(posting_idx, resume_idx, user_id);
	aMgr.insertApplicationResult(posting_idx, user_id);
	
	String msg = "지원 완료했습니다.";
	String location = "user_home.jsp";
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>