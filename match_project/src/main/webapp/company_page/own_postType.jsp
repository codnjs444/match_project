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
<jsp:useBean id="cMgr" class="match.category.certificate_categoryMgr"/>
<jsp:useBean id="cBean" class="match.category.certificate_categoryBean"/>
<jsp:useBean id="jMgr" class="match.category.job_categoryMgr"/>
<jsp:useBean id="jBean" class="match.category.job_categoryBean"/>
<jsp:useBean id="sMgr" class="match.category.skill_categoryMgr"/>
<jsp:useBean id="sBean" class="match.category.skill_categoryBean"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
String jobname[] = {"기획·전략","마케팅·홍보·조사","회계·세무·재무","인사·노무·HRD","총무·법무·사무","IT개발·데이터","디자인","영업·판매·무역","고객상담·TM","구매·자재·물류"};
String skillname[] = {"개발자 언어", "개발자 기술", "그래픽 디자인", "편집", "음악 및 사운드 편집", "애니메이션", "UI/UX 디자인", "3D 모델링 및 디자인", "일러스트레이션", "사진 편집", "비디오 및 영상 제작", "음악 제작 및 오디오 엔지니어링", "글쓰기 및 편집", "디지털 마케팅", "사업 관리 및 프로젝트 관리", "사진 및 비주얼 콘텐츠 제작", "사회 연결망 및 네트워킹", "온라인 교육 및 교육 기술", "헬스 및 피트니스", "온라인 쇼핑 및 전자상거래", "어학 및 언어 학습", "요리 및 조리", "여행 및 여행 계획", "자기 계발 및 심리학", "음악 감상 및 스트리밍", "온라인 커뮤니티 및 포럼", "자동화 및 생산성 도구", "환경 및 지속 가능성"};

Vector<certificate_categoryBean> certificateList = cMgr.certificatenameList();

//스킬 이름을 저장할 배열 생성
String[] data = new String[certificateList.size()];
for (int i = 0; i < certificateList.size(); i++) {
 data[i] = certificateList.get(i).getCertificate_name().toLowerCase();
}

%>

<title>Announcement Form with Bootstrap</title>
<!-- 최신 버전의 부트스트랩 CSS 추가 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
body {
    background-color: #F8F8F8;
}

.custom-bte {
        background-color: #606060; /* 버튼의 배경색을 파란색으로 지정 */
        color: white; /* 버튼 텍스트 색상을 흰색으로 지정 */
}
    
.title {
    font-size: 16px;
    font-weight: bold;
    color: blue; /* 파란색으로 설정 */
    margin-bottom: 10px; /* 아래 여백 설정 */
    margin-top: 20px; /* 위 여백 설정 */
}

.stitle {
    font-size: 18px;
    font-weight: bolder;
    margin-bottom: 10px;
    margin-top: 10px;
}

