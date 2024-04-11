<%@page import="match.ManagerMgr"%>
<%@page import="match.ManagerBean"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="aMgr" class="match.application.ApplicationMgr"/>
<jsp:useBean id="mMgr" class="match.ManagerMgr"/>

<head>
		<meta charset="utf-8">
		<title> 회원정보 수정 </title> <!-- 텍스트 크기를 20px로 조정 -->
		
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
<%
	String manager_id = (String) session.getAttribute("idKey");
	ManagerMgr managerMgr = new ManagerMgr(); // ManagerMgr 객체 생성
	ManagerBean manager = managerMgr.getManager(manager_id); // manager_id에 해당하는 정보 조회
	
	// Manager 정보를 개별 변수에 저장
	String managerEmail = manager.getManager_email();
	String managerName = manager.getManager_name();
	String managerPwd = manager.getManager_pwd();
	String managerPhoneNum = manager.getManager_phonenum();
	int companyIdx = manager.getCompany_idx();
%>
		<div class="container">
			<p class="text-secondary"> 회원님의 정보를 수정/확인할 수 있습니다.</p>
			<form id="frm" name="frm" method="POST" action="Edit_admin_proc.jsp">
				<table class="table table-bordered border-dark">
					<colgroup>
						<col style="width: 30%;" />
						<col style="width: *;" />
					</colgroup>
					<tbody class="text-center">
						<tr>
							<th> 아이디 </th>
							<td> <%=manager_id %> </td>
							
						</tr>
						<tr>
							<th> 
								이름
								<span class="text-danger">*</span> 
							</th>
							<td> <input type="text" class="form-control" id = "manager_name" name="manager_name" value ="<%= managerName  %>"> </td>
						
						
						</tr>
						<tr>
							<th> 
								휴대폰 번호
								<span class="text-danger">*</span> 
							</th>
							<td> <input type="text" class="form-control" id = "manager_phonenum" name="manager_phonenum" value ="<%= managerPhoneNum  %>"> </td>
						</tr>
						<tr>
							<th> 
								이메일
								<span class="text-danger">*</span> 
							</th>
							<td> <input type="text" class="form-control" id = "manager_email" name="manager_email" value ="<%= managerEmail %>"> </td>
						</tr>												
						<tr>
							<th> 개인정보 수집<br/> 및 이용동의 </th>
							<td>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="" id="agree1">
									<input type="hidden" name="manager_id" value="<%= manager_id %>">
									<label class="form-check-label" for="agree1">
										<b>[필수]</b> 개인정보 수정 및 이용동의
									</label>
									<small style="float: right;"><a href="javascript:void(0);">내용보기</a></small>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="" id="agree2">
									<label class="form-check-label" for="agree2">
										<b>[선택]</b> 개인정보 수정 및 이용동의
									</label>
									<small style="float: right;"><a href="javascript:void(0);">내용보기</a></small>
								</div>
							</td>
						</tr>					
					</tbody>
				</table>
				<div class="text-center mt-5 mb-5">
					<button type="submit" id="btn-submit" class="btn btn-lg btn-primary" style="width: 30%;" >수정하기</button>
					<button type="button" id="btn-cancel" class="btn btn-lg btn-secondary" style="width: 30%;">취소</button>
				</div>
			</form>
		</div>
			<%@ include file="menu/bottom.jsp"%>
		<script>
			$(document).ready(function() {
				// 이메일 '직접선택' 이벤트 
				$("#select-email2").on("change", function() {
					var _this_val = $(this).val(); 
					if ( _this_val == "" ) {
						// '직접선택'
						$("#input-email2").val('').focus();
					} else {
						// email 선택
						$("#input-email2").val(_this_val);
					}
				});


			});
		</script>
	</body>
</html>
