<%@page import="match.posting.procedureBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="match.PostingMgr"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="pMgr" class="match.PostingMgr"/>
<jsp:useBean id="aMgr" class="match.application.ApplicationMgr"/>
<jsp:useBean id="prBean" class="match.posting.procedureBean"/>
<jsp:useBean id="aBean" class="match.application.ApplicationBean"/>


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
	.custom-container {
	    max-width: 1410px;
	    margin: auto;	    
	}
	.top_btn {
	    border: none;
	    background-color: transparent;
	    font-size: 18px;
	    color: #606060;
	    margin-right: 40px;
	    font-weight: bold;
	    text-decoration: none; /* 링크 밑줄 제거 */
	}
	.filter-buttons {
	    position: relative;
	    padding-bottom: 10px;
	}
	.filter-buttons::after {
	    content: "";
	    position: absolute;
	    bottom: 0;
	    right: -83px; /* 원하는 만큼 음수값으로 조정합니다. */
	    width: 105%; /* 너비도 조정할 수 있습니다. */
	    height: 2px;
	    background-color: #ccc;
	}
	.top-menu {
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
	    height: 30px;
	    width: 107%;
	}
	.applicant-info {
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
	    height: 100px;
	    width: 107%;
	}	
	
	.applicant-info > div {
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    }
	.fixed-button {
	    position: fixed;
	    bottom: 425px;
	    right: 20px;
	    z-index: 999;
	}
	
	.addbtn22 {
	    width: 120px; /* 원하는 너비로 설정하세요 */
	    background-color: white;
	    color: #606060;
	    border: 2px solid #606060;
	    border-radius: 5px;
	    padding: 10px;
	    margin-bottom: 5px; /* 버튼 간 간격 조절 */
	    font-size: 16px;
	    font-weight: bolder;
	    cursor: pointer;
	    text-align: center; /* 텍스트 가운데 정렬 */
	}
	.dropdown-toggle {
	    padding: 2px 6px; /* 버튼 내부 여백 조절 */
	    font-size: 12px; /* 아이콘 및 텍스트 크기 조절 */
	    line-height: 1; /* 버튼 높이 조절 */
	}
</style>
<body>

<%
    String manager_id = (String)session.getAttribute("idKey");
	// 공고 idx
	String posting_idx = request.getParameter("posting_idx");
	// 공고 이름
	String postingName = pMgr.getPostingName(posting_idx);
	// 채용 절차 수
	int procedureNum = pMgr.countProcedureNum(posting_idx);
	int procecount = 0;
	// 채용 절차 출력하기 위한 파일 (상단 메뉴)
	List<procedureBean> procedureList = pMgr.getProcedure(posting_idx, procecount);
	// x 절차의 user id의 정보를 담음
	List<String> userIds = aMgr.searchUserId(posting_idx, procecount);
	// user id의 순서에 맞게 저장된 resume_IDX값들
	List<Integer> resumeIdxs = aMgr.getResumeIdxsByUserIds(posting_idx, userIds);
%>

<div class="container-fluid custom-container"> <!-- fluid container for full width -->
	<div style="padding-left: 10px;"> <!-- 여기에 내부 패딩 추가 -->
    <div class="row">
        <div class="col">
        	<label style="font-weight: bold; font-size: 20px; margin-bottom: 20px;"><span style="font-size: 25px;">[</span></label>      
			<label style="font-weight: bolder; font-size: 20px; margin-bottom: 20px;"><%= postingName %></label>
			<label style="font-weight: bold; font-size: 20px; margin-bottom: 20px;"><span style="font-size: 25px;">]</span></label>   
        </div>
    </div>
    <div class="row">
		<div class="col filter-buttons">
		    <% for (procedureBean procedure : procedureList) { %>
		        <a href="?posting_status" class="top_btn" style="margin-right: 80px; margin-left: 10px;"><%= procedure.getProcedure_name() %></a>
		    <% } %>
		</div>
    </div>
    <div class="row mt-1">
        <div class="col d-flex justify-content-between">
            <!-- 추가 필터링 옵션 드롭다운 버튼들 -->
			<div class="col buttons">
				<a href="?posting_status=진행중&sort=latest" class="sort-button" style="color: #606060; font-size: 12px; font-weight: bold; margin-right:1170px; ">
   				 	<i class="fas fa-filter"></i> 지원자 필터링
				</a>
			</div>
        </div>
    </div>

 <div class="row top-menu justify-content-center">
        <% String[] words = {"순번", "찜", "신상", "경력", "전공", "자격증", "포토폴리오", "스킬", "어학", "간편메모", "평가", "합격여부"}; %>
        <div class="col" style="flex: 0 0 5%; max-width: 5%; text-align: center;">순번</div>
        <div class="col" style="flex: 0 0 1%; max-width: 1%; margin-right: 13px; text-align: center;">찜</div>
	    <div class="col" style="flex: 0 0 10%; max-width: 10%; margin-right: 20px; overflow: hidden; text-align: center; margin-left: 5px;  text-overflow: ellipsis; white-space: nowrap;">신상</div>
	    <div class="col" style="flex: 0 0 10%; max-width: 10%; margin-right: 10px; overflow: hidden; text-align: center; text-overflow: ellipsis; white-space: nowrap;">경력</div>
	    <div class="col" style="flex: 0 0 10%; max-width: 10%; overflow: hidden; text-align: center; text-overflow: ellipsis; white-space: nowrap;">전공</div>
	    <div class="col" style="flex: 0 0 11%; max-width: 11%; overflow: hidden; text-align: center; text-overflow: ellipsis; white-space: nowrap;">자격증</div>
	    <div class="col" style="flex: 0 0 11%; max-width: 11%; overflow: hidden; text-align: center; text-overflow: ellipsis; white-space: nowrap;">포토폴리오</div>
	    <div class="col" style="flex: 0 0 8%; max-width: 8%; overflow: hidden; text-align: center; text-overflow: ellipsis; white-space: nowrap;">스킬</div>
	    <div class="col" style="flex: 0 0 8%; max-width: 8%; overflow: hidden; text-align: center;text-overflow: ellipsis; white-space: nowrap;">어학</div>
	    <div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center;">간편메모</div>
	    <div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center;">평가</div>
	    <div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center;">합격여부</div>
	</div>