/* 흰색 박스 스타일 */
.box {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

/* (기업명)라벨과 입력 필드 크기 및 간격 수정 */
.question {
    font-size: 16px; /* 라벨 텍스트 크기 조정 */
    margin-bottom: 10px; /* 라벨 아래 여백 조정 */
    font-weight: bolder;
    margin-left: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
}
.questionsub {
    font-size: 16px; /* 라벨 텍스트 크기 조정 */
    margin-bottom: 10px; /* 라벨 아래 여백 조정 */
    font-weight: bolder;
    margin-left: 60px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
    color: gray; /* 폰트 색상 변경 */
}

.input {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    width: 500px;
    height: 40px;
    margin-right: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
}
.input_rtime {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    width: 500px;
    height: 40px;
}
.input_ltime {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    width: 500px;
    height: 40px;
}
.inputplus {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    width: 500px;
    height: auto; /* 높이 자동 조절 */
    max-height: 200px; /* 최대 높이 설정 */
    overflow-y: auto; /* 내용이 넘칠 경우 스크롤 생성 */
    border: 1px solid black; /* 경계선 표시 */
    margin-right: 10px; /* 오른쪽 여백 */
    display: flex; /* flexbox 모델 적용 */
    flex-wrap: wrap; /* 내용이 넘칠 경우 다음 줄로 */
    align-items: flex-start; /* 내용 상단 정렬 */
}

.input_num {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    width: 300px;
    height: 40px;
    margin-right: 210px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
}
.input_all {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    width: 670px;
    height: 40px;
    margin-right: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
    margin-left: 10px;
}
.addbtn {
    /* 원하는 스타일 속성을 여기에 추가하세요 */
    background-color: #606060; /* 배경색을 파란색으로 변경 */
    color: white; /* 글꼴 색상을 흰색으로 변경 */
    border: 2px solid black; /* 테두리 스타일을 추가 */
    border-radius: 5px; /* 버튼의 모서리를 둥글게 만듭니다 */
    padding: 3px 16px; /* 내부 여백을 추가하여 버튼 크기 조정 */
    font-size: 12px; /* 글꼴 크기를 변경 */
    cursor: pointer; /* 커서 모양을 포인터로 변경하여 버튼을 클릭할 때 표시되는 모양을 변경 */
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
/* 선택한 버튼이 마우스로 클릭되었을 때의 스타일 */
.addbtn:active {
    background-color: darkblue; /* 클릭시 배경색을 진한 파란색으로 변경 */
}

.toggle_btn {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    background-color: white;
    border-color: grey;
    width: 500px;
    height: 40px;
    margin-right: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
    color: grey;
    font-size: 17px;
    text-align: left;
}

.toggle_btn_skill {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    background-color: white;
    border-color: grey;
    width: 500px;
    height: 40px;
    margin-right: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
    color: grey;
    font-size: 17px;
    text-align: left;
    margin-top: 10px;
}

.input_noq {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    width: 500px;
    height: 40px;
    margin-left: 180px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
    margin-right: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
}

/* 필수 */
.essential {
    font-size: 12px; /* 필수 문구 텍스트 크기 조정 */
    color: red; /* 빨간색으로 설정 */
}
.essential_money {
    font-size: 12px; /* 필수 문구 텍스트 크기 조정 */
    color: black; /* 빨간색으로 설정 */
}
.essential_date {
    font-size: 12px; /* 필수 문구 텍스트 크기 조정 */
    color: black; /* 빨간색으로 설정 */
    margin-left: 50px;
}
.modal-dialog {
    margin-top: 400px; /* 원하는 위치로 조절 */
}
/* ------------------------------------------------------------------------------ */
/* [지원자 자격 요건_경력 여부 버튼] */
.btn-group {
  width: 500px;
  height: 40px;
  align-items: center;
  margin-right: 10px; /* 오른쪽 여백 줄이기 */
}
.btn-group .btn {
  flex: 1;
  background-color: white; /* 버튼 배경색 */
  color: grey; /* 버튼 텍스트 색상 */
}


.btn-group .btn.active {
  background-color: #606060; /* 눌렸을 때의 배경색 */
}

.btn-group .btn.active:hover {
  background-color: #0056b3; /* 마우스 호버 또는 포커스 시 배경색 */
}
/* ------------------------------------------------------------------------------ */
.direct-input {
    display: flex; /* flexbox 모델 적용 */
    justify-content: space-between; /* 컨테이너 내부 요소들 사이에 공간을 균등하게 배분 */
    margin-top: 10px; /* 상단 여백 추가 */
    margin-bottom: 10px; /* 하단 여백 추가 */
}
.selfbtn {
    padding: 10px 15px; /* 버튼 내부 여백 조정 */
    font-size: 14px; /* 폰트 크기 조정 */
    border-radius: 5px; /* 버튼의 모서리 둥글기 조정 */
}
.direct-input input {
            flex: 1;
            margin-right: 10px;
            margin-left: 10px;
            width: 85%; /* 입력 필드의 너비 조정 */
}

.direct-input button {
            width: 15%; /* 버튼의 너비 조정 */
            background-color: 606060;
                        margin-right: 10px;
            border-color: 606060;
}

#qualification_skill {
    width: 500px; /* 필요에 따라 조절 */
    height: 80px; /* 자동 높이 조절 */
    overflow-y: auto; /* 세로 스크롤바가 필요할 때만 나타남 */
    resize: none; /* 사용자가 크기 조절 못하도록 함 */
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    margin-left: 180px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
    margin-right: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
}
.dropdown-menu {
    max-height: 270px; /* 드롭다운 메뉴의 최대 높이 */
    overflow-y: auto; /* 내용이 넘칠 경우 세로 스크롤바 표시 */
    z-index: 1050; /* .Postsidebar보다 높은 값을 설정 */
}
.procedure-container .row .col {
    padding-left: 46px; /* 오른쪽 패딩을 추가하여 요소들을 우측으로 조금 이동시킵니다. */
}
.fixed-bottom-right {
    position: fixed; /* 고정 위치 */
    bottom: 300px;    /* 하단에서 20px의 여백 */
    right: 70px;     /* 우측에서 20px의 여백 */
    z-index: 1000;   /* 다른 요소들 위에 표시 */
}

.button-container {
    bottom: 20px; /* 하단에서 20px 떨어진 위치 */
    margin-right: 30px;
    z-index: 1000; /* 다른 요소들 위에 표시되도록 z-index 설정 */
}


.Postsidebar {
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



</style>
</head>
<body>
<div class="container mt-10">
    <!-- 좌측 레이아웃 -->
    <form name="companyForm" action="own_post_proc.jsp" method="GET">
    <div class="row">
        <div class="col-md-8 offset-md-2"> <!-- 왼쪽으로 옮길 컨테이너 -->
            <div class="title" id="MycompanyInfo">기업 정보</div>
            <div class="stitle">기업 정보를 확인해주세요.</div>
            <div class="box">
                <!-- 기업명 텍스트와 텍스트 필드 -->
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">기업명</label>
                        </div>
                        <span class="essential">[필수]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
                            <input type="text" class="input" id="posting_cname" name="posting_cname">
                        </div>
                    </div>
                    
                    <!-- 대표 근무지역 입력 -->
                    <div class="row align-items-center"  style="margin-bottom: 10px;">
                        <div class="col ">
                            <label for="companyAdress" class="question">대표 근무지역</label>
                        </div>
                        <span class="essential">[필수]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
                            <input type="text" class="input" id="posting_pcode" name="posting_pcode" placeholder="우편번호" >
                            <input type="button" class="btn-search" onclick="execDaumPostcode()" value="우편번호 찾기">  
                        </div>
                    </div>       
                    <!-- 회사주소와 상세주소 입력 -->
                    <div class="row">
                        <div class="col">
                            <input type="text" class="input_noq" id="posting_address" name="posting_address" placeholder="회사주소" readonly >
                        </div>
                        <div class="col">
                            <input type="text" class="input_noq" id="posting_dcode" name="posting_dcode" placeholder="상세주소" >    
                            <input type="hidden" name="posting_name">
                        </div>
                    </div>
            </div>
            <!-- 모집 정보 -->
            <div class="title" id="MyrecruitmentInfo">모집 정보</div>
            <div class="stitle">어떤 일을 담당할 직원을 찾으시나요</div>
            <div class="box">
                <!-- 기업명 텍스트와 텍스트 필드 -->

                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">모집분야명</label>
                        </div>
                        <span class="essential">[필수]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
							<div class="dropdown">
						      <button class="toggle_btn" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						       모집 분야를 선택해주세요.
						      </button>
						      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="width: 900px;">
						        <div class="row">
						          <!-- 좌측 메뉴 -->
						          <div class="col-md-6 pr-0 border-right">
						            <h6 class="dropdown-header">좌측 메뉴</h6>
						            <div class="row">
						              <div class="col-md-6">
						                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu1', event)">기획·전략</a>
						              </div>
						              <div class="col-md-6">
						                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu2', event)">마케팅·홍보·조사</a>
						              </div>
						              <div class="col-md-6">
						                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu3', event)">회계·세무·재무</a>
						              </div>
						              <div class="col-md-6">
						                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu4', event)">인사·노무·HRD</a>
						              </div>
						              <div class="col-md-6">
						                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu5', event)">총무·법무·사무</a>
						              </div>
						              <div class="col-md-6">
						                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu6', event)">IT개발·데이터</a>
						              </div>
						              <div class="col-md-6">
						                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu7', event)">디자인</a>
						              </div>   
						              <div class="col-md-6">
						                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu8', event)">영업·판매·무역</a>
						              </div>		
						              <div class="col-md-6">
						                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu8', event)">고객상담·TM</a>
						              </div>
						              <div class="col-md-6">
						                <a class="dropdown-item" href="#" onclick="changeRightMenu('menu8', event)">구매·자재·물류</a>
						              </div>	                                 
						            </div>
						          </div>
                        <!-- 우측 메뉴 -->
                        <div class="col-md-6" id="right-menu" style="max-height: 300px; overflow-y: auto;">
                            <h6 class="dropdown-header">우측 메뉴</h6>
                            <!-- 우측 메뉴의 내용을 미리 정의 -->
                            <%
                               for(int i = 1; i < 11; i++){
                            %>
                                  <div id="menu<%=i%>" style="display: none;">
                                      <div class="row">
                                          <% 
                                              Vector<job_categoryBean> vlist = jMgr.jobsnameList(jobname[i-1]);
                                              
                                              // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
                                              for (job_categoryBean menuItem : vlist) {
                                          %>
                                          <div class="col-md-6">
												<a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%= menuItem.getJob_sname() %>', event)"><%= menuItem.getJob_sname() %></a>
                                          </div>
                                          <% 
                                              }
                                          %>
                                      </div>
                                  </div>
                            <%
                               }
                            %>      
								
						             <input type="hidden" name="selectedMenuItem" id="selectedMenuItem">
						          </div>
						        <input type="hidden" id="openposition_name" name="openposition_name">
						        
						        </div>
						      </div>
						    </div>
                        </div>           
                    </div>
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">담당 업무</label>
                        </div>
                        <div class="col">
                            <input type="text" class="input" id="openposition_duty" name="openposition_duty">
                        </div>
                    </div>
                     <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">모집 인원</label>
                        </div>
                        <div class="col">
                           <!-- 숫자 입력을 위한 필드 (type을 "text"로 유지) -->
							<input type="text" class="input_num" id="openposition_num" name="openposition_num" placeholder="모집하는 인원 수를 입력해주세요.">
                        </div>
                    </div> 
                    
                    <div class="row align-items-center">
			            <div class="col">
			                <label class="question">부서</label>
			            </div>           
			            <div class="col checkbox-container">
			                <input type="checkbox" id="openposition_snameToggle" onchange="toggleField('openposition_sname')">
			            </div>
			            <div class="col">
			                <input type="text" class="form-control input" id="openposition_sname" name="openposition_sname" placeholder="근무 부서를 입력하세요." readonly>
			            </div>
		        	</div>
		        	
		        	<div class="row align-items-center">
			            <div class="col">
			                <label class="question">직급</label>
			            </div>           
			            <div class="col">
						    <div class="dropdown">
						        <button class="toggle_btn" type="button" id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						            귀사의 직급/직책을 선택해주세요.
						        </button>
						        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
						        	<a class="dropdown-item" href="#" onclick="selectPosition('무관',event)">무관</a>
						            <a class="dropdown-item" href="#" onclick="selectPosition('사원급',event)">사원급</a>
						            <a class="dropdown-item" href="#" onclick="selectPosition('대리급',event)">주임~대리급</a>
						            <a class="dropdown-item" href="#" onclick="selectPosition('과장~차장급',event)">과장~차장급</a>
						            <a class="dropdown-item" href="#" onclick="selectPosition('부장급',event)">부장급</a>
						            <a class="dropdown-item" href="#" onclick="selectPosition('임원~CEO급',event)">임원~CEO급</a>
						            <!-- 추가적으로 필요한 직급/직책 항목을 여기에 추가 -->        
						            <!-- 숨겨진 입력 필드를 openpositionForm에 추가 -->
									<input type="hidden" id="openposition_position" name="openposition_position" value="">
						        </div>
						    </div>
						</div>
		        	</div>                     
            </div>
            
            <div class="title" id="Myqualification">지원 자격 요건</div>
            <div class="stitle">지원자 자격 요건은 어떻게 되나요?</div>
            <div class="box">
                <!-- 지원자격 학력 -->
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">지원자 학력</label>
                        </div>
                        <span class="essential">[필수]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
                          <div class="dropdown">
						        <button class="toggle_btn" type="button" id="dropdownMenuButton3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						            요구하는 지원자의 학력을 선택해주세요.
						        </button>
						        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton3">
									<a class="dropdown-item" href="#" onclick="selectEdutype('학력 무관', event)">학력 무관</a>
									<a class="dropdown-item" href="#" onclick="selectEdutype('검정고시', event)">검정고시</a>
									<a class="dropdown-item" href="#" onclick="selectEdutype('고등학교 졸업', event)">고등학교 졸업</a>
						            <a class="dropdown-item" href="#" onclick="selectEdutype('대학 졸업(2,3년)', event)">대학 졸업(2,3년)</a>
						            <a class="dropdown-item" href="#" onclick="selectEdutype('대학 졸업(4년)', event)">대학 졸업(4년)</a>
						            <a class="dropdown-item" href="#" onclick="selectEdutype('대학 졸업(4년 예정자)', event)">대학 졸업(4년 예정자)</a>
						            <a class="dropdown-item" href="#" onclick="selectEdutype('석사 졸업', event)">석사 졸업</a>
						            <a class="dropdown-item" href="#" onclick="selectEdutype('박사 졸업', event)">박사 졸업</a>
						            <!-- 추가적으로 필요한 직급/직책 항목을 여기에 추가 -->        
						            <!-- 숨겨진 입력 필드를 openpositionForm에 추가 -->
									<input type="hidden" id="qualification_edutype" name="qualification_edutype" value="">
						        </div>
						    </div>
                        </div>  
                    </div>
                <!-- 지원자격 성별 -->
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">지원자 성별</label>
                        </div>
                        <div class="col">
                          <div class="dropdown">
						        <button class="toggle_btn" type="button" id="dropdownMenuButton4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						            성별을 선택하세요.
						        </button>
						        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton4">
									<a class="dropdown-item" href="#" onclick="selectGender('성별무관', event)">성별무관</a>
									<a class="dropdown-item" href="#" onclick="selectGender('남성', event)">남성</a>
									<a class="dropdown-item" href="#" onclick="selectGender('여성', event)">여성</a>
						            <!-- 숨겨진 입력 필드를 openpositionForm에 추가 -->
									<input type="hidden" id="qualification_gender" name="qualification_gender" value="">
						        </div>
						    </div>
                        </div>  
                    </div>
                    
					<div class="row align-items-center">
					    <div class="col">
					        <label for="companyName" class="question">경력 여부</label>
					    </div>
					    <span class="essential">[필수]</span> <!-- 필수 문구 추가 -->
					    <div class="col">
					        <!-- 버튼 그룹을 좌측으로 정렬하는 부분 -->
					        <div class="btn-group btn-group-toggle" data-toggle="buttons" style="text-align: left;"> 
					            <label class="btn btn-secondary active">
					                <input type="radio" name="qualification_experience" id="noExperience" value="경력 무관" checked> 경력 무관
					            </label>
					            <label class="btn btn-secondary">
					                <input type="radio" name="qualification_experience" id="newcomer" value="신입"> 신입
					            </label>
					            <label class="btn btn-secondary">
					                <input type="radio" name="qualification_experience" id="experienced" value="경력"> 경력
					            </label>
					        </div>
					    </div>
					</div>
					                    <hr>
					<div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">요구 스킬</label>
                        </div>
                        <div class="col">
							<div class="dropdown">
						      <button class="toggle_btn_skill" type="button" id="skilldrop" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						       요구하는 스킬 사항을 선택해주세요.
						      </button>
						      <div class="dropdown-menu" aria-labelledby="skilldrop" style="width: 1100px; weight: 600px;">
						        <div class="row">
						  
							<!-- 좌측 메뉴 -->
							<div class="col-md-6 pr-0 border-right" style="max-height: 600px; overflow-y: auto;">
							    <h6 class="dropdown-header">좌측 메뉴</h6>
						    <div class="row">
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill1', event)">개발자 언어</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill2', event)">개발자 기술</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill3', event)">그래픽 디자인</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill4', event)">편집</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill5', event)">음악 및 사운드 편집</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill6', event)">애니메이션</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill7', event)">UI/UX 디자인</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill8', event)">3D 모델링 및 디자인</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill9', event)">일러스트레이션</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill10', event)">사진 편집</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill11', event)">비디오 및 영상 제작</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill12', event)">음악 제작 및 오디오 엔지니어링</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill13', event)">글쓰기 및 편집</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill14', event)">디지털 마케팅</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill15', event)">사업 관리 및 프로젝트 관리</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill16', event)">사진 및 비주얼 콘텐츠 제작</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill17', event)">사회 연결망 및 네트워킹</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill18', event)">온라인 교육 및 교육 기술</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill19', event)">헬스 및 피트니스</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill20', event)">온라인 쇼핑 및 전자상거래</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill21', event)">어학 및 언어 학습</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill22', event)">요리 및 조리</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill23', event)">여행 및 여행 계획</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill24', event)">자기 계발 및 심리학</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill25', event)">음악 감상 및 스트리밍</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill26', event)">온라인 커뮤니티 및 포럼</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill27', event)">자동화 및 생산성 도구</a>
						        </div>
						        <div class="col-md-6">
						            <a class="dropdown-item" href="#" onclick="changeRightSkill('skill28', event)">환경 및 지속 가능성</a>
						        </div>
						    </div>
						</div>

                        <!-- 우측 메뉴 -->
                        <div class="col-md-6" id="right-skill" style="max-height: 600px; overflow-y: auto;">
                            <h6 class="dropdown-header">우측 메뉴</h6>
                            <!-- 우측 메뉴의 내용을 미리 정의 -->
                            <%
                               for(int i = 1; i < 11; i++){
                            %>
                                  <div id="skill<%=i%>" style="display: none;">
                                      <div class="row">
                                          <% 
                                              Vector<skill_categoryBean> vlist = sMgr.skillsnameList(skillname[i-1]);
                                              
                                              // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
                                              for (skill_categoryBean menuItem : vlist) {
                                          %>
                                          <div class="col-md-6">
												<a class="dropdown-item" href="#" onclick="selectRightSkillItem('<%=menuItem.getSkill_sname()%>', event)"><%=menuItem.getSkill_sname()%></a>
                                          </div>
                                          <% 
                                              }
                                          %>
                                      </div>
                                  </div>
                            <%
                               }
                            %>      
						          </div>
