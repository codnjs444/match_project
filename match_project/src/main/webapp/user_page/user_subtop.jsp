<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 서비스</title>
  <!-- Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<!-- 상단 메뉴바 시작 -->
	<nav class="navbar navbar-expand-lg" style="max-width: 450px; margin: 0;"> <!-- 진한 파란색 배경색, 최대 너비 800px로 제한, 가운데 정렬 -->
	  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	    <ul class="navbar-nav mx-auto">
	      	<li class="nav-item col-5">
			  <a class="nav-link" href="http://localhost/match_project/login/userEdit_user.jsp" id="editUser">회원정보수정</a>
			</li>
			<li class="nav-item col-5">
			  <a class="nav-link" href="http://localhost/match_project/login/changePassword.jsp" id="changePassword">비밀번호 변경</a>
			</li>
			<li class="nav-item col-5">
			  <a class="nav-link" href="http://localhost/match_project/login/leaveUser.jsp" id="leaveUser">회원 탈퇴</a>
			</li>
	    </ul>
	  </div>
	</nav>
<!-- 상단 메뉴바 끝 -->
<!-- Bootstrap JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
	    // 현재 페이지의 전체 URL을 가져옴
	    var currentPage = window.location.pathname;
	
	    // 모든 'nav-link' 요소를 순회
	    $('.nav-item a').each(function() {
	        // 각 링크의 href 속성 값을 절대 경로로 변환
	        var linkHref = new URL($(this).attr('href'), window.location.origin + '/login/').pathname;
	
	        // 현재 페이지의 URL과 링크의 href 속성 값이 일치하면 'active' 클래스 추가
	        if (currentPage === linkHref) {
	            $('.nav-item a').removeClass('active'); // 먼저 모든 'active' 클래스 제거
	            $(this).addClass('active');
	        }
	    });
	});
</script>
</body>
</html>
