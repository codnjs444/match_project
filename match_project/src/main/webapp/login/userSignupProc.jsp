<!-- userSignupProc.jsp -->
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="uMgr" class="match.UserMgr"/>
<jsp:useBean id="uBean" class="match.UserBean"/>
<jsp:setProperty property="*" name="uBean"/>
<!DOCTYPE html>
<%
	//폼 데이터 추출
	String name = request.getParameter("user_name");
	String id = request.getParameter("user_id");
	String pwd = request.getParameter("user_pwd");
	String email = request.getParameter("user_email");
	String phonenum = request.getParameter("user_phonenum");
	String year = request.getParameter("year");
	int month = Integer.parseInt(request.getParameter("month"));
	String formatMonth = String.format("%02d", month);
	
	int day = Integer.parseInt(request.getParameter("day"));
	String formatDay = String.format("%02d", day);
	
	String birthday = year + formatMonth + formatDay;
	// 성별 값 가져오기
	String genderStr = request.getParameter("user_gender");
	boolean gender = "male".equals(genderStr); // 남성인 경우 true, 그렇지 않으면 false
	String postal = request.getParameter("user_postcode");
	String address = request.getParameter("user_address");
	String sns = request.getParameter("user_sns");
	// 다른 사용자 정보도 필요한 경우 이와 같이 추출
	
	
	
	
	// UserBean 객체에 사용자 정보 설정
	uBean.setUser_name(name);
	uBean.setUser_id(id);
	uBean.setUser_pwd(pwd);
	uBean.setUser_email(email);
	uBean.setUser_phonenum(phonenum);
	uBean.setBirthday(birthday);
	uBean.setUser_gender(gender);
	uBean.setUser_pwd(pwd);
	uBean.setPostal_code(postal);
	uBean.setUser_address(address);
	uBean.setSns(sns);

	boolean result = uMgr.signUpUser(uBean);
	String msg = "가입실패";
	String location = "signup.jsp";
	if(result){
		msg = "가입성공";
		location = "login.jsp";
		//가입과 동시에 로그인 처리
		//session.setAttribute("idKey", uBean.getUser_id());
	}	
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>