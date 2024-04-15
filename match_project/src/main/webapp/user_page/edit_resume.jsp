<%@page import="match.resume.CertificateBean"%>
<%@page import="match.resume.SkillBean"%>
<%@page import="match.resume.CurriculumBean"%>
<%@page import="match.resume.InternshipBean"%>
<%@page import="match.resume.CareerBean"%>
<%@page import="match.resume.EduBean"%>
<%@page import="java.util.List"%>
<%@page import="match.*"%>
<%@page import="match.category.certificate_categoryBean"%>
<%@page import="match.category.skill_categoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="sMgr" class="match.category.skill_categoryMgr"/>
<jsp:useBean id="scBean" class="match.category.skill_categoryBean"/>
<jsp:useBean id="cMgr" class="match.category.certificate_categoryMgr"/>
<jsp:useBean id="cBean" class="match.category.certificate_categoryBean"/>
<jsp:useBean id="uMgr" class="match.UserMgr"/>
<jsp:useBean id="uBean" class="match.UserBean"/>
<jsp:useBean id="rBean" class="match.ResumeBean"/>
<jsp:useBean id="rMgr" class="match.ResumeMgr"/>

<jsp:useBean id="eBean" class="match.resume.EduBean"/>
<jsp:useBean id="caBean" class="match.resume.CareerBean"/>
<jsp:useBean id="iBean" class="match.resume.InternshipBean"/>
<jsp:useBean id="cuBean" class="match.resume.CurriculumBean"/>
<jsp:useBean id="sBean" class="match.resume.SkillBean"/>
<jsp:useBean id="ceBean" class="match.resume.CertificateBean"/>
<jsp:useBean id="aBean" class="match.resume.AwardBean"/>
<jsp:useBean id="gBean" class="match.resume.GlobalexBean"/>
<jsp:useBean id="lBean" class="match.resume.LanguageBean"/>
<jsp:useBean id="preBean" class="match.resume.PrefferBean"/>
<jsp:useBean id="proBean" class="match.resume.ProjectBean"/>
<jsp:useBean id="poBean" class="match.resume.PortfolioBean"/>

