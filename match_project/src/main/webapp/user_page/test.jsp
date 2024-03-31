<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bootstrap Tabs Example</title>
  <!-- 부트스트랩 CSS 가져오기 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* 컨텐츠 크기 조정을 위한 CSS */
    .tab-content > .tab-pane {
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .tab-content > .tab-pane > div {
      width: 400px; /* 1번 탭의 경우 */
      height: 400px; /* 1번 탭의 경우 */
      background-color: lightblue; /* div 배경색 */
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .tab-content > .tab-pane.large > div {
      width: 800px; /* 2번 탭의 경우 */
      height: 800px; /* 2번 탭의 경우 */
      background-color: lightgreen; /* div 배경색 */
      display: flex;
      justify-content: center;
      align-items: center;
    }
  </style>
</head>
<body>

<div class="container">
  <!-- 네비게이션 탭 -->
  <ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
      <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Tab 1</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Tab 2</button>
    </li>
  </ul>
  <!-- 탭 컨텐츠 -->
  <div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
      <div>
        <button class="btn btn-primary">버튼</button> <!-- 1번 탭 내 버튼 -->
      </div>
    </div>
    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
      <div class="large">
        <button class="btn btn-primary">버튼</button> <!-- 2번 탭 내 버튼 -->
      </div>
    </div>
  </div>
</div>

<!-- 부트스트랩 및 필수 JavaScript 가져오기 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>

</body>
</html>
