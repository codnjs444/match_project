<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fixed Div Example</title>
<style>
  /* 스타일을 정의하는 CSS 코드 */
  .fixed-div {
    position: fixed; /* 고정 위치 */
    top: 20px; /* 위에서 20px 거리 */
    right: 20px; /* 오른쪽에서 20px 거리 */
    background-color: #f00; /* 배경색 */
    color: white; /* 텍스트색 */
    padding: 10px; /* 안쪽 여백 */
    border-radius: 5px; /* 테두리 모서리 둥글게 */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
  }
</style>
</head>
<body>
  <!-- 고정된 div -->
  <div class="fixed-div">고정된 DIV</div>

  <!-- 내용이 스크롤 되는 더 긴 내용 -->
  <div style="height: 2000px; background-color: #ddd;">
    여기는 스크롤 됩니다.
  </div>
</body>
</html>
