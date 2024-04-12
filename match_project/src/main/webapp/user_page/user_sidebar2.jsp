<%@page import="match.posting.BookmarkPostingBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="userMgr" class="match.UserMgr"/>
<jsp:useBean id="userBean" class="match.UserBean"/>
<jsp:useBean id="resumeMgr2" class="match.ResumeMgr"/>
<jsp:useBean id="resumeBean2" class="match.ResumeMgr"/>
<jsp:setProperty property="*" name="resumeBean2"/>
<jsp:setProperty property="*" name="userBean"/>
<jsp:useBean id="pMgr2" class="match.PostingMgr"/>
<jsp:useBean id="bpBean" class="match.posting.BookmarkPostingBean"/>
<%
	String posting_idxx = (String)session.getAttribute("posting_idx");
	List<Map<String, String>> recentPosts = (List<Map<String, String>>)session.getAttribute("recentPosts");
	Vector<BookmarkPostingBean> vlist = pMgr2.getBookmarkPosting((String)session.getAttribute("idKey"));
%>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link href="../css/user_home_middle.css" rel="stylesheet" type="text/css">
		<style>
			.fixed3{
				position: fixed;
				width: 200px;
				right: 200px;
				top: 400px;
			}
			.to-top{
				border: none;
				background-color: #fff;
			}
			.text-btn{
				width: 197px;
				height:50px;
				background-color: #fff;
				border: none;
			}
			.recent-post-link {
    color: #666666; /* 연한 검정색 */
}
			.modal-content{
				width: 800px;
			}
			.modal-dialog {
			    position: fixed; /* 모달 위치 고정 */
			    top: 20%; /* 상단에서 50% 위치 */
			    left: 560px; /* 좌측에서 50% 위치 */
			    transform: translate(-50%, -50%); /* 정확한 중앙 정렬을 위해 변환 적용 */
			}
		</style>
	</head>
	<body>
		<div class="row m-0 fixed3">
			<div class="border border-light-subtitle m-0 px-0">
				<button type="button" class="row m-0 px-0 text-btn" data-bs-toggle="modal" data-bs-target="#scrapModal">
				    <div class="col-8 pe-0 d-flex justify-content-center align-self-center">스크랩 공고</div>
				    <div class="col-4 ps-0 d-flex justify-content-end align-self-center">(<%=vlist.size()%>)</div>
				</button>
				<button type="button" class="row border-top border-light-subtitle m-0 px-0 text-btn" data-bs-toggle="modal" data-bs-target="#recentModal">
				    <div class="col-8 pe-0 d-flex justify-content-center align-self-center">최근 본 공고</div>
		            <% 
		            int recentPostsCount = (recentPosts != null) ? recentPosts.size() : 0; // recentPosts가 null이 아니라면 사이즈를, null이라면 0을 반환
		            %>
		            <div class="col-4 ps-0 d-flex justify-content-end align-self-center">(<%= recentPostsCount %>)</div>
				</button>
			</div>
			<div class="row m-0">
				<button class="to-top" onclick="scrollToTop()">TOP</button>
			</div>
		</div>
		
				<!-- 스크랩 공고 모달 -->
		<div class="modal fade align-self-center" id="scrapModal" tabindex="-1" aria-labelledby="scrapModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="scrapModalLabel">스크랩 공고</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body">
		                <%
		                	for(int i = 0; i < vlist.size(); i++){
		                		bpBean = vlist.get(i);
		                		String postingIdxStr = String.valueOf(bpBean.getPosting_idx());
		                        // 변환된 문자열로 posting_name과 posting_cname을 조회
		                        String postingName = pMgr2.getPostingName(postingIdxStr);
		                        String postingCname = pMgr2.getPostingCname(postingIdxStr);
		                        String procedureEdatetime = pMgr2.getProcedureEdatetime(bpBean.getPosting_idx());
	               		%>
	               			<div class="row m-0">
	               				<div class="col-3 p-0"><%=postingCname%></div>
	               				 <a href="viewPosting.jsp?posting_idx=<%=postingIdxStr%>" class="col-6"><%=postingName%></a>
	               				<div class="col-3 p-0"><%=procedureEdatetime%></div>
	               			</div>
	               		<%
		                	}
		                %>
		            </div>
		        </div>
		    </div>
		</div>
		
<!-- 최근 본 공고 모달 -->
<div class="modal fade" id="recentModal" tabindex="-1" aria-labelledby="recentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="recentModalLabel">최근 본 공고</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <% 
                if (recentPosts != null && !recentPosts.isEmpty()) {
                    for (Map<String, String> post : recentPosts) {
                        String postId = post.get("id");
                        String title = post.get("title");
                        String url = post.get("url"); // URL 정보 가져오기
                %>
					<p>
					    최근에 본 제목: <a href="<%= url %>" target="_blank" class="recent-post-link"><%= title %></a>
					</p>
                <% 
                    }
                } %>
            </div>
        </div>
    </div>
</div>

	</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script>
		function scrollToTop() {
		    window.scrollTo(0, 0);
		}
	</script>
</html>