<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="userMgr" class="match.UserMgr"/>
<jsp:useBean id="userBean" class="match.UserBean"/>
<jsp:useBean id="resumeMgr2" class="match.ResumeMgr"/>
<jsp:useBean id="resumeBean2" class="match.ResumeMgr"/>
<jsp:setProperty property="*" name="resumeBean2"/>
<jsp:setProperty property="*" name="userBean"/>
<%
	String posting_idxx = (String)session.getAttribute("posting_idx");
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
		</style>
	</head>
	<body>
		<div class="row m-0 fixed3">
			<div class="border border-light-subtitle m-0 px-0">
				<button type="button" class="row m-0 px-0 text-btn" data-bs-toggle="modal" data-bs-target="#scrapModal">
				    <div class="col-8 pe-0 d-flex justify-content-center align-self-center">스크랩 공고</div>
				    <div class="col-4 ps-0 d-flex justify-content-end align-self-center">(갯수)</div>
				</button>
				<button type="button" class="row border-top border-light-subtitle m-0 px-0 text-btn" data-bs-toggle="modal" data-bs-target="#recentModal">
				    <div class="col-8 pe-0 d-flex justify-content-center align-self-center">최근 본 공고</div>
				    <div class="col-4 ps-0 d-flex justify-content-end align-self-center">(갯수)</div>
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
		                <!-- 스크랩 공고 내용 -->
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
		                <!-- 최근 본 공고 내용 -->
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