<jsp:setProperty property="*" name="uBean"/>
<jsp:setProperty property="*" name="rBean"/>
<jsp:setProperty property="*" name="eBean"/>
<jsp:setProperty property="*" name="caBean"/>
<jsp:setProperty property="*" name="iBean"/>
<jsp:setProperty property="*" name="cuBean"/>
<jsp:setProperty property="*" name="sBean"/>
<jsp:setProperty property="*" name="ceBean"/>
<jsp:setProperty property="*" name="aBean"/>
<jsp:setProperty property="*" name="gBean"/>
<jsp:setProperty property="*" name="lBean"/>
<jsp:setProperty property="*" name="preBean"/>
<jsp:setProperty property="*" name="proBean"/>
<jsp:setProperty property="*" name="poBean"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이력서 수정</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<style>
		.resume{
			display: flex;
			justify-content: center;
		}
		.resume-center{
			width: 940px;
			height: auto;
			margin-bottom: 20px;
		}
		.resume-side{
			background-color: #f1f2f4;
			border: none; 
		}
		.fixed-left{
			top: 155px;
			left: 140px;
			width: 300px;
			height: 500px;
			position: fixed;
			display: flex;
			justify-content: center;
			align-items: flex-end;
		}
		.fixed-right{
			top: 155px;
			right: 240px;
			width: 200px;
			height: 600px; 
			position: fixed;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.left-img{
			width: 140px;
			height: 140px;
			background-color: #fff;
			border-radius: 50%;
		}
		.left-name{
			text-align: center;
			font-size: 18px;
			font-weight: bold;
		}
		.left-info{
			width: 250px;
			height: 270px;
			background-color: #fff;
			margin-bottom: 20px;
			border-radius: 5%;
		}
		.info-header{
			font-size: 12px;
			color: #767f8c;
		}
		.info-body{
			padding-bottom: 5px;
		}
		.right-header{
			margin-top: 12px;
			font-size: 18px;
			font-weight: bold;
		}
		.right-content{
			width: 90%;
			height: 80%;
			background-color: #fff;
			border-radius: 10px/10px;
		}
		.register-btn{
			background-color: #fff;
			border: none;
			width: 60%;
			height: 35px;
			border-radius: 5%:
		}
		.title {
		    font-size: 20px;
		    font-weight: bold;
		    margin-bottom: 10px; /* 아래 여백 설정 */
		    margin-top: 20px;
		}
		
		.stitle {
		    font-size: 18px;
		    font-weight: bolder;
		    margin-bottom: 10px;
		    margin-top: 15px;
		    color: #717273;
		}
		.input-box{
			width: 930px;
			height: 200px;
			border: 1px solid lightgrey;
			border-radius: 10px/10px;
		}
		.box{
			width: 930px;
			min-height: 100px;
			border: 1px solid lightgrey;
			border-radius: 10px/10px;
			padding-bottom: 10px;
		}
		.box2{
			width: 930px;
			min-height: 57px;
			border: 1px solid lightgrey;
			border-radius: 10px/10px;
			padding-bottom: 10px;
		}
		.career-box{
			height:auto;
		}
		.edu-box{
			height:auto;
			margin-bottom: 10px;
		}
		.box-style{
			border-radius: 5px/5px;
			border: 1px solid lightgrey;
		}
		.box-style.active{
			border: 1px solid #0000ff;
		}
		.sbox{
			margin-left: 20px;
			margin-top: 10px;
			height: 55px;
			width: 165px;
			background-color: #fff;
		}
		.ssbox{
			margin-top: 10px;
			height: 55px;
			width: 100px;
			background-color: #fff;
		}
		.mbox{
			margin-left: 20px;
			margin-top: 10px;
			width: 330px;
			height: 55px;
		}
		.msbox{
			margin-left: 20px;
			margin-top: 10px;
			width: 200px;
			height: 55px;
		}
		.lbox{
			margin-left: 20px;
			margin-top: 10px;
			width: 900px;
			height: 70px;
		}
		.lsbox{
			margin-left: 20px;
			margin-top: 10px;
			width: 678px;
			height: 70px;
		}
		.sbox-con{
			height: 55px;
			width: 165px;
			background-color: #fff;
		}
		.sbox-con{
			height: 55px;
			width: 165px;
			background-color: #fff;
		}
		.mbox-con{
			width: 330px;
			height: 55px;
			background-color: #fff;
		}
		.msbox-con{
			width: 200px;
			height: 55px;
		}
		.lbox-con{
			width: 900px;
			height: 68px;
			resize: none;
			overflow-y: auto;
		}
		.lsbox-con{
			width: 678px;
			height: 68px;
			resize: none;
			overflow-y: auto;
		}
		.stext{
			width: 100px;
			margin-left: 12px;
			margin-top: 10px;
			display: flex;
			text-align: center;
			align-items: center;
		}
		.sstext{
			width: 70px;
			margin-left: 12px;
			margin-top: 10px;
			display: flex;
			text-align: center;
			align-items: center;
		}
		.add-btn{
			margin-top: 10px;
			width: 150px;
			background-color: #606060;
			color: #fff;
			border: 1px solid #606060;
			border-radius: 5px/5px;
		}
		.delete-btn{
			padding-left: 6px;
			padding-right: 6px;
			width:  46px;
			background-color: #fff;
			color: #ff0000;
			border: 1px solid;
			border-radius: 5%;
		}
		.ctgr {
	    	width: 33%;
	    	border-right: 1px solid;
	        max-height: 250px; /* Adjust the maximum width as needed */
    		overflow-y: auto; /* Add vertical scrollbar when content exceeds the height */
		}
		.sctgr {
			width:66%;
	        max-height: 250px; /* Adjust the maximum width as needed */
    		overflow-y: auto; /* Add vertical scrollbar when content exceeds the height */
		}
		.category {
		    display: inline-block;
		    width: 99%; /* Adjust the width as needed */
		    text-align: center; /* Center the text within the span */
		    margin-top: 20px;
		    margin-bottom: 20px;
		    border: none;
		    background-color: #fff;
		    font-size: 14px;
		}
		.category.active{
			color: #0000ff;
		}
		.scategory {
		    width: 32%; /* Adjust the width as needed */
		    margin-top: 20px;
		    margin-bottom: 20px;
		    border: none;
		    background-color: #fff;
		    font-size: 14px;
		}
		.scategory.active{
			color: #0000ff;
		}
		.skill-cbox{
			display:none;
			width: 800px;
			height: 250px;
			border: 1px solid lightgrey;
			border-radius: 10px/10px;
			margin-top : 5px;
			margin-left: 8px;
		}
		.certificate-cbox{
			display:none;
			width: 800px;
			height: 250px;
			border: 1px solid lightgrey;
			border-radius: 10px/10px;
			margin-top : 5px;
			margin-left: 8px;
		}
		.skill-cbox.active{
			display:block;
		}
		.certificate-cbox.active{
			display:block;
		}
		.skill-scategory{
			display: none;
		}
		.form-content1{
			overflow-y: auto; /* Add vertical scrollbar when content exceeds the height */
			height: 68px;
		}
		.form-content-btn1{
			min-width: 50px;
			max-width: 300px;
			border: none;
			background-color: #3d3d3d;
			color: #fff;
			border-radius: 15px/15px;
			margin: 5px;
		}
		.form-content-btn2{
			min-width: 50px;
			max-width: 300px;
			border: none;
			background-color: #3d3d3d;
			color: #fff;
			border-radius: 15px/15px;
			margin: 5px;
		}
		.form-content2{
			overflow-y: auto; /* Add vertical scrollbar when content exceeds the height */
			height: 68px;
		}

        /* 모달 닫기 버튼 스타일 */
        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute; /* 절대 위치 설정 */
            top: 0;
            right: 0;
            margin-right: 20px; /* 오른쪽 여백 설정 */
            margin-top: 10px; /* 상단 여백 설정 */
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .modal-save-btn{
        	height: 60px;
        	width: 100px;
        	background-color: #0066ff;
        	border: 1px solid #0066ff;
        	border-radius: 15px/15px;
        	color: #fff;
        }
        .modal-esc-btn{
        	height: 60px;
        	width: 100px;
        	background-color: #fff;
        	border: 1px solid #0066ff;
        	color: #0066ff;
        	border-radius: 15px/15px;
        }
        .modal-dialog{
        	top:300px;
        }
        .preffer-check{
        	width: 20px;
        	height: 20px;
        	margin-left: 13px;
        	margin-top: 16px;
        }
        .right-content {
		    background-color: white; /* 흰색 배경 */
		    padding: 20px; /* 안쪽 여백 */
		    border-radius: 10px; /* 모서리를 둥글게 */
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
		    max-width: 250px; /* 최대 너비 */
		}
		
		.right-content ul {
		    list-style-type: none; /* 기본 리스트 스타일 제거 */
		    padding: 0; /* 패딩 제거 */
		}
		
		.right-content ul li {
		    margin-bottom: 10px; /* 리스트 아이템 사이의 여백 */
		}
		
		.right-content ul li a {
		    text-decoration: none; /* 밑줄 제거 */
		    color: #333; /* 글자 색상 */
		    font-weight: bold; /* 글자 두께 */
		}
		
		.right-content ul li a:hover {
		    color: #007bff; /* 링크 호버 색상 */
		}
       .resume-side label {
		    display: inline-block;
		    padding-left: 13px;
		    padding-right: 10px;
		    margin-left: 100px;
		    margin-right: 100px;
		    color: #000;
		    vertical-align: middle;
		    background-color: #fff;
		    cursor: pointer;
		    height: 22px;
		    width: 163px;
		    border: 1px solid #000;
		}
		.resume-side input[type="file"] {
		    position: absolute;
		    width: 0;
		    height: 0;
		    padding: 0;
		    overflow: hidden;
		    border: 0;
		} 
	</style>
</head>
<body>
<%@ include file="user_top.jsp" %>
<%
	String skillname[] = {"개발자 언어", "개발자 기술", "그래픽 디자인", "편집", "음악 및 사운드 편집", "애니메이션", "UI/UX 디자인", "3D 모델링 및 디자인", "일러스트레이션", "사진 편집", "비디오 및 영상 제작", "음악 제작 및 오디오 엔지니어링", "글쓰기 및 편집", "디지털 마케팅", "사업 관리 및 프로젝트 관리", "사진 및 비주얼 콘텐츠 제작", "사회 연결망 및 네트워킹", "온라인 교육 및 교육 기술", "헬스 및 피트니스", "온라인 쇼핑 및 전자상거래", "어학 및 언어 학습", "요리 및 조리", "여행 및 여행 계획", "자기 계발 및 심리학", "음악 감상 및 스트리밍", "온라인 커뮤니티 및 포럼", "자동화 및 생산성 도구", "환경 및 지속 가능성"};
	
	if(id==null){
		response.sendRedirect("../login/login.jsp");
		return;
	}
	uBean = uMgr.getUser(id);
	int year = Integer.parseInt(uBean.getBirthday().substring(0, 4));
	
	String gender = "";
	if(uBean.getUser_gender() == false)
		gender = "남";
	else
		gender = "여";
	
	String SNS = "";
	if(uBean.getSns() == null)
		SNS = "없음";
	else
		SNS = uBean.getSns();
	int resume_idx = Integer.parseInt(request.getParameter("resume_idx"));
	rBean = rMgr.getResume(resume_idx);
	List<EduBean> eduList = rMgr.getEduList(resume_idx);
	List<CareerBean> careerList = rMgr.getCareerList(resume_idx);
	List<InternshipBean> internList = rMgr.getInternList(resume_idx);
	List<CurriculumBean> curriculumList = rMgr.getCurriculumList(resume_idx);
	List<SkillBean> skillList = rMgr.getSkillList(resume_idx);
	List<CertificateBean> certificateList = rMgr.getCertificateList(resume_idx);
%>
	<div class="resume">
		<form name="resumeFrm" method="post" action="resumeUpdateProc.jsp">
		<input type="hidden" name="resume_idx" value="<%= resume_idx %>">
			<div class="fixed-left resume-side row ms-0">
				<div class="left-img"></div>
				<input type="file" id="file">
				<label for="file" class="py-0">프로필 사진 업로드</label>
				<div class="left-name"><%=uBean.getUser_name()%></div>
				<div class="left-info">
					<table>
						<tr>
							<td class="info-header">
								개인정보
							</td>
						</tr>
						<tr>
							<td class="info-body">
								<%=year + "년생" + " (" + gender + ")"%>
							</td>
						</tr>
						<tr>
							<td class="info-header">
								주소
							</td>
						</tr>
						<tr>
							<td class="info-body">
								<%=uBean.getUser_address()%>
							</td>
						</tr>
						<tr>
							<td class="info-header">
								이메일
							</td>
						</tr>
						<tr>
							<td class="info-body">
								<%=uBean.getUser_email()%>
							</td>
						</tr>
						<tr>
							<td class="info-header">
								연락처
							</td>
						</tr>
						<tr>
							<td class="info-body">
								<%=uBean.getUser_phonenum()%>
							</td>
						</tr>
						<tr>
							<td class="info-header">
								SNS
							</td>
						</tr>
						<tr>
							<td class="info-body">
								<%=SNS%>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="resume-center">
				<div class="title" id="introInfo">자기소개</div>
				<div class="stitle">당신은 어떤 사람인가요? (한 줄 소개)</div>
				<textarea class="input-box" id="intro1" name="intro1"><%=rBean.getSelf_intro1()%></textarea>
				<div class="stitle">당신의 꿈, 목표와 비전에 대해 기술해주세요.</div>
				<textarea class="input-box" id="intro2" name="intro2"><%=rBean.getSelf_intro2()%></textarea>
				<div class="stitle">당신의 가치관에 대해 기술해주세요.</div>
				<textarea class="input-box" id="intro3" name="intro3"><%=rBean.getSelf_intro3()%></textarea>
				<input type="hidden" name="resume_name">
				
				<div class="title" id="eduInfo">학력</div>
				<div class="box">
				<%
					for(EduBean edu : eduList){
				%>
					<div class="edu-box">
						<div class="row">
							<div class="box-style sbox p-0">
								<div class="dropdown">
						            <button class="box-style sbox-con dropdown-toggle" type="button" id="edu-type-dropdown" data-bs-toggle="dropdown" aria-expanded="false" value="<%=edu.getEdu_type()%>">
						                <%= edu.getEdu_type() == null ? "학력 유형 선택" : edu.getEdu_type() %>
						            </button>
						            <div class="dropdown-menu">
						                <a class="dropdown-item" href="#" onclick="selectEdu('검정고시', event)">검정고시</a>
						                <a class="dropdown-item" href="#" onclick="selectEdu('고등학교 졸업', event)">고등학교 졸업</a>
						                <a class="dropdown-item" href="#" onclick="selectEdu('대학교 졸업(2~3년)', event)">대학교 졸업(2~3년)</a>
						                <a class="dropdown-item" href="#" onclick="selectEdu('대학교 졸업(4년)', event)">대학교 졸업(4년)</a>
						                <a class="dropdown-item" href="#" onclick="selectEdu('대학원 졸업(석사)', event)">대학원 졸업(석사)</a>
						                <a class="dropdown-item" href="#" onclick="selectEdu('대학원 졸업(박사)', event)">대학원 졸업(박사)</a>
						                <input type="hidden" id="edu_type[]" name="edu_type[]">
						            </div>
						        </div>
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="edu_school[]" name="edu_school[]" placeholder="학교명" value="<%=edu.getEdu_school()%>">
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="edu_major[]" name="edu_major[]" placeholder="전공명" value="<%=edu.getEdu_major()%>">
							</div>
						</div>
						<div class="row">
							<span class="stext">입학년월</span>
							<div class="box-style msbox p-0">
								<input type="month" id="edu_syear[]" name="edu_syear[]" class="box-style msbox-con" value="<%=edu.getEdu_syear()%>">
							</div>
							<span class="stext">졸업년월</span>
							<div class="box-style msbox p-0">
								<input type="month" id="edu_eyear[]" name="edu_eyear[]" class="box-style msbox-con" value="<%=edu.getEdu_eyear()%>">
							</div>
							<div class="box-style sbox p-0">
								<div class="dropdown">
						            <button class="box-style sbox-con dropdown-toggle" type="button" id="status-dropdown" data-bs-toggle="dropdown" aria-expanded="false">
						                <%= edu.getEdu_status() == null ? "재학 상태 선택" : edu.getEdu_status() %>
						            </button>
						            <div class="dropdown-menu">
						                <a class="dropdown-item" href="#" onclick="selectStatus('재학', event)">재학</a>
						                <a class="dropdown-item" href="#" onclick="selectStatus('졸업 예정', event)">졸업 예정</a>
						                <a class="dropdown-item" href="#" onclick="selectStatus('졸업', event)">졸업</a>
						                <input type="hidden" id="status[]" name="status[]" value="<%=edu.getEdu_status()%>">
						            </div>
						        </div>
							</div>
						</div>
					</div>
					<hr>
					<%} %>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addEduBox(this)">추가하기</button>
					</div>
				</div>
				
				<div class="title" id="careerInfo">경력</div>
				<div class="box">
				<%for(CareerBean career : careerList) {%>
					<div class="career-box">
						<div class="row">
							<div class="box-style sbox p-0">
								<input class="box-style sbox-con" type="text" id="career_cname[]" name="career_cname[]" placeholder="회사명" value="<%=career.getCareer_cname()%>">
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="career_dep[]" name="career_dep[]" placeholder="부서명" value="<%=career.getCareer_dep()%>">
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="career_job[]" name="career_job[]" placeholder="담당 직무" value="<%=career.getCareer_job()%>">
							</div>
						</div>
						<div class="row">
							<span class="stext">입사년월</span>
							<div class="box-style msbox p-0">
								<input type="month" id="career_syear[]" name="career_syear[]" class="box-style msbox-con" value="<%=career.getCareer_syear()%>">
							</div>
							<span class="stext">퇴사년월</span>
							<div class="box-style msbox p-0">
								<input type="month" id="career_eyear[]" name="career_eyear[]" class="box-style msbox-con" value="<%=career.getCareer_eyear()%>">
							</div>
						</div>
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea class="lbox-con box-style" id="career_duty[]" name="career_duty[]" placeholder="담당 업무"><%=career.getCareer_duty()	%></textarea>
							</div>
						</div>
					</div>
					<hr>
					<%} %>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addCareerBox(this)">추가하기</button>
					</div>
				</div>
				<div class="title" id="internInfo">인턴, 대외 활동</div>
				<div class="box">
				<%
					for(InternshipBean intern : internList){
				%>
					<div class="intern-box">
						<div class="row">
							<div class="box-style sbox p-0">
								<div class="dropdown">
						            <button class="box-style sbox-con dropdown-toggle" type="button" id="intern-dropdown" data-bs-toggle="dropdown" aria-expanded="false">
						                <%= intern.getInternship_type() == null ? "재학 상태 선택" : intern.getInternship_type() %>
						            </button>
						            <div class="dropdown-menu">
						                <a class="dropdown-item" href="#" onclick="selectIntern('인턴',event)">인턴</a>
						                <a class="dropdown-item" href="#" onclick="selectIntern('아르바이트',event)">아르바이트</a>
						                <a class="dropdown-item" href="#" onclick="selectIntern('동아리',event)">동아리</a>
						                <a class="dropdown-item" href="#" onclick="selectIntern('자원봉사',event)">자원봉사</a>
						                <a class="dropdown-item" href="#" onclick="selectIntern('사회활동',event)">사회활동</a>
						                <a class="dropdown-item" href="#" onclick="selectIntern('교내활동',event)">교내활동</a>
						                <a class="dropdown-item" href="#" onclick="selectIntern('기타',event)">기타</a>
						                <input type="hidden" id="intern_type[]" name="intern_type[]" value="<%=intern.getInternship_type()%>">
						            </div>
						        </div>
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="intern_cname[]" name="intern_cname[]" placeholder="기관 이름" value="<%=intern.getInternship_cname()%>">
							</div>
							<span class="sstext p-0">시작연도</span>
							<select name="intern_syear[]" class="box-style ssbox p-0 intern-syear">
								<option value="<%=intern.getInternship_syear()%>" selected><%=intern.getInternship_syear()%></option>
							</select>
							<span class="sstext p-0">종료연도</span>
							<select name="intern_eyear[]" class="box-style ssbox p-0 intern-eyear">
								<option value="<%=intern.getInternship_eyear()%>" selected><%=intern.getInternship_eyear()%></option>
							</select>
						</div>
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea class="lbox-con box-style" id="intern_duty[]" name="intern_duty[]" placeholder="활동 내용 (직무와 관련된 경험에 대해 작성해주세요.)"><%=intern.getInternship_duty()%></textarea>
							</div>
						</div>			
					</div>
					<hr>
					<%
					}
					%>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addInternBox(this)">추가하기</button>
					</div>
				</div>
				<div class="title" id="curriculumInfo">교육 이수</div>
				<div class="box">
				<%
					for(CurriculumBean curriculum : curriculumList){
				%>
					<div class="curriculum-box">
						<div class="row">
							<div class="box-style sbox p-0">
								<input class="box-style sbox-con" type="text" id="curriculum_name[]" name="curriculum_name[]" placeholder="교육 명" value="<%=curriculum.getCurriculum_name()%>">
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="curriculum_cname[]" name="curriculum_cname[]" placeholder="기관 이름" value="<%=curriculum.getCurriculum_cname()%>">
							</div>
							<span class="sstext p-0">시작연도</span>
							<select name="curriculum_syear[]" class="box-style ssbox p-0 curriculum-syear">
								<option value="<%=curriculum.getCurriculum_syear()%>" selected><%=curriculum.getCurriculum_syear()%></option>
							</select>
							<span class="sstext p-0">종료연도</span>
							<select name="curriculum_eyear[]" class="box-style ssbox p-0 curriculum-eyear">
								<option value="<%=curriculum.getCurriculum_eyear()%>" selected><%=curriculum.getCurriculum_eyear()%></option>
							</select>
						</div>
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea class="lbox-con box-style" id="curriculum_content[]" name="curriculum_content[]" placeholder="활동 내용 (이수하신 교육 과정에 대해 작성해주세요.)"><%=curriculum.getCurriculum_content()%></textarea>
							</div>
						</div>	
					</div>
					<hr>
					<%
					}
					%>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addCurriculumBox(this)">추가하기</button>
					</div>
				</div>
				<div class="title" id="skillInfo">스킬</div>
				<div class="box">
					<div class="skill-box">
						<div class="row">
							<div class="box-style mbox p-0">
								<button class="box-style mbox-con" type="button" id="skill-cbtn" onclick="toggleContent(1)">당신의 스킬을 선택해주세요.</button>
							</div>
						</div>
						<div>
							<div class="skill-cbox" id="contentBox1">
						        <div class="row">
						            <div class="col-4 ctgr">
						                <%
						                for(int i = 0; i < skillname.length; i++){
					                	%>
					                		<button class="category category1" type="button" id="skill-category<%=i%>"><%=skillname[i]%></button>
					                	<%
					                	}
					                	%>
						            </div>
						            <%
						            for(int j = 0; j < skillname.length; j++){
						            %>
						            <div class="col-6 sctgr" id="skill-scategory<%=j%>">
						                <%
						                Vector<skill_categoryBean> vlist = sMgr.skillsnameList(skillname[j]);
						                for(int i = 0; i < vlist.size(); i++){
						                	scBean = vlist.get(i);
						                %>
						                	<button class="scategory scategory1" type="button"><%=scBean.getSkill_sname()%></button>
						                <%
						                }
						                %>
						            </div>
						            <%
						            }
						            %>
						        </div>
						    </div>
						</div>
						<div class="row">
							<div class="box-style lbox">
								<div class="col form-content1">
								<%
									for(SkillBean skill : skillList){
								%>
										<input type="hidden" name="skill_sname[]" value="<%=skill.getSkill_sname()%>">
										<button class="form-content-btn1"><%=skill.getSkill_sname()%></button>
								<%
									}
								%>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="title" id="certificateInfo">자격증</div>
				<div class="box">
					<div class="certificate-box">
						<div class="row">
							<div class="box-style mbox p-0">
								<button class="box-style mbox-con" type="button" id="certificate-cbtn" onclick="toggleContent(2)">당신의 자격증을 선택해주세요.</button>
							</div>
						</div>
						<div class="certificate-cbox" id="contentBox2">
							<div class="row">
								<div class="col ctgr">
									<%
									Vector<certificate_categoryBean> vlist = cMgr.certificatenameList();
									for(int i = 0; i < vlist.size(); i++){
										cBean = vlist.get(i);
									%>
										<button class="scategory scategory2" type="button"><%=cBean.getCertificate_name()%></button>
									<%
									}
									%>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="box-style lbox">
								<div class="col form-content2">
								<%
									for(CertificateBean certificate : certificateList){
								%>
										<input type="hidden" name="certificate_sname[]" value="<%=certificate.getCertificate_sname()%>">
										<button class="form-content-btn2"><%=certificate.getCertificate_sname()%></button>
								<%
									}
								%>
								</div>
							</div>
						</div>
					</div>
				</div>
        		
				<div class="title" id="projectInfo">프로젝트</div>
				<div class="box">
					<div class="project-box">
						<div class="row">
							<div class="box-style sbox p-0">
								<input type="text" class="box-style sbox-con" id="project_name[]" name="project_name[]" placeholder="프로젝트 제목">
							</div>
							<div class="box-style mbox p-0">
								<input type="text" class="box-style mbox-con" id="project_url[]" name="project_url[]" placeholder="프로젝트 url을 입력해주세요.">
							</div>
							<div class="box-style mbox p-0">
								<input type="file" class="box-style mbox-con" id="project_file1" name="project_file[]" placeholder="프로젝트 파일을 업로드해주세요.">
								<input type="hidden" id="project_fname1" name="project_fname[]">
    							<input type="hidden" id="project_extension1" name="project_extension[]">
							</div>
						</div>
						<div class="row">
							<span class="stext">시작일</span>
							<div class="box-style msbox p-0">
								<input type="datetime-Local" id="project_syear[]" name="project_syear[]" class="box-style msbox-con">
							</div>
							<span class="stext">종료일</span>
							<div class="box-style msbox p-0">
								<input type="datetime-Local" id="project_eyear[]" name="project_eyear[]" class="box-style msbox-con">
							</div>
						</div>
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea id="project_duty[]" name="project_duty[]" class="box-style lbox-con"></textarea>
							</div>
						</div>
					</div>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addProjectBox(this)">추가하기</button>
					</div>
				</div>
				
				<div class="title" id="portfolioInfo">포트폴리오</div>
				<div class="box2">
					<div class="portfolio-box" id="potofolio_Fields">
					    <div class="row">

					    </div>
					</div>
					
					<div class="row m-0">
					<button class="add-btn mx-auto" type="button" id="addPortfolioButton">추가하기</button>					
					</div>
				</div>
				
				<div class="title" id="awardInfo">수상내역</div>
				<div class="box">
					<div class="award-box">
						<div class="row">
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="award_name[]" name="award_name[]" placeholder="수상명">
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="award_cname[]" name="award_cname[]" placeholder="수여기관">
							</div>
							<span class="sstext p-0">수상연도</span>
							<select id="award_syear[]" name="award_syear[]" class="box-style ssbox p-0">
							<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
							</select>
						</div>
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea class="box-style lbox-con" id="award_content[]" name="award_content[]" placeholder="수상 내용과 결과에 대해 작성해주세요."></textarea>
							</div>
						</div>
					</div>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addAwardBox(this)">추가하기</button>
					</div>
				</div>
				<div class="title" id="globalInfo">해외경험</div>
				<div class="box">
					<div class="globalex-box">
						<div class="row">
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="globalex_name[]" name="globalex_name[]" placeholder="국가명">
							</div>
							<span class="sstext p-0">시작연도</span>
							<select id="globalex_syear[]" name="globalex_syear[]" class="box-style ssbox p-0">
							<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
							</select>
							<span class="sstext p-0">종료연도</span>
							<select id="globalex_eyear[]" name="globalex_eyear[]" class="box-style ssbox p-0">
							<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
							</select>
						</div>
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea class="box-style lbox-con" id="globalex_content[]" name="globalex_content[]" placeholder="해외에서 어떤 경험을 했는지 작성해주세요. (ex. 어학연수, 교환학생, 워킹홀리데이, 해외근무)"></textarea>
							</div>
						</div>
					</div>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addGlobalexBox(this)">추가하기</button>
					</div>
				</div>
				<div class="title" id="languageInfo">어학</div>
				<div class="box">
					<div class="language-box">
						<div class="row">
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="language_name[]" name="language_name[]" placeholder="외국어">
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="language_level[]" name="language_level[]" placeholder="회화능력">
							</div>
						</div>
					</div>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addLanguageBox(this)">추가하기</button>
					</div>
				</div>
				<div class="title" id="prefferInfo">취업우대</div>
				<div class="box">
					<div class="preffer-box">
						<div class="row">
							<div class="box-style sbox p-0">
								<input class="preffer-check" type="checkbox" id="checkbox1" name="checkbox1" onclick="toggleActiveClass(this)">
								<span>보훈 대상</span>
							</div>
							<div class="box-style sbox p-0">
								<input class="preffer-check" type="checkbox" id="checkbox2" name="checkbox2" onclick="toggleActiveClass(this)">
								<span>취업보호 대상</span>
							</div>
							<div class="box-style sbox p-0">
								<input class="preffer-check" type="checkbox" id="checkbox3" name="checkbox3" onclick="toggleActiveClass(this)">
								<span>고용지원금 대상</span>
							</div>
							<div class="box-style sbox p-0">
								<input class="preffer-check" type="checkbox" id="checkbox4" name="checkbox4" onclick="toggleActiveClass(this)">
								<span>장애</span>
							</div>
							<div class="box-style sbox p-0">
								<input class="preffer-check" type="checkbox" id="checkbox5" name="checkbox5" onclick="toggleActiveClass(this)">
								<span>병역</span>
							</div>
						</div>
						<div class="row">
							<span class="sstext">장애</span>
							<div class="box-style sbox p-0">
								<div class="dropdown">
						            <button class="box-style sbox-con dropdown-toggle" type="button" id="disabled-dropdown" data-bs-toggle="dropdown" aria-expanded="false" disabled>
						                장애 등급 선택
						            </button>
						            <div class="dropdown-menu">
						                <a class="dropdown-item" href="#" onclick="selectDisabled('1급', event)">1급</a>
						                <a class="dropdown-item" href="#" onclick="selectDisabled('2급', event)">2급</a>
						                <a class="dropdown-item" href="#" onclick="selectDisabled('3급', event)">3급</a>
						                <a class="dropdown-item" href="#" onclick="selectDisabled('4급', event)">4급</a>
						                <a class="dropdown-item" href="#" onclick="selectDisabled('5급', event)">5급</a>
						                <a class="dropdown-item" href="#" onclick="selectDisabled('6급', event)">6급</a>
						                <input type="hidden" id="disabled" name="disabled" value="">
						            </div>
						        </div>
							</div>
						</div>
						<div class="row">
							<span class="sstext">병역</span>
							<div class="box-style sbox p-0">
								<div class="dropdown">
						            <button class="box-style sbox-con dropdown-toggle" type="button" id="military-dropdown" data-bs-toggle="dropdown" aria-expanded="false" disabled>
						                병역 선택
						            </button>
						            <div class="dropdown-menu">
						                <a class="dropdown-item" href="#" onclick="selectMilitary('현역', event)">현역</a>
						                <a class="dropdown-item" href="#" onclick="selectMilitary('예비역', event)">예비역</a>
						                <a class="dropdown-item" href="#" onclick="selectMilitary('보충역', event)">보충역</a>
						                <a class="dropdown-item" href="#" onclick="selectMilitary('병역준비역', event)">병역준비역</a>
						                <a class="dropdown-item" href="#" onclick="selectMilitary('전시근로역', event)">전시근로역</a>
						                <a class="dropdown-item" href="#" onclick="selectMilitary('대체역', event)">대체역</a>
						                <input type="hidden" id="military" name="military" value="">
						            </div>
						        </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="fixed-right resume-side row me-0">
				<div class="right-header">이력서 항목</div>
				<div class="right-content">
				    <ul>
				        <li><a href="#introInfo">자기소개</a></li>
				        <li><a href="#eduInfo">학력</a></li>
				        <li><a href="#careerInfo">경력</a></li>
				        <li><a href="#internInfo">인턴,대외 활동</a></li>
				        <li><a href="#curriculumInfo">교육 이수</a></li>
				        <li><a href="#skillInfo">스킬</a></li>
				        <li><a href="#certificateInfo">자격증</a></li>
				        <li><a href="#projectInfo">프로젝트</a></li>
				        <li><a href="#portfolioInfo">포트폴리오</a></li>
				        <li><a href="#awardInfo">수상내역</a></li>
				        <li><a href="#globalInfo">해외경험</a></li>
				        <li><a href="#languageInfo">어학</a></li>
				        <li><a href="#prefferInfo">취업우대</a></li>
				    </ul>
				</div>
				<button id="register-btn" class="register-btn" type="button">저장</button>
			</div>
		</form>
	</div>
	
		<!-- 등록 완료 모달 -->
	<div class="modal fade" id="titleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">이력서 제목 입력</h5>
	        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <form id="titleForm" method="get" action="resumeUpdateProc.jsp">
	        <div class="modal-body">
	          <input type="text" class="form-control" id="resume_name_modal" name="resume_name" placeholder="제목 입력" value="<%=rBean.getResume_name()%>">
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="" data-bs-dismiss="modal">취소</button>
	          <button type="button" class="btn btn-primary" onclick="submitResume()">확인</button>
	        </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		document.getElementById("register-btn").addEventListener("click", function() {
		    var selfIntro1 = document.getElementById("intro1").value.trim();
		    var selfIntro2 = document.getElementById("intro2").value.trim();
		    var selfIntro3 = document.getElementById("intro3").value.trim();
		    var missingFields = []; // 비어 있는 필수 항목의 이름을 모을 배열 초기화
	
		    // 각 필수 항목을 검사하고 비어있다면 missingFields 배열에 추가
		    if (selfIntro1 === "") missingFields.push("당신은 어떤 사람인가요? (한 줄 소개)");
		    if (selfIntro2 === "") missingFields.push("당신의 꿈, 목표와 비전에 대해 기술해주세요.");
		    if (selfIntro3 === "") missingFields.push("당신의 가치관에 대해 기술해주세요.");
		    
		    // missingFields 배열에 항목이 있다면 경고 메시지 생성
		    if (missingFields.length > 0) {
		        var message = "다음 필수 사항을 입력해주세요:\n" + missingFields.join("\n");
		        alert(message);
		    } else {
		        // 모든 필수 입력이 완료된 경우 등록 완료 모달 표시
		        $('#titleModal').modal('show');
		    }
		});
	
		document.addEventListener("DOMContentLoaded", function() {
		    // edu-box의 DOM 요소를 가져옴
		    var Box = document.querySelector('.box');
	
		    // edu-box의 내용이 변경될 때마다 높이를 조절하는 함수
		    function adjustHeight() {
		        // edu-box 내부의 콘텐츠 높이를 가져옴
		        var contentHeight = Box.scrollHeight;
		        // edu-box의 높이를 콘텐츠 높이에 맞게 조절
		        Box.style.height = contentHeight + 'px';
		    }
	
		    // 페이지 로드 시 초기 높이 조절
		    adjustHeight();
	
		    // edu-box 내부의 콘텐츠가 변경될 때마다 높이 조절
		    // 이벤트 리스너를 사용하여 콘텐츠 변화 감지
		    Box.addEventListener('input', adjustHeight);
		});
		function selectEdu(edu, event) {
		    event.preventDefault(); // 페이지 상단으로 스크롤되는 것을 방지
		    var dropdownButton = event.target.closest('.dropdown').querySelector('.dropdown-toggle');
		    dropdownButton.textContent = edu;
		    dropdownButton.style.backgroundColor = '#606060';
		    dropdownButton.style.color = 'white';
		    // 선택한 교육 유형을 숨겨진 입력 필드에 저장
		    var hiddenInput = event.target.closest('.dropdown').querySelector('input[type="hidden"]');
		    hiddenInput.value = edu;
		}
		function selectStatus(status, event) {
		    event.preventDefault(); // 페이지 상단으로 스크롤되는 것을 방지
		    var dropdownButton = event.target.closest('.dropdown').querySelector('.dropdown-toggle');
		    dropdownButton.textContent = status;
		    dropdownButton.style.backgroundColor = '#606060';
		    dropdownButton.style.color = 'white';
		    // 선택한 재학 상태를 숨겨진 입력 필드에 저장
		    var hiddenInput = event.target.closest('.dropdown').querySelector('input[type="hidden"]');
		    hiddenInput.value = status;
		}
		function selectIntern(intern, event) {
		    event.preventDefault(); // 페이지 상단으로 스크롤되는 것을 방지
		    var dropdownButton = event.target.closest('.dropdown').querySelector('.dropdown-toggle');
		    dropdownButton.textContent = intern;
		    dropdownButton.style.backgroundColor = '#606060';
		    dropdownButton.style.color = 'white';
		    // 선택한 재학 상태를 숨겨진 입력 필드에 저장
		    var hiddenInput = event.target.closest('.dropdown').querySelector('input[type="hidden"]');
		    hiddenInput.value = intern;
		}
		function selectDisabled(disabled, event) {
		    event.preventDefault(); // 페이지 상단으로 스크롤되는 것을 방지
		    var dropdownButton = event.target.closest('.dropdown').querySelector('.dropdown-toggle');
		    dropdownButton.textContent = disabled;
		    dropdownButton.style.backgroundColor = '#606060';
		    dropdownButton.style.color = 'white';
		    // 선택한 재학 상태를 숨겨진 입력 필드에 저장
		    var hiddenInput = event.target.closest('.dropdown').querySelector('input[type="hidden"]');
		    hiddenInput.value = disabled;
		}
		function selectMilitary(military, event) {
		    event.preventDefault(); // 페이지 상단으로 스크롤되는 것을 방지
		    var dropdownButton = event.target.closest('.dropdown').querySelector('.dropdown-toggle');
		    dropdownButton.textContent = military;
		    dropdownButton.style.backgroundColor = '#606060';
		    dropdownButton.style.color = 'white';
		    // 선택한 재학 상태를 숨겨진 입력 필드에 저장
		    var hiddenInput = event.target.closest('.dropdown').querySelector('input[type="hidden"]');
		    hiddenInput.value = military;
		}
		function addEduBox(button) {
		    var box = button.closest('.box');
		    var newEduBox = document.createElement('div');
		    newEduBox.className = 'edu-box';

			 // 새로운 edu-box 위에 구분선을 추가
		    var separator = document.createElement('hr');
		    newEduBox.appendChild(separator);


		    var existingEduBox = box.querySelector('.edu-box');
		    var clonedEduContent = existingEduBox.cloneNode(true);
		    newEduBox.appendChild(clonedEduContent);

		    // 새로운 edu-box의 id 값을 유니크하게 설정합니다.
		    var eduBoxCount = document.querySelectorAll('.edu-box').length;
		    var newEduBoxId = 'edu-box-' + eduBoxCount;
		    newEduBox.setAttribute('id', newEduBoxId);

		    // edu-box 내부의 개체에 동적으로 고유한 ID를 할당합니다.
		    var elementsWithId = newEduBox.querySelectorAll('[id]');
		    elementsWithId.forEach(function(element) {
		        var oldId = element.id;
		        element.id = oldId + '-' + eduBoxCount;
		    });
		    
		 // 복제된 노드의 모든 입력과 텍스트 영역 요소의 값을 지웁니다.
		    var inputs = newEduBox.querySelectorAll('input, textarea');
		    inputs.forEach(function(input) {
		        // 텍스트 입력과 텍스트 영역의 값 리셋
		        if (input.type === 'text' || input.tagName.toLowerCase() === 'textarea') {
		            input.value = '';
		        } else if (input.type === 'hidden') {
		            // 숨겨진 입력을 리셋하려면
		            input.value = '';
		        } else if (input.type === 'datetime-local') {
		            input.value = ''; // 필요하다면 datetime-local 입력을 리셋
		        }
		        // 드롭다운을 기본 상태로 리셋
		        if (input.classList.contains('dropdown-toggle')) {
		            input.textContent = '선택';
		            input.style.backgroundColor = '';
		            input.style.color = '';
		        }
		    });

		    // 드롭다운 메뉴 초기화
		    resetDropdowns(newEduBox);

		    box.insertBefore(newEduBox, button.parentNode);

		    var deleteButtonContainer = document.createElement('div');
		    deleteButtonContainer.style.textAlign = 'center';
		    var deleteButton = document.createElement('button');
		    deleteButton.className = 'delete-btn';
		    deleteButton.textContent = '삭제';
		    deleteButton.onclick = function() {
		        deleteEduBox(newEduBox);
		    };
		    deleteButtonContainer.appendChild(deleteButton);
		    newEduBox.appendChild(deleteButtonContainer);

		    // 새로운 edu-box가 추가될 때마다 box의 높이를 170px 만큼 증가시킵니다.
		    adjustHeightForBox();
		}

		function resetDropdowns(parentElement) {
		    var dropdowns = parentElement.querySelectorAll('.dropdown-toggle');
		    dropdowns.forEach(function(dropdown) {
		        dropdown.textContent = '선택';
		        dropdown.style.backgroundColor = '';
		        dropdown.style.color = '';
		    });

		    var hiddenInputs = parentElement.querySelectorAll('input[type="hidden"]');
		    hiddenInputs.forEach(function(input) {
		        input.value = '';
		    });
		}

		// 새로운 edu-box가 추가될 때마다 box의 높이를 170px씩 증가하는 함수
		function adjustHeightForBox() {
		    // 새로 추가된 edu-box만을 선택합니다.
		    var newEduBox = document.querySelector('.box').lastElementChild.previousElementSibling;
		    // 새로운 edu-box의 높이를 가져옵니다.
		    var newEduBoxHeight = newEduBox.offsetHeight;
		    // box의 현재 높이를 가져옵니다.
		    var currentBoxHeight = parseInt(document.querySelector('.box').style.height.replace('px', '')) + 16;
		    // 새로운 edu-box의 높이를 현재 높이에 더하여 설정합니다.
		    document.querySelector('.box').style.height = currentBoxHeight + newEduBoxHeight + 'px';
		}
    	 // edu-box를 삭제하는 함수
        function deleteEduBox(eduBox) {
		    // 삭제할 edu-box의 높이를 가져옵니다.
		    var deletedHeight = eduBox.offsetHeight;
		    // 삭제할 edu-box를 삭제합니다.
		    eduBox.parentNode.removeChild(eduBox);
		    // box의 현재 높이를 가져옵니다.
		    var currentBoxHeight = parseInt(document.querySelector('.box').style.height.replace('px', '')) - 15;
		    // 현재 높이에서 삭제할 edu-box의 높이를 빼고 설정합니다.
		    document.querySelector('.box').style.height = (currentBoxHeight - deletedHeight) + 'px';
		}
        function addCareerBox(button) {
            var box = button.closest('.box'); // 'box' 클래스를 가진 가장 가까운 부모를 찾습니다.
            var newCareerBox = document.createElement('div');
            newCareerBox.className = 'career-box'; // 새로운 div에 'career-box' 클래스를 추가합니다.

            // 시각적 구분을 위한 구분선 추가
            var separator = document.createElement('hr');
            newCareerBox.appendChild(separator);

            var existingCareerBox = box.querySelector('.career-box');
            var clonedCareerContent = existingCareerBox.cloneNode(true);
            newCareerBox.appendChild(clonedCareerContent);

            // 복제된 노드의 모든 입력과 텍스트 영역 요소의 값을 지웁니다.
            var inputs = newCareerBox.querySelectorAll('input, textarea');
            inputs.forEach(function(input) {
                input.value = ''; // 모든 입력 필드를 비웁니다.
            });

            box.insertBefore(newCareerBox, button.parentNode); // '추가하기' 버튼 전에 새로운 경력 박스를 삽입합니다.

            // 새로운 경력 박스에 삭제 버튼을 추가합니다.
            var deleteButtonContainer = document.createElement('div');
            deleteButtonContainer.style.textAlign = 'center';
            var deleteButton = document.createElement('button');
            deleteButton.className = 'delete-btn'; // 삭제 버튼에 클래스 추가
            deleteButton.textContent = '삭제';
            deleteButton.onclick = function() {
                deleteCareerBox(newCareerBox); // 해당 경력 박스를 삭제하는 함수
            };
            deleteButtonContainer.appendChild(deleteButton);
            newCareerBox.appendChild(deleteButtonContainer);
        }

        // 경력 박스를 삭제하는 함수
        function deleteCareerBox(careerBox) {
            careerBox.parentNode.removeChild(careerBox);
        }
        
        function addInternBox(button) {
            var box = button.closest('.box'); // 'box' 클래스를 가진 가장 가까운 부모를 찾습니다.
            var newInternBox = document.createElement('div');
            newInternBox.className = 'intern-box'; // 새로운 div에 'intern-box' 클래스를 추가합니다.

            // 시각적 구분을 위한 구분선 추가
            var separator = document.createElement('hr');
            newInternBox.appendChild(separator);

            var existingInternBox = box.querySelector('.intern-box');
            var clonedInternContent = existingInternBox.cloneNode(true);
            newInternBox.appendChild(clonedInternContent);

            // 복제된 노드의 모든 입력과 텍스트 영역 요소의 값을 지웁니다.
            var inputs = newInternBox.querySelectorAll('input, textarea');
            inputs.forEach(function(input) {
                input.value = ''; // 모든 입력 필드를 비웁니다.
            });

            box.insertBefore(newInternBox, button.parentNode); // '추가하기' 버튼 전에 새로운 인턴 박스를 삽입합니다.

            // 복제된 노드의 드롭다운 메뉴 선택 및 스타일 초기화
            resetDropdowns(newInternBox);

            // 새로운 인턴 박스에 삭제 버튼을 추가합니다.
            var deleteButtonContainer = document.createElement('div');
            deleteButtonContainer.style.textAlign = 'center';
            var deleteButton = document.createElement('button');
            deleteButton.className = 'delete-btn';
            deleteButton.textContent = '삭제';
            deleteButton.onclick = function() {
                deleteInternBox(newInternBox); // 해당 인턴 박스를 삭제하는 함수
            };
            deleteButtonContainer.appendChild(deleteButton);
            newInternBox.appendChild(deleteButtonContainer);
        }


        // 인턴 박스를 삭제하는 함수
        function deleteInternBox(internBox) {
            internBox.parentNode.removeChild(internBox);
        }
        
        function addCurriculumBox(button) {
            var box = button.closest('.box'); // 가장 가까운 부모에서 'box' 클래스를 찾습니다.
            var newCurriculumBox = document.createElement('div');
            newCurriculumBox.className = 'curriculum-box'; // 새로운 div에 'curriculum-box' 클래스를 추가합니다.

            // 시각적 구분을 위한 구분선 추가
            var separator = document.createElement('hr');
            newCurriculumBox.appendChild(separator);

            var existingCurriculumBox = box.querySelector('.curriculum-box');
            var clonedCurriculumContent = existingCurriculumBox.cloneNode(true);
            newCurriculumBox.appendChild(clonedCurriculumContent);

            // 새로운 커리큘럼 박스 내의 모든 입력 및 텍스트 영역 요소의 값을 지웁니다.
            var inputs = newCurriculumBox.querySelectorAll('input, textarea');
            inputs.forEach(function(input) {
                input.value = ''; // 모든 입력 필드를 비웁니다.
            });

            box.insertBefore(newCurriculumBox, button.parentNode); // '추가하기' 버튼 전에 새로운 커리큘럼 박스를 삽입합니다.

            // 새로운 커리큘럼 박스에 삭제 버튼을 추가합니다.
            var deleteButtonContainer = document.createElement('div');
            deleteButtonContainer.style.textAlign = 'center';
            var deleteButton = document.createElement('button');
            deleteButton.className = 'delete-btn'; // 삭제 버튼에 클래스 추가
            deleteButton.textContent = '삭제'; // 버튼 텍스트 설정
            deleteButton.onclick = function() {
                deleteCurriculumBox(newCurriculumBox); // 커리큘럼 박스를 삭제하는 함수 호출
            };
            deleteButtonContainer.appendChild(deleteButton);
            newCurriculumBox.appendChild(deleteButtonContainer);
        }

        // 커리큘럼 박스를 삭제하는 함수
        function deleteCurriculumBox(curriculumBox) {
            curriculumBox.parentNode.removeChild(curriculumBox);
        }
        
        function updateFileNameAndExtension(inputElement, index) {
            var fullPath = inputElement.value;
            if (fullPath) {
                var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
                var filename = fullPath.substring(startIndex);
                if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
                    filename = filename.substring(1);
                }

                var dotIndex = filename.lastIndexOf('.');
                var fileName = filename.substring(0, dotIndex);
                var fileExtension = filename.substring(dotIndex + 1);

                document.getElementById('project_fname' + index).value = fileName;
                document.getElementById('project_extension' + index).value = fileExtension;
            }
        }
		
		document.addEventListener('DOMContentLoaded', function() {
		    // 이미 존재하는 모든 파일 입력 요소에 대해 이벤트 리스너를 추가합니다.
		    var existingFileInputs = document.querySelectorAll('input[type="file"]');
		    existingFileInputs.forEach(function(fileInput, index) {
		        // 첫 번째 프로젝트 박스의 인덱스는 1로 시작한다고 가정합니다.
		        var currentIndex = index;
		        fileInput.addEventListener('change', function(e) {
		            updateFileNameAndExtension(e.target, currentIndex);
		        });
		    });
		});
        
        var proidx = 1;
        
        function addProjectBox(button) {
        	proidx++;
            console.log(proidx);
            var box = button.closest('.box');
            var newProjectBox = document.createElement('div');
            newProjectBox.className = 'project-box';

            var separator = document.createElement('hr');
            newProjectBox.appendChild(separator);

            var existingProjectBox = box.querySelector('.project-box');
            var clonedProjectContent = existingProjectBox.cloneNode(true);
            newProjectBox.appendChild(clonedProjectContent);

            var inputs = newProjectBox.querySelectorAll('input, textarea');
            inputs.forEach(function(input) {
                input.value = ''; // 모든 입력 필드를 비웁니다.
                if (input.type === 'file') {
                    var newFileId = 'project_file' + proidx;
                    input.id = newFileId; // 새로운 id 값으로 설정합니다.
                    // 이벤트 리스너를 여기에서 추가합니다.
                    input.addEventListener('change', function(e) {
                        updateFileNameAndExtension(e.target, proidx);
                    });
                }
                if (input.type === 'hidden') {
                    if (input.id.startsWith('project_fname')) {
                        input.id = 'project_fname' + proidx; // project_fname의 새로운 id 값으로 설정
                    } else if (input.id.startsWith('project_extension')) {
                        input.id = 'project_extension' + proidx; // project_extension의 새로운 id 값으로 설정
                    }
                }
            });

            box.insertBefore(newProjectBox, button.parentNode);

            var deleteButtonContainer = document.createElement('div');
            deleteButtonContainer.style.textAlign = 'center';
            var deleteButton = document.createElement('button');
            deleteButton.className = 'delete-btn';
            deleteButton.textContent = '삭제';
            deleteButton.onclick = function() {
                deleteProjectBox(newProjectBox);
            };
            deleteButtonContainer.appendChild(deleteButton);
            newProjectBox.appendChild(deleteButtonContainer);
        }

        // 커리큘럼 박스를 삭제하는 함수
        function deleteProjectBox(ProjectBox) {
        	ProjectBox.parentNode.removeChild(ProjectBox);
        	proidx--;
        	console.log(proidx);
        }
        
        document.getElementById('addPortfolioButton').addEventListener('click', function() {
            var container = document.getElementById('potofolio_Fields'); // 동적 필드를 추가할 부모 컨테이너 ID

            var newDiv = document.createElement('div');
            newDiv.className = 'row align-items-center mt-2';

            // 파일 입력 필드 생성
            var newFileInput = document.createElement('input');
            newFileInput.type = 'file';
            newFileInput.className = 'box-style lbox p-0';
            newFileInput.name = 'portfolio_file[]'; // 파일을 배열 형태로 서버에 전송
            newDiv.appendChild(newFileInput);

            // 파일 이름을 저장할 숨김 필드 생성 (서버에서 처리 시 사용될 수 있음)
            var newFileNameInput = document.createElement('input');
            newFileNameInput.type = 'hidden';
            newFileNameInput.name = 'portfolio_fname[]';
            newDiv.appendChild(newFileNameInput);

            // 파일 확장자를 저장할 숨김 필드 생성 (서버에서 처리 시 사용될 수 있음)
            var newFileExtensionInput = document.createElement('input');
            newFileExtensionInput.type = 'hidden';
            newFileExtensionInput.name = 'portfolio_extension[]';
            newDiv.appendChild(newFileExtensionInput);

            // 파일 입력 필드에 이벤트 리스너 추가: 파일 선택 시 파일 이름, 확장자, 크기를 숨김 필드에 저장
            newFileInput.addEventListener('change', function(e) {
                if(e.target.files.length > 0) {
                    var file = e.target.files[0];
                    var fileName = file.name.substring(0, file.name.lastIndexOf('.'));
                    var fileExtension = file.name.substring(file.name.lastIndexOf('.') + 1);

                    newFileNameInput.value = fileName;
                    newFileExtensionInput.value = fileExtension;
                }
            });

         	// 삭제 버튼 컨테이너
            var deleteButtonContainer = document.createElement('div');
            deleteButtonContainer.className = 'text-center'; // 중앙 정렬을 위한 클래스 추가

            // 삭제 버튼 생성 및 설정
            var deleteButton = document.createElement('button');
            deleteButton.innerText = '삭제';
            deleteButton.type = 'button';
            deleteButton.className = 'delete-btn'; // 부트스트랩 클래스를 사용해 스타일 적용
            deleteButton.onclick = function() { newDiv.remove(); };
            deleteButtonContainer.appendChild(deleteButton);

            newDiv.appendChild(deleteButtonContainer);

            container.appendChild(newDiv);

        });
        
        
        
        function addAwardBox(button) {
            var box = button.closest('.box'); // 가장 가까운 부모에서 'box' 클래스를 찾습니다.
            var newAwardBox = document.createElement('div');
            newAwardBox.className = 'award-box'; // 새로운 div에 'curriculum-box' 클래스를 추가합니다.

            // 시각적 구분을 위한 구분선 추가
            var separator = document.createElement('hr');
            newAwardBox.appendChild(separator);

            var existingAwardBox = box.querySelector('.award-box');
            var clonedAwardContent = existingAwardBox.cloneNode(true);
            newAwardBox.appendChild(clonedAwardContent);

            // 새로운 커리큘럼 박스 내의 모든 입력 및 텍스트 영역 요소의 값을 지웁니다.
            var inputs = newAwardBox.querySelectorAll('input, textarea');
            inputs.forEach(function(input) {
                input.value = ''; // 모든 입력 필드를 비웁니다.
            });

            box.insertBefore(newAwardBox, button.parentNode); // '추가하기' 버튼 전에 새로운 커리큘럼 박스를 삽입합니다.

            // 새로운 커리큘럼 박스에 삭제 버튼을 추가합니다.
            var deleteButtonContainer = document.createElement('div');
            deleteButtonContainer.style.textAlign = 'center';
            var deleteButton = document.createElement('button');
            deleteButton.className = 'delete-btn'; // 삭제 버튼에 클래스 추가
            deleteButton.textContent = '삭제'; // 버튼 텍스트 설정
            deleteButton.onclick = function() {
                deleteAwardBox(newAwardBox); // 커리큘럼 박스를 삭제하는 함수 호출
            };
            deleteButtonContainer.appendChild(deleteButton);
            newAwardBox.appendChild(deleteButtonContainer);
        }

        // 커리큘럼 박스를 삭제하는 함수
        function deleteAwardBox(awardBox) {
            awardBox.parentNode.removeChild(awardBox);
        }
		
        function addGlobalexBox(button) {
            var box = button.closest('.box'); // 가장 가까운 부모에서 'box' 클래스를 찾습니다.
            var newGlobalexBox = document.createElement('div');
            newGlobalexBox.className = 'globalex-box'; // 새로운 div에 'curriculum-box' 클래스를 추가합니다.

            // 시각적 구분을 위한 구분선 추가
            var separator = document.createElement('hr');
            newGlobalexBox.appendChild(separator);

            var existingGlobalexBox = box.querySelector('.globalex-box');
            var clonedGlobalexContent = existingGlobalexBox.cloneNode(true);
            newGlobalexBox.appendChild(clonedGlobalexContent);

            // 새로운 커리큘럼 박스 내의 모든 입력 및 텍스트 영역 요소의 값을 지웁니다.
            var inputs = newGlobalexBox.querySelectorAll('input, textarea');
            inputs.forEach(function(input) {
                input.value = ''; // 모든 입력 필드를 비웁니다.
            });

            box.insertBefore(newGlobalexBox, button.parentNode); // '추가하기' 버튼 전에 새로운 커리큘럼 박스를 삽입합니다.

            // 새로운 커리큘럼 박스에 삭제 버튼을 추가합니다.
            var deleteButtonContainer = document.createElement('div');
            deleteButtonContainer.style.textAlign = 'center';
            var deleteButton = document.createElement('button');
            deleteButton.className = 'delete-btn'; // 삭제 버튼에 클래스 추가
            deleteButton.textContent = '삭제'; // 버튼 텍스트 설정
            deleteButton.onclick = function() {
                deleteGlobalexBox(newGlobalexBox); // 커리큘럼 박스를 삭제하는 함수 호출
            };
            deleteButtonContainer.appendChild(deleteButton);
            newGlobalexBox.appendChild(deleteButtonContainer);
        }

        // 커리큘럼 박스를 삭제하는 함수
        function deleteGlobalexBox(globalexBox) {
        	globalexBox.parentNode.removeChild(globalexBox);
        }
        
        function addLanguageBox(button) {
            var box = button.closest('.box'); // 가장 가까운 부모에서 'box' 클래스를 찾습니다.
            var newLanguageBox = document.createElement('div');
            newLanguageBox.className = 'language-box'; // 새로운 div에 'curriculum-box' 클래스를 추가합니다.

            // 시각적 구분을 위한 구분선 추가
            var separator = document.createElement('hr');
            newLanguageBox.appendChild(separator);

            var existingLanguageBox = box.querySelector('.language-box');
            var clonedLanguageContent = existingLanguageBox.cloneNode(true);
            newLanguageBox.appendChild(clonedLanguageContent);

            // 새로운 커리큘럼 박스 내의 모든 입력 및 텍스트 영역 요소의 값을 지웁니다.
            var inputs = newLanguageBox.querySelectorAll('input, textarea');
            inputs.forEach(function(input) {
                input.value = ''; // 모든 입력 필드를 비웁니다.
            });

            box.insertBefore(newLanguageBox, button.parentNode); // '추가하기' 버튼 전에 새로운 커리큘럼 박스를 삽입합니다.

            // 새로운 커리큘럼 박스에 삭제 버튼을 추가합니다.
            var deleteButtonContainer = document.createElement('div');
            deleteButtonContainer.style.textAlign = 'center';
            var deleteButton = document.createElement('button');
            deleteButton.className = 'delete-btn'; // 삭제 버튼에 클래스 추가
            deleteButton.textContent = '삭제'; // 버튼 텍스트 설정
            deleteButton.onclick = function() {
                deleteLanguageBox(newLanguageBox); // 커리큘럼 박스를 삭제하는 함수 호출
            };
            deleteButtonContainer.appendChild(deleteButton);
            newLanguageBox.appendChild(deleteButtonContainer);
        }

        // 커리큘럼 박스를 삭제하는 함수
        function deleteLanguageBox(languageBox) {
        	languageBox.parentNode.removeChild(languageBox);
        }
        
        function toggleContent(num) {
            var box = document.getElementById('contentBox'+num);
            box.classList.toggle('active');
        }
        
        document.addEventListener('DOMContentLoaded', function () {
		    var categoryButtons = document.querySelectorAll('.category1');
		
		    categoryButtons.forEach(function (button) {
		        button.addEventListener('click', function () {
		            // 현재 클릭한 버튼에 active 클래스 추가
		            if (!button.classList.contains('active')) {
		                // 모든 버튼의 active 클래스 제거 및 ">" 특수문자 삭제
		                categoryButtons.forEach(function (btn) {
		                    btn.classList.remove('active');
		                    btn.textContent = btn.textContent.replace(' >', '');
		                });
		                // 클릭한 버튼에 active 클래스 추가 및 ">" 특수문자 추가
		                button.classList.add('active');
		                button.innerHTML = button.innerHTML + ' >';
		            }
		        });
		    });
		});
        document.addEventListener("DOMContentLoaded", function() {
        	var subCategoryDivs = document.querySelectorAll('[id^="skill-scategory"]');
            subCategoryDivs.forEach(function(div) {
                div.style.display = 'none'; // 모든 서브 카테고리 div를 숨김
            });
            var categoryButtons = document.querySelectorAll('.category1');

            categoryButtons.forEach(function(button) {
                button.addEventListener('click', function() {
                    // 현재 클릭한 버튼의 id 추출
                    var categoryId = button.id;
                    // 해당하는 서브 카테고리 div의 id 설정
                    var subCategoryId = categoryId.replace('skill-category', 'skill-scategory');

                    // 모든 서브 카테고리 div를 숨김
                    var subCategoryDivs = document.querySelectorAll('[id^="skill-scategory"]');
                    subCategoryDivs.forEach(function(div) {
                        div.style.display = 'none';
                    });

                    // 현재 클릭한 버튼에 해당하는 서브 카테고리 div만 보이게 함
                    var currentSubCategoryDiv = document.getElementById(subCategoryId);
                    if (currentSubCategoryDiv) {
                        currentSubCategoryDiv.style.display = 'block';
                    }
                });
            });
        });
        
        document.addEventListener('DOMContentLoaded', function () {
            // 스킬 서브 카테고리 버튼에 대한 클릭 이벤트 처리
            var subCategoryButtons = document.querySelectorAll('.scategory1');
            subCategoryButtons.forEach(function (button) {
                button.addEventListener('click', function () {
                    var buttonValue = button.value;
                    button.classList.toggle('active'); // active 클래스 toggle 처리
                    if (button.classList.contains('active')) {
                        var newInput = document.createElement('input');
                        newInput.type = 'hidden';
                        newInput.value = button.textContent;
                        newInput.name = 'skill_sname[]';
                        var newButton = document.createElement('button');
                        newButton.textContent = button.textContent.trim();
                        newButton.classList.add('form-content-btn1');
                        var formContent = document.querySelector('.form-content1');
                        formContent.appendChild(newInput);
                        formContent.appendChild(newButton);
                    } else {
                        var buttonText = button.textContent.trim();
                        var filterSaveButtons = document.querySelectorAll('.form-content1 button');
                        filterSaveButtons.forEach(function (filterButton) {
                            if (filterButton.textContent.trim() === buttonText) {
                                // 버튼을 삭제할 때 해당하는 hidden input 태그도 함께 삭제
                                var valueToRemove = filterButton.textContent.trim();
                                var hiddenInputToRemove = document.querySelector('input[value="' + valueToRemove + '"]');
                                if (hiddenInputToRemove) {
                                    hiddenInputToRemove.remove();
                                }
                                filterButton.remove();
                            }
                        });
                    }
                });
            });
        });

        	
        document.addEventListener('DOMContentLoaded', function () {
            // form-content 내 버튼 클릭 시 이벤트 처리
            document.querySelector('.form-content1').addEventListener('click', function (event) {
                if (event.target && event.target.classList.contains('form-content-btn1')) {
                    // 클릭된 버튼의 텍스트 값을 가져옵니다.
                    var buttonText = event.target.textContent.trim();
                    
                    // 클릭된 버튼의 텍스트 값과 동일한 서브 카테고리 버튼을 찾습니다.
                    var scategoryButtons = document.querySelectorAll('.scategory1');
                    scategoryButtons.forEach(function (button) {
                        if (button.textContent.trim() === buttonText) {
                            // 찾은 서브 카테고리 버튼에서 active 클래스를 제거합니다.
                            button.classList.remove('active');
                        }
                    });
                    
                    // 클릭된 버튼의 텍스트 값과 동일한 hidden input 태그를 찾아 제거합니다.
                    var hiddenInputs = document.querySelectorAll('input[value="' + buttonText + '"]');
                    hiddenInputs.forEach(function (input) {
                        input.remove();
                    });
                    
                    // 클릭된 버튼을 제거합니다.
                    event.target.remove();
                }
            });
        });

        document.addEventListener('DOMContentLoaded', function () {
            // Add event listener to dynamically created filter-save-btn buttons
            document.querySelector('.form-content1').addEventListener('click', function (event) {
                if (event.target && event.target.classList.contains('form-content-btn1')) {
                    // Remove the clicked button from its parent element
                    event.target.parentNode.removeChild(event.target);

                    // Get the text content of the clicked filter-save-btn button
                    var buttonText = event.target.textContent.trim();
                    // Find the corresponding scategory button with the same text content
                    var scategoryButtons = document.querySelectorAll('.scategory1');
                    scategoryButtons.forEach(function (button) {
                        if (button.textContent.trim() === buttonText) {
                            // Remove the active class from the corresponding scategory button
                            button.classList.remove('active');
                        }
                    });
                    
                    // 클릭된 버튼의 텍스트 값과 동일한 hidden input 태그를 찾아 제거합니다.
                    var hiddenInputs = document.querySelectorAll('input[value="' + buttonText + '"]');
                    hiddenInputs.forEach(function (input) {
                        input.remove();
                    });
                }
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // 스킬 서브 카테고리 버튼에 대한 클릭 이벤트 처리
            var subCategoryButtons = document.querySelectorAll('.scategory2');
            subCategoryButtons.forEach(function (button) {
                button.addEventListener('click', function () {
                    var buttonValue = button.value;
                    button.classList.toggle('active'); // active 클래스 toggle 처리
                    if (button.classList.contains('active')) {
                        var newInput = document.createElement('input');
                        newInput.type = 'hidden';
                        newInput.value = button.textContent;
                        newInput.name = 'certificate_sname[]';
                        var newButton = document.createElement('button');
                        newButton.textContent = button.textContent.trim();
                        newButton.classList.add('form-content-btn2');
                        var formContent = document.querySelector('.form-content2');
                        formContent.appendChild(newInput);
                        formContent.appendChild(newButton);
                    } else {
                        var buttonText = button.textContent.trim();
                        var filterSaveButtons = document.querySelectorAll('.form-content2 button');
                        filterSaveButtons.forEach(function (filterButton) {
                            if (filterButton.textContent.trim() === buttonText) {
                                // 버튼을 삭제할 때 해당하는 hidden input 태그도 함께 삭제
                                var valueToRemove = filterButton.textContent.trim();
                                var hiddenInputToRemove = document.querySelector('input[value="' + valueToRemove + '"]');
                                if (hiddenInputToRemove) {
                                    hiddenInputToRemove.remove();
                                }
                                filterButton.remove();
                            }
                        });
                    }
                });
            });
        });
        
        
        

        	
        document.addEventListener('DOMContentLoaded', function () {
            // form-content 내 버튼 클릭 시 이벤트 처리
            document.querySelector('.form-content2').addEventListener('click', function (event) {
                if (event.target && event.target.classList.contains('form-content-btn2')) {
                    // 클릭된 버튼의 텍스트 값을 가져옵니다.
                    var buttonText = event.target.textContent.trim();
                    
                    // 클릭된 버튼의 텍스트 값과 동일한 서브 카테고리 버튼을 찾습니다.
                    var scategoryButtons = document.querySelectorAll('.scategory2');
                    scategoryButtons.forEach(function (button) {
                        if (button.textContent.trim() === buttonText) {
                            // 찾은 서브 카테고리 버튼에서 active 클래스를 제거합니다.
                            button.classList.remove('active');
                        }
                    });
                    
                    // 클릭된 버튼의 텍스트 값과 동일한 hidden input 태그를 찾아 제거합니다.
                    var hiddenInputs = document.querySelectorAll('input[value="' + buttonText + '"]');
                    hiddenInputs.forEach(function (input) {
                        input.remove();
                    });
                    
                    // 클릭된 버튼을 제거합니다.
                    event.target.remove();
                }
            });
        });

        document.addEventListener('DOMContentLoaded', function () {
            // Add event listener to dynamically created filter-save-btn buttons
            document.querySelector('.form-content2').addEventListener('click', function (event) {
                if (event.target && event.target.classList.contains('form-content-btn2')) {
                    // Remove the clicked button from its parent element
                    event.target.parentNode.removeChild(event.target);

                    // Get the text content of the clicked filter-save-btn button
                    var buttonText = event.target.textContent.trim();
                    // Find the corresponding scategory button with the same text content
                    var scategoryButtons = document.querySelectorAll('.scategory2');
                    scategoryButtons.forEach(function (button) {
                        if (button.textContent.trim() === buttonText) {
                            // Remove the active class from the corresponding scategory button
                            button.classList.remove('active');
                        }
                    });
                    
                    // 클릭된 버튼의 텍스트 값과 동일한 hidden input 태그를 찾아 제거합니다.
                    var hiddenInputs = document.querySelectorAll('input[value="' + buttonText + '"]');
                    hiddenInputs.forEach(function (input) {
                        input.remove();
                    });
                }
            });
        });
        
		function toggleActiveClass(checkbox) {
		    var container = checkbox.parentNode; // 체크박스를 감싸고 있는 div 요소 선택
		    if (checkbox.checked) {
		        checkbox.classList.add('active'); // 체크박스에 active 클래스 추가
		        container.classList.add('active'); // 해당 div 요소에 active 클래스 추가
		        if (checkbox.id === 'checkbox4') {
		            var disabledDropdown = document.getElementById('disabled-dropdown');
		            disabledDropdown.disabled = false;
		            disabledDropdown.textContent = "장애 등급 선택";
		            disabledDropdown.style.backgroundColor = '';
		            disabledDropdown.style.color = '';
		            document.getElementById('disabled').value = "";
		        } else if (checkbox.id === 'checkbox5') {
		            var militaryDropdown = document.getElementById('military-dropdown');
		            militaryDropdown.disabled = false;
		            militaryDropdown.textContent = "병역 선택";
		            militaryDropdown.style.backgroundColor = '';
		            militaryDropdown.style.color = '';
		            document.getElementById('military').value = "";
		        }
		    } else {
		        checkbox.classList.remove('active'); // 체크박스에서 active 클래스 제거
		        container.classList.remove('active'); // 해당 div 요소에서 active 클래스 제거
		        if (checkbox.id === 'checkbox4') {
		            var disabledDropdown = document.getElementById('disabled-dropdown');
		            disabledDropdown.disabled = true;
		            disabledDropdown.textContent = "장애 등급 선택";
		            disabledDropdown.style.backgroundColor = '';
		            disabledDropdown.style.color = '';
		            document.getElementById('disabled').value = "";
		        } else if (checkbox.id === 'checkbox5') {
		            var militaryDropdown = document.getElementById('military-dropdown');
		            militaryDropdown.disabled = true;
		            militaryDropdown.textContent = "병역 선택";
		            militaryDropdown.style.backgroundColor = '';
		            militaryDropdown.style.color = '';
		            document.getElementById('military').value = "";
		        }
		    }
		}
        
		function submitResume() {
			//var formData = new FormData(document.getElementById("companyForm"));
			formData = document.resumeFrm;
		    //formData.append("resume_name", document.getElementById("resume_name_modal").value);
		    formData.resume_name.value = document.getElementById("resume_name_modal").value;
		    formData.submit();
			
		    $('#titleModal').modal('hide'); // 모달 닫기
		}
        
        document.addEventListener("DOMContentLoaded", function() {
            var projectsyearDropdown = document.getElementById("project_syear[]");
            var projecteyearDropdown = document.getElementById("project_eyear[]");
            var awardsyearDropdown = document.getElementById("award_syear[]");
            var globalexsyearDropdown = document.getElementById("globalex_syear[]");
            var globalexeyearDropdown = document.getElementById("globalex_eyear[]");
            
            
            var currentYear = new Date().getFullYear();

            for (var i = currentYear - 60; i <= currentYear; i++) {
                var projectsoption = document.createElement("option");
                var projecteoption = document.createElement("option");
                var awardsoption = document.createElement("option")
                var globalexsoption = document.createElement("option");
                var globalexeoption = document.createElement("option")
                
                awardsoption.text = i;
                awardsoption.value = i;
                
                globalexsoption.text = i;
                globalexsoption.value = i;
                
                globalexeoption.text = i;
                globalexeoption.value = i;
                
                awardsyearDropdown.appendChild(awardsoption);
                
                globalexsyearDropdown.appendChild(globalexsoption);
                globalexeyearDropdown.appendChild(globalexeoption);
            }
        });
        document.addEventListener("DOMContentLoaded", function() {
            // 현재 연도를 가져옵니다.
            var currentYear = new Date().getFullYear();

            // 문서에서 모든 시작연도와 종료연도 선택 요소를 찾습니다.
            var startYearSelects = document.querySelectorAll(".intern-syear");
            var endYearSelects = document.querySelectorAll(".intern-eyear");

            // 각 시작연도 선택 요소에 대해 실행합니다.
            startYearSelects.forEach(function(selectElement) {
                // 지난 60년간의 연도를 추가합니다.
                for (var i = currentYear - 60; i <= currentYear; i++) {
                    var option = document.createElement("option");
                    option.text = i;
                    option.value = i;
                    selectElement.appendChild(option);
                }
            });

            // 각 종료연도 선택 요소에 대해 실행합니다.
            endYearSelects.forEach(function(selectElement) {
                // 지난 60년간의 연도를 추가합니다.
                for (var i = currentYear - 60; i <= currentYear; i++) {
                    var option = document.createElement("option");
                    option.text = i;
                    option.value = i;
                    selectElement.appendChild(option);
                }
            });
        });	
        document.addEventListener("DOMContentLoaded", function() {
            // 현재 연도를 가져옵니다.
            var currentYear = new Date().getFullYear();

            // 문서에서 모든 시작연도와 종료연도 선택 요소를 찾습니다.
            var startYearSelects = document.querySelectorAll(".curriculum-syear");
            var endYearSelects = document.querySelectorAll(".curriculum-eyear");

            // 각 시작연도 선택 요소에 대해 실행합니다.
            startYearSelects.forEach(function(selectElement) {
                // 지난 60년간의 연도를 추가합니다.
                for (var i = currentYear - 60; i <= currentYear; i++) {
                    var option = document.createElement("option");
                    option.text = i;
                    option.value = i;
                    selectElement.appendChild(option);
                }
            });

            // 각 종료연도 선택 요소에 대해 실행합니다.
            endYearSelects.forEach(function(selectElement) {
                // 지난 60년간의 연도를 추가합니다.
                for (var i = currentYear - 60; i <= currentYear; i++) {
                    var option = document.createElement("option");
                    option.text = i;
                    option.value = i;
                    selectElement.appendChild(option);
                }
            });
        });	
        </script>
</body>
</html>