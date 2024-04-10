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
		<%@include file="../user_page/user_top.jsp" %>
		<%@include file="../user_page/user_sidebar.jsp" %>
		<%uBean = uMgr.getUser((String)session.getAttribute("idKey")); %>
		<div style="margin-left: 50px; width: 1400px;">
			<h2> 회원정보 수정 </h2>
			<p class="text-secondary"> 회원님의 정보를 수정/확인할 수 있습니다.</p>
			<form id="frm" name="frm" method="POST" action="user_Edit_proc.jsp">
				<table class="table table-bordered border-dark">
					<colgroup>
						<col style="width: 30%;" />
						<col style="width: *;" />
					</colgroup>
					<tbody class="text-center">
						<tr>
							<th> 아이디 </th>
							<td><%=uBean.getUser_id()%></td>
							    
						</tr>
						<tr>
							<th> 
								이름
								<span class="text-danger">*</span> 
							</th>
							<td>  <input type="text" class="form-control" name="user_name" value="<%=uBean.getUser_name()%>">
						</tr>
						<tr>
							<th> 생년월일/성별 </th>
							<td>
								<div class="row ">
									<div class="row col-8">
										<div class="col-4">
											<select class="form-select" id="year-select" name="birth_year">
												<option value="">출생년도</option>
												
											</select>
										</div>
										<div class="col-4">
											<select class="form-select" id="month-select" name="birth_month">
												<option value="">월</option>
											</select>
										</div>
										<div class="col-4">
											<select class="form-select" id="day-select" name="birth_day">
												<option value="">일</option>
											</select>
										</div>
									</div>
									<div class="row col-4 ps-5 pt-2">
										<div class="form-check col-auto">
											<input class="form-check-input" type="radio" name="flexRadioDefault" id="gender1" <%= (uBean.getUser_gender()) ? "checked" : "" %> value="1">
										  <label class="form-check-label" for="gender1">
										    남
										  </label>
										</div>
										<div class="form-check col-auto">
											<input class="form-check-input" type="radio" name="flexRadioDefault" id="gender1" <%= (uBean.getUser_gender()) ? "checked" : "" %> value="0">

										  <input type="hidden" name="user_id" value="<%=uBean.getUser_id()%>">
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
										<input type="text" class="form-control" name="phone_number2" maxlength='4' value="<%=uBean.getUser_phonenum().substring(4,8)%>">
									</div>
									<span class="col-1">-</span>
									<div class="row col-3">
										<input type="text" class="form-control" name="phone_number3" maxlength='4' value="<%=uBean.getUser_phonenum().substring(9,13)%>">
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
							<%
								String email = uBean.getUser_email();
								int index = email.indexOf('@');
							%>
								<div class="row">
									<div class="col-4">
										<input type="text" class="form-control" name="email_part1" value="<%=email.substring(0, index)%>">
									</div>
									<span class="col-1">@</span>
									<div class="col-7">
										<div class="row">
											<div class="col-6 p-0 pe-1">
												<input type="text" class="form-control" id="input-email2"  name="email_part2"  value="<%=email.substring(index+1)%>">
											</div>
											<div class="col-6 p-0 ps-1">
												<select class="form-select" id="select-email2">
													<option value="">직접입력</option>
													<option value="gmail.com">gmail.com</option>
													<option value="naver.com">naver.com</option>
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
										<input type="text" class="form-control" name="sns" value="<%=uBean.getSns()%>">
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
										<input type="text" class="form-control" id="user_postcode" name="user_postcode" readonly value="<%=uBean.getPostal_code()%>">
									</div>
									<div class="col-auto">
										<button type="button" class="btn btn-primary" id="btn-address-search"  onClick="execDaumPostcode()"> 주소검색 </button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th> 주소 </th>
							<td> 
								<div class="row">
									<div class="col-6"><input type="text" class="form-control" id="user_address" name="user_address" readonly value="<%=uBean.getUser_address()%>"></div>
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
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

				});
				// 취소하기 버튼 이벤트 
				$("#btn-cancel").on("click", function() {
					// todo. 이전페이지 돌아가기
					history.back();
				});
			});
			$(document).ready(function() {
		        // 서버에서 가져온 생년월일 값을 JavaScript 변수로 설정
		        var birthday = '<%= uBean.getBirthday() %>';
		        var birthYear = parseInt(birthday.substring(0, 4), 10);
		        var birthMonth = parseInt(birthday.substring(5, 7), 10);
		        var birthDay = parseInt(birthday.substring(8, 10), 10);

		        // 출생년도 선택지 설정
		        var currentYear = new Date().getFullYear();
		        for (var year = currentYear; year >= currentYear - 100; year--) {
		            $('<option>', {
		                value: year,
		                text: year,
		                selected: year === birthYear // 출생년도를 기본값으로 선택
		            }).appendTo('#year-select'); // 'year-select'는 출생년도 선택 select 태그의 id입니다.
		        }

		        // 월 설정
		        for (var month = 1; month <= 12; month++) {
		            $('<option>', {
		                value: month < 10 ? '0' + month : month,
		                text: month,
		                selected: month === birthMonth // 출생월을 기본값으로 선택
		            }).appendTo('#month-select'); // 'month-select'는 월 선택 select 태그의 id입니다.
		        }

		        // 월 선택에 따른 일수 자동 설정 함수
		        function setDays() {
		            var year = $('#year-select').val();
		            var month = $('#month-select').val();
		            var daysInMonth = new Date(year, month, 0).getDate();

		            $('#day-select').empty(); // 'day-select'는 일 선택 select 태그의 id입니다.
		            for (var day = 1; day <= daysInMonth; day++) {
		                $('<option>', {
		                    value: day < 10 ? '0' + day : day,
		                    text: day,
		                    selected: day === birthDay // 출생일을 기본값으로 선택
		                }).appendTo('#day-select');
		            }
		        }

		        // 월 선택 시 일수 업데이트
		        $('#month-select').change(function() {
		            setDays();
		        });

		        // 초기 일수 설정
		        setDays();
		        
		     // 서버에서 가져온 성별 정보를 JavaScript 변수로 설정
		        var userGender = parseInt('<%= uBean.getUser_gender() %>', 10); // 문자열을 정수로 변환

		        // 성별에 따라 해당 라디오 버튼 선택
		        if (userGender === 0) {
		            $('#gender1').prop('checked', true);
		        } else if (userGender === 1) {
		            $('#gender2').prop('checked', true);
		        }
		    })
		    function execDaumPostcode() {
			    new daum.Postcode({
			        oncomplete: function(data) {
			            var addr = '';
			
			            if (data.userSelectedType === 'R') {
			                addr = data.roadAddress;
			            } else {
			                addr = data.jibunAddress;
			            }
			
		                document.getElementById('user_postcode').value = data.zonecode;
		                document.getElementById("user_address").value = addr;
			        }
			    }).open();
			}
	    </script>
	</body>
</html>
