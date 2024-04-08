<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="match.PostingMgr"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="pMgr" class="match.PostingMgr"/>
<jsp:useBean id="aMgr" class="match.application.ApplicationMgr"/>

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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<style>
body {
    background-color: #F8F8F8;
}
	.custom-container {
	    max-width: 1400px;
	    margin: auto;	    
	}
	/*상단 부분 버튼*/
	.top_btn {
	    border: none; /* 테두리 제거 */
	    background-color: transparent; /* 배경색 제거 */
	    font-size: 18px; /* 폰트 사이즈 설정 */
	    color: #606060; /* 폰트 색상 설정 */
	    margin-right: 40px;
	    font-weight: bold;
	}
	
	.filt_btn {
	    border: none; /* 테두리 제거 */
	    background-color: transparent; /* 배경색 제거 */
	    font-size: 15px; /* 폰트 사이즈 설정 */
	    color: #606060; /* 폰트 색상 설정 */
	    margin-top: 6px;
	    margin-right: 20px;
	    font-weight: bolder;
	}	
	.filt_btn2 {
	    border: none; /* 테두리 제거 */
	    background-color: transparent; /* 배경색 제거 */
	    font-size: 15px; /* 폰트 사이즈 설정 */
	    color: #606060; /* 폰트 색상 설정 */
	    margin-top: 6px;
	    font-weight: bolder;
	}		
	.top_btn:hover {
	    color: #fff; /* 호버 시 폰트 색상 변경 */
	    background-color: #606060; /* 호버 시 배경색 변경 */
	}
    .top_btn.active {
        background-color: #4698EA; /* 배경색 */
        color: #fff; /* 텍스트 색상 */
        border-color: #4698EA; /* 테두리 색상, 필요한 경우 */
    }

	.filter-buttons {
	    position: relative;
	    margin-right: 10px;
	    padding-bottom: 10px; 
	}
	
	.buttons {
    margin-left: 1100px; /* 왼쪽으로 20px만큼 이동 */
	}
	
	.filter-buttons::after {
	    content: "";
	    position: absolute;
	    bottom: 0;
	    right: 0;
	    width: 99%;
	    height: 2px;
	    background-color: #ccc;
	}
    /*공고 부분 스타일*/
	.job-post {
	    border: 1px solid #C4C4C4;
	    padding: 20px;
	    padding-top: 0; /* 상단 패딩 제거 */
	    padding-bottom: 0; /* 상단 패딩 제거 */
	    padding-right: 0; /* 상단 패딩 제거 */
	    padding-left: 0; /* 상단 패딩 제거 */
	    margin-bottom: 20px;
	    margin-right: auto;
	    margin-top: 0; /* 상단 마진 제거 */
	    margin-bottom: 0; /* 상단 마진 제거 */
	    margin-left: 0; /* 상단 마진 제거 */
	    margin-right: 0; /* 상단 마진 제거 */
	    min-height: 200px;
	    width: 100%;
	}

	
    /*공고 부분  구역 나누기 스타일*/
    .section {
        display: flex;
        justify-content: space-between;
    }

    .top, .middle, .bottm {
        flex: 1; /* 가로 공간을 동일하게 채움 */
        color: white; /* 텍스트 색상을 흰색으로 설정 */
    }

    /* 개별 섹션의 높이를 다르게 설정 */
    .top {
        height: 30px; /* 상단 부분의 높이 */
    }

    .middle {
        height: 160px; /* 중간 부분의 높이 */
    }

    .bottom {
        height: 30px; /* 하단 부분의 높이 */
    }
	.procedure-box {
	    display: inline-flex; /* 내용에 맞게 너비 조정 */
	    justify-content: center;
	    align-items: center;
	    padding: 0 10px; /* 좌우 패딩 추가 */
	    min-width: 100px; /* 최소 너비 설정 */
	    height: 34px;
	    background-color: white;
	    color: black;
	    margin: 15px auto;
	    border: 1px solid #606060;
	    border-radius: 5px;
	    font-weight: bold;
	    white-space: nowrap; /* 텍스트가 줄 바뀜 없이 한 줄로 표시 */
	}

	
	.section.middle {
	    height: 160px; /* 기존의 높이 설정 유지 */
	    display: flex;
	    flex-direction: column;
	}
	
	.vertical-section {
	    flex: 1; /* 부모 컨테이너의 높이에 따라 동일한 비율로 높이 설정 */
	}
    .middle-container {
        display: flex; /* Flexbox를 사용하여 가로로 요소를 배치 */
        height: 100%; /* 부모 컨테이너의 높이를 전부 차지 */
    }
    
    .horizontal-section {
        position: relative; /* 자식 요소인 .oval-shape를 절대 위치로 배치하기 위함 */
        height: 100%;
        display: flex;
    }

	.posting_type {
		margin-left: 10px;
	    position: absolute;
	    width: 80px;
	    height: 30px;
	    background-color: white;
	    border-radius: 30%;
	    border: 2px solid #C4C4C4;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    color: #606060;
	    font-size: 14px;
	    font-weight: bold;
	    left: 50%;
	    top: 0; /* 타원을 상단에 위치시킴 */
	    transform: translate(-50%, +100%); /* 왼쪽으로 50%, 위로 50% 이동하여 중앙 정렬 */
	}    

    .posting_name {
    	margin-top: 22px;
    	margin-left: 20px;
        font-size: 18px;
        font-weight: bolder;
        color: black;
        text-align: left; /* 좌측 정렬 */
        margin-bottom: 8px; /* 이름과 날짜 사이에 여백 */
    }

    .posting_date, .posting_service {
    	margin-left: 20px;
        font-size: 14px;
        color: #606060;
        text-align: left; /* 좌측 정렬 */
        margin-bottom: 8px; /* 날짜와 서비스 사이에 여백 */
    }

    .horizontal-section {
        flex-direction: column; /* 세로로 쌓기 */
        padding: 10px; /* 안쪽 여백 */
    }

	/*나머지 스타일*/
    .row-between {
        padding-right: 80px; /* 우측 간격을 늘립니다 */
    }
	

