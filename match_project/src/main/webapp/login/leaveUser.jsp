<%@page contentType="text/html; charset=UTF-8"%>
<%
		
%>

<!DOCTYPE html> 
<html  lang="ko">
	<head>
		<meta charset="utf-8">
		<title> Match 회원탈퇴 </title>
		
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
			<div class="container ps-5 pe-5 mt-5 mb-5" >
				<p class="text-secondary fs-5"> 지금까지 이용해주셔서 감사드립니다. 탈퇴하기 전 아래 유의사항을 확인해주세요. </p>
				<p class="text-secondary fs-6"> 1. 탈퇴하신 아이디는 복구가 불가능하며, 추후 동일한 아이디로 재가입이 되지 않습니다. </p>
				<p class="text-secondary fs-6"> 2. 이력서 정보, 구직 활동내역이 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. </p>
				<p class="text-secondary fs-6"> 3. 소셜 로그인 회원의 경우, 모든 정보가 삭제되며 같은 소셜 아이돌 재가입시 신규 회원으로 가입됩니다. </p>
			</div>
			<form id="frm" name="frm" method="POST" action="user_LeaveProc.jsp">
				<table class="table table-bordered border-dark">
					<colgroup>
						<col style="width: 30%;" />
						<col style="width: *;" />
					</colgroup>
					<tbody class="text-center">
						<tr>
							<th> 아이디 </th>
							<td> <%=uBean.getUser_id()%> </td>
						</tr>
						<tr>
							<th> 비밀번호 </th>
							<td> 
								<input type="password" class="form-control">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="d-flex justify-content-center">
					<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					  <label class="form-check-label" for="flexCheckDefault">
					    유의사항을 모두 확인했으며, 이에 동의합니다.
					  </label>
					</div>
				</div>
				<div class="text-center mt-5 mb-5">
					<button type="submit" id="btn-submit" class="btn btn-lg btn-primary" style="width: 30%;" >탈퇴하기</button>
				</div>
			</form>
		</div>
		
		<script>
			$(document).ready(function() {
				// 탈퇴하기 버튼 이벤트 
				$("#frm").on("submit", function(e) {
					var userPwdFromServer = "<%=uBean.getUser_pwd()%>";
					var currentPwd = $("input[type=password]").eq(0).val().trim();
					var isTermsChecked = $("#flexCheckDefault").is(":checked"); // 체크박스 상태 확인

					if (currentPwd !== userPwdFromServer) {
		                e.preventDefault(); // 폼 제출 막기
		                alert("비밀번호가 틀렸습니다.");
		                return false;
		            }
					if (!isTermsChecked) {
		                e.preventDefault(); // 폼 제출 막기
		                alert("유의사항에 동의하지 않으면 탈퇴할 수 없습니다.");
		                return false;
		            }
				});
			});
		</script>
	</body>
</html>