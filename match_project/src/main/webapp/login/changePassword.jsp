<%@page contentType="text/html; charset=UTF-8"%>
<%
		
%>

<!DOCTYPE html> 
<html  lang="ko">
	<head>
		<meta charset="utf-8">
		<title> 비밀번호 변경 </title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<style>
			table.table th { background-color: #e2e3e5; line-height: 30px; vertical-align: middle; }
			table.table td { text-align: left; padding: 0.55rem 1.15rem; }
			table.table span { line-height: 35px; vertical-align: middle; }
		</style>		
	</head>
	
	<body>
		<%@include file="../user_page/user_top.jsp" %>
		<%@include file="../user_page/user_sidebar.jsp" %>
		<%@include file="../user_page/user_subtop.jsp" %>
		<div style="width: 1400px; margin-left: 50px;">
			<p class="text-secondary"> 비밀번호는 8~16자 숫자, 영어, 특수문자를 사용할 수 있습니다. </p>
			<form id="frm" name="frm" method="POST" action="user_changePasswordProc.jsp">
				<table class="table table-bordered border-dark">
					<colgroup>
						<col style="width: 30%;" />
						<col style="width: *;" />
					</colgroup>
					<tbody class="text-center">
						<tr>
							<th> 현재 비밀번호 </th>
							<td> <input type="password" class="form-control" value=""> </td>
						</tr>
						<tr>
							<th> 새로운 비밀번호 </th>
							<td> 
								<input type="password" class="form-control" id="new_password">
								<input type="hidden" name="new_password" id="flag_confirm_password" value=""> 
							</td>
						</tr>
						<tr>
							<th> 새로운 비밀번호 확인 </th>
							<td> <input type="password" class="form-control" id="confirm_new_password"> </td>
						</tr>
					</tbody>
				</table>
				<div class="text-center mt-5 mb-5">
					<button type="submit" id="btn-submit" class="btn btn-lg btn-primary" style="width: 30%;" >수정하기</button>
					<button type="button" id="btn-cancel" class="btn btn-lg btn-secondary" style="width: 30%;">취소</button>
				</div>
			</form>
		</div>
		
		<script>
			$(document).ready(function() {
		        // 폼 제출 이벤트 핸들러
		        $("#frm").on("submit", function(e) {
		            var userPwdFromServer = "<%=uBean.getUser_pwd()%>";
		            var currentPwd = $("input[type=password]").eq(0).val().trim(); // 현재 비밀번호 입력 필드 값
		            var newPassword = $("#new_password").val().trim(); // 새로운 비밀번호 입력 필드 값
		            var confirmNewPassword = $("#confirm_new_password").val().trim(); // 새로운 비밀번호 확인 입력 필드 값
	
		            // 현재 비밀번호가 서버의 비밀번호와 일치하지 않는 경우
		            if (currentPwd !== userPwdFromServer) {
		                e.preventDefault(); // 폼 제출 막기
		                alert("현재 비밀번호가 틀렸습니다.");
		                return false;
		            }
	
		            // 새 비밀번호가 비어 있는 경우
		            if (newPassword === "") {
		                e.preventDefault();
		                alert("변경할 비밀번호를 입력해주세요.");
		                return false;
		            }
	
		            // 새 비밀번호와 새 비밀번호 확인 값이 일치하지 않는 경우
		            if (newPassword !== confirmNewPassword) {
		                e.preventDefault(); // 폼 제출 막기
		                alert("새로운 비밀번호가 일치하지 않습니다.");
		                return false;
		            }
	
		            // 새 비밀번호 값을 hidden input에 설정
		            $("#flag_confirm_password").val(newPassword);
	
		            // 폼 제출 진행
		        });
	
		        // 취소 버튼 이벤트
		        $("#btn-cancel").click(function() {
		            history.back(); // 이전 페이지로 이동
		        });
		    });
		</script>
	</body>
</html>