</style>
<body>

<%
    String manager_id = (String)session.getAttribute("idKey");
    String posting_status = request.getParameter("posting_status");
    if (posting_status == null) posting_status = "진행중"; // 기본값 설정
    String sort = request.getParameter("sort"); // URL에서 sort 파라미터 값을 가져옵니다.
    if (sort == null) {
        sort = "latest"; // 기본 정렬 방식을 설정
    }
    ArrayList<Integer> postIdxList = pMgr.getSortedPostIdxList(manager_id, posting_status, sort);

  /*   ArrayList<Integer> postIdxList = pMgr.savePostIdx(manager_id, posting_status); */
    ArrayList<Integer> resumeNume = aMgr.ResumeNum(manager_id, posting_status);
    ArrayList<Integer> finalAcceptedCounts = pMgr.countFinalAcceptedByPostIdx(postIdxList);

    HashMap<Integer, ArrayList<String>> proceduresMap = pMgr.getProceduresByPosting(postIdxList);
    ArrayList<String> postingNames = pMgr.getPostingNames(postIdxList);
    ArrayList<String> dateRanges = pMgr.getApplicationDates(postIdxList);
    ArrayList<String> postTypes = pMgr.getPostingTypes(postIdxList);


    int totalPosts = postIdxList.size();
    final int numperPage = 3;
    int totalPages = (int)Math.ceil((double)totalPosts / numperPage);

    String pageParam = request.getParameter("page");
    int currentPage = pageParam == null ? 1 : Integer.parseInt(pageParam);

    int startIndex = (currentPage - 1) * numperPage;
    int endIndex = Math.min(startIndex + numperPage, totalPosts);
%>

