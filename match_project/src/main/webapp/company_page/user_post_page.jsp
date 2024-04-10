<%@page import="match.posting.OpenPositionBean"%>
<%@page import="match.posting.WelfareBean"%>
<%@page import="java.util.List"%>
<%@ page import="com.google.gson.Gson" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<%@page import="java.util.Vector"%>
<%@ page import="match.category.job_categoryBean" %>
<%@ page import="match.category.job_categoryMgr" %>
<%@ page import="match.category.skill_categoryBean" %>
<%@ page import="match.category.skill_categoryMgr" %>
<%@ page import="match.category.certificate_categoryBean" %>
<%@ page import="match.category.certificate_categoryMgr" %>
<%@ page import="match.posting.procedureBean"%>

<jsp:useBean id="cMgr" class="match.category.certificate_categoryMgr"/>
<jsp:useBean id="cBean" class="match.category.certificate_categoryBean"/>
<jsp:useBean id="jMgr" class="match.category.job_categoryMgr"/>
<jsp:useBean id="jBean" class="match.category.job_categoryBean"/>
<jsp:useBean id="sMgr" class="match.category.skill_categoryMgr"/>
<jsp:useBean id="sBean" class="match.category.skill_categoryBean"/>

<jsp:useBean id="pMgr" class="match.PostingMgr" scope="request"/>

<jsp:useBean id="pBean" class="match.PostingBean"/>
<jsp:useBean id="opBean" class="match.posting.OpenPositionBean"/>
<jsp:useBean id="quBean" class="match.posting.QualificationBean"/>
<jsp:useBean id="eBean" class="match.posting.environmentBean"/>
<jsp:useBean id="wBean" class="match.posting.WelfareBean"/>
<jsp:useBean id="apBean" class="match.posting.application_periodBean"/>
<jsp:useBean id="prBean" class="match.posting.procedureBean"/>
<jsp:useBean id="adqBean" class="match.posting.addquestionBean"/>
<jsp:useBean id="addBean" class="match.posting.adddocumentBean"/>


<jsp:setProperty property="*" name="pBean"/>
<jsp:setProperty property="*" name="opBean"/>
<jsp:setProperty property="*" name="quBean"/>
<jsp:setProperty property="*" name="eBean"/>
<jsp:setProperty property="*" name="wBean"/>
<jsp:setProperty property="*" name="apBean"/>
<jsp:setProperty property="*" name="prBean"/>
<jsp:setProperty property="*" name="adqBean"/>
<jsp:setProperty property="*" name="addBean"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
	String posting_idx = request.getParameter("posting_idx");
	String posting_name = pMgr.getPostingName(posting_idx);
	String manager_id = pMgr.getManagerId(posting_idx);
	int company_idx = pMgr.getCompanyIdx(manager_id);
	String company_name = pMgr.getCompanyName(company_idx);
	
	pBean = pMgr.searchPostingInfo(posting_idx);	
	opBean = pMgr.searchOpenPositionInfo(posting_idx); // 수정됨
	quBean = pMgr.searchQualificationInfo(posting_idx);
	eBean = pMgr.searchEnvironmentInfo(posting_idx);
	int procedureNum = pMgr.countProcedureNum(posting_idx);
	List<procedureBean> procedureList = pMgr.getProcedure(posting_idx, procedureNum);
	List<WelfareBean> wBeanList = pMgr.searchWelfareInfo(posting_idx);
	apBean = pMgr.searchperiodInfo(posting_idx);
	String selectedJobCategoryName = opBean.getOpenposition_name();
	List<String> addQuestionQuestions = pMgr.getAddQuestionQuestions(posting_idx);
	List<String> addDocumentDocuments = pMgr.getAddDuestionDuestions(posting_idx);
	List<WelfareBean> welfareList = pMgr.searchWelfareInfo(posting_idx);
	OpenPositionBean openPosition = pMgr.searchOpenPositionInfo(posting_idx);
	String openpositionName = openPosition.getOpenposition_name();


%>
<style>
body {
    background-color: #F8F8F8;
}

/* 흰색 박스 스타일 */
.box {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}


