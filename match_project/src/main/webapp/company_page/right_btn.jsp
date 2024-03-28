<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Right Buttons</title>
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        /* 오른쪽 화면 우측 상단에 고정하기 위한 스타일 */
        .right-buttons-container {
            position: fixed;
            top: 10%; /* 오른쪽 상단에서의 거리 조절 */
            right: 5%; /* 오른쪽 여백 조절 */
            display: flex;
            flex-direction: column; /* 버튼들을 상하로 배치 */
            align-items: flex-end; /* 버튼들을 오른쪽 정렬 */
        }
        .button-spacing {
            margin-bottom: 10px; /* 버튼 사이의 간격 조절 */
        }
    </style>
</head>
<body>
    <div class="right-buttons-container">
        <button type="button" class="btn btn-primary button-spacing" onclick="saveTemporary()">임시 저장</button>
        <button type="button" class="btn btn-success" onclick="submitForm()">등록하기</button>
    </div>

    <script>
        // 임시 저장 버튼 클릭 시 호출되는 함수
        function saveTemporary() {
            // 여기에 임시 저장 기능을 구현
            alert('임시 저장되었습니다.');
        }

        // 등록하기 버튼 클릭 시 호출되는 함수
        function submitForm() {
            // 여기에 폼을 전송하거나 다른 동작을 수행하는 코드를 추가
            alert('등록되었습니다.');
        }
    </script>

    <!-- 부트스트랩 JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
