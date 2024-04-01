<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Vector" %>
<%@page import="match.category.skill_categoryBean"%>
<%@page import="match.category.skill_categoryMgr"%>
<jsp:useBean id="skill_category" class="match.category.skill_categoryBean"></jsp:useBean>
<%
// categoryMgr 객체 생성
    skill_categoryMgr mgr = new skill_categoryMgr();
    // 스킬 이름 리스트 가져오기
    Vector<skill_categoryBean> skillList = mgr.skillList();

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
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<div class="container">
    <!-- 기업 정보 확인 텍스트 -->
    <div class="q1_1">기업 정보</div>
    <div class="q1">기업 정보를 확인해주세요.</div>

    <!-- 흰색 박스 -->
    <div class="q1-box">
        <!-- 기업명 텍스트와 텍스트 필드 -->
        <div class="row align-items-center">
            <div class="col">
                <label for="companyName" class="q1-label1">기업명</label>
            </div>
            <span class="q1-required">[필수]</span> <!-- 필수 문구 추가 -->
            <div class="col">
                <input type="text" class="form-control q1-input1" id="companyName" name="companyName">
            </div>
        </div>
        <!-- 기업명 텍스트와 텍스트 필드 -->
        <div class="row align-items-center">
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

    <!-- 모집 분야 -->
    <div class="q1_1">모집 분야</div>
    <div class="q1">어떤 일을 담당할 직원을 찾으시나요?</div>

    <!-- 흰색 박스 -->
    <div class="q1-box">
        <!-- 기업명 텍스트와 텍스트 필드 -->
        <div class="row align-items-center">
            <div class="col">
                <label for="companyName" class="q1-label1">모집분야명</label>
            </div>
            <span class="q1-required">[필수]</span> <!-- 필수 문구 추가 -->
            <div class="col">
                <input type="text" class="form-control q1-input1 bg-white" id="companyName01" name="companyName" readonly>
                <input type="hidden" name="companyName01" id="hidden_companyName01" value="">
                <script>
                	$(document).ready(function() {
                		// DB에서 가지고 오는 데이터
                		var category_list = [
                			{"code":"01", "name":"기획,전략", "slist":
                				[
                					{"code":"0101", "name":"경영관리"},
                					{"code":"0102", "name":"기획"},
                					{"code":"0103", "name":"게임기획"},
                					{"code":"0104", "name":"경영분석"}
                				]
                			},
               				{"code":"02", "name":"마케팅,홍보,조사", "slist":
	            				[
	            					{"code":"0201", "name":"마케팅"},
	            					{"code":"0202", "name":"홍보"},
	            					{"code":"0203", "name":"조사"}
	            				]
               				}
                		];
                		// 문서가 로딩이 되면 처리되는 내용 
                		var _mainCategory_html = "";
                		category_list.forEach(function(_row){
                			_mainCategory_html += "<li class='list-group-item'>" + _row.name + "</li>";
                		});
                		// 모집분야명을 클릭할 때, 이벤트 발생
                		$("#mainCategory").append(_mainCategory_html);
                		$("#companyName01").on("click", function() {
                			$("#companyNameCategory").show();
                		});
                		// 메인카테고리를 선택할 경우 서브카테고리 보여주기 
                		$("#mainCategory li").on("click", function() {
                			var _this_idx = $(this).index();
                			var _subCategoryHtml = "";
                			category_list[_this_idx].slist.forEach(function(_row) {
                				_subCategoryHtml += "<li class='list-group-item'> " + _row.name + " </li>";
                			});
                			$("#subCategory").html("").append(_subCategoryHtml);
                		});
                	});
                	// 서브카테고리를 선택할 경우의 이벤트
                	$(document).on("click", "ul#subCategory > li", function() {
            			var _this_val = $(this).text().trim();
            			var _origin_val = $("#companyName01").val().trim();
            			// todo. 카테고리 코드를 저장하는 스크립트 추가
            			// .... 
            			$("#companyName01").val( _origin_val + " " + _this_val );
            			$("#companyNameCategory").hide();
                	});
                </script>
                <div class="row" id="companyNameCategory" style="display: none;">
                	<div class="col-5">
                		<ul id="mainCategory" class="list-group"></ul>
                	</div>
                	<div class="col-5">
                		<ul class="list-group" id="subCategory"></ul>
                	</div>
                </div>
            </div>
        </div>

        <div class="row align-items-center">
            <div class="col">
                <label for="companyName" class="q1-label1">담당 업무</label>
            </div>           
            <div class="col">
                <input type="text" class="form-control q1-input1" id="companyName" name="companyName">
            </div>
        </div>

        <div class="row align-items-center">
            <div class="col">
                <label for="companyName" class="q1-label1">모집 인원</label>
            </div>           
            <div class="col">
                <input type="text" class="form-control q1-input1" id="companyName" name="companyName" placeholder="인원 수를 입력해주세요.">
            </div>
        </div>

        <div class="row align-items-center">
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
        <div class="row align-items-center">
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

    <!-- 지원 자격 -->
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
    <div class="dropdown-menu dropdown-menu-left" aria-labelledby="educationDropdownButton">
        <a class="dropdown-item" href="#">학력 무관</a>
        <a class="dropdown-item" href="#">검정고시</a>
        <a class="dropdown-item" href="#">고등학교 졸업</a>
        <a class="dropdown-item" href="#">대학졸업(2,3년)</a>
        <div class="dropdown-divider dropdown-menu-right"></div>
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