.addbtn22 {
    /* 원하는 스타일 속성을 여기에 추가하세요 */
    background-color: #606060; /* 배경색을 파란색으로 변경 */
    color: white; /* 글꼴 색상을 흰색으로 변경 */
    border: 2px solid black; /* 테두리 스타일을 추가 */
    border-radius: 5px; /* 버튼의 모서리를 둥글게 만듭니다 */
    padding: 5px 22px; /* 내부 여백을 추가하여 버튼 크기 조정 */
    font-size: 16px; /* 글꼴 크기를 변경 */
    cursor: pointer; /* 커서 모양을 포인터로 변경하여 버튼을 클릭할 때 표시되는 모양을 변경 */
}
.addbtn_rlast {
    /* 원하는 스타일 속성을 여기에 추가하세요 */
    background-color: #3448FF; /* 배경색을 파란색으로 변경 */
    color: white; /* 글꼴 색상을 흰색으로 변경 */
    border-radius: 5px; /* 버튼의 모서리를 둥글게 만듭니다 */
    border: none; /* Border */
    padding: 6px 30px; /* 내부 여백을 추가하여 버튼 크기 조정 */
    font-size: 18px; /* 글꼴 크기를 변경 */
    cursor: pointer; /* 커서 모양을 포인터로 변경하여 버튼을 클릭할 때 표시되는 모양을 변경 */
    margin-bottom: 10px;
}
.addbtn_llast {
    /* 원하는 스타일 속성을 여기에 추가하세요 */
    background-color: white; /* 배경색을 파란색으로 변경 */
    color: black; /* 글꼴 색상을 흰색으로 변경 */
    border: none; /* Border */
    border-radius: 5px; /* 버튼의 모서리를 둥글게 만듭니다 */
    padding: 6px 30px; /* 내부 여백을 추가하여 버튼 크기 조정 */
    font-size: 18px; /* 글꼴 크기를 변경 */
    cursor: pointer; /* 커서 모양을 포인터로 변경하여 버튼을 클릭할 때 표시되는 모양을 변경 */
    margin-bottom: 10px;
}
.addbtn2 {
    /* 원하는 스타일 속성을 여기에 추가하세요 */
    background-color: #606060; /* 배경색을 파란색으로 변경 */
    color: white; /* 글꼴 색상을 흰색으로 변경 */
    border: 2px; /* 테두리 스타일을 추가 */
    border-radius: 5px; /* 버튼의 모서리를 둥글게 만듭니다 */
    padding: 3px 10px; /* 내부 여백을 추가하여 버튼 크기 조정 */
    font-size: 12px; /* 글꼴 크기를 변경 */
    cursor: pointer; /* 커서 모양을 포인터로 변경하여 버튼을 클릭할 때 표시되는 모양을 변경 */
}
.top {
    flex: 1; /* 상단 영역이 더 높이가 높게 설정됩니다 */
    margin-bottom: 5px; /* 하단과의 여백 조절 */
}

.bottom {
    flex: 2; /* 하단 영역이 더 높이가 높게 설정됩니다 */
    margin-top: 10px; /* 상단과의 여백 조절 */
}

.left-side {
    flex: 2; /* 좌측 영역이 우측 영역보다 2배 넓게 설정 */
    padding: 10px; /* 내용과 상자 경계 사이의 여백 */
}

.right-side {
    flex: 1; /* 우측 영역은 1배 넓게 설정 */
    padding: 10px; /* 내용과 상자 경계 사이의 여백 */
}

