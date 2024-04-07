<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="ulogin" class="match.UserBean"/>
<jsp:useBean id="mlogin" class="match.ManagerBean"/>
<%
	String id = (String)session.getAttribute("idKey");
	String url = request.getParameter("url");
%>	
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LogIn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="../css/loginstyle.css" rel="stylesheet" type="text/css">
</head>
<body class="main-tab"> 
	<div class="logo">
		<button type="button" onclick="redirectTo('../user_page/user_home.jsp')">
			<img src="../img/logo.png" width="210" height="50">
		</button>
	</div>
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
	        			if(id != null){
	        		%>
	        				<script>
	        					window.location.replace("../user_page/user_home.jsp");
	        				</script>
	        		<%
	        			}
	        			else if(id == null){
        			%>
		        	<form class="login-form" action="userLoginProc.jsp" method="post" name="loginFrm">
		            	<div class="form-container">
		                	<div class="form-group input-text">
		                    	<input type="text" id="user_id" name="user_id" placeholder="아이디">
		                	</div>
		                	<div class="form-group input-text">
		                    	<input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호">
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
		        	<form class="login-form" action="managerLoginProc.jsp" method="post" name="loginFrm2">
		            	<div class="form-container">
		                	<div class="form-group input-text">
		                    	<input type="text" id="manager_id" name="manager_id" placeholder="기업회원 아이디">
		                	</div>
		                	<div class="form-group input-text">
		                    	<input type="password" id="manager_pwd" name="manager_pwd" placeholder="비밀번호">
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
        <span class=""> <a href="signup.jsp">회원가입</a> </span>
   	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
	    function redirectTo(page) {
			window.location.href = page;
		}
    </script>
</body>
</html>