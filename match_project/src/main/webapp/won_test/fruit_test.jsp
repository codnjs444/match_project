<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- dropdown.jsp -->
<!DOCTYPE html>
<html>
<head>
    <title>과일 선택</title>
</head>
<body>
    <h2>과일 선택</h2>
    <form action="processFruit.jsp" method="post">
        <label for="fruit">과일 선택:</label>
        <select id="fruit" name="fruit">
            <option value="apple">사과</option>
            <option value="banana">바나나</option>
            <option value="orange">오렌지</option>
            <option value="grape">포도</option>
        </select><br><br>
        
        <input type="submit" value="제출">
    </form>
</body>
</html>
