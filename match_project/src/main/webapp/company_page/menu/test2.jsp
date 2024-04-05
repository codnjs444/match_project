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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="path_to_your_custom_css.css" rel="stylesheet">
    <!-- 기타 필요한 CSS 링크 -->
    <link href="../../css/company_home_middle.css" rel="stylesheet" type="text/css">    
	<link href="../css/company_home_middle.css" rel="stylesheet" type="text/css">   
</head>
<body>
<%
    String manager_id = (String)session.getAttribute("idKey");
    String posting_status = request.getParameter("posting_status");
    if (posting_status == null) posting_status = "진행중"; // 기본값 설정
    
    ArrayList<Integer> postIdxList = pMgr.savePostIdx(manager_id, posting_status);
    ArrayList<String> postingNames = pMgr.getPostingNames(postIdxList);
    ArrayList<String> dateRanges = pMgr.getApplicationDates(postIdxList);


    int totalPosts = postIdxList.size();
    final int numperPage = 3;
    int totalPages = (int)Math.ceil((double)totalPosts / numperPage);

    String pageParam = request.getParameter("page");
    int currentPage = pageParam == null ? 1 : Integer.parseInt(pageParam);

    int startIndex = (currentPage - 1) * numperPage;
    int endIndex = Math.min(startIndex + numperPage, totalPosts);
%>

<div class="container custom-container">
    <!-- Filter buttons -->
    <div class="row mb-3">
        <div class="col">
            <div class="btn-group" role="group" aria-label="Basic example">
                <a href="?posting_status=진행중" class="btn btn-outline-primary">진행중</a>
                <a href="?posting_status=임시저장" class="btn btn-outline-secondary">임시저장</a>
                <a href="?posting_status=마감" class="btn btn-outline-success">마감</a>
                <a href="?posting_status=협업" class="btn btn-outline-danger">협업</a>
                <a href="?posting_status=전체" class="btn btn-outline-warning">전체</a>
            </div>
        </div>
    </div>
    
    <!-- Job posts -->
    <div class="row">
        <div class="col">
            <% for(int i = startIndex; i < endIndex; i++) { %>
            <div class="job-post p-3 mb-2 bg-light border rounded">
                <h5><%= postingNames.get(i) %></h5>
                <p><strong>채용 유형:</strong> </p>
                <p><strong>공고 기간:</strong> <%= dateRanges.get(i) %></p>
                <!-- Additional info can be added here -->
            </div>
            <% } %>
        </div>
    </div>

    <!-- Pagination -->
    <div class="row">
        <div class="col">
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 기타 필요한 스크립트 -->
</body>
</html>