<!-- 						        <input type="hidden" id="qualification_skill" name="qualification_skill"> -->				        
						        </div>
						      </div>
						    </div>
                        </div>           
                    </div>
                    
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="questionsub">선택 된 스킬</label>
                        </div>
						<div class="col">
						    <div class="inputplus" id="selectedSkillsDisplay" style="border: 1px solid black;"></div>
						    <input type="hidden" id="qualification_skill" name="selectedSkills">
						</div>
                    </div>
                    <hr>
					<!-- 지원자격 학력 -->
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">요구 자격증</label>
                        </div>
                        <div class="col">
							<div class="dropdown">
							    <button class="toggle_btn" type="button" id="certificatedropBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							        요구하는 자격증 사항을 선택해주세요.
							    </button>
							    <div class="dropdown-menu" aria-labelledby="certificatedropBtn">
							        <input type="text" class="form-control" id="certificateSearch" placeholder="검색...">
							        <div id="certificateList">
							            <!-- 드롭다운 항목들이 여기에 동적으로 삽입됩니다. -->
							        </div>
							    </div>
							</div>
							<input type="hidden" id="qualification_certificate" name="qualification_certificate" value="">
                        </div>  
					<div class="row align-items-center">
					    <div class="col">
					        <label for="companyName" class="questionsub">선택 된 자격증</label>
					    </div>
					    <div class="col">
					        <div class="inputplus" id="selectedCertificatesDisplay" style="border: 1px solid black;"></div>
					        <input type="hidden" id="qualification_certificate" name="qualification_certificate">
					    </div>
					</div>

                    </div>
           </div>      
       
           <div class="title" id="MyworkEnvironment">근무 환경</div>
            <div class="stitle">근무환경은 어떻게 되나요?</div>
            <div class="box">
                <!-- 연봉 받기 -->
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">연봉/급여</label>
                        </div>
                        <span class="essential_money">[최소 금액]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
                            <input type="number" class="input" id="environment_minsalary" name="environment_minsalary" placeholder="만원">               
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">     </label>
                        </div>
                        <span class="essential_money">[최대 금액]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
                            <input type="number" class="input" id="environment_maxsalary" name="environment_maxsalary" placeholder="만원">
                        </div>
                    </div>                       
                    <div class="row align-items-center">
					    <div class="col">
					        <label for="companyName" class="question">고용 형태</label>
					    </div>
					    <span class="essential">필수</span> <!-- 필수 문구 추가 -->
					    <div class="col">
					        <div class="btn-group btn-group-toggle" data-toggle="buttons" style="text-align: left;"> 
					            <label class="btn btn-secondary active">
					                <input type="radio" name="environment_type" id="noExperience" value="정규직" checked> 정규직
					            </label>
					            <label class="btn btn-secondary">
					                <input type="radio" name="environment_type" id="newcomer" value="계약직"> 계약직
					            </label>
					            <label class="btn btn-secondary">
					                <input type="radio" name="environment_type" id="experienced" value="알바"> 알바
					            </label>
					            <label class="btn btn-secondary">
					                <input type="radio" name="environment_type" id="go1" value="파견직"> 파견직
					            </label>
					            <label class="btn btn-secondary">
					                <input type="radio" name="environment_type" id="go12" value="인턴"> 인턴
					            </label>
					        </div>  
					    </div>
					</div>
					<div class="row align-items-center">
					    <div class="col">
					        <label for="companyName" class="question">근무 요일</label>
					    </div>
					    <div class="col">
                          	<div class="dropdown">
						        <button class="toggle_btn_skill" type="button" id=dropworkingdayBtn data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						            귀사의 근무 요일을 입력해주세요.
						        </button>
						        <div class="dropdown-menu" aria-labelledby="dropworkingdayBtn">
									<a class="dropdown-item" href="#" onclick="selectDay('주말', event)">주말</a>
									<a class="dropdown-item" href="#" onclick="selectDay('주 3일', event)">주 3일</a>
									<a class="dropdown-item" href="#" onclick="selectDay('주 4일', event)">주 4일</a>      
						        	<a class="dropdown-item" href="#" onclick="selectDay('주 5일(월~금)',event)">주 5일(월~금)</a>      
						            <a class="dropdown-item" href="#" onclick="selectDay('주 5일(재택근무)',event)">주 5일(재택근무)</a>	         
						            <!-- 숨겨진 입력 필드를 openpositionForm에 추가 -->
									<input type="hidden" id="working_day" name="working_day" value="">
						        </div>
                        	</div>  					        
					    </div>
					</div>
					<div class="row align-items-center">
					    <div class="col">
					        <label for="companyName" class="question">근무 시간</label>
					    </div>
					    <div class="col">
                          	<div class="dropdown">
						        <button class="toggle_btn_skill" type="button" id=dropworkinghourBtn data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						            귀사의 근무 시간을 입력해주세요.
						        </button>
						        <div class="dropdown-menu" aria-labelledby="dropworkinghourBtn">
						        	<a class="dropdown-item" href="#" onclick="selectHour('오전', event)">오전</a>
						        	<a class="dropdown-item" href="#" onclick="selectHour('오후',event)">오후</a>
						        	<a class="dropdown-item" href="#" onclick="selectHour('저녁',event)">저녁</a>
						        	<a class="dropdown-item" href="#" onclick="selectHour('새벽',event)">새벽</a>
						        	<a class="dropdown-item" href="#" onclick="selectHour('오전~오후',event)">오전~오후</a>
						        	<a class="dropdown-item" href="#" onclick="selectHour('오후~저녁',event)">오후~저녁</a>
						        	<a class="dropdown-item" href="#" onclick="selectHour('저녁~새벽',event)">저녁~새벽</a>
						        	<a class="dropdown-item" href="#" onclick="selectHour('새벽~오전',event)">새벽~오전</a>
						        	<a class="dropdown-item" href="#" onclick="selectHour('종일'),event">종일</a>
						        	<a class="dropdown-item" href="#" onclick="selectHour('시간협의'),event">시간협의</a>
         
						            <!-- 숨겨진 입력 필드를 openpositionForm에 추가 -->
									<input type="hidden" id="working_hour" name="working_hour" value="">
						        </div>
                        	</div>  					        
					    </div>
					</div>
            </div> <!-- 박스 -->
            <div class="title" id="MywelfareBenefits">복리후생</div>
            <div class="stitle">복지 및 혜택은 어떻게 되나요?</div>
			<div class="box">
			    <div class="row align-items-center welfare" id="welfareFields">
			        <div class="col">
			            <input type="text" class="input_all" name="Welfare_content[]" placeholder="귀사의 복지, 혜택에 대해 작성해주세요.">
			        </div>
			    </div>
			    <div class="row justify-content-center"> <!-- 여기에 justify-content-center 클래스를 추가 -->
			        <div class="col-auto"> <!-- col-auto로 변경하여 버튼의 너비에 맞게 컬럼 크기 조정 -->
			            <button type="button" id="addWelfareField" class="addbtn">추가 작성</button>
			        </div>
			    </div>
			</div> <!-- 복리 후생 박스 -->
			
			<div class="title" id="MyhiringProcess">채용 절차</div>
            <div class="stitle">채용 절차는 어떻게 되나요?</div>
            <div class="box">
                <!-- 기업명 텍스트와 텍스트 필드 -->
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">접수기간</label>
                        </div>
                        <span class="essential_money">[시작 날짜]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
					      	<input type="datetime-Local" id="application_sdatetime" name="application_sdatetime" class="input">
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">    </label>
                        </div>
                        <span class="essential_money">[종료 날짜]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
					      	<input type="datetime-Local" id="application_edatetime" name="application_edatetime" class="input">
                        </div>
                    </div>
                    <hr/>
                <!-- 기업명 텍스트와 텍스트 필드 -->
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">전형 절차</label>
                        </div>
                        <span class="essential">[필수]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
					      	<input type="text" class="input" id="procedure_name[]" name="procedure_name[]" placeholder="서류 전형">
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">    </label>
                        </div>
                        <span class="essential_money">[시작 기간]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
					      	<input type="datetime-Local" id="procedure_sdatetime[]" name="procedure_sdatetime[]" class="input">
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">    </label>
                        </div>
                        <span class="essential_money">[종료 기간]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
					      	<input type="datetime-Local" id="procedure_edatetime[]" name="procedure_edatetime[]" class="input">
                        </div>
                    </div>
                    <hr/>
				    <div class="row justify-content-center"> <!-- 여기에 justify-content-center 클래스를 추가 -->
				        <div class="col-auto"> <!-- col-auto로 변경하여 버튼의 너비에 맞게 컬럼 크기 조정 -->
				            <button type="button" id="addProcedureBtn" class="addbtn">절차 추가</button>
				        </div>
				    </div>
				    <hr/>    
				                    <!-- 기업명 텍스트와 텍스트 필드 -->
					<div class="row align-items-center">
					    <div class="col">
					        <label for="procedure_final" class="question">최종 합격</label>
					    </div>
					    <span class="essential">[필수]</span> <!-- 필수 문구 추가 -->
					    <div class="col">
					        <input type="text" class="input" id="procedure_final" name="procedure_name[]" value="최종 합격" readonly>
					    </div>
					</div>
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">    </label>
                        </div>
                        <span class="essential_money">[마감 기간]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
					      	<input type="datetime-Local" id="procedure_edatetime[]" name="procedure_edatetime[]" class="input">
                        </div>
                    </div>

            </div> <!-- 채용 절차 박스 -->

            <div class="title" id="MyadditionalSubmission">추가 제출사항</div>
            <div class="stitle">자사만의 추가 질문 혹은 추가 제출 자료가 있나요?</div>
			<div class="box">
			    <div class="row align-items-center addquestion" id="addquestion_Fields">
			        <div class="col">
			            <input type="text" class="input_all" name="addquestion_question[]" placeholder="추가 질문 사항을 작성해주세요.">
			        </div>
			    </div>
			    <div class="row justify-content-center"> <!-- 여기에 justify-content-center 클래스를 추가 -->
			        <div class="col-auto"> <!-- col-auto로 변경하여 버튼의 너비에 맞게 컬럼 크기 조정 -->
			            <button type="button" id="addaddquestion_Fields" class="addbtn">질문 추가</button>
			        </div>
			    </div>
			    <hr/>
			    <div class="row align-items-center adddocument" id="adddocument_Fields">
			        <div class="col">
			            <input type="text" class="input_all" name="adddocument_document[]" placeholder="추가 제출 파일을 작성해주세요.">
			        </div>
			    </div>
			    <div class="row justify-content-center"> <!-- 여기에 justify-content-center 클래스를 추가 -->
			        <div class="col-auto"> <!-- col-auto로 변경하여 버튼의 너비에 맞게 컬럼 크기 조정 -->
			            <button type="button" id="addadddocument_Fields" class="addbtn">파일 추가</button>
			        </div>
			    </div>
			</div> <!-- 추가 제출 사항 박스 -->
			<div class="container">
			    <div class="row justify-content-center mt-4">
			        <div class="col-auto">
			            <!-- 등록하기 버튼 -->
			            <button id="registerButton" type="button" class="addbtn_rlast" onclick="submitForm()">등록하기</button>
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
		    <!-- 등록 완료 버튼에 margin-bottom을 추가하여 다음 버튼과의 간격을 띄웁니다 -->
		    <button id="registerButton1" type="button" class="addbtn22" style="margin-bottom: 10px;">등록완료</button>
		    <!-- 임시저장 버튼 -->
		    <button type="button" class="addbtn22">임시저장</button>
		    
		    <div class="Postsidebar">
		    
		    <ul>
		        <li><a href="#MycompanyInfo">기업 정보</a></li>
		        <li><a href="#MyrecruitmentInfo">모집 정보</a></li>
		        <li><a href="#Myqualification">지원 자격 요건</a></li>
		        <li><a href="#MyworkEnvironment">근무 환경</a></li>
		        <li><a href="#MywelfareBenefits">복리후생</a></li>
		        <li><a href="#MyhiringProcess">채용 절차</a></li>
		        <li><a href="#MyadditionalSubmission">추가 제출 사항</a></li>
		    </ul>
