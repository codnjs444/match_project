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
	.disabledButton {
	    color: #ccc; /* 회색 글자 */
	    background-color: #f3f3f3; /* 밝은 회색 배경 */
}

.memo-form {
    position: absolute;
    background-color: #fff;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    padding: 10px;
    border-radius: 5px;
    z-index: 100; /* Ensure it's above other elements */
}

.memo-input {
    width: 200px;
    height: 100px;
    margin-bottom: 5px;
}
.dropdown-menu {
    position: absolute;
    transform: translate3d(0, 0, 0);
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
    
	String posting_idxStr = request.getParameter("posting_idx");
	int posting_idx2 = 0; // 기본값 설정 혹은 에러 처리를 위한 기본값 설정
	try {
	    posting_idx2 = Integer.parseInt(posting_idxStr);
	} catch (NumberFormatException e) {
	    System.out.println("Error converting posting_idx to integer: " + e.getMessage()); // 에러 메시지 출력
	}
	
	// 채용 절차 출력하기 위한 파일 (상단 메뉴)
	List<procedureBean> procedureList = pMgr.getProcedure(posting_idx, procedureNum);
	// x 절차의 user id의 정보를 담음
	List<String> userid = aMgr.searchUserId(posting_idx, procecount);
	
	List<String> userIds = aMgr.getSortedUserIdsByApplicationDate(posting_idx, userid);
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
	List<String> applicationLikes = aMgr.getApplicationLikesByResumeIdxs(resumeIdxs,posting_idx2);
	// resume_idx에 맞게 저장된 제외 여부
	List<String> applicationIgnoreList = aMgr.getApplicationIgnoreByResumeIdxs(resumeIdxs,posting_idx2);
	// resume_idx에 맞게 저장된 합격 상태
	List<String> applicationSResultList = aMgr.getApplicationSResultByResumeIdxs(resumeIdxs,posting_idx2);

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
        <% String currentProcecount = request.getParameter("procecount"); %>
        <% for (procedureBean procedure : procedureList) { %>
            <% 
                boolean isActive = currentProcecount != null && index == Integer.parseInt(currentProcecount);
                String style = "margin-right: 80px; margin-left: 10px; font-weight: bold; font-size: 20px;";
                if (isActive) {
                    style += "color: #4698EA;"; // 선택된 버튼에 파란색 적용
                }
            %>
            <a href="?posting_idx=<%=posting_idx%>&procecount=<%=index%>" class="<%= isActive ? "top_btn_active" : "top_btn" %>" style="<%= style %>">
                <%= procedure.getProcedure_name() %>
            </a>
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
    <div class="col" style="flex: 0 0 10%; max-width: 10%; text-align: center;">전공</div>
    <div class="col" style="flex: 0 0 14%; max-width: 14%; text-align: center;">자격증</div>
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
	<div class="row applicant-info justify-content-center" style="<%= ignoreStyle %>" id="row_<%= resumeIdxs.get(i) %>" data-user-id="<%= userIds.get(i) %>"data-posting-idx="<%= posting_idx %>">
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
			        <input type="hidden" name="procecount" value="<%= procecount %>"> <!-- procecount를 전송하는 hidden 필드 추가 -->
			        <input type="hidden" name="resume_idx" value="<%= resumeIdxs.get(i) %>">
			    </a>
	            <br> <!-- 줄바꿈을 위해 사용 -->
    			<span style="font-size: 13px;"> (<%= userGenders.get(userIds.get(i)) %>)</span>
	        </div>
			<div class="col" style="flex: 0 0 5%; min-width: 5%; white-space: normal; overflow: visible;">
			    <%= careerStatus.get(i) %>
			</div>
	        <div class="col" style="flex: 0 0 10%; max-width: 10%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
	            <%= eduMajorsList.get(i) %>
	        </div>
			<div class="col" style="flex: 0 0 14%; max-width: 14%; flex-wrap: wrap;">
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
            	<% 
			        boolean memoExists = aMgr.checkMemoExists(posting_idx2, userIds.get(i)); // 메모 존재 여부 확인
			        String buttonStyle = memoExists ? "background-color: #4F4F4F; color: white;" : "";
			        String memoContent = aMgr.getMemo(posting_idx2, userIds.get(i)); // 특정 user_id와 posting_idx에 대한 메모 내용 가져오기
   				 %>
            <button type="button" class="addbtn" style="<%= buttonStyle %>" onclick="toggleMemoForm(this, '<%= resumeIdxs.get(i) %>');">메모</button>
			
			<div id="memoForm_<%= resumeIdxs.get(i) %>" class="memo-form" style="display: none;">
			     <textarea class="memo-input" placeholder="메모를 입력하세요..."><%= memoContent != null ? memoContent : "" %></textarea>
			    <button type="button" onclick="saveMemo(this, '<%= resumeIdxs.get(i) %>');">확인</button>
			    <button type="button" onclick="deleteMemo('<%= resumeIdxs.get(i) %>');">삭제</button>
			    
			</div>

	        </div>
	        
<div class="col" style="flex: 0 0 7%; max-width: 7%; text-align: center; position: relative;">
    <%
        // 평가 점수를 불러오는 로직
        String commentsScore = pMgr.checkCommentsNum(posting_idx2, userIds.get(i));
        String displayScore = "평가"; // 기본값 설정
        if (!"no".equals(commentsScore)) {
            displayScore = commentsScore + "점"; // DB에서 점수를 불러왔다면 해당 점수를 표시
        }
    %>
        <div class="dropdown">
            <button class="addbtn dropdown-toggle" type="button" id="dropdownMenuButtonScore<%= i %>"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <%= displayScore %>
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButtonScore<%= i %>">
                <% for (int score = 0; score <= 10; score++) { %>
                    <a class="dropdown-item" href="javascript:void(0);" onclick="setScore(<%= score %>, '<%= userIds.get(i) %>', <%= posting_idx2 %>);"><%= score %>점</a>
                <% } %>
            </div>
        </div>
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
							<a class="dropdown-item" href="javascript:void(0);"
							   data-posting-idx="<%= posting_idx %>"
							   data-user-id="<%= userIds.get(i) %>"
							   onclick="moveApplicationUp(this)">
							    <i class="fas fa-arrow-up"></i> 상단으로 이동
							</a>
							<a class="dropdown-item" href="javascript:void(0);" 
							   data-posting-idx="<%= posting_idx %>" 
							   data-user-id="<%= userIds.get(i) %>" 
							   onclick="moveApplicationDown(this)">
							    <i class="fas fa-arrow-down"></i> 하단으로 이동
							</a>
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

        <!-- 합격자 메일 설정 -->
        <div id="passSection" style="display:none;">
            <label for="passEmailSubject">합격 메일 제목:</label>
            <input type="text" id="passEmailSubject" class="form-control" value="축하합니다! Match 합격을 알려드립니다">
            <label for="passEmailContent">합격 메일 내용:</label>
            <textarea id="passEmailContent" class="form-control">귀하가 지원하신 포지션에 대해 합격하셨습니다. 축하드립니다!!!</textarea>
        </div>

        <!-- 불합격자 메일 설정 -->
        <div id="failSection" style="display:none;">
            <label for="failEmailSubject">불합격 메일 제목:</label>
            <input type="text" id="failEmailSubject" class="form-control" value="불합격 통지">
            <label for="failEmailContent">불합격 메일 내용:</label>
            <textarea id="failEmailContent" class="form-control">이번에는 불합격하셨습니다. 다음 기회에 도전해 주시길 바랍니다.</textarea>
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

	document.addEventListener('DOMContentLoaded', function() {
	    document.getElementById('showPassed').addEventListener('click', function() {
	        document.getElementById('resultsList').innerHTML = '합격자 ID: <br>' + collectApplicationResults().passedUserIds.join('<br>');
	        $('#passSection').show();
	        $('#failSection').hide();
	    });

	    document.getElementById('showFailed').addEventListener('click', function() {
	        document.getElementById('resultsList').innerHTML = '불합격자 ID: <br>' + collectApplicationResults().failedUserIds.join('<br>');
	        $('#failSection').show();
	        $('#passSection').hide();
	    });

	    document.getElementById('confirmPublish').addEventListener('click', function() {
	        // 공통 데이터
	        var postingIdx = '<%= posting_idx %>';
	        var procedureNum = <%= procedureNum %>;
	        var procedureCount = <%= procecount %>;

	        // 합격자 데이터 수집
	        var passedUserIds = collectApplicationResults().passedUserIds;
	        var passEmailSubject = document.getElementById('passEmailSubject').value;
	        var passEmailContent = document.getElementById('passEmailContent').value;

	        // 불합격자 데이터 수집
	        var failedUserIds = collectApplicationResults().failedUserIds;
	        var failEmailSubject = document.getElementById('failEmailSubject').value;
	        var failEmailContent = document.getElementById('failEmailContent').value;

	        var dataToSend = JSON.stringify({
	            postingIdx: postingIdx,
	            procedureNum: procedureNum,
	            procedureCount: procedureCount,
	            passedUserIds: passedUserIds,
	            passedEmailSubject: passEmailSubject,
	            passedEmailContent: passEmailContent,
	            failedUserIds: failedUserIds,
	            failedEmailSubject: failEmailSubject,
	            failedEmailContent: failEmailContent
	        });

	        sendEmails(dataToSend);
	    });




	    function collectApplicationResults() {
	        var passedUserIds = [];
	        var failedUserIds = [];

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

	    function sendEmails(data) {
	        var xhr = new XMLHttpRequest();
	        xhr.open("POST", "/match_project/GetUserEmailsServlet", true);
	        xhr.setRequestHeader("Content-Type", "application/json");

	        xhr.onload = function() {
	            if (xhr.status == 200) {
	                alert(xhr.responseText);
	                $('#resultsModal').modal('hide');
	            } else {
	                alert('이메일 전송 실패');
	            }
	        };

	        xhr.send(data);
	    }
	});
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
	   
	   
	   function moveApplicationDown(element) {
		    var postingIdx = element.getAttribute('data-posting-idx'); // HTML 요소에서 posting_idx 읽기
		    var userId = element.getAttribute('data-user-id'); // HTML 요소에서 user_id 읽기

		    var xhr = new XMLHttpRequest();
		    xhr.open("POST", "/match_project/MoveApplicationDownServlet", true);
		    xhr.setRequestHeader("Content-Type", "application/json");  // JSON 형식으로 데이터 전송

		    // 객체를 JSON 문자열로 변환
		    var jsonData = JSON.stringify({
		        posting_idx: postingIdx,
		        user_id: userId
		    });

		    xhr.onload = function() {
		        if (xhr.status === 200) {
		            var response = xhr.responseText.trim();
		            if (response === "Success") {
		                alert('하단으로 이동 처리되었습니다.');
		                location.reload(); // 성공 시 페이지 리로드
		            } else {
		                alert('이동 실패: ' + response);
		            }
		        } else {
		            alert('서버 오류가 발생했습니다. 상태 코드: ' + xhr.status);
		        }
		    };

		    xhr.send(jsonData);
		}
	   
	   function moveApplicationUp(element) {
		    var postingIdx = element.getAttribute('data-posting-idx'); // HTML 요소에서 posting_idx 읽기
		    var userId = element.getAttribute('data-user-id'); // HTML 요소에서 user_id 읽기

		    var xhr = new XMLHttpRequest();
		    xhr.open("POST", "/match_project/MoveApplicationUpServlet", true);
		    xhr.setRequestHeader("Content-Type", "application/json");  // JSON 형식으로 데이터 전송

		    // 객체를 JSON 문자열로 변환
		    var jsonData = JSON.stringify({
		        posting_idx: postingIdx,
		        user_id: userId
		    });

		    xhr.onload = function() {
		        if (xhr.status === 200) {
		            var response = xhr.responseText.trim();
		            if (response === "Success") {
		                alert('상단으로 이동 처리되었습니다.');
		                location.reload(); // 성공 시 페이지 리로드
		            } else {
		                alert('이동 실패: ' + response);
		            }
		        } else {
		            alert('서버 오류가 발생했습니다. 상태 코드: ' + xhr.status);
		        }
		    };

		    xhr.send(jsonData);
		}
	   
	   window.onload = function() {
		    // 유저 목록의 길이를 확인합니다.
		    var userIds = <%= userIds.size() %>;

		    // userIds가 0일 경우, 저장 및 결과 발표 버튼을 비활성화하고 스타일을 변경합니다.
		    if (userIds === 0) {
		        var sendBtn = document.getElementById('sendBtn');
		        var finalBtn = document.getElementById('finalBtn');

		        sendBtn.disabled = true;
		        finalBtn.disabled = true;

		        sendBtn.classList.add('disabledButton');
		        finalBtn.classList.add('disabledButton');
		    }
		};
		
		function toggleMemoForm(button, resumeIdx) {
		    var memoForm = document.getElementById('memoForm_' + resumeIdx);
		    if (memoForm.style.display === 'none') {
		        memoForm.style.display = 'block';
		        memoForm.style.position = 'absolute';
		        memoForm.style.left = button.offsetLeft + 'px'; // Position it below the button
		        memoForm.style.top = (button.offsetTop + button.offsetHeight + 5) + 'px'; // 5px below the button
		    } else {
		        memoForm.style.display = 'none';
		    }
		}

		function saveMemo(button, resumeIdx) {
		    var memoInput = button.previousElementSibling;
		    if (memoInput.value.trim() !== '') {
		        // 버튼의 부모 요소인 .applicant-info 로우에서 user_id와 posting_idx 추출
		        var memoRow = document.getElementById('row_' + resumeIdx);
		        var userId = memoRow.getAttribute('data-user-id');
		        var postingIdx = memoRow.getAttribute('data-posting-idx');

		        // AJAX 요청 설정
		        var xhr = new XMLHttpRequest();
		        xhr.open("POST", "/match_project/SaveMemoServlet", true);
		        xhr.setRequestHeader("Content-Type", "application/json");  // JSON 형식으로 데이터 전송

		        // JSON 데이터 생성
		        var data = JSON.stringify({
		            user_id: userId,
		            posting_idx: postingIdx,
		            memo: memoInput.value
		        });

		        xhr.onload = function() {
		            if (xhr.status == 200) {
		                alert(xhr.responseText);
		                location.reload(); // 성공 시 페이지 리로드
		            } else {
		                alert(xhr.status);
		            }
		        };

		        xhr.onerror = function() {
		            alert("Request failed, unable to connect to server.");
		        };

		        xhr.send(data);  // JSON 데이터 전송
		        document.getElementById('memoForm_' + resumeIdx).style.display = 'none';
		    }
		}
		
		function deleteMemo(resumeIdx) {
		    // 삭제 여부를 확인하고 사용자에게 확인 메시지를 띄우기
		    var confirmDelete = confirm("정말로 이 메모를 삭제하시겠습니까?");
		    if (confirmDelete) {
		        // AJAX 요청 설정
		        var xhr = new XMLHttpRequest();
		        xhr.open("POST", "/match_project/DeleteMemoServlet", true);
		        xhr.setRequestHeader("Content-Type", "application/json");  // JSON 형식으로 데이터 전송

		        // .applicant-info 로우에서 user_id와 posting_idx 추출
		        var memoRow = document.getElementById('row_' + resumeIdx);
		        var userId = memoRow.getAttribute('data-user-id');
		        var postingIdx = memoRow.getAttribute('data-posting-idx');

		        // JSON 데이터 생성
		        var data = JSON.stringify({
		            user_id: userId,
		            posting_idx: postingIdx
		        });

		        xhr.onload = function() {
		            if (xhr.status == 200) {
		                alert(xhr.responseText);
		                location.reload(); // 성공 시 페이지 리로드
		            } else {
		                alert(xhr.status);
		            }
		        };

		        xhr.onerror = function() {
		            alert("Request failed, unable to connect to server.");
		        };

		        xhr.send(data);  // JSON 데이터 전송
		    }
		}
		
		function setScore(score, userId, postingIdx) {
		    var xhr = new XMLHttpRequest();
		    xhr.open("POST", "/match_project/SaveScoreServlet", true); // 경로 확인 필요
		    xhr.setRequestHeader("Content-Type", "application/json");  // JSON 형식으로 데이터 전송

		    // 객체를 JSON 문자열로 변환
		    var jsonData = JSON.stringify({
		        user_id: userId,
		        posting_idx: postingIdx,
		        score: score.toString()  // 점수를 문자열로 변환
		    });

		    xhr.onload = function() {
		        if (xhr.status === 200) {
		            var response = JSON.parse(xhr.responseText);
		            if (response.success) {
		                
		                alert(response.message);
		                location.reload(); // 성공 시 페이지 리로드
		            } else {
		                alert("점수 업데이트 실패: " + response.message);
		            }
		        } else {
		            alert('서버 오류가 발생했습니다. 상태 코드: ' + xhr.status);
		        }
		    };

		    xhr.onerror = function() {
		        alert("Request failed, unable to connect to server.");
		    };

		    xhr.send(jsonData);  // JSON 데이터 전송
		}

		

</script>


</body>
</html>
