<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Vector" %>
<%@page import="match.skillBean"%>
<%@page import="match.categoryMgr"%>
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
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <link href="../css/post_job.css" rel="stylesheet" type="text/css">
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
    		    <div class="form-control q1-input10" id="greyBox" onclick="selectGreyBoxItem(event)">
            	<button id="boxbtn" class="btn btn-primary position-absolute end-0 bottom-0" onclick="addCustomItem()">직접입력</button> 
        	</div>
    	</div>
	</div>
		
		
	<div class="row align-items-center mb-30"> <!-- align-items-center 클래스 추가 -->
            <div class="col">
                <label for="companyName" class="q1-label2">선택 된 스킬</label>
            </div>           
            <div class="col">
                <div class="form-control q1-input11" id="selectedItems"></div>
            </div>
        </div>


dd

<!-- 부트스트랩 JS -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
// 선택된 아이템을 저장하는 배열
var selectedItemsArray = [];

// 스킬 데이터
var data = [
    <% 
        for (int i = 0; i < data.length; i++) {
            out.println("'" + data[i] + "'");
            if (i < data.length - 1) {
                out.println(",");
            }
        }
    %>
];




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
    
    // 스킬 자동완선 관련 function///////////////////////////////////////////////////////////////////////////////////
 // 초기에는 회색 상자가 비어있음
    document.getElementById('greyBox').style.display = 'none';

    // 검색 함수
    function searchData() {
        var searchField = document.getElementById('searchField');
        var searchText = searchField.value.toLowerCase();

        // 검색창이 비어있을 때
        if (searchText === '') {
            document.getElementById('greyBox').style.display = 'none'; // 회색 상자 숨기기
            document.getElementById('searchFieldValue').textContent = ''; // 검색 필드 값 영역 초기화
            return;
        }

        document.getElementById('greyBox').style.display = 'block'; // 회색 상자 보이기

        var filteredData = data.filter(function(item) {
            return item.startsWith(searchText);
        });

        // 회색 상자에 데이터 출력
        var greyBox = document.getElementById('greyBox');
        greyBox.innerHTML = '';
        filteredData.forEach(function(item) {
            var div = document.createElement('div');
            div.textContent = item;
            greyBox.appendChild(div);
        });

        // 검색 필드 값 출력
        document.getElementById('searchFieldValue').textContent = searchText;
    }

    // 선택된 아이템을 배열에 추가하고 화면에 표시하는 함수
    function selectItem(item) {
        selectedItemsArray.push(item);
        renderSelectedItems();
    }

    // 선택된 항목을 취소하는 함수
    function deselectItem(item) {
        var index = selectedItemsArray.indexOf(item);
        if (index > -1) {
            selectedItemsArray.splice(index, 1);
            renderSelectedItems();
        }
    }

    // 회색 상자 안의 항목을 선택하는 함수
    function selectGreyBoxItem(event) {
        var clickedItem = event.target.textContent;
        if (!isSelected(clickedItem)) {
            selectItem(clickedItem);
        } else {
            deselectItem(clickedItem);
        }
    }

    // 직접입력 버튼 클릭 시 호출되는 함수
    function addCustomItem() {
        var searchFieldValue = document.getElementById('searchFieldValue').textContent;
        if (searchFieldValue) { // 검색 필드에 값이 있는 경우
            if (!selectedItemsArray.includes(searchFieldValue)) {
                selectItem(searchFieldValue); // 선택된 아이템 목록에 추가
            }
        }
    }

    function renderSelectedItems() {
        var selectedItemsDiv = document.getElementById('selectedItems');
        selectedItemsDiv.innerHTML = '';
        selectedItemsArray.forEach(function(item) {
            var div = document.createElement('div');
            var span = document.createElement('span');
            span.textContent = item;
            div.className = 'selected-item';
            
            var removeBtn = document.createElement('button');
            removeBtn.textContent = 'X';
            removeBtn.className = 'remove-btn';
            removeBtn.onclick = function() {
                deselectItem(item);
            };

            div.appendChild(span);
            div.appendChild(removeBtn);
            selectedItemsDiv.appendChild(div);
        });
    }


    // 선택된 아이템인지 확인하는 함수
    function isSelected(item) {
        return selectedItemsArray.includes(item);
    }
    
 // 검색 필드 지우는 함수
    function clearSearchField() {
        document.getElementById('searchField').value = ''; // 검색 필드 내용을 지움
        document.getElementById('greyBox').style.display = 'none'; // 회색 상자 숨김
        document.getElementById('searchFieldValue').textContent = ''; // 검색 필드 값 영역 초기화
    }
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // 첫 번째 드롭다운 메뉴 아이템 클릭 이벤트 핸들러 등록
    var educationDropdownItems = document.querySelectorAll('#educationDropdownButton + .dropdown-menu .dropdown-item');
    registerDropdownItemClickEvent('educationDropdownButton', educationDropdownItems);

    // 두 번째 드롭다운 메뉴 아이템 클릭 이벤트 핸들러 등록
    var genderDropdownItems = document.querySelectorAll('#genderDropdownButton + .dropdown-menu .dropdown-item');
    registerDropdownItemClickEvent('genderDropdownButton', genderDropdownItems);
    
    
</script>

</body>
</html>