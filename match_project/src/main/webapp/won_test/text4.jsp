<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dropdown Menu</title>
  <!-- 부트스트랩 CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
  <div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Dropdown 버튼
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="max-width: 1000px;">
      <div class="row">
        <!-- 좌측 메뉴 -->
        <div class="col-md-6 pr-0 border-right">
          <h6 class="dropdown-header">좌측 메뉴</h6>
          <div class="row">
            <div class="col-md-6">
              <a class="dropdown-item" href="#" onclick="changeRightMenu('menu1', event)">좌측 메뉴 항목 1</a>
            </div>
            <div class="col-md-6">
              <a class="dropdown-item" href="#" onclick="changeRightMenu('menu2', event)">좌측 메뉴 항목 2</a>
            </div>
            <div class="col-md-6">
              <a class="dropdown-item" href="#" onclick="changeRightMenu('menu3', event)">좌측 메뉴 항목 3</a>
            </div>
            <div class="col-md-6">
              <a class="dropdown-item" href="#" onclick="changeRightMenu('menu4', event)">좌측 메뉴 항목 4</a>
            </div>
            <div class="col-md-6">
              <a class="dropdown-item" href="#" onclick="changeRightMenu('menu5', event)">좌측 메뉴 항목 5</a>
            </div>
          </div>
        </div>
        <!-- 우측 메뉴 -->
        <div class="col-md-6" id="right-menu">
          <h6 class="dropdown-header">우측 메뉴</h6>
          <!-- 우측 메뉴의 내용을 미리 정의 -->
          <div id="menu1" style="display: none;">
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 A')">우측 메뉴 항목 A</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 B')">우측 메뉴 항목 B</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 C')">우측 메뉴 항목 C</a>
          </div>
          <div id="menu2" style="display: none;">
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 D')">우측 메뉴 항목 D</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 E')">우측 메뉴 항목 E</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 F')">우측 메뉴 항목 F</a>
          </div>
          <div id="menu3" style="display: none;">
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 G')">우측 메뉴 항목 G</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 H')">우측 메뉴 항목 H</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 I')">우측 메뉴 항목 I</a>
          </div>
          <div id="menu4" style="display: none;">
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 J')">우측 메뉴 항목 J</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 K')">우측 메뉴 항목 K</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 L')">우측 메뉴 항목 L</a>
          </div>
          <div id="menu5" style="display: none;">
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 M')">우측 메뉴 항목 M</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 N')">우측 메뉴 항목 N</a>
            <a class="dropdown-item" href="#" onclick="selectRightMenuItem('우측 메뉴 항목 O')">우측 메뉴 항목 O</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 부트스트랩 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
function changeRightMenu(menu, event) {
  event.stopPropagation(); // 이벤트 전파 중지
  // 모든 우측 메뉴 숨기기
  document.querySelectorAll('#right-menu > div').forEach(function(div) {
    div.style.display = 'none';
  });
  // 해당 메뉴 보여주기
  document.getElementById(menu).style.display = 'block';
}

function selectRightMenuItem(menuItemText) {
  document.getElementById('dropdownMenuButton').textContent = menuItemText; // Dropdown 버튼 텍스트 변경
  $('.dropdown-toggle').dropdown('toggle'); // 드롭다운 닫기
}
</script>

</body>
</html>