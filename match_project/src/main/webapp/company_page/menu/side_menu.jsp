<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- Font Awesome CSS 파일 -->
<style>
  * {
    box-sizing: border-box;
  }
  body {
    margin: 0;
    font-family: Arial, sans-serif;
  }
  .sidebar {
    position: fixed;
    top: 61px; /* 페이지 상단에서 아래로 80px 떨어진 위치 */
    left: 0;
    bottom: 0;
    width: 250px;
    background-color: #4D4D4D; /* 사이드바 배경색을 #4D4D4D로 변경 */
    color: white;
    padding: 10px;
  }
  .sidebar a {
    color: white;
    text-decoration: none;
    display: block;
    padding: 10px;
    font-size: 18px; /* 텍스트 크기를 증가 */
  }
  .sidebar a:hover {
    background-color: #ddd;
    color: black;
  }
  .sidebar a.active {
    color: #E4D233; /* 현재 선택된 메뉴의 텍스트 색을 노란색으로 변경 */
  }
  .sidebar a .icon {
    margin-right: 10px;
    font-size: 20px; /* 아이콘 크기를 증가 */
  }
  .company-info h2 {
    margin-top: 0;
  }
  .sidebar ul {
    list-style-type: none; /* 기본 리스트 스타일 제거 */
    padding: 0; /* 내부 여백 제거 */
    margin: 0; /* 외부 여백 제거 */
  }
  .sidebar li {
    padding-left: 5px; /* 아이콘과 텍스트 사이의 간격 조정 */
    margin-top: 20px; /* 위쪽 마진 추가 */
    margin-bottom: 10px; /* 아래쪽 마진 추가 */
  }
  .submenu {
    display: none;
    padding-left: 20px;
  }
  .submenu.active {
    display: block;
  }
  .sidebar ul ul {
    padding-left: 35px; /* 우측으로 이동시키기 위해 padding-left 값을 증가시킵니다. */
  }
</style>
</head>
<body>

<div class="sidebar">
  <ul>
    <li><a id="homeLink" href="company_home.jsp"><i class="fas fa-home icon"></i>공고 관리</a></li>
    <li><a id="talentLink" href="talent.jsp"><i class="fas fa-users icon"></i>인재 관리</a></li>
    <li><a id="promotionLink" href="promotion.jsp"><i class="fas fa-bullhorn icon"></i>홍보 관리</a></li>
    <li><a id="memberLink" href="Edit_admin_page.jsp"><i class="fas fa-user-cog icon"></i>회원정보 관리</a></li>
    <li><a id="supportLink" href="support.jsp"><i class="fas fa-headset icon"></i>고객지원</a></li>
  </ul>
</div>

<script>
// 문서 로드 시 active 메뉴 강조
document.addEventListener('DOMContentLoaded', function() {
    setActiveLink();
});

function setActiveLink() {
    const currentPath = window.location.pathname.split('/').pop();
    const links = document.querySelectorAll('.sidebar a');
    links.forEach(link => {
        if (link.getAttribute('href') === currentPath) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });
}

// 해당 링크로 이동할 때 URL을 통해 active 상태를 설정
function navigate(pageUrl) {
    window.location.href = pageUrl;
    setActiveLink();
}

// 이벤트 리스너 연결
document.querySelectorAll('.sidebar a').forEach(link => {
    link.addEventListener('click', function() {
        navigate(this.getAttribute('href'));
    });
});
</script>

</body>
</html>