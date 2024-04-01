<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<%@page import="java.util.Vector"%>
<%@ page import="match.category.job_categoryBean" %>
<%@ page import="match.category.job_categoryMgr" %>

<jsp:useBean id="jMgr" class="match.category.job_categoryMgr"/>
<jsp:useBean id="jBean" class="match.category.job_categoryBean"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Announcement Form with Bootstrap</title>
<!-- 최신 버전의 부트스트랩 CSS 추가 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
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
.input {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    width: 500px;
    height: 40px;
    margin-right: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
}
.input_num {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    width: 300px;
    height: 40px;
    margin-right: 210px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
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

.modal-dialog {
    margin-top: 400px; /* 원하는 위치로 조절 */
}


</style>
</head>
<body>
<div class="container mt-10">
    <!-- 좌측 레이아웃 -->
    <form name="companyForm" action="post_proc.jsp" method="GET">
    <div class="row">
        <div class="col-md-8 offset-md-1"> <!-- 왼쪽으로 옮길 컨테이너 -->
            <div class="title">기업 정보</div>
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
            <div class="title">모집 정보</div>
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
								    <div id="menu1" style="display: none;">
								        <div class="row">
								            <% 
								                String name = "기획·전략";
								                Vector<job_categoryBean> vlist = jMgr.jobsnameList(name);
								                
								                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
								                for (job_categoryBean menuItem : vlist) {
								            %>
								            <div class="col-md-6">
								                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
								            </div>
								            <% 
								                }
								            %>
								        </div>
								    </div>
						            <div id="menu2" style="display: none;">
						             <div class="row">
								            <% 
								                String name1 = "마케팅·홍보·조사";
								                Vector<job_categoryBean> vlist1 = jMgr.jobsnameList(name1);
								                
								                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
								                for (job_categoryBean menuItem : vlist1) {
								            %>
								            <div class="col-md-6">
								                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
								            </div>
								            <% 
								                }
								            %>
								        </div>
						            </div>
						            <div id="menu3" style="display: none;">
						                 <div class="row">
								            <% 
								                String name3 = "회계·세무·재무";
								                Vector<job_categoryBean> vlist3 = jMgr.jobsnameList(name3);
								                
								                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
								                for (job_categoryBean menuItem : vlist3) {
								            %>
								            <div class="col-md-6">
								                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
								            </div>
								            <% 
								                }
								            %>
								        </div>
						            </div>
						            <div id="menu4" style="display: none;">
						                   <div class="row">
								            <% 
								                String name4 = "인사·노무·HRD";
								                Vector<job_categoryBean> vlist4 = jMgr.jobsnameList(name4);
								                
								                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
								                for (job_categoryBean menuItem : vlist4) {
								            %>
								            <div class="col-md-6">
								                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
								            </div>
								            <% 
								                }
								            %>
								        </div>
						            </div>
						            <div id="menu5" style="display: none;">
						                   <div class="row">
								            <% 
								                String name5 = "총무·법무·사무";
								                Vector<job_categoryBean> vlist5 = jMgr.jobsnameList(name5);
								                
								                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
								                for (job_categoryBean menuItem : vlist5) {
								            %>
								            <div class="col-md-6">
								                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
								            </div>
								            <% 
								                }
								            %>
								        </div>
						            </div>
						            <div id="menu6" style="display: none;">
						                   <div class="row">
								            <% 
								                String name6 = "IT개발·데이터";
								                Vector<job_categoryBean> vlist6 = jMgr.jobsnameList(name6);
								                
								                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
								                for (job_categoryBean menuItem : vlist6) {
								            %>
								            <div class="col-md-6">
								                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
								            </div>
								            <% 
								                }
								            %>
								        </div>
						            </div>
						            <div id="menu7" style="display: none;">
						                   <div class="row">
								            <% 
								                String name7 = "디자인";
								                Vector<job_categoryBean> vlist7 = jMgr.jobsnameList(name7);
								                
								                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
								                for (job_categoryBean menuItem : vlist7) {
								            %>
								            <div class="col-md-6">
								                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
								            </div>
								            <% 
								                }
								            %>
								        </div>
						            </div>
						            <div id="menu8" style="display: none;">
						                   <div class="row">
								            <% 
								                String name8 = "영업·판매·무역";
								                Vector<job_categoryBean> vlist8 = jMgr.jobsnameList(name8);
								                
								                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
								                for (job_categoryBean menuItem : vlist8) {
								            %>
								            <div class="col-md-6">
								                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
								            </div>
								            <% 
								                }
								            %>
								        </div>
						            </div>
						            <div id="menu9" style="display: none;">
						                   <div class="row">
								            <% 
								                String name9 = "고객상담·TM";
								                Vector<job_categoryBean> vlist9 = jMgr.jobsnameList(name9);
								                
								                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
								                for (job_categoryBean menuItem : vlist9) {
								            %>
								            <div class="col-md-6">
								                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
								            </div>
								            <% 
								                }
								            %>
								        </div>
						            </div>
						            <div id="menu10" style="display: none;">
						                   <div class="row">
								            <% 
								                String name10 = "구매·자재·물류";
								                Vector<job_categoryBean> vlist10 = jMgr.jobsnameList(name10);
								                
								                // Vector에서 항목들을 가져와 동적으로 우측 메뉴 항목 생성
								                for (job_categoryBean menuItem : vlist10) {
								            %>
								            <div class="col-md-6">
								                <a class="dropdown-item" href="#" onclick="selectRightMenuItem('<%=menuItem.getJob_sname()%>')"><%=menuItem.getJob_sname()%></a>
								            </div>
								            <% 
								                }
								            %>
								        </div>
						            </div>
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
							<input type="text" class="input_num" id="openposition_num" name="openposition_num" placeholder="인원 수를 입력해주세요.">
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
						            직급/직책을 선택하세요.
						        </button>
						        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
						        	<a class="dropdown-item" href="#" onclick="selectPosition('무관')">무관</a>
						            <a class="dropdown-item" href="#" onclick="selectPosition('사원급')">사원급</a>
						            <a class="dropdown-item" href="#" onclick="selectPosition('대리급')">주임~대리급</a>
						            <a class="dropdown-item" href="#" onclick="selectPosition('과장~차장급')">과장~차장급</a>
						            <a class="dropdown-item" href="#" onclick="selectPosition('부장급')">부장급</a>
						            <a class="dropdown-item" href="#" onclick="selectPosition('임원~CEO급')">임원~CEO급</a>
						            <!-- 추가적으로 필요한 직급/직책 항목을 여기에 추가 -->        
						            <!-- 숨겨진 입력 필드를 openpositionForm에 추가 -->
									<input type="hidden" id="openposition_position" name="openposition_position" value="">
						        </div>
						    </div>
						</div>
		        	</div>                     
            </div>
            
            <div class="title">지원 자격 요건</div>
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
						            직급/직책을 선택하세요.
						        </button>
						        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton3">
						        	<a class="dropdown-item" href="#" onclick="selectEdutype('학력 무관')">학력 무관</a>
						            <a class="dropdown-item" href="#" onclick="selectEdutype('검정고시')">검정고시</a>
						            <a class="dropdown-item" href="#" onclick="selectEdutype('고등학교 졸업')">고등학교 졸업</a>
						            <a class="dropdown-item" href="#" onclick="selectEdutype('대학 졸업(2,3년)')">대학 졸업(2,3년)</a>
						            <a class="dropdown-item" href="#" onclick="selectEdutype('대학 졸업(4년)')">대학 졸업(4년)</a>
						            <a class="dropdown-item" href="#" onclick="selectEdutype('대학 졸업(4년 예정자)')">대학 졸업(4년 예정자)</a>
						            <a class="dropdown-item" href="#" onclick="selectEdutype('석사 졸업')">석사 졸업</a>
						            <a class="dropdown-item" href="#" onclick="selectEdutype('박사 졸업')">박사 졸업</a>
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
						        	<a class="dropdown-item" href="#" onclick="selectGender('남성')">남성</a>
						            <a class="dropdown-item" href="#" onclick="selectGender('여성')">여성</a>	         
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
                            <!-- 경력 여부 버튼 그룹 -->
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
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
           </div>      
        </div>
        <!-- 우측 레이아웃 -->
        <div class="col-md-3 d-flex flex-column align-items-center justify-content-center"> <!-- 버튼을 상하 중앙에 배치하기 위해 align-items-center 및 justify-content-center 클래스 추가 -->
            <!-- 등록 완료 버튼 -->
            <button id="registerButton" type="button" class="btn btn-primary mb-2 btn-sm">등록완료</button>
            <button type="button" class="btn btn-secondary btn-sm">임시저장</button>
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


<!-- 부트스트랩 JS, Popper.js, and jQuery -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
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
	
	function selectRightMenuItem(menuItemText) {
		  var dropdownButton = document.getElementById('dropdownMenuButton');
		  dropdownButton.textContent = menuItemText; // Dropdown 버튼 텍스트 변경
		  dropdownButton.style.backgroundColor = '#D9D9D9'; // 버튼의 배경색을 회색(#D9D9D9)으로 변경
		  dropdownButton.style.color = 'black'; // 텍스트 색상을 검정으로 변경	  
		  dropdownButton.style.textAlign = 'left'; // 텍스트를 좌측으로 정렬
		  $('.dropdown-toggle').dropdown('toggle'); // 드롭다운 닫기
		  
		  document.getElementById('openposition_name').value = menuItemText;
		}

	/////////////////////////////////////////////////////////////////////////////////////////////////
	// [모집정보_직급 드롭버튼 기능]
	function selectPosition(position) {
	    var dropdownButton = document.getElementById('dropdownMenuButton2');
	    dropdownButton.textContent = position;
	    dropdownButton.style.backgroundColor = '#D9D9D9';
	    dropdownButton.style.color = 'black';
	    // 선택된 직급/직책을 숨겨진 입력 필드에 저장
	    document.getElementById('openposition_position').value = position;
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
    function selectEdutype(edutype) {
        var dropdownButton = document.getElementById('dropdownMenuButton3');
        dropdownButton.textContent = edutype;
        dropdownButton.style.backgroundColor = '#D9D9D9';
        dropdownButton.style.color = 'black';
        // 선택한 지원 자격을 양식 데이터에 저장하기 위한 숨겨진 입력 필드 값 설정
        document.getElementById('qualification_edutype').value = edutype;
    }
    // [지원 자격(성별) 드롭다운 기능]
    function selectGender(gender) {
        var dropdownButton = document.getElementById('dropdownMenuButton4');
        dropdownButton.textContent = gender;
        dropdownButton.style.backgroundColor = '#D9D9D9';
        dropdownButton.style.color = 'black';
        // 선택한 지원 자격을 양식 데이터에 저장하기 위한 숨겨진 입력 필드 값 설정
        document.getElementById('qualification_gender').value = gender;
    }
	/////////////////////////////////////////////////////////////////////////////////////////////////

	</script>

</body>
</html>