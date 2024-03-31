<%@page import="match.category.job_categoryBean"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Vector" %>
<%@page import="match.category.skillBean"%>
<%@page import="match.category.categoryMgr"%>
<jsp:useBean id="skill_category" class="match.category.skillBean"></jsp:useBean>
<jsp:useBean id="jBean" class="match.category.job_categoryBean"></jsp:useBean>
<jsp:useBean id="cMgr" class="match.category.categoryMgr"></jsp:useBean>
<%
Vector<job_categoryBean> vlist = cMgr.jobsnameList();
    String[] jobNames = new String[vlist.size()]; // 벡터의 크기만큼의 배열 생성

    // 벡터의 각 요소를 배열에 복사
    for (int i = 0; i < vlist.size(); i++) {
        jobNames[i] = vlist.get(i).getJob_sname(); // 여기서 getName()은 Job_CategoryBean에서 이름을 가져오는 메서드일 것입니다.
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
    
    <style>
    	.custom-scrollbar::-webkit-scrollbar {
		  width: 10px;
		}
		
		.custom-scrollbar {
		  scrollbar-width: thin;
		  overflow-y: scroll; /* 세로 스크롤바를 항상 표시 */
		  max-height: 200px; /* 스크롤바가 표시되기 전에 최대 높이 지정 */
		}
    	
    </style>
</head>
<body>
<div class="container">
    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            선택해주세요
        </button>
        <div class="dropdown-menu d-flex" aria-labelledby="dropdownMenuButton">
            <div class="dropdown-scrollable">
                <div class="dropdown-menu-left">
                    <a class="dropdown-item" href="#" id="planning">기획·전략</a>
                    <a class="dropdown-item" href="#" id="marketing">마케팅·홍보·조사</a>
                    <a class="dropdown-item" href="#" id="accounting">회계·세무·재무</a>
                    <a class="dropdown-item" href="#" id="hr">인사·노무·HRD</a>
                    <a class="dropdown-item" href="#" id="administration">총무·법무·사무</a>
                    <a class="dropdown-item" href="#" id="it">IT개발·데이터</a>
                    <a class="dropdown-item" href="#" id="design">디자인</a>
                    <a class="dropdown-item" href="#" id="sales">영업·판매·무역</a>
                    <a class="dropdown-item" href="#" id="customer-service">고객상담·TM</a>
                </div>
            </div>
            <div class="dropdown-scrollable custom-scrollbar"> <!-- 수정 -->
                <div class="dropdown-menu-right">
                    <a class="dropdown-item" href="#"></a>
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
</body>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 부트스트랩 JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
    // 페이지가 완전히 로드된 후에 JavaScript 코드 실행
    document.addEventListener("DOMContentLoaded", function() {
        var dropdownMenu = document.querySelector('.dropdown-menu');
        var dropdownButton = document.getElementById('dropdownMenuButton');

        // 선택하세요 버튼을 클릭할 때마다 드롭다운을 토글하는 함수
        dropdownButton.addEventListener('click', function() {
            dropdownMenu.classList.toggle('show');
        });

     // 왼쪽 박스 1을 클릭했을 때 오른쪽 박스에 과일 이름들이 나오도록 하는 함수
        document.getElementById('planning').addEventListener('click', function() {
            updateDropdownButton("기획·전략");
            var fruits = ['사과', '바나나', '딸기', '수박', '포도'];
            var rightBoxItems = document.querySelectorAll('.dropdown-menu-right .dropdown-item');
            rightBoxItems.forEach(function(item, index) {
                item.textContent = fruits[index];
            });
        });

        // 왼쪽 박스 2를 클릭했을 때 오른쪽 박스에 동물 이름들이 나오도록 하는 함수
        document.getElementById('marketing').addEventListener('click', function() {
            updateDropdownButton("마케팅·홍보·조사");
            var animals = [
            	  <% 
            	    for(int i = 0; i < jobNames.length; i++) {
            	        out.print("'" + jobNames[i] + "'");
            	        if(i < jobNames.length - 1) {
            	            out.print(",");
            	        }
            	    }
            	  %>
            	];

            var rightBoxItems = document.querySelectorAll('.dropdown-menu-right .dropdown-item');
            rightBoxItems.forEach(function(item, index) {
                item.textContent = animals[index];
            });
        });
        
        

        // 오른쪽 박스의 항목이 선택되었을 때 드롭다운 버튼의 텍스트를 변경하는 함수
        document.querySelectorAll('.dropdown-menu-right .dropdown-item').forEach(function(item) {
            item.addEventListener('click', function() {
                updateDropdownButton(this.textContent);
            });
        });
        
     // 확인 버튼을 클릭하면 드롭다운 메뉴를 닫는 함수
        document.getElementById('confirmButton').addEventListener('click', function() {
            dropdownMenu.classList.remove('show'); // 드롭다운을 닫음
        });


        // 드롭다운 버튼 텍스트 업데이트 함수
        function updateDropdownButton(text) {
            dropdownButton.textContent = text;
        }

    });
</script>
</html>
