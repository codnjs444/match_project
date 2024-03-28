<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
    <style>
.container {
    display: flex;
    padding: 20px;
    margin-left: 300px;
}


.announcement-form {
    margin-right: 20px; /* 버튼과의 간격 */
}

.announcement-form textarea {
    height: 200px; /* 적절한 높이 설정 */
}

.buttons {
    flex-direction: column; /* 버튼을 세로로 배치 */
    justify-content: flex-start; /* 상단 정렬 */
}

.buttons button {
    margin-bottom: 10px; /* 버튼 간 간격 */
    width: 50px; /* 버튼의 가로 길이 */
}
        
    </style>
</head>
<body>
    <div class="container">
    <div class="announcement-form">
        <textarea placeholder="공고 내용을 여기에 작성하세요..."></textarea>
    </div>
    <div class="buttons">
        <button type="button">버튼 1</button>
        <button type="button">버튼 2</button>
    </div>
</div>
    
</body>
</html>
