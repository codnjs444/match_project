<!-- resume.jsp -->
<%@page import="match.category.certificate_categoryBean"%>
<%@page import="match.category.skill_categoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="sMgr" class="match.category.skill_categoryMgr"/>
<jsp:useBean id="sBean" class="match.category.skill_categoryBean"/>
<jsp:useBean id="cMgr" class="match.category.certificate_categoryMgr"/>
<jsp:useBean id="cBean" class="match.category.certificate_categoryBean"/>
<%
	String skillname[] = {"개발자 언어", "개발자 기술", "그래픽 디자인", "편집", "음악 및 사운드 편집", "애니메이션", "UI/UX 디자인", "3D 모델링 및 디자인", "일러스트레이션", "사진 편집", "비디오 및 영상 제작", "음악 제작 및 오디오 엔지니어링", "글쓰기 및 편집", "디지털 마케팅", "사업 관리 및 프로젝트 관리", "사진 및 비주얼 콘텐츠 제작", "사회 연결망 및 네트워킹", "온라인 교육 및 교육 기술", "헬스 및 피트니스", "온라인 쇼핑 및 전자상거래", "어학 및 언어 학습", "요리 및 조리", "여행 및 여행 계획", "자기 계발 및 심리학", "음악 감상 및 스트리밍", "온라인 커뮤니티 및 포럼", "자동화 및 생산성 도구", "환경 및 지속 가능성"};
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이력서 작성</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
		.right-btn{
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
		/* 모달 스타일 */
        .modal {
            display: none; /* 기본적으로 숨김 */
            position: fixed; /* 위치 설정 */
            z-index: 1; /* 위로 배치 */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.4); /* 배경색과 투명도 조절 */
        }

        /* 모달 콘텐츠 스타일 */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 모달 콘텐츠가 화면 중앙에 위치하도록 설정 */
            padding: 20px;
            border: 1px solid #888;
            width: 800px; /* 너비 설정 */
            height: 350px; /* 높이 설정 */
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
            position: relative; /* 닫기 버튼 위치 설정을 위해 상대 위치 지정 */
            align-items: center;
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
        .preffer-check{
        	width: 20px;
        	height: 20px;
        	margin-left: 13px;
        	margin-top: 16px;
        }
	</style>
