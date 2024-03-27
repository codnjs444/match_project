<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="uMgr" class="match.UserMgr"/>
<jsp:useBean id="uBean" class="match.UserBean"/>
<jsp:setProperty property="*" name="uBean"/>
<%
	boolean result = uMgr.signUpUser(uBean);
	String msg = "가입실패";
	String location = "signup.jsp";
	if(result){
		msg = "가입성공";
		location = "login.jsp";
		//가입과 동시에 로그인 처리
		session.setAttribute("idKey", uBean.getUser_id());
	}	
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>