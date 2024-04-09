<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="pMgr" class="match.PostingMgr"/>
<%
	// posting_idx를 기반으로 데이터베이스에서 공고 정보 조회
	String postingIdx = request.getParameter("posting_idx");
	String postingType = pMgr.searchPostType(postingIdx); // 데이터베이스에서 posting_type 조회
	
	
    out.println("공고 인덱스: " + postingIdx + "<br>");
    out.println("공고 타입: " + postingType + "<br>");

	
 	// posting_type 값에 따라 다른 JSP 페이지로 리다이렉트
	if ("블라인드".equals(postingType)) {
	    response.sendRedirect("edit_bPost.jsp?posting_idx=" + postingIdx);
	} else if ("일반채용".equals(postingType)) {
	    response.sendRedirect("user_post_page.jsp?posting_idx=" + postingIdx);
	} 
 	
%>
