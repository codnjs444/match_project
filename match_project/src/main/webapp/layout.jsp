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

.input {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    width: 500px;
    height: 40px;
    margin-right: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
}
</style>
</head>
<body>
<div class="container mt-10">
    <!-- 좌측 레이아웃 -->
    <form name="companyForm" action="post_proc.jsp" method="GET">
    <div class="row">
        <div class="col-md-8 offset-md-2"> <!-- 왼쪽으로 옮길 컨테이너 -->
            <div class="box">
                <!-- 기업명 텍스트와 텍스트 필드 -->
                    <div class="row align-items-center">
                        <div class="col">
                            <input type="text" class="input" id="posting_cname" name="posting_cname">
                        </div>
                    </div>
                  
            </div>

		</div>
        </div>
		</form>
</div>




<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>