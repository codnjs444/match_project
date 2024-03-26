<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="ulogin" class="match.UserBean"/>
<jsp:useBean id="mlogin" class="match.ManagerBean"/>
<%
	String uid = (String)session.getAttribute("idKey");
	String uurl = request.getParameter("url");
	String mid = (String)session.getAttribute("idKey");
	String murl = request.getParameter("url");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LogIn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <style>
	    .main-tab {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: center;
		    height: 100vh;
		}
		body {
            background-color: #f5f6f8; /* body의 배경색을 변경 */
        }
        main {
        	background-color: #ffffff;
        }
		.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
		    background-color: #ffffff; /* 선택된 탭의 배경색 */
		    color: #000; /* 선택된 탭의 글자색 */
		}
		.nav-tabs .nav-link {
		    background-color: #f7f7f7; /* 선택되지 않은 탭의 배경색 */
		    color: #9e9e9e; /* 선택되지 않은 탭의 글자색 */
		}
        .main-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .login-form {
            display: flex; /* 폼 내부 요소를 가로로 배치 */
            flex-direction: row;
            align-items: flex-start;
            border: none;
        }
        .form-container {
            display: flex;
            flex-direction: column; /* 입력 필드를 세로로 배치 */
            margin-right: 10px; /* 폼 컨테이너와 로그인 버튼 사이의 간격 */
        }
        .input-text {
            width: 100%; /* 입력 필드의 너비를 폼 컨테이너의 너비에 맞춤 */
            height: 50px; /* 입력 필드의 높이를 50px로 설정 */
            margin-bottom: 10px; /* 입력 필드 사이의 여백 */
            font-size: 18px; /* 입력 필드의 글꼴 크기를 조정 */
            border-radius: 5px; /* 입력 필드의 모서리를 둥글게 */
            border: 1px solid #ccc; /* 입력 필드의 테두리를 연하게 */
        }
        .form-group {
            display: flex;
            align-items: center;
            /* 세로 중앙 정렬 */
        }
        .form-group label {
            margin: 5px/* 체크박스와 텍스트 사이 간격 */
        }
		.form-group .checkbox-container {
            width: 20px; /* 원하는 너비로 조절 */
            height: 20px;
        }
        .tab-pane{
        	padding-bottom: 0px;
        }
        .keep{
        	height: 20px;
        }
        .login-button {
            height: calc(50px + 50px + 10px); /* 2개 입력 필드의 높이와 마진을 고려한 버튼 높이 */
            width: 100px;
            padding: 10px; /* 버튼 내부의 여백 */
            font-size: 18px; /* 버튼의 글꼴 크기를 조정 */
            align-self: stretch; /* 버튼을 입력 필드의 높이에 맞춤 */
            border-radius: 5px; /* 버튼의 모서리를 둥글게 */
            background-color: blue; /* 버튼의 배경색을 파란색으로 */
            color: white; /* 버튼 텍스트의 색상을 흰색으로 */
            border: none; /* 버튼의 테두리를 없앰 */
        }
        #user_id, #user_password, #manager_id, #manager_password{
        	border: none;
        }
    </style>
  </head>
<body class="main-tab">
	<main class="form-signin">
	    <div class="row">
	        <div class="col-12">
	            <ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
	                <li class="nav-item" role="presentation">
	                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">개인회원</button>
	                </li>
	                <li class="nav-item" role="presentation">
	                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">기업회원</button>
	                </li>
	            </ul>
	        </div>
	    </div>

    	<div class="tab-content" id="myTabContent">
	        <div class="tab-pane fade show active p-3" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
	        	<div class="main-container">
	        		
	        		<%
        				if(uid != null){
        			%>
		        	<form class="login-form" action="userLoginProc.jsp" method="post" name="loginFrm">
		            	<div class="form-container">
		                	<div class="form-group input-text">
		                    	<input type="text" id="user_id" name="user_id" placeholder="아이디">
		                	</div>
		                	<div class="form-group input-text">
		                    	<input type="password" id="user_password" name="user_password" placeholder="비밀번호">
		                	</div>
					        <div class="form-group keep">
                                <div class="checkbox-container">
                                    <input type="checkbox" id="login-keep" name="login-keep">
                                </div>
                                <label for="login-keep">로그인 유지</label>
                            </div>
		            	</div>
		            	<button type="submit" class="login-button">로그인</button>
		        	</form>
		        	<%
	        			}
		        	%>
	   			</div>
	        </div>

	        <div class="tab-pane fade p-3" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
	        	<div class="main-container">
		        	<form class="login-form" action="managerLoginProc.jsp" method="post" name="loginFrm">
		            	<div class="form-container">
		                	<div class="form-group input-text">
		                    	<input type="text" id="manager_id" name="manager_id" placeholder="기업회원 아이디">
		                	</div>
		                	<div class="form-group input-text">
		                    	<input type="password" id="manager_password" name="manager_password" placeholder="비밀번호">
		                	</div>
		            	</div>
		            	<button type="submit" class="login-button">로그인</button>
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
        <span class=""> <a href="javascript:void(0)">회원가입</a> </span>
   	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    	
</body>
</html>