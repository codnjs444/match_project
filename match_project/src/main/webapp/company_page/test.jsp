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
<button onclick="sendGetRequest()">GET 요청 보내기</button>

<script>
// 서버로 GET 요청을 보내는 함수
function sendGetRequest() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // 요청 성공 시 응답 출력
                console.log(xhr.responseText);
                alert('서버로부터의 응답: ' + xhr.responseText);
            } else {
                // 요청 실패 시 에러 출력
                console.error('요청 실패: ', xhr.status);
                alert('요청 실패: ' + xhr.status);
            }
        }
    };

 // GET 요청 보내기
    xhr.open('GET', '/match/GetContextPathServlet', true);
    xhr.send();

}
</script>
</body>
</html>
