<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>Index Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    $(document).ready(function(){
        $("#openModal").click(function(){
            var userInput = prompt("���ڸ� �Է��ϼ���:");
            if(userInput != null){
                // �������� �� ����
                var form = $('<form action="show2.jsp" method="post">' +
                             '<input type="hidden" name="number" value="' + userInput + '">' +
                             '</form>');
                $('body').append(form);
                form.submit(); // �� ����
            }
        });
    });
    </script>
</head>
<body>

<h1>�ȳ�</h1>
<button id="openModal">���</button>
<div id="result"></div>

</body>
</html>
