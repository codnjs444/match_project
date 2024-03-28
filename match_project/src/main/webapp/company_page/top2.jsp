<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Match Job Portal</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- FontAwesome 아이콘 CSS 파일 -->
<style>
  body {
    margin: 0;
    font-family: Arial, sans-serif;
  }
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 50px;
    background-color: #333333;
    color: #fff;
    margin-bottom: 0; /* 여백 제거 */
}

  .logo {
    font-size: 24px;
    font-weight: bold;
    color: #fff; /* 로고 텍스트 색상을 흰색으로 변경 */
    margin-right: 50px; /* Match 로고와 검색창 사이의 거리 조정 */
  }
  .search-bar {
    display: flex;
    align-items: center;
    position: relative;
    margin-right: 50px; /* 검색창과 오른쪽 여백 사이의 거리 조정 */
    margin-left: 84px; /* 왼쪽에 자동 마진을 주어 오른쪽으로 밀어냄 */
  }
  .search-bar input[type="text"] {
    padding: 10px;
    border: none; /* 테두리 제거 */
    border-radius: 5px;
    width: 600px; /* 검색창의 길이를 늘림 */
    background-color: #f8f9fa; /* 검색창 배경색 */
    color: #333; /* 검색창 텍스트 색상 */
    font-size: 16px; /* 검색창 텍스트 크기 */
    outline: none; /* 포커스 효과 제거 */
  }
  .search-bar img {
    position: absolute; /* 아이콘을 절대 위치로 설정하여 텍스트와 겹치게 함 */
    right: 10px; /* 아이콘을 오른쪽으로 이동 */
    pointer-events: none; /* 마우스 이벤트를 통과시킴 */
  }
  .nav-links {
    display: flex;
    margin-left: auto;
  }
  .nav-links a {
    text-decoration: none;
    color: #fff; /* 링크 텍스트 색상을 흰색으로 변경 */
    padding: 10px 15px;
    margin: 0 5px;
    font-size: 16px; /* 링크 텍스트 크기 */
  }
  .footer {
    background-color: #fff; /* 푸터 배경색 */
    padding: 10px 50px;
    border-top: 1px solid #999; /* 회색 구분선 */
  }
  .footer .nav-links {
    display: flex;
    align-items: center;
  }
  .footer .nav-links i {
    margin-right: 10px;
  }
</style>
</head>
<body>

<header class="header">
  <div class="logo">Match</div>
  <div class="search-bar">
    <input type="text" placeholder="인재, 등록하신 공고를 검색해보세요.">
    <img src="${pageContext.request.contextPath}/img/fi_search.png" alt="Search Icon">
  </div>
  <div class="nav-links">
    <a href="post_modal.jsp" id="openModal">공고등록</a>
    <a href="/signup">로그아웃</a>
    <a href="/corporate-services">마이페이지</a>
  </div>
</header>

<footer class="footer">
  <div class="nav-links"></div>
</footer>

</body>
</html>
