<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- dropdown.jsp -->
<!DOCTYPE html>
<html>
<head>
    <title>���� ����</title>
</head>
<body>
    <h2>���� ����</h2>
    <form action="processFruit.jsp" method="post">
        <label for="fruit">���� ����:</label>
        <select id="fruit" name="fruit">
            <option value="apple">���</option>
            <option value="banana">�ٳ���</option>
            <option value="orange">������</option>
            <option value="grape">����</option>
        </select><br><br>
        
        <input type="submit" value="����">
    </form>
</body>
</html>
