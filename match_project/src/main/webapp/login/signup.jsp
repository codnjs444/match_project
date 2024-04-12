<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>회원가입</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	 
	 <style>
	 	.main-tab {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 0; /* 기본 마진 제거 */
	padding: 0; /* 기본 패딩 제거 */
}
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .logo span {
            font-size: 2rem;
            font-weight: bold;
            color: #007bff;
        }
        .login-button {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            padding: 10px;
            width: 100%;
            cursor: pointer;
        }
        .login-form .input-text input {
            border: 1px solid #cccccc;
            border-radius: 4px;
            padding: 10px;
            width: 100%;
            margin-bottom: 15px;
        }
        #footer-link a {
            color: #007bff;
            text-decoration: none;
        }
        .sep-line {
            margin: 0 10px;
            color: #bbbbbb;
        }
        .logo button {
		    border: none; /* 테두리 제거 */
		    background: none; /* 배경 제거 */
		    padding: 0; /* 패딩 제거 */
		    margin: 0; /* 마진 제거 */
		    box-shadow: none; /* 박스 그림자 제거 */
		}
		.logo span {
	        font-size: 2rem;
	        font-weight: bold;
	        color: #007bff;
	        background-color: #ffffff; /* 배경색 추가 */
	        padding: 10px 20px; /* 텍스트 주변의 패딩 추가 */
	        border-radius: 8px; /* 둥근 모서리 추가 */
	        box-shadow: 0 2px 4px rgba(0,0,0,0.2); /* 그림자 추가 */
	        display: inline-block; /* 필요한 만큼의 공간만 차지하도록 설정 */
	    }
