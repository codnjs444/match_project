<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>���� Ȯ��</title>
</head>
<body>

<%
    // ������ �Է��� ���� �ޱ�
    String number1 = request.getParameter("number1");
    // ��޿��� �Է��� ���� �ޱ�
    String number2 = request.getParameter("number2");
%>

<div>
    <!-- ������ �Է��� ���ڿ� ��޿��� �Է��� ���� ��� -->
    <h2>������ �Է��� ���ڴ� <%= number1 %> �̰�, ��޿��� �Է��� ���ڴ� <%= number2 %> �Դϴ�.</h2>
</div>

</body>
</html>
