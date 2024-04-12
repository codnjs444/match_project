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
<jsp:useBean id="rMgr" class="match.ResumeMgr"/>
<jsp:useBean id="uBean" class="match.UserBean"/>
<jsp:useBean id="rBean" class="match.ResumeBean"/>

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
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이력서 열람</title>
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
				height: 100px;
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
			        
		</style>
	</head>
	<body>
		<%@include file="../user_page/user_top.jsp" %>
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
			<div class="fixed-left resume-side row ms-0">
				<label class="left-img"></label>
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
				<div class="title"><%=rBean.getResume_name()%></div>
				<div class="title" id="introInfo">자기소개</div>
				<div class="stitle">당신은 어떤 사람인가요? (한 줄 소개)</div>
				<input class="input-box" type="text" id="intro1" name="intro1" value="<%=rBean.getSelf_intro1()%>" readonly>
				<div class="stitle">당신의 꿈, 목표와 비전에 대해 기술해주세요.</div>
				<input class="input-box" type="text" id="intro2" name="intro2" value="<%=rBean.getSelf_intro2()%>" readonly>
				<div class="stitle">당신의 가치관에 대해 기술해주세요.</div>
				<input class="input-box" type="text" id="intro3" name="intro3" value="<%=rBean.getSelf_intro3()%>" readonly>
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
								<input class="box-style mbox-con" type="text" id="edu_school[]" name="edu_school[]" placeholder="학교명" value="<%=edu.getEdu_school()%>" readonly>
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="edu_major[]" name="edu_major[]" placeholder="전공명" value="<%=edu.getEdu_major()%>" readonly>
							</div>
						</div>
						<div class="row">
							<span class="stext">입학년월</span>
							<div class="box-style msbox p-0">
								<input type="month" id="edu_syear[]" name="edu_syear[]" class="box-style msbox-con" value="<%=edu.getEdu_syear()%>" readonly>
							</div>
							<span class="stext">졸업년월</span>
							<div class="box-style msbox p-0">
								<input type="month" id="edu_eyear[]" name="edu_eyear[]" class="box-style msbox-con" value="<%=edu.getEdu_eyear()%>" readonly>
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
				</div>
				
				<div class="title" id="careerInfo">경력</div>
				<div class="box">
				<%for(CareerBean career : careerList) {%>
					<div class="career-box">
						<div class="row">
							<div class="box-style sbox p-0">
								<input class="box-style sbox-con" type="text" id="career_cname[]" name="career_cname[]" placeholder="회사명" value="<%=career.getCareer_cname()%>" readonly>
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="career_dep[]" name="career_dep[]" placeholder="부서명" value="<%=career.getCareer_dep()%>" readonly>
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="career_job[]" name="career_job[]" placeholder="담당 직무" value="<%=career.getCareer_job()%>" readonly>
							</div>
						</div>
						<div class="row">
							<span class="stext">입사년월</span>
							<div class="box-style msbox p-0">
								<input type="month" id="career_syear[]" name="career_syear[]" class="box-style msbox-con" value="<%=career.getCareer_syear()%>" readonly>
							</div>
							<span class="stext">퇴사년월</span>
							<div class="box-style msbox p-0">
								<input type="month" id="career_eyear[]" name="career_eyear[]" class="box-style msbox-con" value="<%=career.getCareer_eyear()%>" readonly>
							</div>
						</div>
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea class="lbox-con box-style" id="career_duty[]" name="career_duty[]" placeholder="담당 업무" readonly><%=career.getCareer_duty()%></textarea>
							</div>
						</div>
					</div>
					<hr>
					<%} %>
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
								<input class="box-style mbox-con" type="text" id="intern_cname[]" name="intern_cname[]" placeholder="기관 이름" value="<%=intern.getInternship_cname()%>" readonly>
							</div>
							<span class="sstext p-0">시작연도</span>
							<select name="intern_syear[]" class="box-style ssbox p-0 intern-syear">
								<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
							</select>
							<span class="sstext p-0">종료연도</span>
							<select name="intern_eyear[]" class="box-style ssbox p-0 intern-eyear">
								<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
							</select>
						</div>
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea class="lbox-con box-style" id="intern_duty[]" name="intern_duty[]" placeholder="활동 내용 (직무와 관련된 경험에 대해 작성해주세요.)" readonly><%=intern.getInternship_duty()%></textarea>
							</div>
						</div>			
					</div>
					<hr>
					<%
					}
					%>
				</div>
				<div class="title" id="curriculumInfo">교육 이수</div>
				<div class="box">
				<%
					for(CurriculumBean curriculum : curriculumList){
				%>
					<div class="curriculum-box">
						<div class="row">
							<div class="box-style sbox p-0">
								<input class="box-style sbox-con" type="text" id="curriculum_name[]" name="curriculum_name[]" placeholder="교육 명" value="<%=curriculum.getCurriculum_name()%>" readonly>
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="curriculum_cname[]" name="curriculum_cname[]" placeholder="기관 이름" value="<%=curriculum.getCurriculum_cname()%>" readonly>
							</div>
							<span class="sstext p-0">시작연도</span>
							<select name="curriculum_syear[]" class="box-style ssbox p-0 curriculum-syear">
								<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
							</select>
							<span class="sstext p-0">종료연도</span>
							<select name="curriculum_eyear[]" class="box-style ssbox p-0 curriculum-eyear">
								<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
							</select>
						</div>
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea class="lbox-con box-style" id="curriculum_content[]" name="curriculum_content[]" placeholder="활동 내용 (이수하신 교육 과정에 대해 작성해주세요.)" readonly><%=curriculum.getCurriculum_content()%></textarea>
							</div>
						</div>	
					</div>
					<hr>
					<%
					}
					%>
				</div>
				<div class="title" id="skillInfo">스킬</div>
				<div class="box">
					<div class="skill-box">
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
								<input type="text" id="project_duty[]" name="project_duty[]" class="box-style lbox-con">
							</div>
						</div>
					</div>
				</div>
				
				<div class="title" id="portfolioInfo">포트폴리오</div>
				<div class="box2">
					<div class="portfolio-box" id="potofolio_Fields">
					    <div class="row">

					    </div>
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
			</div>
		</div>
	</body>
</html>