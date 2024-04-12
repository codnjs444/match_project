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
	<link href="../css/post_manage_middle.css" rel="stylesheet" type="text/css"> 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<style>
	.custom-container {
	    max-width: 1410px;
	    margin: auto;	    
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
		.modal-dialog {
	    position: fixed; /* 모달 위치 고정 */
	    width: 700px;
	    max-width: 600px; /* 최대 너비를 화면 너비의 90%로 설정 */
	    top: 50%; /* 상단에서 50% 위치 */
	    left: 50%; /* 좌측에서 50% 위치 */
	    transform: translate(-50%, -50%); /* 정확한 중앙 정렬을 위해 변환 적용 */
	}
	
	.modal-header {
    border-bottom: 1px solid #dee2e6; /* 모달 헤더의 하단 경계선 추가 */
    background-color: #f8f9fa; /* 모달 헤더 배경색 추가 */
	}

	.modal-title {
	    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; /* 제목 폰트 변경 */
	    font-weight: bold;
	    font-size: 20px; /* 제목 크기 조정 */
	    color: #333; /* 제목 색상 조정 */
	}
	
	.modal-body {
	    padding: 20px; /* 내용 영역의 패딩 조정 */
	}
	
	#emailSubject, #emailContent {
	    margin-top: 15px; /* 입력 필드 상단 마진 추가 */
	    border-radius: 5px; /* 입력 필드의 모서리 둥글게 */
	    border: 1px solid #ced4da; /* 입력 필드 경계선 스타일 */
	}
	
	label {
	    font-weight: bold; /* 라벨 폰트 굵게 */
	    margin-bottom: 5px; /* 라벨과 입력 필드 사이의 마진 */
	}
	
	.btn {
	    border-radius: 20px; /* 버튼 모서리 둥글게 */
	    padding: 10px 20px; /* 버튼 패딩 조정 */
	    font-weight: bold; /* 버튼 텍스트 굵게 */
	}
	
	#showPassed, #showFailed {
	    margin-right: 10px; /* 버튼 간격 조정 */
	    margin-bottom: 20px; /* 버튼과 입력 필드 사이의 간격 */
	}
	
	#confirmPublish {
	    background-color: #007bff; /* 발표하기 버튼 배경색 */
	    color: white; /* 발표하기 버튼 글자색 */
	}
	
	.modal-footer {
	    border-top: 1px solid #dee2e6; /* 모달 바닥의 상단 경계선 추가 */
	    background-color: #f8f9fa; /* 모달 바닥 배경색 추가 */
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
	<div class="row applicant-info justify-content-center" style="<%= ignoreStyle %>" id="row_<%= resumeIdxs.get(i) %>" data-user-id="<%= userIds.get(i) %>">
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
			        <input type="hidden" name="resume_idx" value="<%= resumeIdxs.get(i) %>">
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
			                <i class="fas fa-ellipsis-v" style="font-size: 6px;"></i> <!-- 인라인 스타일로 크기 조정 -->
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

<!-- 결과 발표 모달 -->
<!-- 결과 발표 모달 -->
<div class="modal fade" id="resultsModal" tabindex="-1" aria-labelledby="resultsModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="resultsModalLabel">결과 발표</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <button id="showPassed" class="btn btn-success">합격자 보기</button>
        <button id="showFailed" class="btn btn-danger">불합격자 보기</button>
        <div id="resultsList"></div>
         <div>
        <label for="emailSubject">메일 제목:</label>
        <input type="text" id="emailSubject" class="form-control" value="축하합니다! 합격을 알려드립니다">
    </div>
    <div>
        <label for="emailContent">메일 내용:</label>
        <textarea id="emailContent" class="form-control">귀하가 지원하신 포지션에 대해 합격하셨음을 알려드립니다. 다음 1차 면접 발표 날짜는 xx월 xx일 입니다. 자세한 사항은 문자를 참고해주시기 바랍니다.</textarea>
    </div>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="confirmPublish">발표하기</button>
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
	
	
	document.getElementById('finalBtn').addEventListener('click', function() {
	    $('#resultsModal').modal('show');
	});

	var { passedUserIds, failedUserIds } = collectApplicationResults();

	document.getElementById('showPassed').addEventListener('click', function() {
	    document.getElementById('resultsList').innerHTML = '합격자 ID: <br>' + passedUserIds.join('<br>');
	});

	document.getElementById('showFailed').addEventListener('click', function() {
	    document.getElementById('resultsList').innerHTML = '불합격자 ID: <br>' + failedUserIds.join('<br>');
	});

	document.getElementById('confirmPublish').addEventListener('click', function() {
	    var emailSubject = document.getElementById('emailSubject').value; // 메일 제목
	    var emailContent = document.getElementById('emailContent').value; // 메일 내용
	    // JSP에서 JavaScript로 변수 값을 전달
	    var postingIdx = '<%= posting_idx %>'; // JSP 변수
	    var procedureNum = <%= procedureNum %>; // JSP 변수, 숫자이므로 따옴표 없이 삽입
	    var procedureCount = <%= procecount %>; // JSP 변수, 숫자이므로 따옴표 없이 삽입
	    var passedUserIds = collectApplicationResults().passedUserIds; // 합격자 ID 배열을 가져오는 함수의 결과
	    
	    // XMLHttpRequest 객체 생성
	    var xhr = new XMLHttpRequest();
	    xhr.open("POST", "/match_project/GetUserEmailsServlet", true);
	    xhr.setRequestHeader("Content-Type", "application/json");
	    
	    xhr.onload = function() {
	        if (xhr.status == 200) {
	            // 성공 시 처리
	            $('#resultsModal').modal('hide');
	            alert('결과 발표를 완료했습니다.');
	        } else {
	            // 실패 시 처리
	            console.error("Error: ", xhr.statusText);
	        }
	    };
	    
	    // 서버로 전송할 데이터에 메일 제목과 내용 추가
	    var dataToSend = JSON.stringify({
	        postingIdx: postingIdx,
	        procedureNum: procedureNum,
	        procedureCount: procedureCount,
	        passedUserIds: passedUserIds,
	        emailSubject: emailSubject, // 메일 제목
	        emailContent: emailContent // 메일 내용
	    });
	    xhr.send(dataToSend);
	});
	
	
	function collectApplicationResults() {
	    var passedUserIds = []; // 합격한 사용자의 ID를 저장할 배열
	    var failedUserIds = []; // 불합격한 사용자의 ID를 저장할 배열

	    document.querySelectorAll('.applicant-info').forEach(function(applicantInfoElement) {
	        var applicationResult = applicantInfoElement.querySelector('input[name^="application_result_"]').value;
	        var userId = applicantInfoElement.getAttribute('data-user-id');

	        if (applicationResult === '합격') {
	            passedUserIds.push(userId);
	        } else if (applicationResult === '불합격') {
	            failedUserIds.push(userId);
	        }
	    });

	    return { passedUserIds, failedUserIds };
	}

	   $(document).ready(function() {
	        // URL에서 쿼리 파라미터를 파싱하는 함수
	        function getQueryParam(param) {
	            var result = window.location.search.match(new RegExp("(\\?|&)" + param + "(\\[\\])?=([^&]*)"));

	            return result ? result[3] : false;
	        }

	        // 'procecount' 쿼리 파라미터를 가져와서 콘솔에 출력
	        var procedure_num = getQueryParam('procecount');
	        console.log('Current procedure_num: ', procedure_num);
	    });



</script>


</body>
</html>