<%-- userIds 리스트의 수만큼 반복 --%>
<% for(int i = 0; i < userIds.size(); i++) { %>
	<div class="row applicant-info justify-content-center">
	        <div class="col-1 d-flex align-items-center justify-content-center" style="flex: 0 0 5%; max-width: 5%;">
	            <%= i + 1 %>
	        </div>
			<div class="col-1 d-flex align-items-center justify-content-center" style="flex: 0 0 1%; max-width: 1%;">
			    <i class="far fa-star favorite-icon" onclick="toggleFavorite(this);"></i>
			</div>
	        <div class="col" style="flex: 0 0 10%; max-width: 10%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
	            사람이름<%= i + 1 %>
	        </div>
			<div class="col" style="flex: 1; min-width: 10%; white-space: normal; overflow: visible;">
			    경력내용<%= i + 1 %>
			</div>
	        <div class="col" style="flex: 0 0 10%; max-width: 10%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
	            학교이름<%= i + 1 %>
	        </div>
	        <div class="col" style="flex: 0 0 11%; max-width: 11%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
	            자격증이름<%= i + 1 %>
	        </div>
	        <div class="col" style="flex: 0 0 11%; max-width: 11%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
	            포토폴리오<%= i + 1 %>.pdf
	        </div>
	        <div class="col" style="flex: 0 0 10%; max-width: 10%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
	            스킬내용<%= i + 1 %>
	        </div>
	        <div class="col" style="flex: 0 0 8%; max-width: 8%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
	            언어능력<%= i + 1 %>
	        </div>
	        <div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center;">
	            <button type="button" class="btn btn-info">메모</button>
	        </div>
	        <div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center;">
	            <button type="button" class="btn btn-primary">평가</button>
	        </div>
			<div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center; position: relative;">
			    <button type="button" class="btn btn-success">합격</button>
			    <div class="menu-icon position-absolute" style="right: 0; top: 0;">
			        <div class="dropdown">
			            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                <i class="fas fa-ellipsis-v" style="font-size: 8px;"></i> <!-- 인라인 스타일로 크기 조정 -->
			            </button>
			            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="#"><i class="fas fa-edit"></i> 수정</a>
							<a class="dropdown-item" href="#"><i class="fas fa-arrow-up"></i> 상단으로 이동</a>
							<a class="dropdown-item" href="#"><i class="fas fa-arrow-down"></i> 하단으로 이동</a>
							<a class="dropdown-item" href="#"><i class="fas fa-times"></i> 제외하기</a>
							<a class="dropdown-item" href="#"><i class="far fa-save"></i> 인재 저장</a>
			                <!-- 필요에 따라 추가 메뉴 아이템 -->
			            </div>
			        </div>
			    </div>
			</div>
	</div>
    <% } %>
    </div>
</div>
	<div class="fixed-button">
	    <button type="button" class="addbtn22"><i class="fas fa-user-shield"></i> 권한 관리</button><br>
	    <button type="button" class="addbtn22"><i class="fas fa-print"></i> 인쇄하기</button><br>
	    <button type="button" class="addbtn22"><i class="fas fa-save"></i> 저장하기</button><br>
	    <button type="button" class="addbtn22"><i class="fas fa-check"></i> 합격</button><br>
	    <button type="button" class="addbtn22"><i class="fas fa-times"></i> 제외하기</button><br>
	    <button type="button" class="addbtn22"><i class="fas fa-arrow-up"></i> Top</button>
	</div>






<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
	function toggleFavorite(element) {
	    // 'fas' 클래스가 있는지 확인하여 현재 상태 파악
	    const isFavorited = element.classList.contains('fas');
	    
	    // 채워진 별과 채워지지 않은 별 아이콘 클래스를 토글
	    element.classList.toggle('fas', !isFavorited);
	    element.classList.toggle('far', isFavorited);
	
	    // 여기에 AJAX 요청을 추가하여 서버에 상태 변경을 알릴 수 있음
	    // 예를 들어, isFavorited 상태를 서버에 전송
	}
</script>

</body>
</html>