</div>
		    
		</div>

        </div>
		</form>
</div>

<!-- 등록 완료 모달 -->
<div class="modal fade" id="titleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">공고 제목 입력</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="titleForm" method="get" action="post_proc.jsp">
        <div class="modal-body">
          <input type="text" class="form-control" id="posting_name_modal" name="posting_name" placeholder="제목 입력">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" onclick="submitAnnouncement()">확인</button>
        </div>
      </form>
    </div>
  </div>
</div>



<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// [모집 정보_부서, 직급 관련 기능] 
	// 박스 클릭 시 체크되도록 수정된 함수 
	function toggleCheckbox(checkboxId) {
	    var checkbox = document.getElementById(checkboxId);
	    checkbox.checked = !checkbox.checked;
	}
	function toggleField(fieldId) {
	    var fieldInput = document.getElementById(fieldId);
	    if (document.getElementById(fieldId + "Toggle").checked) {
	        // 체크되었을 때
	        fieldInput.removeAttribute('readonly');
	    } else {
	        // 체크 해제되었을 때
	        fieldInput.setAttribute('readonly', 'readonly');
	    }
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////	
/* 	window.onbeforeunload = function() {
    return "정말 나가시겠습니까? 아직 공고가 작성중입니다..";
}; */
	/////////////////////////////////////////////////////////////////////////////////////////////////////	
	// [기업 정보_우편찾기 기능]
	// 주소 찾기 기능
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('posting_pcode').value = data.zonecode;
	            document.getElementById("posting_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("posting_dcode").focus();
	        }
	    }).open();
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// [등록 완료 버튼 클릭 시 기능] 
	// 등록 완료 버튼 클릭 시 모달 활성화
	// 등록 버튼 클릭 시 필수 입력 필드 확인
	document.getElementById("registerButton").addEventListener("click", function() {
	    var companyName = document.getElementById("posting_cname").value.trim();
	    var postalCode = document.getElementById("posting_pcode").value.trim();
	    var selectedField = document.getElementById("dropdownMenuButton").textContent.trim();
	    // 기본 드롭다운 버튼의 텍스트와 비교
	    if (companyName === "" || postalCode === "" || selectedField === "모집 분야를 선택해주세요.") {
	        alert("필수 사항들을 모두 입력해주세요.");
	    } else {
	        // 모든 필수 입력이 완료된 경우 등록 완료 모달 표시
	        $('#titleModal').modal('show');
	    }
	});
	document.getElementById("registerButton1").addEventListener("click", function() {
	    var companyName = document.getElementById("posting_cname").value.trim();
	    var postalCode = document.getElementById("posting_pcode").value.trim();
	    var selectedField = document.getElementById("dropdownMenuButton").textContent.trim();
	    // 기본 드롭다운 버튼의 텍스트와 비교
	    if (companyName === "" || postalCode === "" || selectedField === "모집 분야를 선택해주세요.") {
	        alert("필수 사항들을 모두 입력해주세요.");
	    } else {
	        // 모든 필수 입력이 완료된 경우 등록 완료 모달 표시
	        $('#titleModal').modal('show');
	    }
	});
	function submitAnnouncement() {
		//var formData = new FormData(document.getElementById("companyForm"));
		formData = document.companyForm;
	    //formData.append("posting_name", document.getElementById("posting_name_modal").value);
	    formData.posting_name.value = document.getElementById("posting_name_modal").value;
	    formData.submit();
		
	    $('#titleModal').modal('hide'); // 모달 닫기
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////
	// [모집 정보_모집분야 명 드롭다운 관련 기능]
	function changeRightMenu(menu, event) {
	  event.stopPropagation(); // 이벤트 전파 중지
	  // 모든 우측 메뉴 숨기기
	  document.querySelectorAll('#right-menu > div').forEach(function(div) {
	    div.style.display = 'none';
	  });
	  // 해당 메뉴 보여주기
	  document.getElementById(menu).style.display = 'block';
	}
	
	// 모집 분야 선택 시 호출되는 함수
	function selectRightMenuItem(menuItemText, event) {
	    event.preventDefault(); // 기본 이벤트 방지
	    event.stopPropagation(); // 이벤트 버블링 방지

	    // 선택된 모집 분야를 표시하는 버튼을 명확하게 선택
	    var dropdownButton = document.getElementById('dropdownMenuButton');
	    dropdownButton.textContent = menuItemText; // 버튼 텍스트를 선택된 모집 분야로 변경
	    dropdownButton.style.backgroundColor = '#606060'; // 선택된 상태의 스타일 적용
	    dropdownButton.style.color = 'white';

	    // 선택된 모집 분야 값을 숨겨진 입력 필드에 저장
	    document.getElementById('openposition_name').value = menuItemText;

	    // 해당 드롭다운 메뉴만 닫기
	    var dropdownMenu = document.querySelector('.dropdown-menu[aria-labelledby="dropdownMenuButton"]');
	    if (dropdownMenu.classList.contains('show')) {
	        dropdownMenu.classList.remove('show');
	    }
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////
	// 직급 선택 시 호출되는 함수
	function selectPosition(position, event) {
	    event.preventDefault(); // 기본 이벤트 방지
	    event.stopPropagation(); // 이벤트 버블링 방지
	
	    // 선택된 직급을 표시하는 버튼을 명확하게 선택
	    var dropdownButton = document.getElementById('dropdownMenuButton2');
	    dropdownButton.textContent = position; // 버튼 텍스트를 선택된 직급으로 변경
	    dropdownButton.style.backgroundColor = '#606060'; // 선택된 상태의 스타일 적용
	    dropdownButton.style.color = 'white';
	
	    // 선택된 직급 값을 숨겨진 입력 필드에 저장
	    document.getElementById('openposition_position').value = position;
	
	    // 해당 드롭다운 메뉴만 닫기 (jQuery가 아닌 순수 JavaScript를 사용)
	    // jQuery를 사용하는 경우: $('#dropdownMenuButton2').dropdown('toggle');
	    var dropdownMenu = document.querySelector('.dropdown-menu[aria-labelledby="dropdownMenuButton2"]');
	    if (dropdownMenu.classList.contains('show')) {
	        dropdownMenu.classList.remove('show');
	    }
	}


	
	document.getElementById('openposition_num').addEventListener('input', function(e) {
	    var value = e.target.value;
	    // 입력된 값이 숫자만 포함하는지 검사
	    if (!/^\d*$/.test(value)) { // 정규표현식을 사용하여 숫자만 있는지 검사
	        alert('모집 할 인원의 숫자만 입력해주세요.');
	        e.target.value = value.replace(/[^0-9]/g, ''); // 숫자가 아닌 모든 문자를 제거
	    }
	});
	
	/////////////////////////////////////////////////////////////////////////////////////////////////
    // [지원 자격(학력) 드롭다운 기능]
	function selectEdutype(edutype, event) {
	    event.preventDefault(); // 페이지 상단으로 스크롤되는 것을 방지
	    var dropdownButton = document.getElementById('dropdownMenuButton3');
	    dropdownButton.textContent = edutype;
	    dropdownButton.style.backgroundColor = '#606060';
	    dropdownButton.style.color = 'white';
	    // 선택한 학력을 숨겨진 입력 필드에 저장
	    document.getElementById('qualification_edutype').value = edutype;
	}

    // [지원 자격(성별) 드롭다운 기능]
	// 성별 선택 함수 수정
	function selectGender(gender, event) {
	    event.preventDefault(); // 페이지 상단으로 스크롤되는 것을 방지
	    var dropdownButton = document.getElementById('dropdownMenuButton4');
	    dropdownButton.textContent = gender;
	    dropdownButton.style.backgroundColor = '#606060';
	    dropdownButton.style.color = 'white';
	    // 선택한 성별을 숨겨진 입력 필드에 저장
	    document.getElementById('qualification_gender').value = gender;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////
	// [모집 정보_모집분야 명 드롭다운 관련 기능]
	function changeRightSkill(skill, event) {
		event.preventDefault(); // 페이지 상단으로 이동하는 기본 동작 방지
	  event.stopPropagation(); // 이벤트 전파 중지
	  // 모든 우측 메뉴 숨기기
	  document.querySelectorAll('#right-skill > div').forEach(function(div) {
	    div.style.display = 'none';
	  });
	  // 해당 메뉴 보여주기
	  document.getElementById(skill).style.display = 'block';
	}
	// 선택한 스킬을 관리하기 위한 배열
    var selectedSkills = [];

    function selectRightSkillItem(skillName, event) {
    	event.preventDefault(); // 페이지 상단으로 이동하는 기본 동작 방지
    	event.stopPropagation(); // 이벤트 전파 중단

        // 스킬이 이미 선택되었는지 확인하고, 선택되지 않았다면 배열에 추가
        if (selectedSkills.indexOf(skillName) === -1) {
            selectedSkills.push(skillName); // 배열에 스킬 추가
            updateSelectedSkillsDisplay(); // 선택된 스킬 표시 업데이트
        } else {
            // 이미 선택된 스킬이면 배열에서 제거
            selectedSkills = selectedSkills.filter(function(skill) {
                return skill !== skillName;
            });
            updateSelectedSkillsDisplay(); // 선택된 스킬 표시 업데이트
        }
    }


 	// 선택된 스킬을 화면에 표시하는 함수
    function updateSelectedSkillsDisplay() {  
        var displayArea = document.getElementById('selectedSkillsDisplay');
        displayArea.innerHTML = ''; // 화면 초기화
        var selectedSkillsValue = selectedSkills.join(','); // 배열을 쉼표로 구분된 문자열로 변환
        document.getElementById('qualification_skill').value = selectedSkillsValue; // Hidden input 업데이트
       
        
        selectedSkills.forEach(function(skill) {
            var skillElement = document.createElement('span');
            skillElement.textContent = skill;
            skillElement.style.marginRight = '10px';
            skillElement.style.marginBottom = '10px';
            skillElement.style.display = 'inline-block';
            skillElement.style.padding = '5px 10px';
            skillElement.style.borderRadius = '20px'; // 타원 모양으로 만들기 위한 둥근 모서리
            skillElement.style.backgroundColor = '#606060'; // 배경색
            skillElement.style.color = 'white'; // 글자색
            skillElement.style.cursor = 'pointer';
            skillElement.style.fontSize = '14px';
            skillElement.onclick = function() { removeSkill(skill); }; // 스킬 클릭 시 제거
            displayArea.appendChild(skillElement);
        });
    }

    // 스킬 클릭 시 제거하는 함수
    function removeSkill(skillName) {
        selectedSkills = selectedSkills.filter(function(skill) {
            return skill !== skillName;
        });
        updateSelectedSkillsDisplay(); // 선택된 스킬 표시 업데이트
    }
	/////////////////////////////////////////////////////////////////////////////////////////////////
	// [지원자 자격 요건_ 요구 자격증 관련]
	// 예시 데이터 배열
	const certificates = [
	    <% for (int i = 0; i < certificateList.size(); i++) { %>
	        "<%= certificateList.get(i).getCertificate_name() %>"<%= i < certificateList.size() - 1 ? "," : "" %>
	    <% } %>
	];
	
	// 드롭다운 리스트를 초기화하고 전체 항목을 표시하는 함수
	function initDropdownList() {
	    const list = document.getElementById('certificateList');
	    list.innerHTML = ''; // 리스트 초기화
	    certificates.forEach(certificate => {
	        const item = document.createElement('a');
	        item.classList.add('dropdown-item');
	        item.href = "#";
	        item.textContent = certificate;
	        item.addEventListener('click', function(event) { selectCertificate(certificate, event); });
	        list.appendChild(item);
	    });
	}
	
	// 사용자의 입력에 따라 리스트를 필터링하는 함수
	function filterList() {
	    const searchValue = document.getElementById('certificateSearch').value.toLowerCase();
	    const filteredCertificates = certificates.filter(certificate => certificate.toLowerCase().includes(searchValue));
	    const list = document.getElementById('certificateList');
	    list.innerHTML = ''; // 리스트 초기화
	    filteredCertificates.forEach(certificate => {
	        const item = document.createElement('a');
	        item.classList.add('dropdown-item');
	        item.href = "#";
	        item.textContent = certificate;
	        item.onclick = function() { selectCertificate(certificate); };
	        list.appendChild(item);
	    });
	}
	
	// 선택된 항목을 처리하는 함수
	function selectCertificate(certificate, event) {
	    event.preventDefault(); // 페이지 상단으로 이동하는 기본 동작 방지
	    document.getElementById('certificatedropBtn').textContent = certificate;
	    document.getElementById('qualification_certificate').value = certificate;
	    // 드롭다운 닫기 (옵션)
	}
	
	// 이벤트 리스너 추가
	document.getElementById('certificateSearch').addEventListener('input', filterList);
	
	// 페이지 로드 시 드롭다운 리스트 초기화
	window.onload = initDropdownList;
	/////////////////////////////////////////////////////////////////////////////////////////////////
	// 선택한 자격증을 관리하기 위한 배열
	var selectedCertificates = [];
	
	// 선택된 자격증을 화면에 표시하는 함수
	function updateSelectedCertificatesDisplay() {
	    var displayArea = document.getElementById('selectedCertificatesDisplay');
	    displayArea.innerHTML = ''; // 화면 초기화
	    var selectedCertificatesValue = selectedCertificates.join(', '); // 배열을 쉼표로 구분된 문자열로 변환
	    document.getElementById('qualification_certificate').value = selectedCertificatesValue; // Hidden input 업데이트
	    
	    selectedCertificates.forEach(function(certificate) {
	        var certificateElement = document.createElement('span');
	        certificateElement.textContent = certificate;
	        certificateElement.style.marginRight = '10px';
	        certificateElement.style.marginBottom = '10px';
	        certificateElement.style.display = 'inline-block';
	        certificateElement.style.padding = '5px 10px';
	        certificateElement.style.borderRadius = '20px'; // 타원 모양으로 만들기 위한 둥근 모서리
	        certificateElement.style.backgroundColor = '#606060'; // 배경색
	        certificateElement.style.color = 'white'; // 글자색
	        certificateElement.style.cursor = 'pointer';
	        certificateElement.style.fontSize = '14px';
	        certificateElement.onclick = function() { removeCertificate(certificate); }; // 자격증 클릭 시 제거
	        displayArea.appendChild(certificateElement);
	    });
	}
	
	// 자격증 클릭 시 제거하는 함수
	function removeCertificate(certificateName) {
	    selectedCertificates = selectedCertificates.filter(function(certificate) {
	        return certificate !== certificateName;
	    });
	    updateSelectedCertificatesDisplay(); // 선택된 자격증 표시 업데이트
	}
	
	// 드롭다운에서 자격증 선택 시 처리하는 함수
	function selectCertificate(certificate, event) {
	    event.stopPropagation(); // 이벤트 전파 중단
    	event.preventDefault(); // 페이지 상단으로 이동하는 기본 동작 방지
	    if (selectedCertificates.indexOf(certificate) === -1) {
	        selectedCertificates.push(certificate); // 배열에 자격증 추가
	        updateSelectedCertificatesDisplay(); // 선택된 자격증 표시 업데이트
	        event.stopPropagation()
	    }
	    // 드롭다운 닫기 (부트스트랩 사용 시 적절한 방법으로 구현)
	}

	
	/////////////////////////////////////////////////////////////////////////////////////////////////
    // [근무 환경(근무 시간) 드롭다운 기능]
		function selectDay(Day, event) {
		    event.preventDefault(); // 페이지 상단으로 스크롤되는 것을 방지
		    var dropdownButton = document.getElementById('dropworkingdayBtn');
		    dropdownButton.textContent = Day;
		    dropdownButton.style.backgroundColor = '#606060';
		    dropdownButton.style.color = 'white';
		    // 선택한 근무 요일을 숨겨진 입력 필드에 저장
		    document.getElementById('working_day').value = Day;
		}

 	// [근무 환경(근무 시간) 드롭다운 기능]
		// 근무 시간 선택 함수 수정
		function selectHour(Hour, event) {
		    event.preventDefault(); // 페이지 상단으로 스크롤되는 것을 방지
		    var dropdownButton = document.getElementById('dropworkinghourBtn');
		    dropdownButton.textContent = Hour;
		    dropdownButton.style.backgroundColor = '#606060';
		    dropdownButton.style.color = 'white';
		    // 선택한 근무 시간을 숨겨진 입력 필드에 저장
		    document.getElementById('working_hour').value = Hour;
		}

 		/////////////////////////////////////////////////////////////////////////////////////////////////
 	    // [복리 후생(복지 버튼) 드롭다운 기능] 	
		document.getElementById('addWelfareField').addEventListener('click', function() {
		    var container = document.getElementById('welfareFields'); // 부모 컨테이너를 가져옵니다.
		
		    var newDiv = document.createElement('div'); // 새 div 요소를 생성합니다.
		    newDiv.className = 'row align-items-center'; // 기존과 동일한 클래스를 적용합니다.
		
		    // 새 입력 필드를 생성합니다.
		    var newInput = document.createElement('input');
		    newInput.type = 'text';
		    newInput.className = 'input_all'; // 기존 입력 필드와 동일한 클래스를 사용합니다.
		    newInput.name = 'Welfare_content[]';
		    newInput.placeholder = '귀사의 복지, 혜택에 대해 추가로 작성해주세요.';
		    // 인라인 스타일 직접 적용
		    newInput.style.width = '670px';
		    newInput.style.height = '40px';
		    newInput.style.marginRight = '10px';
		    newInput.style.marginLeft = '40px';
		    newInput.style.padding = '10px';
		    newInput.style.fontSize = '18px';
		
		    newDiv.appendChild(newInput); // 새 입력 필드를 div에 추가합니다.

		    // 삭제 버튼 생성
		    var deleteButton = document.createElement('button');
		    deleteButton.textContent = '삭제하기';
		    deleteButton.type = 'button';
		    deleteButton.className = 'btn btn-light btn-sm mx-auto d-block'; // 색상을 light로 변경하고, 버튼을 중앙 정렬합니다.
		    // 삭제 버튼 이벤트 리스너
		    deleteButton.onclick = function() {
		        newDiv.remove(); // 해당 필드를 삭제합니다.
		    };
		
		    // 삭제 버튼을 div에 추가합니다.
		    newDiv.appendChild(deleteButton);
		
		    container.appendChild(newDiv); // 새로운 div를 부모 컨테이너에 추가합니다.
		});


 		/////////////////////////////////////////////////////////////////////////////////////////////////
 	    // [채용 절차(채용 절차 주가)] 	 		
		document.getElementById('addProcedureBtn').addEventListener('click', function() {
        var newProcedureContainer = document.createElement('div');
        newProcedureContainer.classList.add('procedure-container');
        newProcedureContainer.innerHTML = `
            <div class="row align-items-center">
                <div class="col">
                <label for="companyName" class="question"></label>
                </div>
                <div class="col" style="margin-left: 20px;">
                <input type="text" class="input" name="procedure_name[]" placeholder="추가하실 절차 명을 입력해주세요." /* style="background-color: lightgrey; */">
                </div>
            </div>
            <div class="row align-items-center" style="margin-left: 135px;">
                <span class="essential_date">[시작 기간을 입력해주세요.]</span>
                <div class="col">
                    <input type="datetime-local" class="input" name="procedure_sdatetime[]" placeholder="시작 날짜와 시간">
                </div>
            </div>
            <div class="row align-items-center" style="margin-left: 135px;">
                <span class="essential_date">[종료 기간을 입력해주세요.]</span>
                <div class="col">
                    <input type="datetime-local" class="input" name="procedure_edatetime[]" placeholder="종료 날짜와 시간">
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-auto">
                    <button type="button" class="addbtn2 date-remove-btn">절차 제거</button>
                </div>
            </div>
            <hr/>
        `;

        // '날짜 제거' 버튼 클릭 이벤트 추가
        newProcedureContainer.querySelector('.date-remove-btn').addEventListener('click', function() {
            newProcedureContainer.remove(); // 전체 절차 컨테이너 제거
        });

        // '절차 추가' 버튼의 부모 요소에 새로운 절차 입력 폼 컨테이너 삽입
        var addProcedureBtnContainer = document.getElementById('addProcedureBtn').parentNode;
        addProcedureBtnContainer.insertBefore(newProcedureContainer, document.getElementById('addProcedureBtn'));
    });
	/////////////////////////////////////////////////////////////////////////////////////////////////
	// [추가 질문 사항(질문 주가)] 	
	document.getElementById('addaddquestion_Fields').addEventListener('click', function() {
	    var container = document.getElementById('addquestion_Fields'); // 부모 컨테이너를 가져옵니다.
	
	    var newDiv = document.createElement('div'); // 새 div 요소를 생성합니다.
	    newDiv.className = 'row align-items-center'; // 기존과 동일한 클래스를 적용합니다.
	
	    // 새 입력 필드를 생성합니다.
	    var newInput = document.createElement('input');
	    newInput.type = 'text';
	    newInput.className = 'input_all'; // 기존 입력 필드와 동일한 클래스를 사용합니다.
	    newInput.name = 'addquestion_question[]';
	    newInput.placeholder = '추가 질문 사항을 작성해주세요.';
	    // 인라인 스타일 직접 적용
	    newInput.style.width = '670px';
	    newInput.style.height = '40px';
	    newInput.style.marginRight = '10px';
	    newInput.style.marginLeft = '40px';
	    newInput.style.padding = '10px';
	    newInput.style.fontSize = '18px';
	
	    newDiv.appendChild(newInput); // 새 입력 필드를 div에 추가합니다.
	
	 	// 삭제 버튼 생성
	    var deleteButton = document.createElement('button');
	    deleteButton.textContent = '삭제하기';
	    deleteButton.className = 'btn btn-light btn-sm'; // mx-auto d-block 제거
	    deleteButton.style.marginTop = '5px'; // 상단 여백 추가
	    deleteButton.style.marginLeft = '338px'; // 상단 여백 추가
	    
	    // 삭제 버튼 이벤트 리스너
	    deleteButton.onclick = function() {
	        newDiv.remove(); // 해당 필드를 삭제합니다.
	    };
	
	    // 삭제 버튼을 div에 추가합니다.
	    newDiv.appendChild(deleteButton);
	
	    // 새로운 div를 부모 컨테이너에 추가합니다.
	    container.appendChild(newDiv);
	
	    // 새로운 입력 필드와 삭제 버튼 사이에 구분선 추가
	    var hr = document.createElement('hr');
	    newDiv.appendChild(hr);
	});
	/////////////////////////////////////////////////////////////////////////////////////////////////
	// [추가 질문 사항(서류 주가)] 
document.getElementById('addadddocument_Fields').addEventListener('click', function() {
    var container = document.getElementById('adddocument_Fields'); // 부모 컨테이너를 가져옵니다.

    var newDiv = document.createElement('div'); // 새 div 요소를 생성합니다.
    newDiv.className = 'row align-items-center'; // 기존과 동일한 클래스를 적용합니다.

    // 새 입력 필드를 생성합니다.
    var newInput = document.createElement('input');
    newInput.type = 'text';
    newInput.className = 'input_all'; // 기존 입력 필드와 동일한 클래스를 사용합니다.
    newInput.name = 'adddocument_document[]';
    newInput.placeholder = '추가 제출 파일을 작성해주세요.';
    // 인라인 스타일 직접 적용
	    newInput.style.width = '670px';
	    newInput.style.height = '40px';
	    newInput.style.marginRight = '10px';
	    newInput.style.marginLeft = '40px';
	    newInput.style.padding = '10px';
	    newInput.style.fontSize = '18px';

    newDiv.appendChild(newInput); // 새 입력 필드를 div에 추가합니다.

 	// 삭제 버튼 생성
    var deleteButton = document.createElement('button');
    deleteButton.textContent = '삭제하기';
    deleteButton.className = 'btn btn-light btn-sm'; // mx-auto d-block 제거
    deleteButton.style.marginTop = '5px'; // 상단 여백 추가
    deleteButton.style.marginLeft = '338px'; // 상단 여백 추가

    // 삭제 버튼 이벤트 리스너
    deleteButton.onclick = function() {
        newDiv.remove(); // 해당 필드를 삭제합니다.
    };

    // 삭제 버튼을 div에 추가합니다.
    newDiv.appendChild(deleteButton);

    // 새로운 div를 부모 컨테이너에 추가합니다.
    container.appendChild(newDiv);

    // 새로운 입력 필드와 삭제 버튼 사이에 구분선 추가
    var hr = document.createElement('hr');
    newDiv.appendChild(hr);
	});
	
	
	
	
	
	//'취소하기' 버튼 클릭 시 확인 후 main.jsp로 이동
	function cancelForm() {
	    if (confirm("정말 나가시겠습니까? 아직 공고가 작성중입니다.")) {
	        window.location.href = "company_home.jsp";
	    }
	}
	
	
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
	</script>

</body>
</html>