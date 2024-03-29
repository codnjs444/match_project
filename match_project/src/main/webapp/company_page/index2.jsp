<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>Index Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    $(document).ready(function(){
        $("#openModal").click(function(){
            var userInput = prompt("숫자를 입력하세요:");
            if(userInput != null){
                // 동적으로 폼 생성
                var form = $('<form action="show2.jsp" method="post">' +
                             '<input type="hidden" name="number" value="' + userInput + '">' +
                             '</form>');
                $('body').append(form);
                form.submit(); // 폼 제출
            }
        });
    });
    </script>
</head>
<body>

<h1>안녕</h1>
<button id="openModal">모달</button>
<div id="result"></div>

</body>
</html>
