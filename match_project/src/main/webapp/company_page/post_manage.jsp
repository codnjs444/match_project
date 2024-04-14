<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Match Job Portal</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- FontAwesome 아이콘 CSS 파일 -->
<style>
/* CSS 스타일은 생략 */
</style>
</head>
<body>

<%@ include file="menu/top.jsp"%>
<%@ include file="menu/side_menu.jsp"%>
<%@ include file="post_manage_middle.jsp"%>
<%@ include file="menu/bottom.jsp"%>

<script>	
	document.addEventListener('DOMContentLoaded', function() {
		  var currentPage = window.location.pathname.split("/").pop(); // 현재 페이지 파일 이름을 가져옵니다.
	
		  var links = document.querySelectorAll('.sidebar a'); // 모든 사이드바 링크를 가져옵니다.
		  links.forEach(function(link) {
		    // href 속성에서 파일 이름 부분만 추출하여 현재 페이지와 비교
		    if (link.getAttribute('href') === currentPage) {
		      link.classList.add('active'); // 일치하면 active 클래스 추가
		    } else {
		      link.classList.remove('active'); // 일치하지 않으면 active 클래스 제거
		    }
		  });
		});
	
	

	
</script>


</body>
</html>