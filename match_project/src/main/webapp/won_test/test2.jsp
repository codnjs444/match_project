<%@page import="match.category.skillBean"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Vector" %>
<%@page import="match.category.skillBean"%>
<%@page import="match.category.categoryMgr"%>
<jsp:useBean id="skill_category" class="match.category.skillBean"></jsp:useBean>
<%
    // categoryMgr 객체 생성
    categoryMgr mgr = new categoryMgr();
    // 스킬 이름 리스트 가져오기
    Vector<skillBean> skillList = mgr.skillList();

    // 스킬 이름을 저장할 배열 생성
    String[] data = new String[skillList.size()];
    for (int i = 0; i < skillList.size(); i++) {
        data[i] = skillList.get(i).getSkill_sname().toLowerCase();
    }
%>

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

        <!-- 두 번째 드롭다운 -->
        <div class="row align-items-center mb-3">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="genderDropdownButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    성별을 선택해주세요.
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


      
</div>

<!-- 부트스트랩 JS -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>





// 드롭다운 버튼 텍스트 업데이트 함수
function updateDropdownButton(dropdownId, text) {
    document.getElementById(dropdownId).innerText = text;
    document.getElementById(dropdownId).style.fontSize = '18px';
}

// 드롭다운 메뉴 아이템 클릭 이벤트 핸들러 등록 함수
function registerDropdownItemClickEvent(dropdownId, dropdownItems) {
    for (var i = 0; i < dropdownItems.length; i++) {
        dropdownItems[i].addEventListener('click', function(event) {
            // 링크 이동 등의 기본 동작을 막음
            event.preventDefault();
            var selectedText = this.innerText;
            updateDropdownButton(dropdownId, selectedText);
        });
    }
}



</script>
</body>
</html>
