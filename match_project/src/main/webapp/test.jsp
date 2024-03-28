<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>test</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	    <link href="css/signupstyle.css" rel="stylesheet" type="text/css">
	    <style>
		    
	    </style>
	</head>
	<body class="main-tab">
		<div class="logo" align="center">
			<button type="button" onclick="redirectTo('user_page/user_home.jsp')">
				<img src="img/logo.png" width="210" height="50">
			</button>
		</div>
		<main class="form-signin">
		<div class="row">
			<div class="col-12">
				<ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
					<li class="nav-item col-8 border-bottom	" role="presentation">
						<button class="nav-link active" id="user-tab" data-bs-toggle="tab" data-bs-target="#user-tab-pane" type="button" role="tab" aria-controls="user-tab-pane" aria-selected="true">개인회원</button>
					</li>
					<li class="nav-item col-4" role="presentation">
						<button class="nav-link" id="manager-tab" data-bs-toggle="tab" data-bs-target="#manager-tab-pane" type="button" role="tab" aria-controls="manager-tab-pane" aria-selected="false">기업회원</button>
					</li>
				</ul>
			</div>
		</div>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active p-3" id="user-tab-pane" role="tabpanel" aria-labelledby="user-tab" tabindex="0">
				<div align="center">
					<form name="regFrm" method="post" action="userSignupProc.jsp">
						<table cellpadding="5">
							<tr>
								<td>
									<h6 class="col-8">회원가입하고 다양한 혜택을 누리세요!</h6>
									<p class="col-4" style="font-size: 10px; color: #ff0000">* 필수 입력 정보입니다.</p>
								</td>
							</tr>
							<tr>
								<td class="input-text">
									<input class="user" name="user_name" id="user_name" size="15" placeholder="이름">
								</td>
							<tr>
								<td class="input-text">
									<input class="user" name="user_id" id="user_id" size="15" placeholder="아이디">
								</td>
							</tr>
							<tr>
								<td class="input-text">
									<input class="user" type="password" name="user_pwd" id="user_pwd" size="15"placeholder="비밀번호">
								</td>
							<tr>
								<td class="input-text">
									<input class="user" name="user_email" id="user_email" size="30"placeholder="이메일">
								</td>
							</tr>
							<tr>
								<td class="input-text">
									<input class="user" name="user_phonenum" id="user_phonenum" size="30"placeholder="휴대폰 번호">
								</td>
							</tr>
							<tr>
								<td>
									<div class="row">
									<div class="col">
										<label for="year">연도</label> <select id="year" name="year" class="form-control">
											<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
										</select>
									</div>
									<div class="col">
										<label for="month">월</label> <select id="month" class="form-control">
											<option value="1">1월</option>
											<option value="2">2월</option>
											<option value="3">3월</option>
											<option value="4">4월</option>
											<option value="5">5월</option>
											<option value="6">6월</option>
											<option value="7">7월</option>
											<option value="8">8월</option>
											<option value="9">9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
											<!-- 나머지 월도 마찬가지로 추가합니다. -->
										</select>
									</div>
									<div class="col">
										<label for="day">일</label> <select id="day" class="form-control">
											<!-- 일은 JavaScript로 동적으로 추가됩니다. -->
										</select>
									</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<input type="radio" name="gender" value="1" checked> 남
									<input type="radio" name="gender" value="2">여
								</td>
							</tr>
							<tr>
								<td class="input-text">
									<input class="address1" name="postal_code" id="postcode" size="5" readonly placeholder="우편번호">
									<input type="button" value="우편번호찾기" onClick="execDaumPostcode()">
								</td>
							</tr>
							<tr>
								<td class="input-text"><input class="user" name="user_address" id="address" size="45" placeholder="주소"></td>
							</tr>
							<tr>
								<td class="input-text"><input class="user" id="detailAddress" placeholder="상세주소"></td>
							</tr>
							<tr>
						        <td colspan="2">
						            <div class="keep">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 160px;">
						                        <span>필수동의 항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보 수신(선택)에 모두 동의합니다.</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 40px; height: 40px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2">
						            <div class="keep-small1">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 20px;">
						                        <span>[필수]만 15세 이상입니다.</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2">
						            <div class="keep-small1">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 20px;">
						                        <span>[필수]이용약관 동의</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2">
						            <div class="keep-small1">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 20px;">
						                        <span>[필수]개인정보 수집 및 이용 동의</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2">
						            <div class="keep-small2">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 20px;">
						                        <span>[선택]개인정보 수집 및 이용 동의</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2">
						            <div class="keep-small2">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 20px;">
						                        <span>[선택]광고성 정보 이메일 수신 동의</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2">
						            <div class="keep-small2">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 20px;">
						                        <span>[선택]광고성 정보 SMS 수신 동의</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
							<tr>
								<td colspan="3" align="center">
								   <button type="submit" class="join-button" onclick="inputCheck()">가입하기</button>
								 </td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="tab-pane fade p-3" id="manager-tab-pane" role="tabpanel" aria-labelledby="manager-tab" tabindex="0">
				<div align="center">
					<form name="regFrm" method="post" action="managerSignupProc.jsp">
						<table cellpadding="5">
							<tr>
								<tr>
									<td class="input-text">
										<input class="user" name="user_name" id="user_name" size="15" placeholder="이름">
									</td>
							</tr>
							<tr>
								<td width="50%">
									<input name="user_id" id="user_id" size="15" placeholder="아이디">
								</td>
							</tr>
							<tr>
								<td><input type="password" name="user_pwd" id="user_pwd" size="15"placeholder="비밀번호"></td>
							<tr>
								<td>
									<input type="radio" name="gender" value="1" checked> 남
									<input type="radio" name="gender" value="2">여
								</td>
							</tr>
							<tr>
								<td>
									<div class="row">
									<div class="col">
										<label for="year">년</label> <select id="year" class="form-control">
											<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
										</select>
									</div>
									<div class="col">
										<label for="month">월</label> <select id="month" class="form-control">
											<option value="1">1월</option>
											<option value="2">2월</option>
											<option value="3">3월</option>
											<option value="4">4월</option>
											<option value="5">5월</option>
											<option value="6">6월</option>
											<option value="7">7월</option>
											<option value="8">8월</option>
											<option value="9">9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
											<!-- 나머지 월도 마찬가지로 추가합니다. -->
										</select>
									</div>
									<div class="col">
										<label for="day">일</label> <select id="day" class="form-control">
											<!-- 일은 JavaScript로 동적으로 추가됩니다. -->
										</select>
									</div>
									</div>
								</td>
							</tr>
							<tr>
								<td><input name="user_email" id="user_email" size="30"placeholder="이메일">
								</td>
							</tr>
							<tr>
								<td><input name="user_phonenum" id="user_phonenum" size="30"placeholder="전화번호"></td>
							</tr>
							<tr>
								<td>
									<input name="postal_code" id="postcode" size="5" readonly placeholder="우편번호">
									<input type="button" value="우편번호찾기" onClick="execDaumPostcode()">
								</td>
							</tr>
							<tr>
								<td><input name="user_address" id="address" size="45" placeholder="주소"></td>
							</tr>
							<tr>
								<td><input id="detailAddress" placeholder="상세주소"></td>
							</tr>
							<tr>
						        <td colspan="2">
						            <div class="keep">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 160px;">
						                        <span>필수동의 항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보 수신(선택)에 모두 동의합니다.</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 40px; height: 40px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2">
						            <div class="keep-small1">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 20px;">
						                        <span>[필수]만 15세 이상입니다.</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2">
						            <div class="keep-small1">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 20px;">
						                        <span>[필수]이용약관 동의</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2">
						            <div class="keep-small1">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 20px;">
						                        <span>[필수]개인정보 수집 및 이용 동의</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2">
						            <div class="keep-small2">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 20px;">
						                        <span>[선택]개인정보 수집 및 이용 동의</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2">
						            <div class="keep-small2">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 20px;">
						                        <span>[선택]광고성 정보 이메일 수신 동의</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2">
						            <div class="keep-small2">
						                <div class="check-text">
						                    <div style="flex-grow: 1; margin-right: 20px;">
						                        <span>[선택]광고성 정보 SMS 수신 동의</span>
						                    </div>
						                    <div class="checkbox-container" style="margin-left: auto;">
						                        <input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						                    </div>
						                </div>
						            </div>
						        </td>
						    </tr>
							<tr>
								<td colspan="3" align="center">
								   <button type="submit" onclick="inputCheck()">가입하기</button>
								 </td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		</main>
	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script>
	        function redirectTo(page) {
				window.location.href = page;
			}
	     // 연도 옵션 동적 생성
	        var yearDropdown = document.getElementById("year");
	        var currentYear = new Date().getFullYear();
	        for (var i = currentYear - 100; i <= currentYear; i++) {
	            var option = document.createElement("option");
	            option.text = i;
	            option.value = i;
	            yearDropdown.appendChild(option);
	        }
	        function updateDays() {
	            var selectedYear = document.getElementById("year").value;
	            var selectedMonth = document.getElementById("month").value;
	            var daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();
	            var dayDropdown = document.getElementById("day");
	            dayDropdown.innerHTML = ""; // 기존 옵션 제거
	            for (var i = 1; i <= daysInMonth; i++) {
	                var option = document.createElement("option");
	                option.text = i;
	                option.value = i;
	                dayDropdown.appendChild(option);
	            }
	        }
	        // 월과 연도 선택시 일 옵션 업데이트
	        document.getElementById("year").addEventListener("change", updateDays);
	        document.getElementById("month").addEventListener("change", updateDays);

	        // 페이지 로드시 초기 일 옵션 설정
	        updateDays();
	        
	        document.addEventListener('DOMContentLoaded',function() {
				var keepCheckbox = document.querySelector('.keep input[type="checkbox"]');
				var smallCheckboxes = document.querySelectorAll('.keep-small1 input[type="checkbox"], .keep-small2 input[type="checkbox"]');
				function updateKeepCheckbox() {
					// 작은 체크박스들 중 하나라도 체크가 해제되었는지 확인합니다.
					var anyUnchecked = Array.from(smallCheckboxes).some(function(checkbox) {
						return !checkbox.checked;
					});

					// 작은 체크박스들 중 하나라도 체크가 해제되었다면 keep도 체크를 해제합니다.
					keepCheckbox.checked = !anyUnchecked;
				}

				keepCheckbox.addEventListener('click', function() {
					var isChecked = this.checked;
					smallCheckboxes.forEach(function(smallCheckbox) {
						smallCheckbox.checked = isChecked;
					});
				});

				smallCheckboxes.forEach(function(smallCheckbox) {
					smallCheckbox.addEventListener('click',
							updateKeepCheckbox);
				});
			});
	        
	        document.addEventListener('DOMContentLoaded', function() {
				var navTabs = document.querySelectorAll('.nav-tabs .nav-link');
				navTabs.forEach(function(tab) {tab.addEventListener('click', function() {
					var selectedTab = this.getAttribute('data-bs-target');
					var allTabs = document.querySelectorAll('.nav-tabs .nav-link');
						allTabs.forEach(function(tab) {
							var tabId = tab.getAttribute('data-bs-target');
							if (tabId === selectedTab) {
								tab.parentElement.classList.remove('col-4');
								tab.parentElement.classList.add('col-8');
							} else {
								tab.parentElement.classList.remove('col-8');
								tab.parentElement.classList.add('col-4');
							}
						});
					});
				});
			});
	        
		    function execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postcode').value = data.zonecode;
		                document.getElementById("address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("detailAddress").focus();
		            }
		        }).open();
		    }
		</script>
	</body>
</html>