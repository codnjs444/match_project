<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>��ư �� ��</title>
    <!-- ��Ʈ��Ʈ�� CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        /* �߰��� CSS */
        .btn-group-vertical {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            margin-top: 100px; /* ��ư���� ������κ����� ���� */
        }
        .btn-group-vertical .btn {
            margin-bottom: 10px; /* ��ư�� ���� ���� */
            width: 100px; /* ��ư�� �ʺ� */
            font-size: 14px; /* ��ư�� ��Ʈ ũ�� */
        }
        .container {
            display: flex;
            justify-content: flex-end; /* �����̳��� ������ ���������� ���� */
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- ��ư �� �� -->
        <div class="btn-group-vertical">
            <button type="button" class="btn btn-primary">��ư 1</button>
            <button type="button" class="btn btn-primary">��ư 2</button>
        </div>
    </div>

    <!-- ��Ʈ��Ʈ�� JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
