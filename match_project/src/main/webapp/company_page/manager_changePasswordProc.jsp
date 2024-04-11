<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mBean" class="match.ManagerBean"/>
<jsp:useBean id="mMgr" class="match.ManagerMgr"/>
<jsp:setProperty property="*" name="mBean"/>
<%
	String id = (String)session.getAttribute("idKey");
	String pwd = request.getParameter("new_password");
	mBean.setManager_pwd(pwd);;
	mBean.setManager_id(id);
	mMgr.updateManagerPassword(id, pwd);
	String msg = "비밀번호 변경 완료했습니다.";
	String location = "Edit_admin_changep.jsp"; // 기본 리다이렉션 URL
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>"
</script>