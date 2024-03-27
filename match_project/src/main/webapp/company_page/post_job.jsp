<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용 공고 입력 양식</title>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- 추가: Poppins 폰트 -->
<style>
    body {
        font-family: 'Poppins', sans-serif;
    }
    
    /* 기업 정보 확인 텍스트 스타일 */
    .q1 {
        font-size: 26px;
        font-weight: bolder;
        margin-bottom: 20px;
        margin-top: 20px;
    }

    .q1_1 {
        font-size: 19px;
        font-weight: bold;
        color: blue; /* 파란색으로 설정 */
        margin-bottom: 20px; /* 아래 여백 설정 */
        margin-top: 40px; /* 위 여백 설정 */

    }

    /* 흰색 박스 스타일 */
    .q1-box {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }

    /* (기업명)라벨과 입력 필드 크기 및 간격 수정 */
    
    .q1-label1 {
        font-size: 22px; /* 라벨 텍스트 크기 조정 */
        margin-bottom: 10px; /* 라벨 아래 여백 조정 */
        font-weight: bolder;

        margin-left: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
    }
	
    .q1-input1 {
        font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
        padding: 10px; /* 입력 필드 내부 여백 조정 */
        margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
        width: 750px;
        height: 60px;
    	margin-right: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
    }
    
        .q1-input2 {
        font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
        padding: 10px; /* 입력 필드 내부 여백 조정 */
        margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
        width: 750px;
        height: 60px;
    	margin-left: 292px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
    }
    
    .address2 {
        font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
        padding: 10px; /* 입력 필드 내부 여백 조정 */
        margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
        width: 400px;
        height: 60px;
    	margin-right: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
    }
    
    .q2-input1 {
        font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
        padding: 10px; /* 입력 필드 내부 여백 조정 */
        margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
        width: 250px;
        height: 60px;
    	margin-right: 10px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
    }

    /* 필수 */
    .q1-required {
        font-size: 16px; /* 필수 문구 텍스트 크기 조정 */
        color: red; /* 빨간색으로 설정 */
/* 		margin-right: 180px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */ */
    }
    
    /* q1_1과 q1 사이의 간격 조절 */
    .q1_1 + .q1 {
        margin-top: -20px; /* q1_1 아래 여백을 줄여 q1-box 위로 이동 */
    }
    
        #toggleDepartment {
        transform: scale(1.5); /* 체크 박스 크기를 1.2배로 키웁니다. */
    }
    
        .checkbox-container {
        margin-right: 10px; /* 체크 박스와 텍스트 필드 사이의 간격 조절 */
    }
    
        /* 드롭다운 버튼의 배경색과 글자색 변경 */
    .dropdown-toggle {
        background-color: #007bff; /* 배경색을 파란색으로 변경 */
        color: #fff; /* 글자색을 흰색으로 변경 */
    }

    /* 드롭다운 메뉴 아이템의 배경색과 글자색 변경 */
    .dropdown-item {
        background-color: #007bff; /* 배경색을 파란색으로 변경 */
        color: #fff; /* 글자색을 흰색으로 변경 */
    }

    /* 드롭다운 메뉴 아이템 호버시 배경색 변경 */
    .dropdown-item:hover {
        background-color: #0056b3; /* 호버시 배경색을 진한 파란색으로 변경 */
    }
</style>
<!-- 추가: 사용자 정의 스타일 시트 -->
</head>
<body>
<!----------------------------------------- 기업 정보 컨테이너 --------------------------------------------->
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
    <!-- 기업 정보 확인 텍스트 -->
    <div class="q1_1">지원 자격</div>
    <div class="q1">지원 자격은 어떻게 되나요?</div>

    <!-- 흰색 박스 -->
    <div class="q1-box">
        <!-- 기업명 텍스트와 텍스트 필드 -->
        <div class="row align-items-center"> <!-- align-items-center 클래스 추가 -->
            <div class="col">
                <label for="companyName" class="q1-label1">지원자 학력</label>
            </div>
            <span class="q1-required">[필수]</span> <!-- 필수 문구 추가 -->
<div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        선택하세요
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="#">옵션 1</a>
        <a class="dropdown-item" href="#">옵션 2</a>
        <a class="dropdown-item" href="#">옵션 3</a>
    </div>
</div>

        </div>
        
      
    </div>
</div>

        

<!-- 부트스트랩 JS -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
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
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
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
    
</script>

</body>
</html>