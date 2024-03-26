<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>test</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	    <style>
		    .main-tab {
			    display: flex;
			    flex-direction: column;
			    align-items: center;
			    justify-content: center;
			    height: 100vh;
			    margin: 0; /* 기본 마진 제거 */
			    padding: 0; /* 기본 패딩 제거 */
			}
			body {
	            background-color: #f5f6f8; /* body의 배경색을 변경 */
	        	margin: 0;
	        	padding: 0;
	        }
	        main {
	        	background-color: #ffffff;
	        }
	        .body{
	        }
			.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
			    background-color: #3399ff; /* 선택된 탭의 배경색 */
			    color: #ffffff; /* 선택된 탭의 글자색 */
			}
			.nav-tabs .nav-link {
			    background-color: #ffffff; /* 선택되지 않은 탭의 배경색 */
			    color: #000000; /* 선택되지 않은 탭의 글자색 */
			}
	        .main-container {
	            display: flex;
	            flex-direction: column;
	            justify-content: center;
	            align-items: center;
	        }
	        .form-container {
	            display: flex;
	            flex-direction: column; /* 입력 필드를 세로로 배치 */
	            margin-right: 10px; /* 폼 컨테이너와 로그인 버튼 사이의 간격 */
	        }
	        .checkbox-container{
	        	margin-left: auto;
	        }
	        .input-text {
	            width: 540px; /* 입력 필드의 너비를 폼 컨테이너의 너비에 맞춤 */
	            height: 40px; /* 입력 필드의 높이를 50px로 설정 */
	            margin-bottom: 10px; /* 입력 필드 사이의 여백 */
	            font-size: 14px; /* 입력 필드의 글꼴 크기를 조정 */
	            border: 1px solid #ccc; /* 입력 필드의 테두리를 연하게 */
	        }
	        .input-text2 {
	            width: 194px; /* 입력 필드의 너비를 폼 컨테이너의 너비에 맞춤 */
	            height: 40px; /* 입력 필드의 높이를 50px로 설정 */
	            margin-bottom: 10px; /* 입력 필드 사이의 여백 */
	            margin-left: 12px;
	            font-size: 14px; /* 입력 필드의 글꼴 크기를 조정 */
	            border: 1px solid #ccc; /* 입력 필드의 테두리를 연하게 */
	            padding: 0px;
	        }
	        .check-text{
	        	display: flex;
	        	flex-direction: row; 
	        	align-items: left; 
	        	width: 540px;
	        }
	        .required::after {
	            content: '*'; /* placeholder 끝에 '*'를 추가합니다. */
	            color: #ff0000; /* 빨간색으로 설정합니다. */
	            margin-left: 3px; /* '*'과 텍스트 사이의 간격을 조절합니다. */
	        }
	        .form-group {
	            display: flex;
	            align-items: center;
	            /* 세로 중앙 정렬 */
	        }
	        .form-group label {
	            margin: 5px/* 체크박스와 텍스트 사이 간격 */
	        }
			.form-group.checkbox-container {
	            width: 20px; /* 원하는 너비로 조절 */
	            height: 20px;
	            display: flex;
	            justify-content: flex-end; /* 체크박스를 오른쪽으로 정렬 */
	        }
	        .keep{
	        	height: 20px;
	        	margin-bottom: 30px;
	        	font-size: 14px;
	        	display: flex; 
	        	flex-direction: column;
	        }
	        .keep-small1{
	        	height: 20px;
	        	margin-bottom: 10px;
	        	font-size: 14px;
	        	color: #ff0000;
	        	display: flex; 
	        	flex-direction: column;
	        }
	        .keep-small2{
	        	height: 20px;
	        	margin-bottom: 10px;
	        	font-size: 14px;
	        	display: flex; 
	        	flex-direction: column;
	        }
	        .join-button {
	            height: 50px;
	            width: 100%;
	            padding: 10px; /* 버튼 내부의 여백 */
	            font-size: 18px; /* 버튼의 글꼴 크기를 조정 */
	            align-self: stretch; /* 버튼을 입력 필드의 높이에 맞춤 */
	            border-radius: 5px; /* 버튼의 모서리를 둥글게 */
	            background-color: #3399ff; /* 버튼의 배경색을 파란색으로 */
	            color: white; /* 버튼 텍스트의 색상을 흰색으로 */
	            border: none; /* 버튼의 테두리를 없앰 */
	        }
	        .user{
	        	border: none;
	        	width: 520px;
	        }
	        .company{
	        	border: none;
	        	width: 400px;
	        }
	        .address1{
	        	border: none;
	        	width: 415px;
	        }
	        .address2{
	        	border: none;
	        	width: 520px;
	        }
	    </style>
	</head>
	<body class="main-tab">
		<main class="form-signin">
		    <div class="row">
		        <div class="col-12">
		            <ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
		                <li class="nav-item col-8 border-bottom	" role="presentation">
		                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">개인회원</button>
		                </li>
		                <li class="nav-item col-4" role="presentation">
		                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">기업회원</button>
		                </li>
		            </ul>
		        </div>
		    </div>
	
	    	<div class="tab-content" id="myTabContent">
		        <div class="tab-pane fade show active p-3" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
		        	<div class="main-container">
			        	<form class="join-form" action="joinAction.jsp" method="post">
			            	<div class="form-container">
			            		<div class="row">
			            			<h6 class="col-9">회원가입하고 다양한 혜택을 누리세요!</h6>
			            			<p class="col-3" style="font-size: 10px; color: #ff0000">* 필수 입력 정보입니다.</p>
			            		</div>
			                	<div class="form-group input-text required">
			                    	<input type="text" id="user_name" class="user" name="user_name" placeholder="이름(실명)">
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
			                	<!-- month, day, year를 선택할 수 있는 드롭다운 메뉴를 추가합니다. -->
								<div class="row">
								    <div class="col">
								        <label for="year">년</label>
								        <select id="year" class="form-control">
								            <!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
								        </select>
								    </div>
								    <div class="col">
								        <label for="month">월</label>
								        <select id="month" class="form-control">
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
								        <label for="day">일</label>
								        <select id="day" class="form-control">
								            <!-- 일은 JavaScript로 동적으로 추가됩니다. -->
								        </select>
								    </div>
								</div>
			                	<div class="form-group">
			                    	<div class="form-check form-check-inline">
								        <input class="form-check-input" type="radio" name="user_gender" id="user_gender_male" value="male">
								        <label class="form-check-label" for="user_gender_male">남</label>
								    </div>
								    <div class="form-check form-check-inline">
								        <input class="form-check-input" type="radio" name="user_gender" id="user_gender_female" value="female">
								        <label class="form-check-label" for="user_gender_female">여</label>
								    </div>
			                	</div>
			                	<div class="row">
				                	<div class="col">
					                	<div class="form-group input-text required">
					                		<input type="text" class="address1" id="postcode" placeholder="우편번호" readonly>
											<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
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
			        	</form>
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
					    <div class="check-text" >
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
                    	<button type="submit" class="join-button">가입하기</button>
                    </div>
		        </div>
	
		        <div class="tab-pane fade p-3" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
		        	<div class="main-container">
			        	<form class="join-form" action="joinAction.jsp" method="post">
			            	<div class="form-container">
			                	<div class="form-group input-text">
			                    	<input type="text" class="company" id="company_rnum" name="company_rnum" placeholder="사업자 등록 번호">
			                	</div>
			                	<div class="form-group input-text">
			                    	<input type="text" class="company" id="company_name" name="company_name" placeholder="회사명">
			                	</div>
			                	<div class="form-group input-text">
			                    	<input type="text" class="company" id="company_head" name="company_head" placeholder="대표자명">
			                	</div>
			                	<p style="font-size: 12px;">회사명, 대표자명 수정이 필요한 경우, 가입 후 고객센터로 문의 해 주세요.</p>
			                	<div class="row">
				                	<div class="col">
					                	<div class="form-group input-text">
					                		<input type="text" class="address1" id="postcode" placeholder="우편번호" readonly>
											<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
					                	</div>
				                	</div>
			                	</div>
			                	<div class="form-group input-text">
									<input type="text" class="address2" id="address" placeholder="주소" readonly>
			                	</div>
			                	<div class="form-group input-text">
			                		<input type="text" class="address2" id="detailAddress" placeholder="상세주소">	
			                	</div>
			            	</div>
			            	<button type="submit" class="join-button">가입하기</button>
			        	</form>
		   			</div>
		  		</div>
			</div>
	    </main>
	    
	    
	    
	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script>
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
		        navTabs.forEach(function(tab) {
		            tab.addEventListener('click', function() {
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
		    
		    document.addEventListener('DOMContentLoaded', function() {
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
		            smallCheckbox.addEventListener('click', updateKeepCheckbox);
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