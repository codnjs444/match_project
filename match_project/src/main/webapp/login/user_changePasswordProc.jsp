<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="uBean" class="match.UserBean"/>
<jsp:useBean id="uMgr" class="match.UserMgr"/>
<jsp:setProperty property="*" name="uBean"/>
<%
	String id = (String)session.getAttribute("idKey");
	String pwd = request.getParameter("new_password");
	uBean.setUser_pwd(pwd);
	uBean.setUser_id(id);
	uMgr.updateUserPassword(uBean);
	String msg = "비밀번호 변경 완료했습니다.";
	String location = "../user_page/user_home.jsp";
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location%>"
</script>