</head>
<body>
<%@ include file="top.jsp" %>
	<div class="resume">
		<form name="resumeFrm" method="post" action="resumeProc.jsp">
			<div class="fixed-left resume-side row ms-0">
				<div class="left-img"></div>
				<div class="left-name">한우진</div>
				<div class="left-info">
					
				</div>
			</div>
			
			<div class="resume-center">
				<div class="title">자기소개</div>
				<div class="stitle">당신은 어떤 사람인가요? (한 줄 소개)</div>
				<input class="input-box" type="text" name="intro1">
				<div class="stitle">당신의 꿈, 목표와 비전에 대해 기술해주세요.</div>
				<input class="input-box" type="text" name="intro2">
				<div class="stitle">당신의 가치관에 대해 기술해주세요.</div>
				<input class="input-box" type="text" name="intro3">
				
				<div class="title">학력</div>
				<div class="box">
					<div class="edu-box">
						<div class="row">
							<div class="box-style sbox p-0">
								<div class="dropdown">
						            <button class="box-style sbox-con dropdown-toggle" type="button" id="edu-type-dropdown" data-bs-toggle="dropdown" aria-expanded="false">
						                학력 유형 선택
						            </button>
						            <div class="dropdown-menu">
						                <a class="dropdown-item" href="#" onclick="selectEdu('검정고시', event)">검정고시</a>
						                <a class="dropdown-item" href="#" onclick="selectEdu('고등학교 졸업', event)">고등학교 졸업</a>
						                <a class="dropdown-item" href="#" onclick="selectEdu('대학교 졸업(2~3년)', event)">대학교 졸업(2~3년)</a>
						                <a class="dropdown-item" href="#" onclick="selectEdu('대학교 졸업(4년)', event)">대학교 졸업(4년)</a>
						                <a class="dropdown-item" href="#" onclick="selectEdu('대학원 졸업(석사)', event)">대학원 졸업(석사)</a>
						                <a class="dropdown-item" href="#" onclick="selectEdu('대학원 졸업(박사)', event)">대학원 졸업(박사)</a>
						                <input type="hidden" id="edu_type[]" name="edu_type[]" value="">
						            </div>
						        </div>
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="edu_school[]" name="edu_school[]" placeholder="학교명">
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="edu_major[]" name="edu_major[]" placeholder="전공명">
							</div>
						</div>
						<div class="row">
							<span class="stext">입학년월</span>
							<div class="box-style msbox p-0">
								<input type="datetime-Local" id="edu_syear[]" name="edu_syear[]" class="box-style msbox-con">
							</div>
							<span class="stext">졸업년월</span>
							<div class="box-style msbox p-0">
								<input type="datetime-Local" id="edu_eyear[]" name="edu_eyear[]" class="box-style msbox-con">
							</div>
							<div class="box-style sbox p-0">
								<div class="dropdown">
						            <button class="box-style sbox-con dropdown-toggle" type="button" id="status-dropdown" data-bs-toggle="dropdown" aria-expanded="false">
						                재학 상태 선택
						            </button>
						            <div class="dropdown-menu">
						                <a class="dropdown-item" href="#" onclick="selectStatus('재학', event)">재학</a>
						                <a class="dropdown-item" href="#" onclick="selectStatus('졸업 예정', event)">졸업 예정</a>
						                <a class="dropdown-item" href="#" onclick="selectStatus('졸업', event)">졸업</a>
						                <input type="hidden" id="status[]" name="status[]" value="">
						            </div>
						        </div>
							</div>
						</div>
					</div>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addEduBox(this)">추가하기</button>
					</div>
				</div>
				
				<div class="title">경력</div>
				<div class="box">
					<div class="career-box">
						<div class="row">
							<div class="box-style sbox p-0">
								<input class="box-style sbox-con" type="text" id="career_cname[]" name="career_cname[]" placeholder="회사명">
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="career_dep[]" name="career_dep[]" placeholder="부서명">
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="career_job[]" name="career_job[]" placeholder="담당 직무">
							</div>
						</div>
						<div class="row">
							<span class="stext">입사년월</span>
							<div class="box-style msbox p-0">
								<input type="datetime-Local" id="career_syear[]" name="career_syear[]" class="box-style msbox-con">
							</div>
							<span class="stext">퇴사년월</span>
							<div class="box-style msbox p-0">
								<input type="datetime-Local" id="career_eyear[]" name="career_eyear[]" class="box-style msbox-con">
							</div>
						</div>
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea class="lbox-con box-style" id="career_duty[]" name="career_duty[]" placeholder="담당 업무"></textarea>
							</div>
						</div>
					</div>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addCareerBox(this)">추가하기</button>
					</div>
				</div>
				<div class="title">인턴, 대외 활동</div>
				<div class="box">
					<div class="intern-box">
						<div class="row">
							<div class="box-style sbox p-0">
								<div class="dropdown">
						            <button class="box-style sbox-con dropdown-toggle" type="button" id="intern-dropdown" data-bs-toggle="dropdown" aria-expanded="false">
						                활동 구분
						            </button>
						            <div class="dropdown-menu">
						                <a class="dropdown-item" href="#" onclick="selectIntern('인턴',event)">인턴</a>
						                <a class="dropdown-item" href="#" onclick="selectIntern('아르바이트',event)">아르바이트</a>
						                <a class="dropdown-item" href="#" onclick="selectIntern('동아리',event)">동아리</a>
						                <a class="dropdown-item" href="#" onclick="selectIntern('자원봉사',event)">자원봉사</a>
						                <a class="dropdown-item" href="#" onclick="selectIntern('사회활동',event)">사회활동</a>
						                <a class="dropdown-item" href="#" onclick="selectIntern('교내활동',event)">교내활동</a>
						                <a class="dropdown-item" href="#" onclick="selectIntern('기타',event)">기타</a>
						                <input type="hidden" id="intern_type[]" name="intern_type[]" value="">
						            </div>
						        </div>
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="intern_cname[]" name="intern_cname[]" placeholder="기관 이름">
							</div>
							<span class="sstext p-0">시작연도</span>
							<select id="intern_syear[]" name="intern_syear[]" class="box-style ssbox p-0">
								<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
							</select>
							<span class="sstext p-0">종료연도</span>
							<select id="intern_eyear[]" name="intern_eyear[]" class="box-style ssbox p-0">
								<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
							</select>
						</div>
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea class="lbox-con box-style" id="intern_duty[]" name="intern_duty[]" placeholder="활동 내용 (직무와 관련된 경험에 대해 작성해주세요.)"></textarea>
							</div>
						</div>			
					</div>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addInternBox(this)">추가하기</button>
					</div>
				</div>
				<div class="title">교육 이수</div>
				<div class="box">
					<div class="curriculum-box">
						<div class="row">
							<div class="box-style sbox p-0">
								<input class="box-style sbox-con" type="text" id="curriculum_name[]" name="curriculum_name[]" placeholder="교육 명">
							</div>
							<div class="box-style mbox p-0">
								<input class="box-style mbox-con" type="text" id="curriculum_cname[]" name="curriculum_cname[]" placeholder="기관 이름">
							</div>
							<span class="sstext p-0">시작연도</span>
							<select id="curriculum_syear[]" name="curriculum_syear[]" class="box-style ssbox p-0">
								<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
							</select>
							<span class="sstext p-0">종료연도</span>
							<select id="curriculum_eyear[]" name="curriculum_eyear[]" class="box-style ssbox p-0">
								<!-- 연도 옵션은 JavaScript로 동적으로 추가됩니다. -->
							</select>
						</div>
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea class="lbox-con box-style" id="curriculum_content[]" name="curriculum_content[]" placeholder="활동 내용 (이수하신 교육 과정에 대해 작성해주세요.)"></textarea>
							</div>
						</div>	
					</div>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addCurriculumBox(this)">추가하기</button>
					</div>
				</div>
				<div class="title">스킬</div>
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
						                	sBean = vlist.get(i);
						                %>
						                	<button class="scategory scategory1" type="button"><%=sBean.getSkill_sname()%></button>
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
								<div class="col form-content1"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="title">자격증</div>
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
								<div class="col form-content2"></div>
							</div>
						</div>
					</div>
				</div>
        		
				<div class="title">프로젝트</div>
				<div class="box">
					<div class="project-box">
						<div class="row">
							<div class="box-style lbox p-0">
								<input type="text" class="box-style lbox-con" id="" name="" placeholder="프로젝트를 추가해주세요." readonly>
							</div>
						</div>
					</div>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addProjectBox(this)">추가하기</button>
					</div>
				</div>
				
				<div class="title">포트폴리오</div>
				<div class="box">
					<div class="portfolio-box1">
						<div class="row">
							<div class="box-style lbox p-0">
								<textarea class="box-style lbox-con" id="url[]" name="url[]" placeholder="포트폴리오 url을 입력해주세요."></textarea>
							</div>
						</div>
					</div>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addPortfolioBox1(this)">추가하기</button>
					</div>
					<hr>
					<div class="portfolio-box2">
						<div class="row">
							<div class="box-style lbox p-0">
								<input class="box-style lbox-con" type="file" id="file[]" name="file[]" onclick="" placeholder="파일을 선택해주세요.">
							</div>
						</div>
					</div>
					<div class="row m-0">
						<button class="add-btn mx-auto" type="button" onclick="addPortfolioBox2(this)">추가하기</button>
					</div>
				</div>
				
				<div class="title">수상내역</div>
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
				<div class="title">해외경험</div>
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
				<div class="title">어학</div>
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
				<div class="title">취업우대</div>
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
				<div class="right-content"></div>
				<button class="right-btn" type="submit" onclick="submitResume()">저장</button>
			</div>
		</form>
	</div>
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script>
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
        
        
        function addPortfolioBox1(button) {
            var box = button.closest('.box'); // 가장 가까운 부모에서 'box' 클래스를 찾습니다.
            var newPortfolioBox = document.createElement('div');
            newPortfolioBox.className = 'portfolio-box1'; // 새로운 div에 'curriculum-box' 클래스를 추가합니다.

            // 시각적 구분을 위한 구분선 추가
            var separator = document.createElement('hr');
            newPortfolioBox.appendChild(separator);

            var existingPortfolioBox = box.querySelector('.portfolio-box1');
            var clonedPortfolioContent = existingPortfolioBox.cloneNode(true);
            newPortfolioBox.appendChild(clonedPortfolioContent);

            // 새로운 커리큘럼 박스 내의 모든 입력 및 텍스트 영역 요소의 값을 지웁니다.
            var inputs = newPortfolioBox.querySelectorAll('input, textarea');
            inputs.forEach(function(input) {
                input.value = ''; // 모든 입력 필드를 비웁니다.
            });

            box.insertBefore(newPortfolioBox, button.parentNode); // '추가하기' 버튼 전에 새로운 커리큘럼 박스를 삽입합니다.

            // 새로운 커리큘럼 박스에 삭제 버튼을 추가합니다.
            var deleteButtonContainer = document.createElement('div');
            deleteButtonContainer.style.textAlign = 'center';
            var deleteButton = document.createElement('button');
            deleteButton.className = 'delete-btn'; // 삭제 버튼에 클래스 추가
            deleteButton.textContent = '삭제'; // 버튼 텍스트 설정
            deleteButton.onclick = function() {
                deletePortfolioBox1(newPortfolioBox); // 커리큘럼 박스를 삭제하는 함수 호출
            };
            deleteButtonContainer.appendChild(deleteButton);
            newPortfolioBox.appendChild(deleteButtonContainer);
        }

        // 커리큘럼 박스를 삭제하는 함수
        function deletePortfolioBox1(portfolioBox) {
            portfolioBox.parentNode.removeChild(portfolioBox);
        }
        
        function addPortfolioBox2(button) {
            var box = button.closest('.box'); // 가장 가까운 부모에서 'box' 클래스를 찾습니다.
            var newPortfolioBox = document.createElement('div');
            newPortfolioBox.className = 'portfolio-box2'; // 새로운 div에 'curriculum-box' 클래스를 추가합니다.

            // 시각적 구분을 위한 구분선 추가
            var separator = document.createElement('hr');
            newPortfolioBox.appendChild(separator);

            var existingPortfolioBox = box.querySelector('.portfolio-box2');
            var clonedPortfolioContent = existingPortfolioBox.cloneNode(true);
            newPortfolioBox.appendChild(clonedPortfolioContent);

            // 새로운 커리큘럼 박스 내의 모든 입력 및 텍스트 영역 요소의 값을 지웁니다.
            var inputs = newPortfolioBox.querySelectorAll('input, textarea');
            inputs.forEach(function(input) {
                input.value = ''; // 모든 입력 필드를 비웁니다.
            });

            box.insertBefore(newPortfolioBox, button.parentNode); // '추가하기' 버튼 전에 새로운 커리큘럼 박스를 삽입합니다.

            // 새로운 커리큘럼 박스에 삭제 버튼을 추가합니다.
            var deleteButtonContainer = document.createElement('div');
            deleteButtonContainer.style.textAlign = 'center';
            var deleteButton = document.createElement('button');
            deleteButton.className = 'delete-btn'; // 삭제 버튼에 클래스 추가
            deleteButton.textContent = '삭제'; // 버튼 텍스트 설정
            deleteButton.onclick = function() {
                deletePortfolioBox2(newPortfolioBox); // 커리큘럼 박스를 삭제하는 함수 호출
            };
            deleteButtonContainer.appendChild(deleteButton);
            newPortfolioBox.appendChild(deleteButtonContainer);
        }

        // 커리큘럼 박스를 삭제하는 함수
        function deletePortfolioBox2(portfolioBox) {
            portfolioBox.parentNode.removeChild(portfolioBox);
        }
        
        
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
        
        function submitResume(){
        	document.resumeFrm.submit();
        }
        
        document.addEventListener("DOMContentLoaded", function() {
            var internsyearDropdown = document.getElementById("intern_syear[]");
            var interneyearDropdown = document.getElementById("intern_eyear[]");
            var curriculumsyearDropdown = document.getElementById("curriculum_syear[]");
            var curriculumeyearDropdown = document.getElementById("curriculum_eyear[]");
            var projectsyearDropdown = document.getElementById("project_syear[]");
            var projecteyearDropdown = document.getElementById("project_eyear[]");
            var awardsyearDropdown = document.getElementById("award_syear[]");
            var globalexsyearDropdown = document.getElementById("globalex_syear[]");
            var globalexeyearDropdown = document.getElementById("globalex_eyear[]");
            
            
            var currentYear = new Date().getFullYear();

            for (var i = currentYear - 60; i <= currentYear; i++) {
                var internsoption = document.createElement("option");
                var interneoption = document.createElement("option");
                var curriculumsoption = document.createElement("option");
                var curriculumeoption = document.createElement("option");
                var projectsoption = document.createElement("option");
                var projecteoption = document.createElement("option");
                var awardsoption = document.createElement("option")
                var globalexsoption = document.createElement("option");
                var globalexeoption = document.createElement("option")
                
                internsoption.text = i;
                internsoption.value = i;
                
                interneoption.text = i;
                interneoption.value = i;
                
                curriculumsoption.text = i;
                curriculumsoption.value = i;
                
                curriculumeoption.text = i;
                curriculumeoption.value = i;
                
                awardsoption.text = i;
                awardsoption.value = i;
                
                globalexsoption.text = i;
                globalexsoption.value = i;
                
                globalexeoption.text = i;
                globalexeoption.value = i;
                
                internsyearDropdown.appendChild(internsoption);
                interneyearDropdown.appendChild(interneoption);
                
                curriculumsyearDropdown.appendChild(curriculumsoption);
                curriculumeyearDropdown.appendChild(curriculumeoption);
                
                awardsyearDropdown.appendChild(awardsoption);
                
                globalexsyearDropdown.appendChild(globalexsoption);
                globalexeyearDropdown.appendChild(globalexeoption);
            }
        });
	</script>
</body>
</html>