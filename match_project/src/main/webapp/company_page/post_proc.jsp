<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전송 결과 확인</title>
</head>
<body>

<h2>제출된 기업 정보</h2>
<table border="1">
    <tr>
        <td>기업명</td>
        <td><%= request.getParameter("posting_cname") %></td>
    </tr>
    <tr>
        <td>우편번호</td>
        <td><%= request.getParameter("posting_pcode") %></td>
    </tr>
    <tr>
        <td>회사주소</td>
        <td><%= request.getParameter("posting_address") %></td>
    </tr>
    <tr>
        <td>상세주소</td>
        <td><%= request.getParameter("posting_dcode") %></td>
    </tr>
    <tr>
        <td>제목</td>
        <td><%= request.getParameter("posting_name") %></td>
    </tr>
</table>

</body>
</html>
