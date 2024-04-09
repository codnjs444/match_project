<%@page contentType="text/html; charset=UTF-8"%>
<%
// 회원정보 수정		
%>

<!DOCTYPE html> 
<html  lang="ko">
	<head>
		<meta charset="utf-8">
		<title> 회원정보 수정 </title>
		
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
		<div class="container">
			<h2> 회원정보 수정 </h2>
			<p class="text-secondary"> 회원님의 정보를 수정/확인할 수 있습니다.</p>
			<form id="frm" name="frm" method="POST">
				<table class="table table-bordered border-dark">
					<colgroup>
						<col style="width: 30%;" />
						<col style="width: *;" />
					</colgroup>
					<tbody class="text-center">
						<tr>
							<th> 아이디 </th>
							<td> hwj5614 </td>
						</tr>
						<tr>
							<th> 
								이름
								<span class="text-danger">*</span> 
							</th>
							<td> <input type="text" class="form-control"> </td>
						</tr>
						<tr>
							<th> 생년월일/성별 </th>
							<td>
								<div class="row ">
									<div class="row col-8">
										<div class="col-4">
											<select class="form-select">
												<option value="">출생년도</option>
												<option value="2024">2024</option>
											</select>
										</div>
										<div class="col-4">
											<select class="form-select">
												<option value="">월</option>
												<option value="01">1</option>
											</select>
										</div>
										<div class="col-4">
											<select class="form-select">
												<option value="">일</option>
												<option value="01">01</option>
											</select>
										</div>
									</div>
									<div class="row col-4 ps-5 pt-2">
										<div class="form-check col-auto">
										  <input class="form-check-input" type="radio" name="flexRadioDefault" id="gender1">
										  <label class="form-check-label" for="gender1">
										    남
										  </label>
										</div>
										<div class="form-check col-auto">
										  <input class="form-check-input" type="radio" name="flexRadioDefault" id="gender2">
										  <label class="form-check-label" for="gender2">
										    여
										  </label>
										</div>
									</div>
								</div> 
							</td>
						</tr>
						<tr>
							<th> 
								휴대폰번호
								<span class="text-danger">*</span> 
							</th>
							<td>
								<div class="row">
									<div class="col-3">
										<select class="form-select">
											<option value="010"> 010 </option>
										</select>
									</div>
									<span class="col-1">-</span>
									<div class="row col-3">
										<input type="text" class="form-control" maxlength='4'>
									</div>
									<span class="col-1">-</span>
									<div class="row col-3">
										<input type="text" class="form-control" maxlength='4'>
									</div>
								</div> 
							</td>
						</tr>
						<tr>
							<th> 전화번호 </th>
							<td>  
								<div class="row">
									<div class="col-3">
										<select class="form-select">
											<option value=""> 지역번호 선택 </option>
											<option value="02"> 02 </option>
										</select>
									</div>
									<span class="col-1">-</span>
									<div class="row col-3">
										<input type="text" class="form-control" maxlength='4'>
									</div>
									<span class="col-1">-</span>
									<div class="row col-3">
										<input type="text" class="form-control" maxlength='4'>
									</div>
								</div> 
							</td>
						</tr>
						<tr>
							<th> 
								이메일
								<span class="text-danger">*</span> 
							</th>
							<td>
								<div class="row">
									<div class="col-4">
										<input type="text" class="form-control">
									</div>
									<span class="col-1">@</span>
									<div class="col-7">
										<div class="row">
											<div class="col-6 p-0 pe-1">
												<input type="text" class="form-control" id="input-email2">
											</div>
											<div class="col-6 p-0 ps-1">
												<select class="form-select" id="select-email2">
													<option value="">직접입력</option>
													<option value="gmail.com">gmail.com</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th> 개인 홈페이지 </th>
							<td>
								<div class="row"> 
									<div class="col-8">
										<input type="text" class="form-control">
									</div> 
									<small class="col-4 text-end" > ( 블로그, SNS, Github 등 ) </small>
								</div>
							</td>
						</tr>
						<tr>
							<th> 우편번호 </th>
							<td>
								<div class="row g-3">
									<div class="col-auto">
										<input type="text" class="form-control">
									</div>
									<div class="col-auto">
										<button type="button" class="btn btn-primary" id="btn-address-search"> 주소검색 </button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th> 주소 </th>
							<td> 
								<div class="row">
									<div class="col-6"><input type="text" class="form-control" readonly></div>
									<div class="col-6"><input type="text" class="form-control" readonly placeholder="상세주소를 입력하세요."></div>
								</div>
							</td>
						</tr>
						<tr>
							<th> 개인정보 수집<br/> 및 이용동의 </th>
							<td>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="" id="agree1">
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
		
		<script>
			$(document).ready(function() {
				// 주소 검색 
				$("#btn-address-search").on("click", function() {
					// todo. Daum 주소찾기 API 
					
				});
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
				// 수정하기 버튼 이벤트 
				$("#btn-submit").on("click", function() {
					// todo. validate 
					return false;
				});
				// 취소하기 버튼 이벤트 
				$("#btn-cancel").on("click", function() {
					// todo. 이전페이지 돌아가기
					history.back();
				});
			});
		</script>
	</body>
</html>
