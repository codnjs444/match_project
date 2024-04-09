<%@page import="match.posting.procedureBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="match.PostingMgr"%>
<%@ page import="java.util.Map" %>
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
	    min-height: 100px;
	    height: auto;
	    width: 107%;
	}	
	
	.applicant-info > div {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    text-align: center;
	    flex-wrap: wrap; /* 이 부분 추가 */
	}

	.fixed-button {
	    position: fixed;
	    bottom: 425px; /* 화면 하단에서의 위치 */
	    right: 20px; /* 화면 우측에서의 위치 */
	    z-index: 999;
	    display: flex; /* Flexbox 레이아웃 사용 */
	    flex-direction: column; /* 자식 요소를 세로로 나열 */
	    align-items: center; /* 가운데 정렬 */
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
	.addbtn {
	    width: 70px; /* 원하는 너비로 설정하세요 */
	    height: 30px;
	    background-color: white;
	    color: #606060;
	    border: 2px solid #606060;
	    border-radius: 5px;
	    font-size: 16px;
	    font-weight: bolder;
	    text-align: center; /* 텍스트 가운데 정렬 */
	    align-items: center; /* 수직 가운데 정렬 */
	}
	.dropdown-toggle {
	    padding: 2px 6px; /* 버튼 내부 여백 조절 */
	    font-size: 12px; /* 아이콘 및 텍스트 크기 조절 */
	    line-height: 1; /* 버튼 높이 조절 */
	}
	
	.modal-dialog {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    min-height: calc(100% - 60px); /* 모달이 화면 중앙에 위치하도록 설정 */
	}
	
	.modal-dialog {
	    position: fixed;
	    margin-right: 300px; /* 기본 마진 제거 */
	    margin-top: 300px; /* 기본 마진 제거 */
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
    // procecount 값 설정
    int procecount = 0; // 기본값
    String procecountParam = request.getParameter("procecount");
    if (procecountParam != null && !procecountParam.isEmpty()) {
        try {
            procecount = Integer.parseInt(procecountParam);
        } catch (NumberFormatException e) {
            // 잘못된 값이 입력된 경우, procecount는 0으로 처리
        }
    }
	// 채용 절차 출력하기 위한 파일 (상단 메뉴)
	List<procedureBean> procedureList = pMgr.getProcedure(posting_idx, procedureNum);
	// x 절차의 user id의 정보를 담음
	List<String> userIds = aMgr.searchUserId(posting_idx, procecount);
	// user id의 순서에 맞게 저장된 resume_IDX값들
	List<Integer> resumeIdxs = aMgr.getResumeIdxsByUserIds(posting_idx, userIds);
	// user_id의 값에 맞게 저장된 user_name들
	Map<String, String> userNames = aMgr.getUserNamesByUserIds(userIds);
	// resume_idx에 맞게 저장된 경력 내용
	List<String> careerStatus = aMgr.determineCareerStatusByResumeIdxs(resumeIdxs);
	// user_id의 값에 맞게 저장된 user_gender들
	Map<String, String> userGenders = aMgr.getUserGendersByUserIds(userIds);
	// resume_idx에 맞게 저장된 학력 내용
	List<String> eduMajorsList = aMgr.getEduMajorsByResumeIdxs(resumeIdxs);
	// resume_idx에 맞게 저장된 자격증 내용
	Map<Integer, List<String>> certificateSNameList = aMgr.getCertificateSNamesByResumeIdxs(resumeIdxs);
	// resume_idx에 맞게 저장된 포토폴리오 내용
	Map<Integer, List<String>> portfolioNameList = aMgr.getPortfolioNamesByResumeIdxs(resumeIdxs);
	// resume_idx에 맞게 저장된 스킬 내용
	Map<Integer, List<String>> skillSNameMap = aMgr.getSkillSNamesByResumeIdxs(resumeIdxs);
	// resume_idx에 맞게 저장된 언어 실력 내용
	List<String> languageNameList = aMgr.getLanguageNamesByResumeIdxs(resumeIdxs);
	// resume_idx에 맞게 저장된 좋아요 내용들
	List<String> applicationLikes = aMgr.getApplicationLikesByResumeIdxs(resumeIdxs);
	// resume_idx에 맞게 저장된 제외 여부
	List<String> applicationIgnoreList = aMgr.getApplicationIgnoreByResumeIdxs(resumeIdxs);
	// resume_idx에 맞게 저장된 합격 상태
	List<String> applicationSResultList = aMgr.getApplicationSResultByResumeIdxs(resumeIdxs);
%>
<form id="submitForm" action="post_manage_proc.jsp" method="POST">
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
	        <% int index = 0; %>
	        <% for (procedureBean procedure : procedureList) { %>
	            <%-- 각 절차마다 링크에 procecount 값을 포함하여 설정 --%>
	            <a href="?posting_idx=<%=posting_idx%>&procecount=<%=index%>" class="top_btn" style="margin-right: 80px; margin-left: 10px;"><%= procedure.getProcedure_name() %></a>
	            <% index++; %>
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
    <div class="col" style="flex: 0 0 1%; max-width: 1%; text-align: center;">찜</div>
    <div class="col" style="flex: 0 0 8%; max-width: 8%; text-align: center;">신상</div>
    <div class="col" style="flex: 0 0 5%; max-width: 5%; text-align: center;">경력</div>
    <div class="col" style="flex: 0 0 12%; max-width: 12%; text-align: center;">전공</div>
    <div class="col" style="flex: 0 0 13%; max-width: 13%; text-align: center;">자격증</div>
    <div class="col" style="flex: 0 0 14%; max-width: 14%; text-align: center;">포토폴리오</div>
    <div class="col" style="flex: 0 0 10%; max-width: 10%; text-align: center;">스킬</div>
    <div class="col" style="flex: 0 0 8%; max-width: 8%; text-align: center;">어학</div>
    <div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center;">간편메모</div>
    <div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center;">평가</div>
    <div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center;">합격여부</div>
	</div>
	
<%-- userIds 리스트의 수만큼 반복 --%>
<% for(int i = 0; i < userIds.size(); i++) { %>
    <%
        // applicationIgnoreList에서 현재 인덱스의 값이 "yes"인지 확인하여 스타일을 결정합니다.
        String ignoreStyle = "yes".equals(applicationIgnoreList.get(i)) ? "background-color: #606060; color: white;" : "";
    %>
	<div class="row applicant-info justify-content-center" style="<%= ignoreStyle %>" id="row_<%= resumeIdxs.get(i) %>">
		<input type="hidden" id="user_id_<%= resumeIdxs.get(i) %>" value="<%= userIds.get(i) %>">
		<input type="hidden" name="application_ignored_<%= resumeIdxs.get(i) %>" id="application_ignored_<%= resumeIdxs.get(i) %>" value="<%= applicationIgnoreList.get(i) %>">
	        <div class="col-1 d-flex align-items-center justify-content-center" style="flex: 0 0 5%; max-width: 5%;">
	            <%= i + 1 %>
	        </div>
		    <div class="col-1 d-flex align-items-center justify-content-center" style="flex: 0 0 1%; max-width: 1%;">
		        <i class="<%= "like".equals(applicationLikes.get(i)) ? "fas" : "far" %> fa-star favorite-icon" style="<%= "like".equals(applicationLikes.get(i)) ? "color: black;" : "" %>" onclick="toggleFavorite(this, '<%= resumeIdxs.get(i) %>');" data-resume-idx="<%= resumeIdxs.get(i) %>"></i>
		        <input type="hidden" id="application_like_<%= resumeIdxs.get(i) %>" name="application_like_<%= resumeIdxs.get(i) %>" value="<%= "like".equals(applicationLikes.get(i)) ? "like" : "normal" %>">
		    </div>
	        <div class="col" style="flex: 0 0 8%; max-width: 8%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
			    <a href="user_resume.jsp?resume_idx=<%= resumeIdxs.get(i) %>" style="text-decoration: none; color: inherit;" target="_blank">
			        <%= userNames.get(userIds.get(i)) %>
			        <input type="hidden" name="posting_idx" value="<%= posting_idx %>">
			    </a>
	            <br> <!-- 줄바꿈을 위해 사용 -->
    			<span style="font-size: 13px;"> (<%= userGenders.get(userIds.get(i)) %>)</span>
	        </div>
			<div class="col" style="flex: 0 0 5%; min-width: 5%; white-space: normal; overflow: visible;">
			    <%= careerStatus.get(i) %>
			</div>
	        <div class="col" style="flex: 0 0 12%; max-width: 12%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
	            <%= eduMajorsList.get(i) %>
	        </div>
			<div class="col" style="flex: 0 0 13%; max-width: 13%; flex-wrap: wrap;">
				<% 
				    List<String> certificates = certificateSNameList.get(resumeIdxs.get(i));
				    if (certificates != null && !certificates.isEmpty()) {
				        for (String certificate : certificates) {
				%>
				            <%= certificate %><br>
				<%
				        }
				    } else {
				        out.print("자격증 없음");
				    }
				%>
			</div>
			<div class="col" style="flex: 0 0 14%; max-width: 14%; flex-wrap: wrap;">
				<% 
				    List<String> portfolios = portfolioNameList.get(resumeIdxs.get(i));
				    if (portfolios != null && !portfolios.isEmpty()) {
				        for (String portfolio : portfolios) {
				%>
				            <%= portfolio %><br>
				<%
				        }
				    } else {
				        out.print("포트폴리오 없음");
				    }
				%>

			</div>
	        <div class="col" style="flex: 0 0 10%; max-width: 10%; flex-wrap: wrap;">
				<% 
				    List<String> skills = skillSNameMap.get(resumeIdxs.get(i));
				    if (skills != null && !skills.isEmpty()) {
				        for (String skill : skills) {
				%>
				            <%= skill %><br>
				<%
				        }
				    } else {
				        out.print("해당 사항 없음");
				    }
				%>
	        </div>
	        <div class="col" style="flex: 0 0 8%; max-width: 8%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
	            <%= languageNameList.get(i)%>
	        </div>
	        <div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center;">
	            <button type="button" class="addbtn">메모</button>
	        </div>
	        <div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center;">
	            <button type="button" class="addbtn">평가</button>
	        </div>
			<div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center; position: relative;">
		        <div class="dropdown">
		            <% 
		                String applicationSResult = applicationSResultList.get(i);
		                String dropdownLabel;
		                switch(applicationSResult) {
		                    case "합격":
		                        dropdownLabel = "합격";
		                        break;
		                    case "불합격":
		                        dropdownLabel = "불합격";
		                        break;
		                    default:
		                        dropdownLabel = "미분류";
		                }
		            %>
					<button type="button" class="addbtn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-resume-idx="<%= resumeIdxs.get(i) %>">
					    <%= dropdownLabel %>
					</button>
		            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		                <a class="dropdown-item" href="javascript:setApplicationResult('<%= resumeIdxs.get(i) %>', '미분류');">미분류</a>
		                <a class="dropdown-item" href="javascript:void(0);" onclick="javascript:setApplicationResult('<%= resumeIdxs.get(i) %>', '불합격')">불합격</a>
		                <a class="dropdown-item" href="javascript:void(0);" onclick="javascript:setApplicationResult('<%= resumeIdxs.get(i) %>', '합격')">합격</a>
		            </div>
		                <input type="hidden" id="application_result_<%= resumeIdxs.get(i) %>" name="application_result_<%= resumeIdxs.get(i) %>" value="<%= applicationSResultList.get(i) %>">
		        </div>
			    <div class="menu-icon position-absolute" style="right: 0; top: 0;">
			        <div class="dropdown">
			            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                <i class="fas fa-ellipsis-v" style="font-size: 8px;"></i> <!-- 인라인 스타일로 크기 조정 -->
			            </button>
			            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="#"><i class="fas fa-arrow-up"></i> 상단으로 이동</a>
							<a class="dropdown-item" href="#"><i class="fas fa-arrow-down"></i> 하단으로 이동</a>
							<a class="dropdown-item" href="javascript:void(0);" onclick="toggleIgnore(<%= resumeIdxs.get(i) %>);"><i class="fas fa-times"></i> 제외하기</a>
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
	    <button type="button" class="addbtn22"><i class="fas fa-user-shield"></i> 권한 관리</button>
	    <button type="button" class="addbtn22"><i class="fas fa-print"></i> 인쇄하기</button>
	    <button type="button" class="addbtn22" id="sendBtn" onclick="submitForm();">
		    <i class="fas fa-save"></i> 저장하기
		</button>
	    <button type="button" class="addbtn22" id="finalBtn"><i class="fas fa-check"></i>결과 발표</button>
	    <button type="button" class="addbtn22"><i class="fas fa-arrow-up"></i> Top</button>
	</div>
</form>



<!-- 결과 관리 모달 -->
<div class="modal fade" id="passModal" tabindex="-1" role="dialog" aria-labelledby="passModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog" role="document">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="passModalLabel">결과 관리</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 합격자 및 불합격자 버튼 -->
                <div class="btn-group" role="group" aria-label="합격/불합격 처리">
                    <button type="button" class="btn btn-outline-success" id="showPassCount">합격자</button>
                    <button type="button" class="btn btn-outline-danger" id="showFailCount">불합격자</button>
                </div>
                <p id="totalCount">총 합격자: 0명, 총 불합격자: 0명</p> <!-- 총 인원 수 출력 -->
                <div style="height: 50px; overflow-y: auto;" id="userIdList">
                    <!-- 사용자 ID 나열 (스크롤 가능) -->
                </div>
                <textarea class="form-control mt-3" id="notificationContent" style="height: 200px;" placeholder="통보 내용 입력..."></textarea> <!-- 통보 내용 입력 필드 -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="sendNotification">결과 통보</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>

	function toggleFavorite(icon, resumeIdx) {
	    const input = document.getElementById('application_like_' + resumeIdx);
	    if (icon.classList.contains('far')) {
	        icon.classList.remove('far');
	        icon.classList.add('fas');
	        icon.style.color = 'black'; // 색칠된 별로 변경
	        input.value = 'like'; // hidden input의 값을 'like'로 변경
	    } else {
	        icon.classList.remove('fas');
	        icon.classList.add('far');
	        icon.style.color = ''; // 기본 색으로 변경
	        input.value = 'normal'; // hidden input의 값을 'normal'로 변경
	    }
	}
	
	function toggleIgnore(resumeIdx) {
	    var row = document.getElementById("row_" + resumeIdx);
	    var input = document.getElementById("application_ignored_" + resumeIdx);
	    if (input.value === "no") {
	        // 제외하기 처리
	        row.style.backgroundColor = "#606060";
	        row.style.color = "white";
	        input.value = "yes";
	    } else {
	        // 제외 해제 처리
	        row.style.backgroundColor = "";
	        row.style.color = "";
	        input.value = "no";
	    }
	}
	
	function setApplicationResult(resumeIdx, result) {
	    // hidden input의 값을 변경합니다.
	    var hiddenInput = document.getElementById("application_result_" + resumeIdx);
	    hiddenInput.value = result;

	    // 드롭다운 버튼의 텍스트를 업데이트합니다.
	    var dropdownButton = document.querySelector('button[data-resume-idx="'+resumeIdx+'"]');
	    if (dropdownButton) {
	        dropdownButton.innerText = result; // 버튼의 텍스트를 변경합니다.
	    }
	}

	function submitForm() {
	    document.getElementById("submitForm").submit();
	}
	
	document.addEventListener('DOMContentLoaded', function() {
	    document.getElementById('finalBtn').addEventListener('click', function() {
	        $('#passModal').modal('show');
	    });

	    document.getElementById('processPass').addEventListener('click', function() {
	        processApplications('합격');
	    });

	    document.getElementById('processFail').addEventListener('click', function() {
	        processApplications('불합격');
	    });

	    function processApplications(status) {
	        var selectedApplicants = [];
	        var userIds = [];
	        document.querySelectorAll('input[name^="application_result_"]').forEach(function(item) {
	            if (item.value === status) {
	                var resumeIdx = item.id.split('_')[2];
	                var userId = document.getElementById("user_id_" + resumeIdx).value; // user_id 가져오기
	                selectedApplicants.push(resumeIdx);
	                userIds.push(userId); // userIds 배열에 추가
	            }
	        });

	        var passListElement = document.getElementById('passList');
	        if (selectedApplicants.length > 0) {
	            var displayText = status + '자 resume_idx: ' + selectedApplicants.join(', ') + '<br>' + 'user_ids: ' + userIds.join(', ');
	            passListElement.innerHTML = displayText;
	        } else {
	            passListElement.innerHTML = status + '자가 없습니다.';
	        }
	    }
	});
	document.addEventListener('DOMContentLoaded', function() {
	    var totalCountElement = document.getElementById('totalCount');
	    var userIdListElement = document.getElementById('userIdList');
	    var notificationContentElement = document.getElementById('notificationContent');
	    var passMessage = "축하합니다! 합격하셨습니다. 다음 일정은 아래와 같습니다.\n면접 일정: [면접 일자 및 시간]\n면접 장소: [면접 장소]\n기타 사항: [추가 정보]\n추가적인 문의나 정보가 필요하신 경우 연락주세요.\n감사합니다!";
	    var failMessage = "안타깝게도 불합격하셨습니다.\n\n지원해 주셔서 감사합니다. 불합격 결과에 대해 추가적인 피드백이 필요하신 경우 언제든지 연락 주시기 바랍니다.\n\n더 나은 기회가 찾아올 것을 기대합니다.\n\n감사합니다.";
 
	    document.getElementById('showPassCount').addEventListener('click', function() {
	        processApplications('합격');
	        document.getElementById('notificationContent').value = passMessage; // 합격 메시지로 업데이트
	    });

	    document.getElementById('showFailCount').addEventListener('click', function() {
	        processApplications('불합격');
	        document.getElementById('notificationContent').value = failMessage; // 불합격 메시지로 업데이트
	    });
	    
	    // 합격자 및 불합격자 버튼 클릭 이벤트 처리
	    document.getElementById('showPassCount').addEventListener('click', function() {
	        processApplications('합격');
	    });

	    document.getElementById('showFailCount').addEventListener('click', function() {
	        processApplications('불합격');
	    });

	    // 결과 통보 버튼 클릭 이벤트
	    document.getElementById('sendNotification').addEventListener('click', function() {
	        // AJAX 요청으로 서버에 결과 통보
	        sendNotification(notificationContentElement.value);
	    });

	    // 합격 및 불합격 처리를 위한 함수
	    function processApplications(status) {
	        userIdListElement.innerHTML = ''; // 목록 초기화
	        var selectedUserIds = []; // 선택된 사용자 ID 저장

	        document.querySelectorAll('input[name^="application_result_"]').forEach(function(item) {
	            if (item.value === status) {
	                var userId = document.getElementById("user_id_" + item.id.split('_')[2]).value;
	                selectedUserIds.push(userId);
	            }
	        });

	        selectedUserIds.forEach(function(userId) {
	            var item = document.createElement('div');
	            item.innerText = userId;
	            userIdListElement.appendChild(item);
	        });

	        // 합격자 또는 불합격자 수 업데이트
	        totalCountElement.innerText = `총 ${status}자: ${selectedUserIds.length}명`;
	    }

	    // 결과 통보를 위한 AJAX 요청 함수
	    function sendNotification(notificationContent) {
	        console.log('결과 통보 내용:', notificationContent);
	        // AJAX 요청을 통한 서버 통신 코드 작성 위치
	        // 예: $.ajax({...});
	    }

	    // 모달 표시
	    document.getElementById('finalBtn').addEventListener('click', function() {
	        $('#passModal').modal('show');
	    });
	});
</script>


</body>
</html>
