<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mMgr" class="match.ManagerMgr"/>
<jsp:useBean id="login" class="match.ManagerBean"/>
<jsp:setProperty property="*" name="login"/>
<%
	String url = "login.jsp";
	if(request.getParameter("url") != null && !request.getParameter("url").equals("null")){
		url = request.getParameter("url");
	}
	
	out.println(url);
	
	boolean result = mMgr.loginManager(login.getManager_id(), login.getManager_pwd());;
	String msg = "로그인 실패";
	if(result){
		msg = "로그인 성공";
		login = mMgr.getManager(login.getManager_id());
		session.setAttribute("idKey", login.getManager_id());
		session.setAttribute("login", login);
		url = "company_page/company_home.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>"
</script>