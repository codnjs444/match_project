<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="uBean" class="match.UserBean"/>
<jsp:useBean id="uMgr" class="match.UserMgr"/>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<%
	String userId = request.getParameter("user_id");
	String sns = request.getParameter("sns");
	String postcode = request.getParameter("user_postcode");
	String address = request.getParameter("user_address");
	String email = request.getParameter("email_part1") + "@" + request.getParameter("email_part2");
	boolean updateSuccess = uMgr.updateUserInformation(userId, email, postcode, address, sns);
	if(updateSuccess) {
%>
		<script>
			alert("수정이 완료되었습니다.");
 			window.location.href = "userEdit_user.jsp"; // 리다이렉션 대상 페이지 경로를 확인하고 필요에 맞게 수정해주세요. 
		</script>
<%  } else { %>
		<script>
			alert("수정에 실패하였습니다.");
 			window.location.href = "userEdit_user.jsp"; // 실패 시에도 같은 페이지로 리다이렉트, 필요에 따라 수정 가능 
		</script>
<%  }
%>

<body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
