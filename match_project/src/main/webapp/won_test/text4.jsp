<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="match.job_categoryBean" %>
<%@ page import="match.job_categoryMgr" %>

<jsp:useBean id="jMgr" class="match.job_categoryMgr"/>
<jsp:useBean id="jBean" class="match.job_categoryBean"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dropdown Menu</title>
  <!-- 부트스트랩 CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
  <form id="menuForm" action="myshow.jsp" method="post">
    <div class="dropdown">
      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Dropdown 버튼
      </button>
      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="max-width: 900px;">
        <div class="row">
          <!-- 좌측 메뉴 -->
          <div class="col-md-6 pr-0 border-right">
            <h6 class="dropdown-header">좌측 메뉴</h6>
            <div class="row">
              <div class="col-md-6">
                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu1', event)">기획·전략</a>
              </div>
              <div class="col-md-6">
                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu2', event)">마케팅·홍보·조사</a>
              </div>
              <div class="col-md-6">
                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu3', event)">회계·세무·재무</a>
              </div>
              <div class="col-md-6">
                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu4', event)">인사·노무·HRD</a>
              </div>
              <div class="col-md-6">
                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu5', event)">총무·법무·사무</a>
              </div>
              <div class="col-md-6">
                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu6', event)">IT개발·데이터</a>
              </div>
              <div class="col-md-6">
                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu7', event)">디자인</a>
              </div>                      
            </div>
          </div>
          
		<!-- 우측 메뉴 -->
		<div class="col-md-6" id="right-menu" style="max-height: 300px; overflow-y: auto;">
		    <h6 class="dropdown-header">우측 메뉴</h6>
		    <!-- 우측 메뉴의 내용을 미리 정의 -->
		    <div id="menu1" style="display: none;">
		        <div class="row">
		            <% 
		                String name = "기획·전략";
		                Vector<job_categoryBean> vlist = jMgr.jobsnameList(name);
		                
		                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
		                for (job_categoryBean menuItem : vlist) {
		            %>
		            <div class="col-md-6">
		                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
		            </div>
		            <% 
		                }
		            %>
		        </div>
		    </div>
            <div id="menu2" style="display: none;">
             <div class="row">
		            <% 
		                String name1 = "마케팅·홍보·조사";
		                Vector<job_categoryBean> vlist1 = jMgr.jobsnameList(name1);
		                
		                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
		                for (job_categoryBean menuItem : vlist1) {
		            %>
		            <div class="col-md-6">
		                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
		            </div>
		            <% 
		                }
		            %>
		        </div>
            </div>
            <div id="menu3" style="display: none;">
                 <div class="row">
		            <% 
		                String name3 = "회계·세무·재무";
		                Vector<job_categoryBean> vlist3 = jMgr.jobsnameList(name3);
		                
		                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
		                for (job_categoryBean menuItem : vlist3) {
		            %>
		            <div class="col-md-6">
		                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
		            </div>
		            <% 
		                }
		            %>
		        </div>
            </div>
            <div id="menu4" style="display: none;">
                   <div class="row">
		            <% 
		                String name4 = "인사·노무·HRD";
		                Vector<job_categoryBean> vlist4 = jMgr.jobsnameList(name4);
		                
		                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
		                for (job_categoryBean menuItem : vlist4) {
		            %>
		            <div class="col-md-6">
		                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
		            </div>
		            <% 
		                }
		            %>
		        </div>
            </div>
            <div id="menu5" style="display: none;">
                   <div class="row">
		            <% 
		                String name5 = "총무·법무·사무";
		                Vector<job_categoryBean> vlist5 = jMgr.jobsnameList(name5);
		                
		                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
		                for (job_categoryBean menuItem : vlist5) {
		            %>
		            <div class="col-md-6">
		                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
		            </div>
		            <% 
		                }
		            %>
		        </div>
            </div>
            <div id="menu6" style="display: none;">
                   <div class="row">
		            <% 
		                String name6 = "IT개발·데이터";
		                Vector<job_categoryBean> vlist6 = jMgr.jobsnameList(name6);
		                
		                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
		                for (job_categoryBean menuItem : vlist6) {
		            %>
		            <div class="col-md-6">
		                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
		            </div>
		            <% 
		                }
		            %>
		        </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 제출 버튼 -->
    <div class="mt-3">
      <button type="button" class="btn btn-primary" onclick="submitForm()">선택 항목 제출</button>
    </div>
    <!-- 선택된 우측 메뉴의 값 출력 -->
    <div class="mt-3">
      <p>선택된 우측 메뉴 항목: <span id="selectedMenu"></span></p>
    </div>
    <!-- 선택된 우측 메뉴의 값을 전송할 숨은 입력 필드 -->
    <input type="hidden" name="selectedMenuItem" id="selectedMenuItem">
  </form>
</div>

<!-- 부트스트랩 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
function changeRightMenu(menu, event) {
  event.stopPropagation(); // 이벤트 전파 중지
  // 모든 우측 메뉴 숨기기
  document.querySelectorAll('#right-menu > div').forEach(function(div) {
    div.style.display = 'none';
  });
  // 해당 메뉴 보여주기
  document.getElementById(menu).style.display = 'block';
}

function selectRightMenuItem(menuItemText) {
  document.getElementById('dropdownMenuButton').textContent = menuItemText; // Dropdown 버튼 텍스트 변경
  $('.dropdown-toggle').dropdown('toggle'); // 드롭다운 닫기
}

function submitForm() {
  var selectedItemText = document.getElementById('dropdownMenuButton').textContent;
  document.getElementById('selectedMenu').textContent = selectedItemText;
  document.getElementById('selectedMenuItem').value = selectedItemText; // 숨은 입력 필드에 선택된 값 설정
  document.getElementById('menuForm').submit(); // 폼 제출
}
</script>

</body>
</html>
