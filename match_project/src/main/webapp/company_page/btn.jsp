<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>버튼 두 개</title>
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        /* 추가한 CSS */
        .btn-group-vertical {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            margin-top: 100px; /* 버튼들이 상단으로부터의 여백 */
        }
        .btn-group-vertical .btn {
            margin-bottom: 10px; /* 버튼들 간의 간격 */
            width: 100px; /* 버튼의 너비 */
            font-size: 14px; /* 버튼의 폰트 크기 */
        }
        .container {
            display: flex;
            justify-content: flex-end; /* 컨테이너의 내용을 오른쪽으로 정렬 */
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 버튼 두 개 -->
        <div class="btn-group-vertical">
            <button type="button" class="btn btn-primary">버튼 1</button>
            <button type="button" class="btn btn-primary">버튼 2</button>
        </div>
    </div>

    <!-- 부트스트랩 JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
