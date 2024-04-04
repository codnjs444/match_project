<%@page import="java.util.ArrayList"%>
<%@page import="match.PostingMgr"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="pMgr" class="match.PostingMgr"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 공고 관리</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
	<link href="../../css/company_home_middle.css" rel="stylesheet" type="text/css">    
	<link href="../css/company_home_middle.css" rel="stylesheet" type="text/css">    
	
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%!
    	int i =0;
    	String type = "일반 채용";
    	String name = "온종합병원 전산 직원(개발자) 모집";
    	String proceduretest = "서류전형->1차 면접->2차 면접->최종발표";
   
    %>
    
</head>
<body>
<%
    // 페이지 번호 파라미터 확인, 없으면 1로 설정
    String manager_id = (String)session.getAttribute("idKey");
    String posting_status = "진행중"; // 예시 포스팅 타입
    
    ArrayList<Integer> postIdxList = pMgr.savePostIdx(manager_id, posting_status); // posting_idx 목록을 가져옴
    ArrayList<String> postingNames = pMgr.getPostingNames(postIdxList); // 공고 이름 목록을 가져옴
    
 	// 시작 및 종료 날짜(년월일) 리스트를 가져옴. 각 요소는 "시작날짜~종료날짜" 형태의 문자열입니다.
    ArrayList<String> dateRanges = pMgr.getApplicationDates(postIdxList);

    
    final int numperPage = 3; // 한 페이지에 보여줄 아이템 개수
    
    int totalPosts = pMgr.searchPost(manager_id, posting_status);
    int totalPages = (int)Math.ceil((double)totalPosts / numperPage);

    String pageParam = request.getParameter("page");
    int currentPage = pageParam == null ? 1 : Integer.parseInt(pageParam);

    // 현재 페이지에 따른 아이템 시작 인덱스 (실제 데이터베이스 쿼리에서 사용)
    int startIndex = (currentPage - 1) * numperPage;
    int endIndex = Math.min(startIndex + numperPage, totalPosts); // endIndex 계산


%>
		<p>총 공고 수: <%= totalPosts %></p>
		<p>총 공고 수: <%= manager_id %></p>
<div class="container custom-container"> <!-- 여기에 custom-container 클래스 추가 -->
	<div style="padding-left: 20px;"> <!-- 여기에 내부 패딩 추가 -->
    <div class="row">
		<div class="col filter-buttons">
		    <button class="top_btn">진행중 <span><%= i %></span></button>
		    <button class="top_btn">임시저장 <span><%= i %></span></button>
		    <button class="top_btn">마감 <span><%= i %></span></button>
		    <button class="top_btn">협업 <span><%= i %></span></button>
		    <button class="top_btn">전체 <span><%= i %></span></button>
		</div>
    </div>
    <div class="row mt-1">
        <div class="col d-flex justify-content-between">
            <!-- 추가 필터링 옵션 드롭다운 버튼들 -->
		<div class="col buttons">
		    <button class="filt_btn">최신등록일순</button>
		    <button class="filt_btn">마감일순</button>
		    <button class="filt_btn2">지원자순</button>
		</div>
        </div>
    </div>
        <div class="row mt-1">
            <!-- 공고 리스트 출력 -->
            <div class="col-12">
			<% for(int i = startIndex; i < endIndex; i++) { %>
				<div class="job-post">
				    <div class="section top">
				        <div class="procedure-box">서류전형->1차 면접->2차 면접->최종발표</div>
				        <button class="close-btn" style="position: absolute; top: 10px; right: 10px; border: none; background: none;">
				            <i class="fas fa-times"></i>
				        </button>
				    </div>
				    <div class="section middle">
				        <div class="middle-container">
				            <div class="horizontal-section" style="width: 8%;">
				                <div class="posting_type">일반 채용</div>
				              
				            </div>
				            <div class="horizontal-section" style="width: 62%;">
        						<div class="posting_name"><%= postingNames.get(i) %></div>
				                <!-- 추가된 부분: 공고 이름과 날짜 정보 -->
            					<div class="posting_date"><%= dateRanges.get(i - startIndex) %></div>
				                <div class="posting_service">이용중이신 홍보 서비스가 없습니다.</div>
				                
				            </div> <!-- GreenYellow, 너비 25% -->  
				            
				            <div class="horizontal-section" style="width: 35%;">
				                <!-- 버튼 추가 -->
				                <div class="btn-group" role="group" aria-label="Basic example" style="padding: 10px; display: flex; justify-content: space-around; margin-top: 10px;">
				                    <button type="button" class="btn" style="color: #606060; font-weight: bold;">홍보</button>
				                    <button type="button" class="btn" style="color: #606060; font-weight: bold;">권한</button>
				                    <button type="button" class="btn" style="color: #606060; font-weight: bold;">수정</button>
				                    <button type="button" class="btn" style="color: #606060; font-weight: bold;">복사</button>
				                    <button type="button" class="btn" style="color: #606060; font-weight: bold;">마감</button>
				                </div>
				                <!-- 지원자 및 합격자 수 표시 박스 -->
				                <div style="border: 1px solid #C4C4C4; color: #606060; font-weight: bold; padding: 10px; width: 240px; border-radius: 8px; text-align: center; margin-left: 100px;">
				                    <span style="margin-right: 30px;">지원자: <%= i %>명</span>
				                    <span>합격자: <%= i %>명</span>
				                </div>
				            </div>
				        </div>
				    </div>
				    <div class="section bottom"></div>
				</div>

                <%
                    }
                %>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <!-- 페이지네이션 -->
        		<ul class="pagination justify-content-center"> <!-- justify-content-center 클래스를 추가하여 요소들을 부모 컨테이너의 중앙에 배치합니다. -->
                    <% if(currentPage > 1) { %>
                    <li class="page-item"><a class="page-link" href="?page=<%=currentPage - 1%>">Previous</a></li>
                    <% } %>
                    <%
                        for(int i = 1; i <= totalPages; i++) {
                    %>
                    <li class="page-item <%=currentPage == i ? "active" : ""%>"><a class="page-link" href="?page=<%=i%>"><%=i%></a></li>
                    <%
                        }
                    %>
                    <% if(currentPage < totalPages) { %>
                    <li class="page-item"><a class="page-link" href="?page=<%=currentPage + 1%>">Next</a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const buttons = document.querySelectorAll(".top_btn");
	    buttons.forEach(function(button) {
	        button.addEventListener("click", function() {
	            buttons.forEach(function(btn) {
	                btn.classList.remove("active");
	            });
	            this.classList.add("active");
	            // 클릭된 버튼에 대해 테두리 제거
	            this.style.outline = "none";
	        });
	    });
	});
	
</script>


</body>
</html>
