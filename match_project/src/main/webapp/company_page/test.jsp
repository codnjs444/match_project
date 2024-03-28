<%@page import="match.skillBean"%>
<%@page import="match.categoryMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="skill_category" class="match.skillBean"></jsp:useBean>
<%
    // categoryMgr 객체 생성
    categoryMgr mgr = new categoryMgr();
    // 스킬 이름 리스트 가져오기
    Vector<skillBean> skillList = mgr.skillList();

    // 스킬 이름을 저장할 배열 생성
    String[] data = new String[skillList.size()];
    for (int i = 0; i < skillList.size(); i++) {
        data[i] = skillList.get(i).getSkill_sname().toLowerCase();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공고 등록</title>
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- 커스텀 CSS -->
    <link href="../css/post_job.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="container">
    <div class="row">
        <!-- 왼쪽: 공고 등록 폼 -->
<div class="container">
    <!-- 기업 정보 확인 텍스트 -->
    <div class="q1_1">기업 정보</div>
    <div class="q1">기업 정보를 확인해주세요.</div>

    <!-- 흰색 박스 -->
    <div class="q1-box">
        <!-- 기업명 텍스트와 텍스트 필드 -->
        <div class="row align-items-center"> <!-- align-items-center 클래스 추가 -->
            <div class="col">
                <label for="companyName" class="q1-label1">기업명</label>
            </div>
            <span class="q1-required">[필수]</span> <!-- 필수 문구 추가 -->
            <div class="col">
                <input type="text" class="form-control q1-input1" id="companyName" name="companyName">
            </div>
        </div>
		 <!-- 기업명 텍스트와 텍스트 필드 -->
        <div class="row align-items-center"> <!-- align-items-center 클래스 추가 -->
            <div class="col">
                <label for="companyName" class="q1-label1">대표 근무지역</label>
            </div>
            <span class="q1-required">[필수]</span> <!-- 필수 문구 추가 -->
            <div class="col">
                <input type="text" class="form-control q1-input1" id="postcode" placeholder="우편번호" >
                <input type="button" class="btn-search" onclick="execDaumPostcode()" value="우편번호 찾기">  
            </div>
        </div>
        <div class="col">
            <input type="text" class="form-control q1-input2" id="address" placeholder="회사주소" readonly>
        </div>
        <div class="col">
            <input type="text" class="form-control q1-input2" id="detailAddress" placeholder="상세주소">	
        </div>
    </div>
</div>
<!----------------------------------------- 모집 분야 컨테이너 --------------------------------------------->
<div class="container">
    <!-- 기업 정보 확인 텍스트 -->
    <div class="q1_1">모집 분야</div>
    <div class="q1">어떤 일을 담당할 직원을 찾으시나요?</div>

    <!-- 흰색 박스 -->
    <div class="q1-box">
        <!-- 기업명 텍스트와 텍스트 필드 -->
        <div class="row align-items-center"> <!-- align-items-center 클래스 추가 -->
            <div class="col">
                <label for="companyName" class="q1-label1">모집분야명</label>
            </div>
            <span class="q1-required">[필수]</span> <!-- 필수 문구 추가 -->
            <div class="col">
                <input type="text" class="form-control q1-input1" id="companyName" name="companyName">
            </div>
        </div>
        
        <div class="row align-items-center"> <!-- align-items-center 클래스 추가 -->
            <div class="col">
                <label for="companyName" class="q1-label1">담당 업무</label>
            </div>           
            <div class="col">
                <input type="text" class="form-control q1-input1" id="companyName" name="companyName">
            </div>
        </div>
        
        <div class="row align-items-center"> <!-- align-items-center 클래스 추가 -->
            <div class="col">
                <label for="companyName" class="q1-label1">모집 인원</label>
            </div>           
            <div class="col">
                <input type="text" class="form-control q1-input1" id="companyName" name="companyName" placeholder="인원 수를 입력해주세요.">
            </div>
        </div>
        
        <div class="row align-items-center"> <!-- align-items-center 클래스 추가 -->
            <div class="col">
                <label class="q1-label1">근무 부서</label>
            </div>           
            <div class="col checkbox-container">
                <input type="checkbox" id="departmentToggle" onchange="toggleField('department')">
            </div>
            <div class="col">
                <input type="text" class="form-control q1-input1" id="department" name="department" placeholder="근무 부서를 입력하세요." readonly>
            </div>
        </div>
        <div class="row align-items-center"> <!-- align-items-center 클래스 추가 -->
            <div class="col">
                <label class="q1-label1">직급 직책</label>
            </div>           
            <div class="col checkbox-container">
                <input type="checkbox" id="positionToggle" onchange="toggleField('position')">
            </div>
            <div class="col">
                <input type="text" class="form-control q1-input1" id="position" name="position" placeholder="직급 직책을 입력하세요." readonly>
            </div>
        </div>  
    </div>
</div>
<!----------------------------------------- 지원 자격 컨테이너 --------------------------------------------->
<div class="container">
    <!-- 지원 자격 확인 텍스트 -->
    <div class="q1_1">지원 자격</div>
    <div class="q1">지원 자격은 어떻게 되나요?</div>

    <div class="q1-box">
        <!-- 첫 번째 드롭다운 -->
        <div class="row align-items-center mb-3">
            <div class="col">
                <label for="education" class="q1-label1 align-self-center">지원자 학력</label>
            </div>
            <span class="q1-required align-self-center">[필수]&nbsp;&nbsp;&nbsp;</span>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="educationDropdownButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    학력을 선택해주세요.
                </button>
                <div class="dropdown-menu" aria-labelledby="educationDropdownButton">
                    <a class="dropdown-item" href="#">학력 무관</a>
                    <a class="dropdown-item" href="#">검정고시</a>
                    <a class="dropdown-item" href="#">고등학교 졸업</a>
                    <a class="dropdown-item" href="#">대학졸업(2,3년)</a>
                    <a class="dropdown-item" href="#">대학졸업(4년)</a>
                    <a class="dropdown-item" href="#">석사졸업</a>
                    <a class="dropdown-item" href="#">박사졸업</a>
                </div>
            </div>
        </div>
        <!-- 두 번째 드롭다운 -->
        <div class="row align-items-center mb-3">
            <div class="col">
                <label for="gender" class="q1-label1 align-self-center">성별</label>
            </div>
            <span class="q1-required align-self-center">[필수]&nbsp;&nbsp;&nbsp;</span>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="genderDropdownButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    성별을 선택해주세요.
                </button>
                <div class="dropdown-menu" aria-labelledby="genderDropdownButton">
                    <a class="dropdown-item" href="#">남자</a>
                    <a class="dropdown-item" href="#">여자</a>
                </div>
            </div>
        </div>
        <!-- 세 번째 메뉴 -->
        <div class="row align-items-center">
            <div class="col">
                <label class="q1-label1">경력여부</label>
            </div>
            <span class="q1-required">[필수]</span> <!-- 필수 문구 추가 -->
            <div class="custom-checkbox-container" onclick="toggleCheckbox('entryLevel')">
                <input type="checkbox" id="entryLevel" onchange="updateTextColor('entryLevelText', this)">
                <label for="entryLevel" id="entryLevelText">신입</label>
            </div>
            <div class="custom-checkbox-container" onclick="toggleCheckbox('experienced')">
                <input type="checkbox" id="experienced" onchange="updateTextColor('experiencedText', this)">
                <label for="experienced" id="experiencedText">경력</label>
            </div>
            <div class="custom-checkbox-container" onclick="toggleCheckbox('anyExperience')">
                <input type="checkbox" id="anyExperience" onchange="updateTextColor('anyExperienceText', this)">
                <label for="anyExperience" id="anyExperienceText">경력 무관</label>
            </div>
        </div>
        
        <div class="row align-items-center mb-30">
            <div class="col">
                <label for="companyName" class="q1-label1">필수 스킬</label>
            </div>
            <div class="col">
                <div class="input-group">
                    <input type="text" class="form-control q1-input7" id="searchField" onkeyup="searchData()" placeholder="초성으로 검색">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" onclick="clearSearchField()">X</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="col">
                <div class="form-control q1-input10" id="greyBox" style="display:none; position: relative;" onclick="selectGreyBoxItem(event)">
                </div>
            </div>
        </div>
        <div class="row align-items-center mb-30 justify-content-end"> <!-- 오른쪽 정렬을 위해 justify-content-end 클래스 추가 -->
            <div class="col-auto"> <!-- col-auto를 사용하여 필요한 만큼의 너비만 사용하도록 설정 -->
                <button id="directInputBtn" class="btn btn-primary" onclick="addCustomItem()">직접입력</button>
            </div>
        </div>
        <div class="row align-items-center mb-30"> <!-- align-items-center 클래스 추가 -->
            <div class="col">
                <label for="companyName" class="q1-label2">선택 된 스킬</label>
            </div>           
            <div class="col">
                <div class="form-control q1-input11" id="selectedItemsContainer">
                    <div class="selected-items" id="selectedItems"></div>
                </div>
            </div>
        </div>
    </div>
</div>
        <!-- 오른쪽: 버튼 -->
        <div class="col-md-4">
            <!-- 임시 저장 버튼 -->
            <button type="button" class="btn btn-secondary btn-block mb-3">임시 저장</button>
            <!-- 등록하기 버튼 -->
            <button type="button" class="btn btn-primary btn-block">등록하기</button>
        </div>
    </div>
</div>

<!-- 부트스트랩 JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>