body {
 	background-color: #f5f6f8; /* body의 배경색을 변경 */
	margin: 0;
	padding: 0;
}
main {
	background-color: #ffffff;
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
}
.checkbox-container{
	margin-left: auto;
}
.input-text {
    width: 540px; /* 입력 필드의 너비를 폼 컨테이너의 너비에 맞춤 */
    height: 40px;
    margin-bottom: 10px; /* 입력 필드 사이의 여백 */
    font-size: 14px; /* 입력 필드의 글꼴 크기를 조정 */
    border: 1px solid #ccc; /* 입력 필드의 테두리를 연하게 */
}
.input-text2 {
    width: 260px; /* 입력 필드의 너비를 폼 컨테이너의 너비에 맞춤 */
    height: 40px;
    margin-bottom: 10px; /* 입력 필드 사이의 여백 */
    font-size: 14px; /* 입력 필드의 글꼴 크기를 조정 */
    border: 1px solid #ccc; /* 입력 필드의 테두리를 연하게 */
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
.form-group2 {
    display: flex;
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
.keep2{
	height: 20px;
	margin-bottom: 30px;
	font-size: 14px;
	display: flex; 
	flex-direction: column;
}
.keep-small3{
	height: 20px;
	margin-bottom: 10px;
	font-size: 14px;
	color: #ff0000;
	display: flex; 
	flex-direction: column;
}
.keep-small4{
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
    border-radius: 5px; /* 버튼의 모서리를 둥글게 */
    align-self: stretch; /* 버튼을 입력 필드의 높이에 맞춤 */
    background-color: #3399ff; /* 버튼의 배경색을 파란색으로 */
    color: white; /* 버튼 텍스트의 색상을 흰색으로 */
    border: none; /* 버튼의 테두리를 없앰 */
}
.user{
	border: none;
	width: 520px;
}
.manager{
	border: none;
	width: 520px;
}
.company{
	border: none;
	width: 520px;
}
.company2{
	border: none;
	width: 240px;
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
	<div class="logo">
		<button type="button" style="font-size: 20px" onclick="redirectTo('../user_page/user_home.jsp')">
			<span style="margin-top: 10px;">Match</span>
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
						<form name="userRegFrm" method="post" action="userSignupProc.jsp">
							<table cellpadding="5">
								<tr>
									<td>
										<h6>회원가입하고 다양한 혜택을 누리세요!</h6>
										<p style="font-size: 10px; color: #ff0000">* 필수 입력 정보입니다.</p>
									</td>
								</tr>
								<tr>
									<td class="input-text required">
										<input class="user" name="user_name" id="user_name" placeholder="이름">
									</td>
								<tr>
									<td class="input-text required">
										<input class="user" name="user_id" id="user_id"  placeholder="아이디">
									</td>
								</tr>
								<tr>
									<td class="input-text required">
										<input class="user" type="password" name="user_pwd" id="user_pwd" placeholder="비밀번호">
									</td>
								</tr>
								<tr>
									<td class="input-text required">
										<input class="user" type="password" name="user_repwd" id="user_repwd" placeholder="비밀번호 확인">
									</td>
								</tr>
								<tr>
									<td class="input-text required">
										<input class="user" name="user_email" id="user_email" size="30"placeholder="이메일">
									</td>
								</tr>
								<tr>
									<td class="input-text required">
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
												<label for="month">월</label> 
												<select id="month" name="month" class="form-control">
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
												<label for="day">일</label> <select id="day" name="day" class="form-control">
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
									<td class="input-text required">
										<input class="address1" name="user_postcode" id="user_postcode" size="5" readonly placeholder="우편번호">
										<input type="button" value="우편번호찾기" onClick="execDaumPostcode('user')">
									</td>
								</tr>
								<tr>
									<td class="input-text required">
										<input class="user" name="user_address" id="user_address" size="45" placeholder="주소">
									</td>
								</tr>
								<tr>
									<td class="input-text">
										<input class="user" id="user_detailaddress" placeholder="상세주소">
									</td>
								</tr>
								<tr>
							        <td >
							            <div class="keep">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 160px;">
							                        <span>필수동의 항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보 수신(선택)에 모두 동의합니다.</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="user-keep" name="user-keep" style="width: 40px; height: 40px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
							    <tr>
							        <td >
							            <div class="keep-small1">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 20px;">
							                        <span>[필수]만 15세 이상입니다.</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="user-keep1" name="user-keep1" style="width: 20px; height: 20px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
							    <tr>
							        <td >
							            <div class="keep-small1">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 20px;">
							                        <span>[필수]이용약관 동의</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="user-keep1" name="user-keep1" style="width: 20px; height: 20px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
							    <tr>
							        <td >
							            <div class="keep-small1">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 20px;">
							                        <span>[필수]개인정보 수집 및 이용 동의</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="user-keep1" name="user-keep1" style="width: 20px; height: 20px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
							    <tr>
							        <td >
							            <div class="keep-small2">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 20px;">
							                        <span>[선택]개인정보 수집 및 이용 동의</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="user-keep2" name="user-keep2" style="width: 20px; height: 20px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
							    <tr>
							        <td >
							            <div class="keep-small2">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 20px;">
							                        <span>[선택]광고성 정보 이메일 수신 동의</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="user-keep2" name="user-keep2" style="width: 20px; height: 20px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
							    <tr>
							        <td >
							            <div class="keep-small2">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 20px;">
							                        <span>[선택]광고성 정보 SMS 수신 동의</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="user-keep2" name="user-keep2" style="width: 20px; height: 20px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
								<tr>
									<td align="center">
									   <button class="join-button user-button" onclick="inputCheck('user')">가입하기</button>
									 </td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="tab-pane fade p-3" id="manager-tab-pane" role="tabpanel" aria-labelledby="manager-tab" tabindex="0">
					<div align="center">
						<form name="managerRegFrm" method="post" action="managerSignupProc.jsp">
							<table cellpadding="5">
								<tr>
									<td>
										<h5 class="col-9">기업 정보 확인</h5>
										<p class="col-3"style="font-size: 10px; color: #ff0000">* 필수 입력 정보입니다.</p>
									</td>
								</tr>
								<tr>
									<td class="input-text required">
										<input class="company" name="company_rnum" id="company_rnum"  placeholder="사업자 등록 번호">
									</td>
								<tr>
									<td class="input-text required">
										<input class="company" name="company_name" id="company_name"  placeholder="기업 명">
									</td>
								</tr>
								<tr>
									<td class="input-text required">
										<input class="company" name="company_head" id="company_head" placeholder="기업 대표 명">
									</td>
								</tr>
								<tr>
									<td>
										<p style="font-size: 12px">회사명, 대표자명 수정이 필요한 경우, 가입 후 고객센터로 문의 해 주세요.</p>
									</td>
								</tr>
								<tr>
									<td class="input-text required">
										<input class="address1" name="postal_code_company" id="company_postcode" size="5" readonly placeholder="우편번호">
										<input type="button" value="우편번호찾기" onClick="execDaumPostcode('company')">
									</td>
								</tr>
								<tr>
									<td class="input-text required">
										<input class="company" name="company_address" id="company_address" size="45" placeholder="주소">
									</td>
								</tr>
								<tr>
									<td class="input-text required">
										<input class="company" id="company_detailaddress" placeholder="상세주소">
									</td>
								</tr>
								<tr>
									<td>
									</td>
								</tr>
								<tr style="padding-top: 20px;">
								    <td>
								        <h5>인사담당자 정보</h5>
								        <p style="font-size: 10px; color: #ff0000">* 필수 입력 정보입니다.</p>
								    </td>
								</tr>
								<tr>
									<td class="input-text required">
										<input class="manager" name="manager_name" id="manager_name" placeholder="이름">
									</td>
								</tr>
								<tr>
									<td class="input-text required">
										<input class="manager" name="manager_id" id="manager_id"  placeholder="아이디">
									</td>
								<tr>
								<tr>
									<td class="input-text required">
										<input type="password" class="manager" name="manager_pwd" id="manager_pwd"  placeholder="비밀번호">
									</td>
								<tr>
								<tr>
									<td class="input-text required">
										<input type="password" class="manager" name="manager_repwd" id="manager_repwd"  placeholder="비밀번호 확인">
									</td>
								<tr>
								<tr>
									<td class="input-text required">
										<input class="manager" name="manager_email" id="manager_email"  placeholder="이메일">
									</td>
								<tr>
								<tr>
									<td class="input-text required">
										<input class="manager" name="manager_phonenum" id="manager_phonenum"  placeholder="휴대폰 번호">
									</td>
								<tr>
							        <td >
							            <div class="keep2">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 160px;">
							                        <span>필수동의 항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보 수신(선택)에 모두 동의합니다.</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="manager-keep" name="manager-keep" style="width: 40px; height: 40px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
							    <tr>
							        <td >
							            <div class="keep-small3">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 20px;">
							                        <span>[필수]이용약관 동의</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="manager-keep1" name="manager-keep1" style="width: 20px; height: 20px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
							    <tr>
							        <td >
							            <div class="keep-small3">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 20px;">
							                        <span>[필수]개인정보 수집 및 이용 동의</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="manager-keep1" name="manager-keep1" style="width: 20px; height: 20px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
							    <tr>
							        <td >
							            <div class="keep-small3">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 20px;">
							                        <span>[필수]문자서비스 이용약관 동의</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="manager-keep1" name="manager-keep1" style="width: 20px; height: 20px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
							    <tr>
							        <td >
							            <div class="keep-small4">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 20px;">
							                        <span>[선택]개인정보 수집 및 이용 동의</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="manager-keep2" name="manager-keep2" style="width: 20px; height: 20px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
							    <tr>
							        <td >
							            <div class="keep-small4">
							                <div class="check-text">
							                    <div style="flex-grow: 1; margin-right: 20px;">
							                        <span>[선택]광고성 정보 이메일 수신 동의</span>
							                    </div>
							                    <div class="checkbox-container" style="margin-left: auto;">
							                        <input type="checkbox" id="manager-keep2" name="manager-keep2" style="width: 20px; height: 20px;">
							                    </div>
							                </div>
							            </div>
							        </td>
							    </tr>
							    
								<tr>
									<td align="center">
									   <button class="join-button manager-button" onclick="inputCheck('manager')">가입하기</button>
									 </td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</main>
		<div id="footer-link" class="text-center my-3">
	        <span class=""> <a href="javascript:void(0)">아이디 찾기</a> </span>
	        <span class="sep-line"></span>
	        <span class=""> <a href="javascript:void(0)">비밀번호 찾기</a> </span>
	        <span class="sep-line"></span>
	        <span class=""> <a href="login.jsp">로그인</a> </span>
	   	</div>
	   	<script type="text/javascript" src="../script/signupScript.js"></script>
	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	    
	</body>
</html>