.icons {
    display: flex;
    justify-content: flex-end; /* 아이콘을 우측으로 정렬 */
    align-items: flex-start; /* 아이콘을 상단으로 정렬 */
    gap: 10px; /* 아이콘 사이의 간격 설정 */
}
.icon-label {
    font-size: 14px;
    color: grey;
}
.fas {
     color: #7CFC00; /* 아이콘의 색상을 연두색으로 설정 */
     margin-right: 13px; /* 아이콘과 텍스트 사이의 간격을 조정 */
}
    .category {
        margin-bottom: 20px;
        background-color: #f2f2f2;
        padding: 10px;
        border-radius: 5px;
    }
    .category-label {
        font-size: 18px;
        font-weight: bold;
        color: #4CAF50; /* 연두색 */
    }
    .category-content {
        margin-top: 10px;
    }
    .category-title {
        font-size: 16px;
        font-weight: bold;
        color: #333;
        margin-bottom: 5px;
    }
    .details-list {
        list-style: none;
        padding-left: 0;
    }
    .details-list li {
        margin-bottom: 5px;
        padding-left: 20px;
        position: relative;
    }
    .details-list li:before {
        content: '\f00c'; /* FontAwesome 체크 아이콘 */
        font-family: 'FontAwesome';
        left: 0;
        position: absolute;
        color: #4CAF50;
    }
    
	.Postsidebar {
	    position: fixed; /* 스크롤 시에도 사이드바가 고정되도록 설정 */
    	bottom: 400px;    /* 하단에서 20px의 여백 */
    	left: 70px;     /* 우측에서 20px의 여백 */
    	z-index: 1000;   /* 다른 요소들 위에 표시 */
	    background-color: white; /* 흰색 배경 */
	    padding: 20px; /* 안쪽 여백 */
	    border-radius: 10px; /* 모서리를 둥글게 */
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	    max-width: 250px; /* 최대 너비 */
	    margin: 20px; /* 바깥쪽 여백 */
	}
	
	.Postsidebar ul {
	    list-style-type: none; /* 기본 리스트 스타일 제거 */
	    padding: 0; /* 패딩 제거 */
	}
	
	.Postsidebar ul li {
	    margin-bottom: 10px; /* 리스트 아이템 사이의 여백 */
	}
	
	.Postsidebar ul li a {
	    text-decoration: none; /* 밑줄 제거 */
	    color: #333; /* 글자 색상 */
	    font-weight: bold; /* 글자 두께 */
	}
	
	.Postsidebar ul li a:hover {
	    color: #007bff; /* 링크 호버 색상 */
	}
	.question {
   	 	font-size: 18px; /* 라벨 텍스트 크기 조정 */
    	margin-bottom: 10px; /* 라벨 아래 여백 조정 */
    	font-weight: bolder;
	}
.box-day {
    text-align: center;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-top: 10px;
}

.icon i {
    color: #007bff;
    font-size: 24px;
}

.label {
    margin-top: 10px;
    font-size: 16px;
    color: #333;
}

.d-day {
    font-size: 24px;
    color: red;
    font-weight: bold;
    margin: 10px 0;
}

.dates .start-date, .dates .end-date {
    font-size: 14px;
    color: #666;
}
</style>

