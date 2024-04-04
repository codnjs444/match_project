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
	<li><a href="#" onclick="loadPage('../company_home.jsp')"><i class="fas fa-home icon"></i><span>홈</span></a></li>
    <li>
      <a href="#" onclick="toggleSubMenu('jobSubMenu')">
        <i class="fas fa-briefcase icon"></i><span>공고</span>
      </a>
      <ul id="jobSubMenu" class="submenu">
        <li><a href="#" onclick="loadPage('applicant_management.jsp')"><i class="fas fa-user-friends icon"></i>지원자 관리</a></li>
        <li><a href="#" onclick="loadPage('job_calendar.jsp')"><i class="far fa-calendar-alt icon"></i>공고 캘린더</a></li>
      </ul>
    </li>
    <li><a href="#" onclick="loadPage('talent.jsp')"><i class="fas fa-users icon"></i><span>인재 관리</span></a></li>
    <li><a href="#" onclick="loadPage('promotion.jsp')"><i class="fas fa-bullhorn icon"></i><span>홍보 관리</span></a></li>
    <li><a href="#" onclick="loadPage('member.jsp')"><i class="fas fa-user-cog icon"></i><span>회원정보 관리</span></a></li>
    <li><a href="#" onclick="loadPage('support.jsp')"><i class="fas fa-headset icon"></i><span>고객지원</span></a></li>
  </ul>
</div>

<script>
  var prevActiveLink = null; // 이전에 활성화된 링크를 저장하기 위한 변수

  function loadPage(page) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("content").innerHTML = this.responseText;
        // 현재 활성화된 메뉴 표시를 제거합니다.
        if (prevActiveLink !== null) {
          prevActiveLink.classList.remove('active');
        }
      }
    };
    xhttp.open("GET", page, true);
    xhttp.send();
    // 현재 클릭한 메뉴를 활성화합니다.
    var currentActiveLink = event.target.closest('a');
    currentActiveLink.classList.add('active');
    // 이전에 활성화된 메뉴가 있으면 흰색으로 변경합니다.
    if (prevActiveLink !== null && prevActiveLink !== currentActiveLink) {
      prevActiveLink.classList.remove('active');
    }
    // 현재 활성화된 링크를 이전에 활성화된 링크로 설정합니다.
    prevActiveLink = currentActiveLink;
  }

  function toggleSubMenu(subMenuId) {
    var subMenu = document.getElementById(subMenuId);
    subMenu.classList.toggle('active');
  }

  // 페이지 상단으로 자연스럽게 스크롤하는 함수
  function scrollToTop() {
    window.scrollTo({
      top: 0,
      behavior: "smooth" // 자연스러운 스크롤
    });
  }

  window.addEventListener('scroll', function() {
	    var sidebar = document.querySelector('.sidebar');
	    if (window.scrollY > 100) { // 스크롤 위치가 100 이상이면 사이드 메뉴를 위로 올립니다.
	      sidebar.style.top = '0';
	    } else { // 스크롤 위치가 100 미만이면 사이드 메뉴를 아래로 내립니다.
	      sidebar.style.top = '61px'; // 이 값은 초기 위치인 61px로 설정해야 합니다.
	    }
	  });
</script>

<!-- 상단으로 스크롤 버튼 -->
<button id="scrollTopBtn" onclick="scrollToTop()" style="position: fixed; bottom: 20px; right: 20px; display: none;">상단으로</button>

</body>
</html>
