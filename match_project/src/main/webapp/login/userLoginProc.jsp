<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="uMgr" class="match.UserMgr"/>
<jsp:useBean id="login" class="match.UserBean"/>
<jsp:setProperty property="*" name="login"/>
<%
	String url = "login.jsp";
	if(request.getParameter("url") != null && !request.getParameter("url").equals("null")){
		url = request.getParameter("url");
	}
	
	boolean result = uMgr.loginUser(login.getUser_id(), login.getUser_pwd());
	String msg = "로그인 실패";
	if(result){
		msg = "로그인 성공";
		login = uMgr.getUser(login.getUser_id());
		session.setAttribute("idKey", login.getUser_id());
		session.setAttribute("login", login);
		url = "../user_page/user_home.jsp";
	}	
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>"
</script>