<title>Announcement Form with Bootstrap</title>
<!-- 최신 버전의 부트스트랩 CSS 추가 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<body>
<div class="container mt-10">
    <!-- 좌측 레이아웃 -->
    <div class="row">
        <div class="col-md-8 offset-md-2"> <!-- 왼쪽으로 옮길 컨테이너 -->	
			<div class="box">
			    <div class="left-side">
			        <div class="icons" style="margin-top: 10px;"> <!-- 아이콘들을 위로 이동 -->
			            <i class="fas fa-print"></i> <span class="icon-label">인쇄</span>
			            <i class="fas fa-exclamation-circle"></i> <span class="icon-label">신고</span>
			            <i class="fas fa-share-alt"></i> <span class="icon-label">공유</span>
			        </div>
			        <div class="top-left">
			            <label style="font-size: 14px; color: grey; margin-left: 20px;">기업명 : <%= company_name %></label>
			        </div>
			        <div class="bottom-left">
			            <label style="font-size: 20px; font-weight: bold; margin-left: 20px;"><%= posting_name %></label>
			        </div>
			    </div>
			    <div class="right-side">
			    </div>
			</div>
			
			<!-- 추가 정보를 넣을 새로운 box -->
        <div class="box">
			<div class="category" id="MycompanyInfo">
			    <i class="fas fa-check"></i> <span class="category-label">담당업무</span>
			    <div class="category-content">
			        <div class="category-title">모집 ddd분야</div>
			        <ul class="details-list">
			            <li>모집분야 : [<%=opBean.getOpenposition_name()%>]</li>
			            <li>담당업무 : [<%=opBean.getOpenposition_duty()%>]</li>
			            <li>모집 직급 : [<%= opBean != null ? opBean.getOpenposition_position() : "" %>]</li>
			            <li>모집인원 : [<%=opBean.getOpenposition_num()%>]</li>
			            <!-- 추가적인 상세 정보 -->
			        </ul>
			    </div>
			</div>
			<div class="category">
			    <i class="fas fa-check"></i> <span class="category-label" style="font-size: 18px; font-weight: bold;">자격요건</span>
			    <div class="category-content">
			        <div class="category-title">자격요건</div>
			        <ul class="details-list">
			            <li>학력 : [<%= quBean != null ? quBean.getQualification_edutype() : "" %>]</li>
			            <li>성별 : [<%= quBean != null ? quBean.getQualification_gender() : "" %>]</li>
			            <li>경력 : [<%= quBean != null ? quBean.getQualification_experience() : "" %>]</li>
			        </ul>
			        <div class="category-title">우대사항</div>
			        <ul class="details-list">
			            <li>자격증 : [<%= quBean != null ? quBean.getQualification_certificate() : "" %>]</li>
			            <li>스킬 : [<%= quBean != null ? quBean.getQualification_skill() : "" %>]</li>
			        </ul>
			    </div>
			</div>
			<div class="category" id="MyworkEnvironment">
			    <i class="fas fa-check"></i> <span class="category-label" style="font-size: 18px; font-weight: bold;">근무 환경</span>
			    <div class="category-content">
			        <div class="category-title">근무 환경</div>
			        <ul class="details-list">
			            <li>고용 형태 : [<%= eBean.getEnvironment_type() %>]</li>
			            <li>근무 지역 : [담당업무 상세]</li>
			            <li>근무 요일 : [<%= eBean.getWorking_day() %>]</li>
			            <li>근무 시간 : [<%= eBean.getWorking_hour() %>]</li>
			        </ul>
			    </div>
			</div>
			<div class="category" id="MywelfareBenefits">
			    <i class="fas fa-check"></i> <span class="category-label" style="font-size: 18px; font-weight: bold;">복지 및 혜택</span>
			    <div class="category-content">
			        <ul class="details-list">
			        <%
    					if (welfareList != null && !welfareList.isEmpty()) {
        					for (WelfareBean welfare : welfareList) {
            					List<String> contents = welfare.getWelfareContents();
            					for (String content : contents) { %>
			            <li><%= content %></li>
			            <%}}}%>
			        </ul>
			    </div>
			</div>
			<div class="category" id="MyhiringProcess"> 
			    <i class="fas fa-check"></i> <span class="category-label">채용 절차</span>
			    <div class="category-content">
			        <ul class="timeline">
			            <li class="timeline-item">
			                <span class="time"></span>
			                <div class="info">
			                    <div class="category-title">공고 기간</div>
 			                    <%= apBean.getApplication_sdatetime() %> ~ <%= apBean.getApplication_edatetime() %>
			                </div>
			            </li>
			            <!-- 채용 절차 단계 예시 -->
			            <%for(procedureBean procedure : procedureList) {	%>
			            <li class="timeline-item">
			                <div class="info">      
			                    <div class="category-title"><%= procedure.getProcedure_name()%></div>
 			                    <%= procedure.getProcedure_sdatetime()%> ~ <%= procedure.getProcedure_edatetime()%>
			                </div>
			            <%}%>
			            </li>
			            <!-- 여기에 추가적인 채용 절차 단계를 넣을 수 있음 -->
			        </ul>
			    </div>
			</div>
			<div class="category" id="MyadditionalSubmission"> 
			    <i class="fas fa-check"></i> <span class="category-label" style="font-size: 18px; font-weight: bold;">추가 작성 사항</span>
			    <div class="category-content">
			    	<div class="category-title">질문 사항</div>
			    	<%for(String question : addQuestionQuestions) {%>
			        <ul class="details-list">
			            <li><%=question%></li>
			    	<%}%>
			        </ul>
			        <div class="category-title">제출 자료</div>
			    	<%for(String document : addDocumentDocuments) {%>
			        <ul class="details-list">
			        <li><%=document%></li>
			    	<%}%>
			        </ul>
			    </div>
			</div>
       </div>
       
		<div class="col">
		    <label for="companyName" class="question">접수기간</label>
		</div>
		<div class="box-day">
		    <div class="icon"><i class="fa fa-calendar" aria-hidden="true"></i></div>
		    <div class="label">남은 기간</div>
		    <div id="d-day" class="d-day">D-<span></span></div>
		    <div class="dates">
		        <div class="start-date">시작일: <span><%= apBean.getApplication_sdatetime() %></span></div>
		        <div class="end-date">마감일: <span><%= apBean.getApplication_edatetime() %></span></div>
		    </div>
		</div>
		<label for="companyName" class="question"></label>
		<label for="companyName" class="question"></label>
		<div class="col">
		    <label for="companyName" class="question">기업정보</label>
		</div>
		<div class="box-day">
		    <div class="icon"><i class="fa fa-calendar" aria-hidden="true"></i></div>
		    <div class="label">남은 기간</div>
		    <div id="d-day" class="d-day">D-<span></span></div>
		    <div class="dates">
		        <div class="start-date">시작일: <span><%= apBean.getApplication_sdatetime() %></span></div>
		        <div class="end-date">마감일: <span><%= apBean.getApplication_edatetime() %></span></div>
		    </div>
		</div>		

			<div class="container">
			    <div class="row justify-content-center mt-4">
			        <div class="col-auto">
			            <!-- 등록하기 버튼 -->
			            <button id="registerButton" type="button" class="addbtn_rlast" onclick="submitForm()">지원하기</button>
			        </div>
			        <div class="col-auto">
			            <!-- 취소하기 버튼 -->
			            <button id="cancelButton" type="button" class="addbtn_llast" onclick="cancelForm()">취소하기</button>
			        </div>
			    </div>
			</div>


              
        </div> <!-- 왼쪽 컨테이너 -->
        <!-- 우측 레이아웃 -->
		<div class="col-md-3 d-flex flex-column align-items-center justify-content-center fixed-bottom-right">  
		    <div class="Postsidebar">  
			    <ul>
			        <li><a href="#MycompanyInfo">담당업무</a></li>
			        <li><a href="#Myqualification">자격 요건</a></li>
			        <li><a href="#MyworkEnvironment">근무 환경</a></li>
			        <li><a href="#MywelfareBenefits">복리후생</a></li>
			        <li><a href="#MyhiringProcess">채용 절차</a></li>
			        <li><a href="#MyadditionalSubmission">추가 사항</a></li>
			    </ul>
			</div>		    
		</div>
   </div>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
	// 우측 메뉴바
	document.querySelectorAll('.Postsidebar a').forEach(link => {
	    link.addEventListener('click', function(e) {
	        e.preventDefault();
	        var targetId = this.getAttribute('href');
	        var targetElement = document.querySelector(targetId);
	        targetElement.scrollIntoView({ behavior: 'smooth' });

	        // 선택적으로 특정 입력 필드에 포커스를 맞춥니다. 예를 들어:
	        if (targetId === '#companyInfo') {
	            document.getElementById('posting_cname').focus();
	        }
	    });
	});
	document.addEventListener('DOMContentLoaded', function() {
	    var endDateElement = document.getElementById('end-date');
	    if (endDateElement) {
	        var endDateText = endDateElement.textContent.trim();
	        // 날짜와 시간 사이에 'T' 문자를 삽입하여 형식을 조정합니다.
	        var formattedEndDateText = endDateText.replace(' ', 'T');
	        var endDateTime = new Date(formattedEndDateText).getTime();
	        var now = new Date().getTime();
	        var distance = endDateTime - now;
	        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	        document.getElementById('d-day').getElementsByTagName('span')[0].textContent = days >= 0 ? days : '기간 만료';
	    }
	});
	</script>
</body>
</html>