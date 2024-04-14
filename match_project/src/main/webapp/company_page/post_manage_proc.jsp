<%@page import="match.posting.procedureBean"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<jsp:useBean id="pMgr" class="match.PostingMgr"/>
<jsp:useBean id="aMgr" class="match.application.ApplicationMgr"/>
<jsp:useBean id="prBean" class="match.posting.procedureBean"/>
<jsp:useBean id="aBean" class="match.application.ApplicationBean"/>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<%

	String posting_idxStr = request.getParameter("posting_idx");
	int posting_idx2 = 0; // 기본값 설정 혹은 에러 처리를 위한 기본값 설정
	try {
	    posting_idx2 = Integer.parseInt(posting_idxStr);
	} catch (NumberFormatException e) {
	    System.out.println("Error converting posting_idx to integer: " + e.getMessage()); // 에러 메시지 출력
	}


    String manager_id = (String)session.getAttribute("idKey");
	// 공고 idx
	String posting_idx = request.getParameter("posting_idx");
	// 공고 이름
	String postingName = pMgr.getPostingName(posting_idx);
	// 채용 절차 수
	//현재 채용 절자
	
	
	int procedureNum = pMgr.countProcedureNum(posting_idx);
	int procecount = 0; // 기본값 설정
	String procecountParam = request.getParameter("procecount");
	if (procecountParam != null && !procecountParam.isEmpty()) {
	    try {
	        procecount = Integer.parseInt(procecountParam); // 문자열을 정수로 변환
	    } catch (NumberFormatException e) {
	        // 변환 실패 시, procecount는 0으로 처리
	        procecount = 0;
	    }
	}

	// 채용 절차 출력하기 위한 파일 (상단 메뉴)
	List<procedureBean> procedureList = pMgr.getProcedure(posting_idx, procecount);
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
	List<String> applicationLikes = aMgr.getApplicationLikesByResumeIdxs(resumeIdxs,posting_idx2);
	for (Integer idx : resumeIdxs) {
	    String applicationLike = request.getParameter("application_like_" + idx);
	    aMgr.updateApplicationLikeByResumeIdx(idx,posting_idx2,applicationLike); // 상태 업데이트
	}
    // 추가된 application_ignored 값을 처리하는 로직
    for (Integer idx : resumeIdxs) {
        String applicationIgnored = request.getParameter("application_ignored_" + idx);
        if (applicationIgnored != null) { // null 체크를 추가하여 요청에 해당 파라미터가 포함되어 있는 경우에만 처리
            aMgr.updateApplicationIgnoredByResumeIdx(idx,posting_idx2, applicationIgnored); // 상태 업데이트
        }
    }
    for (Integer idx : resumeIdxs) {
        String applicationResult = request.getParameter("application_result_" + idx);
        if (applicationResult != null) { // null 체크를 추가하여 요청에 해당 파라미터가 포함되어 있는 경우에만 처리
            aMgr.updateApplicationReultByResumeIdx(idx, posting_idx2, applicationResult); // 결과 상태 업데이트
        }
    }

    response.sendRedirect("post_manage.jsp?posting_idx=" + posting_idx + "&procecount=" + procecount);

%>

</body>
</html>
