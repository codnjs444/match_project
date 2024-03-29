<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>��� �׽�Ʈ</title>
    <!-- ��Ʈ��Ʈ�� CSS �߰� -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h2>��� �׽�Ʈ</h2>
    <!-- ��ư�� ������ ����� ���� ��ư -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        ��� ����
    </button>

    <div class="container">
        <h2>���� �Է�</h2>
        <!-- �Է� �� -->
        <form id="myForm" action="show.jsp" method="post">
            <div class="form-group">
                <label for="number1">������ �Է��� ����:</label>
                <input type="number" class="form-control" id="number1" name="number1">
            </div>
            <button type="submit" class="btn btn-primary" id="submitBtn">Ȯ��</button>
        </form>
    </div>
</div>

<!-- ��� -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- ��� ��� -->
            <div class="modal-header">
                <h4 class="modal-title">���� �Է�</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- ��� �ٵ� -->
            <div class="modal-body">
                <form id="modalForm" action="show.jsp" method="post">
                    <div class="form-group">
                        <label for="number2">��޿��� �Է��� ����:</label>
                        <input type="number" class="form-control" id="number2" name="number2">
                    </div>
                    <button type="button" class="btn btn-primary" id="modalSubmitBtn">Ȯ��</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- ��Ʈ��Ʈ�� �� jQuery �߰� -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // ������ �Է°��� ��޿��� �Է°��� ���ļ� show.jsp�� ����
    $(document).ready(function () {
        $('#submitBtn').click(function () {
            $('#myModal').modal('show'); // ��� ����
        });

        $('#modalSubmitBtn').click(function () {
            var form_data = $('#myForm').serialize();
            var modal_data = $('#modalForm').serialize();
            var combined_data = form_data + '&' + modal_data;
            
            // AJAX�� ����Ͽ� ������ ����
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

            // ��� �ݱ�
            $('#myModal').modal('hide');

            return false;
        });
    });
</script>

</body>
</html>
