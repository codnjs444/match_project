<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta charset="UTF-8">
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
    <div class="row">
        <div class="col-md-8 offset-md-1"> <!-- 왼쪽으로 옮길 컨테이너 -->
            <div class="title">기업 정보</div>
            <div class="stitle">기업 정보를 확인해주세요.</div>
            <div class="box">
                <!-- 기업명 텍스트와 텍스트 필드 -->
                <form name="companyForm" action="post_proc.jsp" method="GET">
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
                </form>
            </div>
            <!-- 모집 정보 -->
            <div class="title">모집 정보</div>
            <div class="stitle">어떤 일을 담당할 직원을 찾으시나요</div>
            <div class="box">
                <!-- 기업명 텍스트와 텍스트 필드 -->
                <form name="openpositionForm" action="post_proc.jsp" method="GET">
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="companyName" class="question">모집분야명</label>
                        </div>
                        <span class="essential">[필수]</span> <!-- 필수 문구 추가 -->
                        <div class="col">
                            <select class="input" id="recruitment_pcode" name="recruitment_pcode">
    							<option value="" selected disabled>우편번호 선택</option>
							</select>
                        </div>
                        
                        
                        
                        
                    </div>
                    
                    <!-- 대표 근무지역 입력 -->
                    <div class="row align-items-center"  style="margin-bottom: 10px;">
                        <div class="col ">
                            <label for="companyAdress" class="question">담당 업무</label>
                        </div>
                        <div class="col">
                            <input type="text" class="input" id="recruitment_pcode" name="recruitment_pcode" placeholder="우편번호" >
                           
                        </div>
                    </div>
                    
                    <!-- 회사주소와 상세주소 입력 -->
                    <div class="row">
                        <div class="col">
                            <input type="text" class="input_noq" id="recruitment_address" name="recruitment_address" placeholder="회사주소" readonly >
                        </div>
                        <div class="col">
                            <input type="text" class="input_noq" id="recruitment_dcode" name="recruitment_dcode" placeholder="상세주소" >    
                            <input type="hidden" name="recruitment_name">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- 우측 레이아웃 -->
        <div class="col-md-3 d-flex flex-column align-items-center justify-content-center"> <!-- 버튼을 상하 중앙에 배치하기 위해 align-items-center 및 justify-content-center 클래스 추가 -->
            <!-- 등록 완료 버튼 -->
            <button id="registerButton" type="button" class="btn btn-primary mb-2 btn-sm">등록완료</button>
            <button type="button" class="btn btn-secondary btn-sm">임시저장</button>
        </div>
    </div>
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
	window.onbeforeunload = function() {
    return "정말 나가시겠습니까? 아직 공고가 작성중입니다..";
};
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
	// 등록 완료 버튼 클릭 시 모달 활성화
	// 등록 버튼 클릭 시 필수 입력 필드 확인
	document.getElementById("registerButton").addEventListener("click", function() {
    var companyName = document.getElementById("posting_cname").value.trim();
    var postalCode = document.getElementById("posting_pcode").value.trim();

    if (companyName === "" || postalCode === "") {
        alert("기업명과 우편번호를 모두 입력해주세요.");
    } else {
            // 모든 필수 입력이 완료된 경우 등록 완료 모달 표시
            $('#titleModal').modal('show');

    }
	});
	
	// 제목 입력 후 확인 버튼 클릭 시 처리할 함수
	function submitAnnouncement() {
		
		//var formData = new FormData(document.getElementById("companyForm"));
		formData = document.companyForm;
	    //formData.append("posting_name", document.getElementById("posting_name_modal").value);
	    formData.posting_name.value = document.getElementById("posting_name_modal").value;
	    formData.submit();
		
	    $('#titleModal').modal('hide'); // 모달 닫기
	}



	/////////////////////////////////////////////////////////////////////////////////////////////////////

	</script>

</body>
</html>