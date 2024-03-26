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
   background-color: #333333; /* 배경색을 #333333 (검정색)으로 변경 */
    color: #fff; /* 텍스트 색상을 흰색으로 변경 */
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
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%; /* Adjust width as needed */
  border-radius: 5px;
  text-align: center; /* Centering the content */
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
  text-align: center; /* Centering text */
  margin: 10px;
}

.modal-option img {
  width: 100%; /* Adjust the width as needed */
  margin-bottom: 10px;
}

.modal-option p {
  margin-bottom: 10px;
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
        <img src="path_to_blind_recruitment_image" alt="블라인드 채용 이미지" />
        <p>블라인드 채용</p>
        <button onclick="chooseJobType('blind')">선택하기</button>
      </div>
      <!-- Option 2 -->
      <div class="modal-option">
        <img src="path_to_own_form_recruitment_image" alt="자사양식 채용 이미지" />
        <p>자사양식 채용</p>
        <button onclick="chooseJobType('own-form')">등록하기</button>
      </div>
    </div>
  </div>
</div>


<script>
//Open the modal
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

</script>

</body>
</html>
