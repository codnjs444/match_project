<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Selected Menu</title>
  <!-- 부트스트랩 CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
  <h1>선택된 우측 메뉴 항목</h1>
  <div>
    <% 
      String selectedMenuItem = request.getParameter("selectedMenuItem");
      out.println("<p>" + selectedMenuItem + "</p>");
    %>
  </div>
</div>

</body>
</html>
