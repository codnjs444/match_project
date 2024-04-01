<!-- processFruit.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>선택한 과일</title>
</head>
<body>
    <h2>선택한 과일</h2>
    <% 
        String selectedFruit = request.getParameter("fruit");
    %>
    <p><b>선택한 과일:</b> <%= selectedFruit %></p>
</body>
</html>
