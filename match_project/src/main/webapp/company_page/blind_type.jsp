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
    margin-right: 20px; /* ��ư���� ���� */
}

.announcement-form textarea {
    height: 200px; /* ������ ���� ���� */
}

.buttons {
    flex-direction: column; /* ��ư�� ���η� ��ġ */
    justify-content: flex-start; /* ��� ���� */
}

.buttons button {
    margin-bottom: 10px; /* ��ư �� ���� */
    width: 50px; /* ��ư�� ���� ���� */
}
        
    </style>
</head>
<body>
    <div class="container">
    <div class="announcement-form">
        <textarea placeholder="���� ������ ���⿡ �ۼ��ϼ���..."></textarea>
    </div>
    <div class="buttons">
        <button type="button">��ư 1</button>
        <button type="button">��ư 2</button>
    </div>
</div>
    
</body>
</html>
