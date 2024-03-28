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
.modal {
  display: none;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  /* 중앙에 위치하도록 설정 */
  display: flex;
  justify-content: center;
  align-items: center;
}


.modal-content {
  background-color: #fefefe;
  margin: auto; /* 수직 가운데 정렬을 위해 margin: auto; 사용 */
  padding: 20px;
  border: 1px solid #888;
<<<<<<< HEAD
  width: 60%; /* 모달의 가로 크기 조정 */
=======
  width: 80%; /* 모달의 가로 크기 조정 */
>>>>>>> branch 'master' of https://github.com/codnjs444/match_project
  max-width: 600px; /* 최대 가로 크기 설정 */
  border-radius: 5px;
  text-align: center; /* 모달 내용 가운데 정렬 */
<<<<<<< HEAD
=======
    /* 추가된 스타일 */
  position: absolute; /* 부모 요소를 상대적으로 설정하기 위해 */
  top: 50%; /* 화면 상단에서 50% 위치로 이동 */
  left: 50%; /* 화면 왼쪽에서 50% 위치로 이동 */
  transform: translate(-50%, -50%); /* 수직 및 수평으로 이동하여 화면 중앙에 정렬 */
>>>>>>> branch 'master' of https://github.com/codnjs444/match_project
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  cursor: pointer;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
}

.modal-options {
  display: flex;
  justify-content: space-around; /* Distribute space evenly */
}


.modal-option {
  display: flex; /* flexbox를 사용하여 자식 요소를 가로로 정렬 */
  flex-direction: column; /* 자식 요소를 세로 방향으로 배치 */
  align-items: center; /* 가로 방향 가운데 정렬 */
  margin: 10px;
}

.modal-option img {
  width: 100%; /* 이미지 가로 폭을 100%로 설정하여 부모 요소에 맞춤 */
  margin-bottom: 10px;
}

.modal-option p {
  margin-bottom: 10px;
}

.modal-option button {
  width: 100%; /* 버튼 가로 폭을 100%로 설정하여 부모 요소에 맞춤 */
}

.image-with-button {
  position: relative; /* 부모 요소를 상대 위치로 설정 */
  display: flex; /* flexbox를 사용하여 자식 요소를 가로로 정렬 */
  flex-direction: column; /* 자식 요소를 세로 방향으로 배치 */
  align-items: center; /* 가로 방향 가운데 정렬 */
}
v
.image-with-button img {
  width: 100%; /* 이미지 가로 폭을 100%로 설정하여 부모 요소에 맞춤 */
  margin-bottom: 10px; /* 이미지와 버튼 사이의 간격 조정 */
}
.image-with-button img:hover {
<<<<<<< HEAD
  border: 2px solid #007bff; /* 마우스를 올렸을 때 테두리 색상 변경 */
=======
  border: 4px solid #007bff; /* 마우스를 올렸을 때 테두리 색상 변경 */
>>>>>>> branch 'master' of https://github.com/codnjs444/match_project
  border-radius: 5px; /* 테두리 둥글게 만들기 */
}
.image-with-button button:hover {
  cursor: pointer; /* 마우스를 올렸을 때 커서를 포인터로 변경 */
}


.image-with-button button {
  position: absolute; /* 버튼을 이미지 내에서 절대 위치로 설정 */
  bottom: 20px; /* 이미지의 아래로부터 10px 만큼 띄움 */
  left: 50%; /* 이미지의 가운데에 버튼을 배치 */
  transform: translateX(-50%); /* 가운데 정렬을 위해 왼쪽으로 이동 */
  width: 160px; /* 버튼 가로 폭 조정 */
  padding: 12px 20px; /* 버튼 내부 여백 조정 */
  background-color: #007bff; /* 버튼 배경색 설정 */
  color: #fff; /* 버튼 텍스트 색상 설정 */
  font-size: 18px; /* 버튼 폰트 크기 조정 */
  border: none; /* 버튼 테두리 없애기 */
  border-radius: 5px; /* 버튼 모서리 둥글게 만들기 */
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
    <a href="#" id="openModal">공고등록</a>
    <a href="/signup">로그아웃</a>
    <a href="/corporate-services">마이페이지</a>
  </div>
</header>

<footer class="footer">
  <div class="nav-links"></div>
</footer>

<!-- Modal -->
<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>어떤 채용을 진행하시나요?</h2>
    <div class="modal-options">
      <!-- Option 1 -->
       <div class="modal-option">
        <div class="image-with-button">
          <img src="${pageContext.request.contextPath}/img/employment1.png" alt="블라인드 채용 이미지" />
          <button onclick="redirectTo('blind_post.jsp')">등록하기</button>
        </div>
      </div>
      <!-- Option 2 -->
      <div class="modal-option">
        <div class="image-with-button">
          <img src="${pageContext.request.contextPath}/img/employment2.png" alt="자사양식 채용 이미지" />
          <button onclick="redirectTo('own_post.jsp')">등록하기</button>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
	document.addEventListener('DOMContentLoaded', function() {
  	document.getElementById('openModal').addEventListener('click', function() {
    document.getElementById('myModal').style.display = 'block';
  });
  
  // Close the modal
  	document.getElementsByClassName('close')[0].addEventListener('click', function() {
    document.getElementById('myModal').style.display = 'none';
  });

  // Function to handle job type selection
  function chooseJobType(type) {
    console.log('Chosen job type:', type);
    document.getElementById('myModal').style.display = 'none';
    // Additional logic based on job type
  }

  //Function to redirect to the specified page
  function redirectTo(page) {
    window.location.href = page;
  }
});
</script>


</body>
</html>
