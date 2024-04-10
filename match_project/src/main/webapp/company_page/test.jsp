<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GET Request Example</title>
</head>
<body>
<button onclick="sendGetRequest()">GET ��û ������</button>

<script>
// ������ GET ��û�� ������ �Լ�
function sendGetRequest() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // ��û ���� �� ���� ���
                console.log(xhr.responseText);
                alert('�����κ����� ����: ' + xhr.responseText);
            } else {
                // ��û ���� �� ���� ���
                console.error('��û ����: ', xhr.status);
                alert('��û ����: ' + xhr.status);
            }
        }
    };

 // GET ��û ������
    xhr.open('GET', '/match/GetContextPathServlet', true);
    xhr.send();

}
</script>
</body>
</html>
