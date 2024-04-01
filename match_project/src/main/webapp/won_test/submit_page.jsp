<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Submitted Selection</title>
  <!-- 부트스트랩 CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
  <h4 id="selectedItem">선택된 값: <%= request.getParameter("openposition_name") %></h4>
  <button class="btn btn-primary" onclick="history.back()">뒤로 가기</button>
</div>

</body>
</html>
