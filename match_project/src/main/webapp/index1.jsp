<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>모달 테스트</title>
    <!-- 부트스트랩 CSS 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h2>모달 테스트</h2>
    <!-- 버튼을 누르면 모달을 띄우는 버튼 -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        모달 열기
    </button>

    <div class="container">
        <h2>숫자 입력</h2>
        <!-- 입력 폼 -->
        <form id="myForm" action="show.jsp" method="post">
            <div class="form-group">
                <label for="number1">폼에서 입력한 숫자:</label>
                <input type="number" class="form-control" id="number1" name="number1">
            </div>
            <button type="submit" class="btn btn-primary" id="submitBtn">확인</button>
        </form>
    </div>
</div>

<!-- 모달 -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h4 class="modal-title">숫자 입력</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 모달 바디 -->
            <div class="modal-body">
                <form id="modalForm" action="show.jsp" method="post">
                    <div class="form-group">
                        <label for="number2">모달에서 입력한 숫자:</label>
                        <input type="number" class="form-control" id="number2" name="number2">
                    </div>
                    <button type="button" class="btn btn-primary" id="modalSubmitBtn">확인</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 부트스트랩 및 jQuery 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // 폼에서 입력값과 모달에서 입력값을 합쳐서 show.jsp로 보냄
    $(document).ready(function () {
        $('#submitBtn').click(function () {
            $('#myModal').modal('show'); // 모달 열기
        });

        $('#modalSubmitBtn').click(function () {
            var form_data = $('#myForm').serialize();
            var modal_data = $('#modalForm').serialize();
            var combined_data = form_data + '&' + modal_data;
            
            // AJAX를 사용하여 데이터 전송
            $.ajax({
                type: "POST",
                url: "show.jsp",
                data: combined_data,
                success: function () {
                    console.log('Data sent successfully.');
                },
                error: function () {
                    console.log('Error sending data.');
                }
            });

            // 모달 닫기
            $('#myModal').modal('hide');

            return false;
        });
    });
</script>

</body>
</html>
