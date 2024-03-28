<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공고 등록</title>
<!-- 필요한 CSS 및 JavaScript 파일들을 여기에 추가 -->
</head>
<body>

<h2>공고 등록 폼</h2>

<form action="/submit_job" method="post">
  <!-- 공고 등록을 위한 필드들을 여기에 추가 -->
  <label for="jobTitle">공고 제목:</label>
  <input type="text" id="jobTitle" name="jobTitle" required><br><br>
  
  <label for="jobDescription">공고 설명:</label>
  <textarea id="jobDescription" name="jobDescription" rows="4" cols="50" required></textarea><br><br>
  
  <button type="submit">등록</button>
</form>

</body>
</html>
