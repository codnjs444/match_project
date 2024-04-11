<%@page import="match.CompanyMgr"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%
    String userId = request.getParameter("user_id");
    String postingIdxParam = request.getParameter("posting_idx");
    boolean bookmarked = Boolean.parseBoolean(request.getParameter("bookmarked"));
    
    // 파라미터 값 서버 로그에 출력
    System.out.println("userId: " + userId);
    System.out.println("postingIdxParam: " + postingIdxParam);
    System.out.println("bookmarked: " + bookmarked);

    // posting_idx 파라미터의 null 체크 및 예외 처리
    if (postingIdxParam == null) {
        // 에러 메시지를 설정하거나 기본값을 사용합니다.
        response.getWriter().print("Error: posting_idx parameter is missing.");
        return; // 처리 중단
    }

    int postingIdx = Integer.parseInt(postingIdxParam); // 이제 안전하게 파싱을 시도합니다.
    
    // CompanyMgr 인스턴스 생성
    CompanyMgr coMgr = new CompanyMgr();
    
    // 스크랩 상태에 따라 적절한 메서드 호출
    if (bookmarked) {
    	coMgr.deleteBookmark(userId, postingIdx);
    	
        
    } else {
    	coMgr.insertBookmark(userId, postingIdx);
    }

    // 성공적으로 처리되었음을 응답
    response.getWriter().print("Success");
%>