<div class="container-fluid custom-container"> <!-- fluid container for full width -->
	<div style="padding-left: 10px;"> <!-- 여기에 내부 패딩 추가 -->
    <div class="row">
		<div class="col filter-buttons">
		   	<a href="?posting_status=진행중" class="top_btn">진행중</a>
            <a href="?posting_status=임시저장" class="top_btn">임시저장</a>
            <a href="?posting_status=마감" class="top_btn">마감</a>
            <a href="?posting_status=협업" class="top_btn">협업</a>
            <a href="?posting_status=전체" class="top_btn">전체</a>
		</div>
    </div>
    <div class="row mt-1">
        <div class="col d-flex justify-content-between">
            <!-- 추가 필터링 옵션 드롭다운 버튼들 -->
			<div class="col buttons">
				<a href="?posting_status=진행중&sort=latest" class="sort-button" style="color: #606060; font-weight: bold; margin-left: 30px; margin-right: 30px;">최신등록일순</a>
			    <a href="?posting_status=진행중&sort=deadline" class="sort-button" style="color: #606060; font-weight: bold;">마감일순</a>
			</div>
        </div>
    </div>
        <div class="row mt-1">
            <!-- 공고 리스트 출력 -->
            <div class="col-12">
			<% for(int i = startIndex; i < endIndex && i < postingNames.size() && i < dateRanges.size(); i++) { %>
				<div class="job-post">
				    <div class="section top">
				                       <div class="procedure-box">
                    <% 
                    Integer postingIdx = postIdxList.get(i);
                    ArrayList<String> procedures = proceduresMap.get(postingIdx);
                    if (procedures != null) {
                        for (int j = 0; j < procedures.size(); j++) {
                            out.print(procedures.get(j));
                            if (j < procedures.size() - 1) {
                                out.print(" -> ");
                            }
                        }
                    }
                    %>
                </div>
				    </div>
				    <div class="section middle">
				        <div class="middle-container">
				            <div class="horizontal-section" style="width: 8%;">
				                <div class="posting_type"><%= postTypes.get(i) %></div>
				              
				            </div>
				            <div class="horizontal-section" style="width: 62%;">
			                    <a href="post_manage.jsp?posting_idx=<%= postIdxList.get(i) %>" class="posting_name" style="text-decoration: none; color: #000;">
			                        <%= postingNames.get(i) %>
			                    </a>
				                <!-- 추가된 부분: 공고 이름과 날짜 정보 -->
            					<div class="posting_date"><%= dateRanges.get(i) %></div>
				                <div class="posting_service">이용중이신 홍보 서비스가 없습니다.</div>
				                
				            </div> <!-- GreenYellow, 너비 25% -->  
				            
				            <div class="horizontal-section" style="width: 35%;">
				                <!-- 버튼 추가 -->
				                <div class="btn-group" role="group" aria-label="Basic example" style="padding: 10px; display: flex; justify-content: space-around; margin-top: 10px;">
				                    <button type="button" class="btn" style="color: #606060; font-weight: bold;">권한</button>
									<button type="button" class="btn" style="color: #606060; font-weight: bold;" data-posting-idx="<%= postingIdx %>">수정</button>
				                    <button type="button" class="btn" style="color: #606060; font-weight: bold;">복사</button>
				                    <button type="button" class="btn" style="color: #606060; font-weight: bold;">마감</button>
									<button type="button" class="btn" style="color: #606060; font-weight: bold;"
									    onclick="deletePosting('<%= postingIdx %>', '<%= postingNames.get(i).replaceAll("'", "\\\\'") %>')">삭제</button>
				                </div>
				                <!-- 지원자 및 합격자 수 표시 박스 -->
				                <div style="border: 1px solid #C4C4C4; color: #606060; font-weight: bold; padding: 10px; width: 270px; border-radius: 8px; text-align: center; margin-left: 115px;">
				                    <span style="margin-right: 28px;">지원자 : <%= resumeNume.get(i) %>명</span>
                        			<span>최종 합격 : <%= finalAcceptedCounts.get(i) %>명</span>
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
	            <nav aria-label="Page navigation">
	                <ul class="pagination justify-content-center">
	                    <% if(currentPage > 1) { %>
	                    <li class="page-item"><a class="page-link" href="?posting_status=<%=posting_status%>&page=<%=currentPage - 1%>">Previous</a></li>
	                    <% }
	                       for(int i = 1; i <= totalPages; i++) { %>
	                    <li class="page-item <%=currentPage == i ? "active" : ""%>"><a class="page-link" href="?posting_status=<%=posting_status%>&page=<%=i%>"><%=i%></a></li>
	                    <% }
	                       if(currentPage < totalPages) { %>
	                    <li class="page-item"><a class="page-link" href="?posting_status=<%=posting_status%>&page=<%=currentPage + 1%>">Next</a></li>
	                    <% } %>
	                </ul>
	            </nav>
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
	
	document.addEventListener("DOMContentLoaded", function() {
	    // URL에서 posting_status 값을 추출
	    const urlParams = new URLSearchParams(window.location.search);
	    const postingStatus = urlParams.get('posting_status') || '진행중';

	    // 모든 top_btn에 대해 반복
	    const buttons = document.querySelectorAll(".top_btn");
	    buttons.forEach(function(button) {
	        // 버튼의 href 속성에서 posting_status 값을 찾음
	        const status = new URLSearchParams(button.getAttribute('href').split('?')[1]).get('posting_status');
	        
	        // 현재 URL의 posting_status와 버튼의 posting_status가 일치하면 active 클래스 추가
	        if (status === postingStatus) {
	            button.classList.add("active");
	        }
	        
	        // 버튼 클릭 이벤트
	        button.addEventListener("click", function() {
	            // 클릭 시 모든 버튼의 active 클래스 제거
	            buttons.forEach(btn => btn.classList.remove("active"));
	            
	            // 클릭한 버튼에 active 클래스 추가
	            this.classList.add("active");
	        });
	    });
	});
	
	function deletePosting(postingIdx, postingName) {
	    if (confirm(postingName + " 공고를 정말 삭제하시겠습니까?")) {
	        // AJAX 요청
	        var xhr = new XMLHttpRequest();
	        xhr.open("POST", "/match_project/DeletePostServlet", true); // 컨텍스트 경로를 포함한 전체 경로 사용
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	        xhr.onload = function() {
	            if (xhr.status == 200) {
	                alert("공고가 성공적으로 삭제되었습니다.");
	                window.location.reload(); // 페이지 새로고침
	            }
	        };
	        xhr.send("postingIdx=" + postingIdx); // 데이터 전송
	    }
	}

	document.addEventListener("DOMContentLoaded", function() {
	    // 모든 '수정' 버튼에 대한 참조를 가져옵니다.
	    const editButtons = document.querySelectorAll(".btn[data-posting-idx]");

	    // 각 버튼에 대해 클릭 이벤트 리스너를 추가합니다.
	    editButtons.forEach(function(button) {
	        button.addEventListener("click", function() {
	            const postingIdx = this.getAttribute("data-posting-idx"); // 버튼의 data-posting-idx 속성값을 가져옵니다.
	            window.location.href = "edit_proc.jsp?posting_idx=" + postingIdx;
	        });
	    });
	});

/* 	function deletePosting(postingIdx, postingName) {
	    var message = `${postingName} 공고를 정말 삭제하시겠습니까?`;
	    var confirmed = confirm(message);

	    if (confirmed) {
	        console.log(`삭제 승인. 공고 idx: ${postingIdx}, 이름: ${postingName}`);
	        // 삭제 로직 수행
	        // 예: 서버에 삭제 요청을 보내는 AJAX 호출 등
	    } else {
	        console.log("삭제 취소");
	    }
	} */


	
</script>


</body>
</html>
