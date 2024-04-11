<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="uBean" class="match.UserBean"/>
<jsp:useBean id="uMgr" class="match.UserMgr"/>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    	<link href="../css/user_home_middle.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<%if((String)session.getAttribute("idKey") != null) {
			uBean = uMgr.getUser((String)session.getAttribute("idKey"));
		%>
				<div class="fixed-div1 border border-light-subtitle">
					<div class="row" style="width:300px;">
						<div class="col">
							<div class="id-picture px-0"></div>
						</div>
						<div class="col name border-0 bg-body px-0">
							<label class="name border-0 bg-body"><%=uBean.getUser_name()%></label> 
						</div>
						<div class="col px-0">
							<button class="info border-light-subtitle bg-body" onclick="location.href='../login/logout.jsp'">
							로그 아웃
							</button>
							<button class="info border-light-subtitle bg-body" onclick="location.href='../login/userEdit_user.jsp'">
							회원 정보 수정
							</button>
							<button class="info border-light-subtitle bg-body" onclick="location.href='../login/changePassword.jsp'">
								비밀번호 변경
							</button>
						</div>
					</div>
				</div>
			<div class="fixed-div2">
				<div class="row justify-content-center align-items-center">
					<div class="my-btn-div px-0 border-end border-light-subtitle" onclick="location.href='../login/applicationList.jsp'">
						<button class="my-btn-icon1 my-btn-icon"></button>
						<p class="my-btn-text">이력서 관리</p>
					</div>
					<div class="my-btn-div px-0 border-end border-light-subtitle">
						<button class="my-btn-icon2 my-btn-icon"></button>
						<p class="my-btn-text">이력서 열람</p>
					</div>
					<div class="my-btn-div px-0">
						<button class="my-btn-icon3 my-btn-icon"></button>
						<p class="my-btn-text">입사지원 현황</p>
					</div>
					<div class="my-btn-div px-0 border-end border-top border-light-subtitle">
						<button class="my-btn-icon4 my-btn-icon"></button>
						<p class="my-btn-text">최근 본 공고</p>
					</div>
					<div class="my-btn-div px-0 border-end border-top border-light-subtitle" onclick="location.href='../login/applicationScrap.jsp'">
						<button class="my-btn-icon5 my-btn-icon"></button>
						<p class="my-btn-text">스크랩 공고</p>
					</div>
					<div class="my-btn-div px-0 border-top border-light-subtitle">
						<button class="my-btn-icon6 my-btn-icon"></button>
						<p class="my-btn-text">문의</p>
					</div>
			    </div>
			</div>
		<%} %>
	</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>