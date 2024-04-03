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
			height: 3000px;
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
			min-height: 180px;
			border: 1px solid lightgrey;
			border-radius: 10px/10px;
			padding-bottom: 10px;
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
		.add-edu{
			margin-top: 10px;
			width: 150px;
			background-color: #606060;
			color: #fff;
			border: 1px solid #606060;
			border-radius: 5px/5px;
		}
		.add-career{
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
		<div class="fixed-left resume-side row ms-0">
			<div class="left-img"></div>
			<div class="left-name">한우진</div>
			<div class="left-info">
				
			</div>
		</div>
		
		<div class="resume-center">
			<div class="title">자기소개</div>
			<div class="stitle">당신은 어떤 사람인가요? (한 줄 소개)</div>
			<input class="input-box" type="text">
			<div class="stitle">당신의 꿈, 목표와 비전에 대해 기술해주세요.</div>
			<input class="input-box" type="text">
			<div class="stitle">당신의 가치관에 대해 기술해주세요.</div>
			<input class="input-box" type="text">
			
			<div class="title">학력</div>
			<div class="box">
				<div class="row">
					<div class="box-style sbox p-0">
						<div class="dropdown">
				            <button class="box-style sbox-con dropdown-toggle" type="button" id="edu-type-dropdown" data-bs-toggle="dropdown" aria-expanded="false">
				                학력 유형 선택
				            </button>
				            <div class="dropdown-menu">
				                <a class="dropdown-item" href="#" onclick="selectEdu('학력 무관', event)">학력 무관</a>
				                <a class="dropdown-item" href="#" onclick="selectEdu('고등학교 졸업', event)">고등학교 졸업</a>
				                <a class="dropdown-item" href="#" onclick="selectEdu('대학교 졸업(2~3년)', event)">대학교 졸업(2~3년)</a>
				                <a class="dropdown-item" href="#" onclick="selectEdu('대학교 졸업(4년)', event)">대학교 졸업(4년)</a>
				                <a class="dropdown-item" href="#" onclick="selectEdu('대학원 졸업(석사)', event)">대학원 졸업(석사)</a>
				                <a class="dropdown-item" href="#" onclick="selectEdu('대학원 졸업(박사)', event)">대학원 졸업(박사)</a>
				                <input type="hidden" id="edu_type" name="edu_type" value="">
				            </div>
				        </div>
					</div>
					<div class="box-style mbox p-0">
						<input class="box-style mbox-con" type="text" placeholder="학교명">
					</div>
					<div class="box-style mbox p-0">
						<input class="box-style mbox-con" type="text" placeholder="전공명">
					</div>
				</div>
				<div class="row">
					<span class="stext">입학년월</span>
					<div class="box-style msbox p-0">
						<input type="datetime-Local" id="" name="" class="box-style msbox-con">
					</div>
					<span class="stext">졸업년월</span>
					<div class="box-style msbox p-0">
						<input type="datetime-Local" id="" name="" class="box-style msbox-con">
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
				                <input type="hidden" id="status" name="status" value="">
				            </div>
				        </div>
					</div>
				</div>
				<div class="row m-0">
					<button class="add-edu mx-auto" onclick="addEduSection()">추가하기</button>
				</div>
			</div>
			
			<div class="title">경력</div>
			<div class="box">
				<div class="row">
					<div class="box-style sbox p-0">
						<input class="box-style sbox-con" type="text" placeholder="회사명">
					</div>
					<div class="box-style mbox p-0">
						<input class="box-style mbox-con" type="text" placeholder="부서명">
					</div>
					<div class="box-style mbox p-0">
						<input class="box-style mbox-con" type="text" placeholder="담당 직무">
					</div>
				</div>
				<div class="row">
					<span class="stext">입사년월</span>
					<div class="box-style msbox p-0">
						<input type="datetime-Local" id="" name="" class="box-style msbox-con">
					</div>
					<span class="stext">퇴사년월</span>
					<div class="box-style msbox p-0">
						<input type="datetime-Local" id="" name="" class="box-style msbox-con">
					</div>
				</div>
				<div class="row">
					<div class="box-style lbox p-0">
						<textarea class="lbox-con box-style" placeholder="담당 업무"></textarea>
					</div>
				</div>
				<div class="row m-0">
					<button class="add-career mx-auto" onclick="addCareerSection()">추가하기</button>
				</div>
			</div>
			<div class="title">인턴, 대외 활동</div>
			<div class="box">
				<div class="row">
					
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
			<button class="right-btn">저장</button>
		</div>
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
		    var dropdownButton = document.getElementById('edu-type-dropdown');
		    dropdownButton.textContent = edu;
		    dropdownButton.style.backgroundColor = '#606060';
		    dropdownButton.style.color = 'white';
		    // 선택한 근무 요일을 숨겨진 입력 필드에 저장
		    document.getElementById('edu_type').value = edu;
		}
		function selectStatus(status, event) {
		    event.preventDefault(); // 페이지 상단으로 스크롤되는 것을 방지
		    var dropdownButton = document.getElementById('status-dropdown');
		    dropdownButton.textContent = status;
		    dropdownButton.style.backgroundColor = '#606060';
		    dropdownButton.style.color = 'white';
		    // 선택한 근무 요일을 숨겨진 입력 필드에 저장
		    document.getElementById('status').value = status;
		}
		function addEduSection() {
		    // 학력 섹션을 복제
		    var educationSection = document.querySelector('.box').cloneNode(true);

		    // 기존 입력값 초기화
		    var inputs = educationSection.querySelectorAll('input');
		    inputs.forEach(function(input) {
		        input.value = '';
		    });

		    // 복제한 섹션을 찾아 삽입
		    var addButton = document.querySelector('.add-edu');
		    addButton.parentNode.insertBefore(educationSection, addButton.nextSibling);
		}

		function addCareerSection() {
		    // 경력 섹션을 복제
		    var careerSection = document.querySelectorAll('.box')[1].cloneNode(true);

		    // 기존 입력값 초기화
		    var inputs = careerSection.querySelectorAll('input, textarea');
		    inputs.forEach(function(input) {
		        input.value = '';
		    });

		    // 복제한 섹션을 찾아 삽입
		    var addButton = document.querySelector('.add-career');
		    addButton.parentNode.insertBefore(careerSection, addButton.nextSibling);
		}
	</script>
</body>
</html>