<!-- 부트스트랩 JS -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>

//선택된 아이템을 저장하는 배열
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

function searchData() {
    var searchField = document.getElementById('searchField');
    var searchText = searchField.value.toLowerCase();
    var directInputBtn = document.getElementById('directInputBtn'); // 직접 입력 버튼 가져오기

    if (searchText === '') {
        document.getElementById('greyBox').style.display = 'none'; // 검색창이 비었을 때 숨김
        directInputBtn.style.display = 'none'; // 직접 입력 버튼도 숨김
    } else {
        document.getElementById('greyBox').style.display = 'block'; // 검색창에 입력이 있을 때 보여줌
        directInputBtn.style.display = 'block'; // 직접 입력 버튼도 보여줌

        var filteredData = data.filter(function(item) {
            return item.includes(searchText);
        });

        var greyBox = document.getElementById('greyBox');
        greyBox.innerHTML = ''; // 기존 검색 결과를 초기화
        filteredData.forEach(function(item) {
            var div = document.createElement('div');
            div.textContent = item;
            greyBox.appendChild(div);
        });
    }
}

// 선택된 항목을 배열에 추가하고 화면에 표시하는 함수
function selectItem(item) {
    selectedItemsArray.push(item);
    renderSelectedItems();
    adjustContainerHeight(); // 선택된 항목 추가 후 컨테이너 높이 조정
}

// 선택된 항목을 취소하는 함수
function deselectItem(item) {
    var index = selectedItemsArray.indexOf(item);
    if (index > -1) {
        selectedItemsArray.splice(index, 1);
        renderSelectedItems();
        adjustContainerHeight(); // 선택된 항목 제거 후 컨테이너 높이 조정
    }
}

// 선택된 항목들이 추가되거나 제거될 때마다 화면을 다시 그리는 함수
function renderSelectedItems() {
    var selectedItemsContainer = document.getElementById('selectedItems');
    selectedItemsContainer.innerHTML = '';
    selectedItemsArray.forEach(function(item) {
        var span = document.createElement('span');
        span.textContent = item;
        span.classList.add('selected-item');
        span.setAttribute('onclick', 'deselectItem("' + item + '")'); // 선택된 항목을 클릭하면 취소되도록 설정
        selectedItemsContainer.appendChild(span);
    });
}

// 컨테이너의 높이를 조정하는 함수
function adjustContainerHeight() {
    var selectedItemsContainer = document.getElementById('selectedItemsContainer');
    var selectedItemsHeight = selectedItemsContainer.offsetHeight;
    var greyBoxHeight = document.getElementById('greyBox').offsetHeight;
    var totalHeight = selectedItemsHeight + greyBoxHeight;
    selectedItemsContainer.style.height = totalHeight + 'px';
}

// 검색 필드를 지우는 함수
function clearSearchField() {
    document.getElementById('searchField').value = '';
    searchData(); // 검색창이 비워졌을 때의 동작 수행
}

// 직접 입력 버튼 클릭 시 선택된 항목에 직접 입력한 값을 추가하는 함수
function addCustomItem() {
    var customItem = document.getElementById('searchField').value;
    if (customItem.trim() !== '') {
        selectedItemsArray.push(customItem);
        renderSelectedItems();
        adjustContainerHeight(); // 직접 입력한 항목 추가 후 컨테이너 높이 조정
        document.getElementById('searchField').value = ''; // 입력 필드 초기화
        document.getElementById('greyBox').style.display = 'none'; // 회색 박스 숨김
    }
}

// 회색 상자에서 항목을 선택하면 선택된 항목에 추가되는 함수
function selectGreyBoxItem(event) {
    var selectedItem = event.target.textContent;
    selectItem(selectedItem);
    document.getElementById('searchField').value = ''; // 검색 필드 초기화
    document.getElementById('greyBox').style.display = 'none'; // 회색 박스 숨김
}

// 이 함수를 사용하면 텍스트 필드에서 Enter 키를 눌렀을 때도 '직접 입력' 버튼이 클릭된 효과가 발생합니다.
document.getElementById('searchField').addEventListener('keyup', function(event) {
    if (event.keyCode === 13) {
        document.getElementById('directInputBtn').click();
    }
});
</script>
</body>
</html>
