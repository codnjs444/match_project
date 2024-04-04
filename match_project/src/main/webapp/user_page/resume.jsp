<!-- resume.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
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
			min-height: 190px;
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
			height: 65px;
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
		}
		.msbox-con{
			width: 200px;
			height: 55px;
		}
		.lbox-con{
			width: 900px;
			height: 63px;
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
					<div class="row">
						
					</div>
				</div>
				<div class="title">스킬</div>
				<div class="box">
					<div class="row">
						
					</div>
				</div>
				<div class="title">자격증</div>
				<div class="box">
					<div class="row">
						
					</div>
				</div>
			</div>
			
			<div class="fixed-right resume-side row me-0">
				<div class="right-header">이력서 항목</div>
				<div class="right-content">
					
				</div>
				<button class="right-btn" onclick="submitResume()">저장</button>
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
            var dropdown = newInternBox.querySelector('.dropdown');
            var dropdownToggle = dropdown.querySelector('.dropdown-toggle');
            dropdownToggle.textContent = '활동 구분';
            dropdown.classList.remove('show'); // 드롭다운 메뉴가 열려있는 경우를 처리하기 위해 'show' 클래스 제거
            var dropdownMenu = dropdown.querySelector('.dropdown-menu');
            dropdownMenu.querySelectorAll('.dropdown-item').forEach(function(item) {
                item.classList.remove('active'); // 활성화 클래스 제거
            });

            // hidden input의 스타일 초기화
            var hiddenInput = newInternBox.querySelector('input[type="hidden"]');
            hiddenInput.value = ''; // hidden input 값 초기화
            hiddenInput.style.display = 'none'; // hidden input의 스타일을 숨김으로 설정

            // 새로운 인턴 박스에 삭제 버튼을 추가합니다.
            var deleteButtonContainer = document.createElement('div');
            deleteButtonContainer.style.textAlign = 'center';
            var deleteButton = document.createElement('button');
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

        
        function submitResume(){
        	document.resumeFrm.submit();
        }
        
        document.addEventListener("DOMContentLoaded", function() {
            var internsyearDropdown = document.getElementById("intern_syear[]");
            var interneyearDropdown = document.getElementById("intern_eyear[]");
            var currentYear = new Date().getFullYear();

            for (var i = currentYear - 60; i <= currentYear; i++) {
                var internsoption = document.createElement("option");
                var interneoption = document.createElement("option");
                
                internsoption.text = i;
                internsoption.value = i;
                
                interneoption.text = i;
                interneoption.value = i;
                
                internsyearDropdown.appendChild(internsoption);
                interneyearDropdown.appendChild(interneoption);
            }
        });
	</script>
</body>
</html>