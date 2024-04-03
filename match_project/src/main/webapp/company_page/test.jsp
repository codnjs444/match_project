<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>날짜와 시간 입력 폼</title>
  <!-- 부트스트랩 CSS 추가 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
  <h2>날짜와 시간 입력</h2>
  <form id="datetimeForm" class="mt-3">
    <!-- 시작 날짜와 시간을 동시에 입력 받는 필드 -->
    <div class="form-group">
      <label for="startDateTime">시작 날짜와 시간:</label>
      <input type="datetime-local" id="startDateTime" name="startDateTime" class="form-control">
    </div>
  
    <button type="button" class="btn btn-primary" onclick="submitDateTime()">제출</button>
  </form>
</div>

<script>
  function submitDateTime() {
    var startDateTime = document.getElementById('startDateTime').value;
  
    alert("선택한 날짜와 시간: " + startDateTime);
  }
</script>

<!-- 부트스트랩 JS 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
