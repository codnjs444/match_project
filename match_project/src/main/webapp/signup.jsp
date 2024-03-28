<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"rel="stylesheet"integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"crossorigin="anonymous">
<link href="css/signupstyle.css" rel="stylesheet" type="text/css">
</head>

<body class="main-tab" onload="regFrm.id.focus()">
	<div class="logo">
		<button type="button" onclick="redirectTo('user_page/user_home.jsp')">
			<img src="img/logo.png" width="210" height="50">
		</button>
	</div>
	<main class="form-signin">
		<div class="row">
			<div class="col-12">
				<ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
					<li class="nav-item col-8 border-bottom	" role="presentation">
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
							data-bs-target="#home-tab-pane" type="button" role="tab"
							aria-controls="home-tab-pane" aria-selected="true">개인회원</button>
					</li>
					<li class="nav-item col-4" role="presentation">
						<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
							data-bs-target="#profile-tab-pane" type="button" role="tab"
							aria-controls="profile-tab-pane" aria-selected="false">기업회원</button>
					</li>
				</ul>
			</div>
		</div>
		<form class="join-form" name="regFrm" method="post" action="userSignupProc.jsp">
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active p-3" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<div class="main-container">
						<div class="form-container">
							<div class="row">
								<h6 class="col-9">회원가입하고 다양한 혜택을 누리세요!</h6>
								<p class="col-3" style="font-size: 10px; color: #ff0000">* 필수 입력 정보입니다.</p>
							</div>
							<div class="form-group input-text required">
								<input type="text" id="user_name" class="user" name="user_name"	placeholder="이름(실명)">
							</div>
							<div class="form-group input-text required">
								<input type="text" id="user_id" class="user" name="user_id" placeholder="아이디">
							</div>
							<div class="form-group input-text required">
								<input type="password" id="user_password" class="user" name="user_password" placeholder="비밀번호(8~16자리의 영문, 숫자, 특수기호)">
							</div>
							<div class="form-group input-text required">
								<input type="text" id="user_email" class="user" name="user_email" placeholder="이메일">
							</div>
							<div class="form-group input-text required">
								<input type="text" id="user_phonenum" class="user" name="user_phonenum" placeholder="휴대전화 번호">
							</div>
							<!-- month, day, year를 선택할 수 있는 드롭다운 메뉴를 추가합니다. -->
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
							<div class="form-group">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="user_gender" id="user_gender_male" value="male"> <label class="form-check-label" for="user_gender_male">남</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="user_gender" id="user_gender_female" value="female"> <label class="form-check-label" for="user_gender_female">여</label>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="form-group input-text required">
										<input type="text" class="address1" id="postcode" placeholder="우편번호" readonly> <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
									</div>
								</div>
							</div>
							<div class="form-group input-text required">
								<input type="text" class="address2" id="address" placeholder="주소" readonly><br>
							</div>
							<div class="form-group input-text required">
								<input type="text" class="address2" id="detailAddress" placeholder="상세주소">
							</div>
							<div class="form-group input-text">
								<input type="text" id="user_sns" class="user" name="user_sns" placeholder="SNS" style="width: 400px">
							</div>
						</div>
					</div>
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
					<div class="keep-small2">
						<div class="check-text">
							<div style="flex-grow: 1; margin-right: 20px;">
								<span>[선택]개인정보 수집 및 이용 동의</span>
							</div>
							<div class="checkbox-container">
								<input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
							</div>
						</div>
					</div>
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
					<div>
						<button type="submit" class="join-button" onclick="inputCheck()">가입하기</button>
					</div>
				</div>
			</div>
		</form>
		<div class="tab-pane fade p-3" id="profile-tab-pane" role="tabpanel"
			aria-labelledby="profile-tab" tabindex="0">
			<div class="main-container">
				<form class="join-form" action="joinAction.jsp" method="post">
					<div class="form-container">
						<div class="row">
							<h5 class="col-9">기업 정보</h5>
							<p class="col-3" style="font-size: 10px; color: #ff0000">* 필수입력 정보입니다.</p>
						</div>
						<div class="form-group input-text required">
							<input type="text" class="company" id="company_rnum" name="company_rnum" placeholder="사업자 등록 번호">
						</div>
						<div class="form-group input-text required">
							<input type="text" class="company" id="company_name" name="company_name" placeholder="회사명">
						</div>
						<div class="form-group input-text required">
							<input type="text" class="company" id="company_head" name="company_head" placeholder="대표자명">
						</div>
						<p style="font-size: 12px;">회사명, 대표자명 수정이 필요한 경우, 가입 후 고객센터로 문의 해 주세요.</p>
						<div class="row">
							<div class="col">
								<div class="form-group input-text required">
									<input type="text" class="address1" id="postcode" placeholder="우편번호" readonly> <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
								</div>
							</div>
						</div>
						<div class="form-group input-text required">
							<input type="text" class="address2" id="address" placeholder="회사주소" readonly>
						</div>
						<div class="form-group input-text required">
							<input type="text" class="address2" id="detailAddress" placeholder="상세주소">
						</div>
					</div>
					<div style="height: 20px; margin-bottom: 10px"></div>
					<h5>인사담당자 정보</h5>
					<div>
						<div class="row">
							<div class="col" style="padding-left: 12px; padding-right: 7px;">
								<div class="form-group2 input-text2">
									<input type="text" class="company2" id="manager_id" name="manager_id" placeholder="아이디">
								</div>
							</div>
							<div class="col" style="padding: 0px;">
								<div class="form-group2 input-text2">
									<input type="password" class="company2" id="manager_pwd" name="manager_pwd" placeholder="비밀번호">
								</div>
							</div>
						</div>
						<div>
							<div class="form-group input-text">
								<input type="text" class="company" id="manager_name" name="manager_name" placeholder="가입자명">
							</div>
							<div class="form-group input-text">
								<input type="text" class="company" id="manager_phonenum" name="manager_phonenum" placeholder="전화번호">
							</div>
							<div class="form-group input-text">
								<input type="text" class="company" id="manager_email" name="manager_email" placeholder="이메일">
							</div>
						</div>
					</div>
				</form>
				<div class="keep2">
					<div class="check-text">
						<div style="flex-grow: 1; margin-right: 160px;">
							<span>필수동의 항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보 수신(선택)에 모두 동의합니다.</span>
						</div>
						<div class="checkbox-container" style="margin-left: auto;">
							<input type="checkbox" id="join-keep" name="join-keep" style="width: 40px; height: 40px;">
						</div>
					</div>
				</div>
				<div class="keep-small3">
					<div class="check-text">
						<div style="flex-grow: 1; margin-right: 20px;">
							<span>[필수]이용약관 동의</span>
						</div>
						<div class="checkbox-container" style="margin-left: auto;">
							<input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						</div>
					</div>
				</div>
				<div class="keep-small3">
					<div class="check-text">
						<div style="flex-grow: 1; margin-right: 20px;">
							<span>[필수]개인정보 수집 및 이용 동의</span>
						</div>
						<div class="checkbox-container" style="margin-left: auto;">
							<input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						</div>
					</div>
				</div>
				<div class="keep-small3">
					<div class="check-text">
						<div style="flex-grow: 1; margin-right: 20px;">
							<span>[필수]문자서비스 이용약관 동의</span>
						</div>
						<div class="checkbox-container" style="margin-left: auto;">
							<input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						</div>
					</div>
				</div>
				<div class="keep-small4">
					<div class="check-text">
						<div style="flex-grow: 1; margin-right: 20px;">
							<span>[선택]개인정보 수집 및 이용 동의</span>
						</div>
						<div class="checkbox-container">
							<input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						</div>
					</div>
				</div>
				<div class="keep-small4">
					<div class="check-text">
						<div style="flex-grow: 1; margin-right: 20px;">
							<span>[선택]광고성 정보 이메일 수신 동의</span>
						</div>
						<div class="checkbox-container" style="margin-left: auto;">
							<input type="checkbox" id="join-keep" name="join-keep" style="width: 20px; height: 20px;">
						</div>
					</div>
				</div>
				<button type="submit" class="join-button">가입하기</button>
			</div>
		</div>
		</div>
	</main>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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

		document.addEventListener('DOMContentLoaded',function() {
			var keepCheckbox = document.querySelector('.keep input[type="checkbox"]');
			var smallCheckboxes = document.querySelectorAll('.keep-small1 input[type="checkbox"], .keep-small2 input[type="checkbox"]');
			function updateKeepCheckbox() {
				// 작은 체크박스들 중 하나라도 체크가 해제되었는지 확인합니다.
				var anyUnchecked = Array.from(smallCheckboxes)
					.some(function(checkbox) {
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
				smallCheckbox.addEventListener('click',updateKeepCheckbox);
			});
		});
		document.addEventListener('DOMContentLoaded',function() {
			var keepCheckbox = document.querySelector('.keep2 input[type="checkbox"]');
			var smallCheckboxes = document.querySelectorAll('.keep-small3 input[type="checkbox"], .keep-small4 input[type="checkbox"]');
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

		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
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
		// 페이지가 로드될 때 실행되는 함수를 수정하여, 양식이 서버로 제출될 때 처리되도록 합니다.
		document.addEventListener('DOMContentLoaded', function() {
		    // 폼 제출 이벤트를 감지하여 처리하는 함수를 정의합니다.
		    document.querySelector('.form-signin form').addEventListener('submit', function(event) {
		        // 폼이 기본 제출 동작을 방지합니다.
		        event.preventDefault();
		        
		        // 폼 데이터를 가져옵니다.
		        var formData = new FormData(this);
		        
		        // 서버로 데이터를 전송하는 비동기 POST 요청을 보냅니다.
		        fetch('userSignupProc.jsp', {
		            method: 'POST',
		            body: formData
		        })
		        .then(function(response) {
		            // 응답을 확인하고 필요에 따라 처리합니다.
		            if (response.ok) {
		                // 성공적으로 처리되었을 때 사용자에게 알립니다.
		                alert('가입이 완료되었습니다.');
		            } else {
		                // 오류가 발생했을 때 사용자에게 알립니다.
		                alert('가입 중 오류가 발생했습니다.');
		            }
		        })
		        .catch(function(error) {
		            // 네트워크 오류 등의 문제가 발생했을 때 사용자에게 알립니다.
		            console.error('가입 중 오류 발생:', error);
		            alert('가입 중 오류가 발생했습니다.');
		        });
		    });
		});
	</script>
</body>
</html>