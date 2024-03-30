<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Vector" %>
<%@page import="match.skillBean"%>
<%@page import="match.categoryMgr"%>
<jsp:useBean id="skill_category" class="match.skillBean"></jsp:useBean>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="../css/post_job.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            선택해주세요
        </button>
        <div class="dropdown-menu d-flex" aria-labelledby="dropdownMenuButton">
            <div class="dropdown-menu-left">
                <a class="dropdown-item" href="#" id="fruit">왼쪽 박스1</a>
                <a class="dropdown-item" href="#" id="animal">왼쪽 박스2</a>
            </div>
            <div class="dropdown-divider"></div> <!-- 왼쪽 박스와 오른쪽 박스를 구분하는 구분선 -->
            <div class="dropdown-menu-right">
                <a class="dropdown-item" href="#"></a>
                <a class="dropdown-item" href="#"></a>
                                <a class="dropdown-item" href="#"></a>
                                                <a class="dropdown-item" href="#"></a>
                                                                <a class="dropdown-item" href="#"></a>
                                                                                <a class="dropdown-item" href="#"></a>
                                                                                                <a class="dropdown-item" href="#"></a>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    // 왼쪽 박스 1을 클릭했을 때 오른쪽 박스에 과일 이름들이 나오도록 하는 함수
    document.getElementById('fruit').addEventListener('click', function() {
        var fruits = ['사과', '바나나', '딸기', '수박', '포도'];
        var rightBoxItems = document.querySelectorAll('.dropdown-menu-right .dropdown-item');
        rightBoxItems.forEach(function(item, index) {
            item.textContent = fruits[index];
        });
    });

    // 왼쪽 박스 2를 클릭했을 때 오른쪽 박스에 동물 이름들이 나오도록 하는 함수
    document.getElementById('animal').addEventListener('click', function() {
        var animals = ['고양이', '개', '원숭이', '호랑이', '사자'];
        var rightBoxItems = document.querySelectorAll('.dropdown-menu-right .dropdown-item');
        rightBoxItems.forEach(function(item, index) {
            item.textContent = animals[index];
        });
    });
</script>
</html>
