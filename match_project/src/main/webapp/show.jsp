<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>숫자 확인</title>
</head>
<body>

<%
    // 폼에서 입력한 숫자 받기
    String number1 = request.getParameter("number1");
    // 모달에서 입력한 숫자 받기
    String number2 = request.getParameter("number2");
%>

<div>
    <!-- 폼에서 입력한 숫자와 모달에서 입력한 숫자 출력 -->
    <h2>폼에서 입력한 숫자는 <%= number1 %> 이고, 모달에서 입력한 숫자는 <%= number2 %> 입니다.</h2>
</div>

</body>
</html>
