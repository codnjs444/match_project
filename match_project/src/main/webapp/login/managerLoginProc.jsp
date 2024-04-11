<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mMgr" class="match.ManagerMgr"/>
<jsp:useBean id="mlogin" class="match.ManagerBean"/>
<jsp:setProperty property="*" name="mlogin"/>
<%
	String url = "login.jsp";
	if(request.getParameter("murl") != null && !request.getParameter("murl").equals("null")){
		url = request.getParameter("murl");
	}
	
	boolean result = mMgr.loginManager(mlogin.getManager_id(), mlogin.getManager_pwd());;
	String msg = "로그인 실패";
	if(result){
		msg = "로그인 성공";
		mlogin = mMgr.getManager(mlogin.getManager_id());
		session.setAttribute("idKey", mlogin.getManager_id());
		session.setAttribute("login", mlogin);
		url = "../company_page/company_home.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>"
</script>