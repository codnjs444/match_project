<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dropdown Border Color Change</title>
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
        }

        /* q1_1과 q1 사이의 간격 조절 */
        .q1_1 + .q1 {
            margin-top: -20px; /* q1_1 아래 여백을 줄여 q1-box 위로 이동 */
        }

        #toggleDepartment {
            transform: scale(6.5); /* 체크 박스 크기를 1.2배로 키웁니다. */
        }

        .checkbox-container {
            margin-right: 6px; /* 체크 박스와 텍스트 필드 사이의 간격 조절 */
        }

		
		
        /* 드롭다운 버튼의 배경색과 글자색 변경 */
        .dropdown-toggle {
            width: 745px;
            height: 50px;
            border-radius: 5px;
            background-color: white; /* 배경색을 파란색으로 변경 */
            color: black; /* 글자색을 흰색으로 변경 */
            margin-right: 30px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
        }

        /* 드롭다운 메뉴 아이템의 배경색과 글자색 변경 */
        .dropdown-item {
            background-color: #white; /* 배경색을 파란색으로 변경 */
            color: #black; /* 글자색을 흰색으로 변경 */
            font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
        }

        /* 추가된 CSS */
        .align-self-center {
            align-self: center;
        }

        .align-items-center {
            display: flex;
            align-items: center;
        }


        /* 추가된 CSS */
        .align-self-center {
            align-self: center;
        }

        .align-items-center {
            display: flex;
            align-items: center;
        }

        .q1-label1,
        .q1-required {
            margin-bottom: 0;
        }
        
.custom-checkbox-container {
    border: 1px solid grey;
    padding: 10px;
    border-radius: 4px;
    width: 217px;
    height: 40px;
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    cursor: pointer;
    margin-left: 17px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
    margin-right: 30px; /* 입력 필드 오른쪽 여백 조정하여 왼쪽으로 이동 */
}

.custom-checkbox-container input[type="checkbox"] {
    display: none;
}

.custom-checkbox-container label {
    cursor: pointer;
}

.custom-checkbox-container:hover {
	background-color: #5A6268;
}
.custom-checkbox-container:hover label {
    color: white; /* 마우스 호버 시 텍스트 색상을 흰색으로 변경 */
}

.custom-checkbox-container input[type="checkbox"]:checked + label {
    border-color: blue; /* 체크되었을 때 테두리 색상 변경 */
}

.custom-checkbox-container input[type="checkbox"]:not(:checked) + label:hover {
    border-color: grey; /* 체크되지 않았을 때 마우스를 올렸을 때 테두리 색상 변경 */
}

.custom-checkbox-container input[type="checkbox"]:checked + label:before {
    content: '\2713'; /* 체크 표시 추가 */
    display: inline-block;
    font-size: 16px;
    color: blue; /* 체크된 상태일 때 색상 변경 */
    text-align: center;
    vertical-align: middle;
    width: 20px;
    height: 20px;
    border: 1px solid blue; /* 체크된 상태일 때 테두리 색상 변경 */
    border-radius: 2px;
    margin-right: 5px;
}

.custom-checkbox-container input[type="checkbox"]:not(:checked) + label:before {
    content: ''; /* 체크 표시 없음 */
}
    .mb-30 {
        margin-top: 20px;
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
                <input type="text" class="form-control q1-input1" id="companyName" name="companyName">
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
    
 // 드롭다운 버튼 텍스트 업데이트 함수
    function updateDropdownButton(dropdownId, text) {
        document.getElementById(dropdownId).innerText = text;
        document.getElementById(dropdownId).style.fontSize = '18px';
    }

    // 드롭다운 메뉴 아이템 클릭 이벤트 핸들러 등록 함수
    function registerDropdownItemClickEvent(dropdownId, dropdownItems) {
        for (var i = 0; i < dropdownItems.length; i++) {
            dropdownItems[i].addEventListener('click', function(event) {
                // 링크 이동 등의 기본 동작을 막음
                event.preventDefault();
                var selectedText = this.innerText;
                updateDropdownButton(dropdownId, selectedText);
            });
        }
    }
    
    function updateTextColor(textId, checkbox) {
        var textElement = document.getElementById(textId);
        if (checkbox.checked) {
            textElement.parentNode.style.borderColor = 'blue'; // 체크되면 테두리 색상을 파랑으로 변경
        } else {
            textElement.parentNode.style.borderColor = 'grey'; // 체크 해제되면 테두리 색상을 회색으로 변경
        }
    }
    
    // 박스 클릭 시 체크되도록 수정된 함수
    function toggleCheckbox(checkboxId) {
        var checkbox = document.getElementById(checkboxId);
        checkbox.checked = !checkbox.checked;
    }


    // 첫 번째 드롭다운 메뉴 아이템 클릭 이벤트 핸들러 등록
    var educationDropdownItems = document.querySelectorAll('#educationDropdownButton + .dropdown-menu .dropdown-item');
    registerDropdownItemClickEvent('educationDropdownButton', educationDropdownItems);

    // 두 번째 드롭다운 메뉴 아이템 클릭 이벤트 핸들러 등록
    var genderDropdownItems = document.querySelectorAll('#genderDropdownButton + .dropdown-menu .dropdown-item');
    registerDropdownItemClickEvent('genderDropdownButton', genderDropdownItems);
    
    
</script>

</body>
</html>