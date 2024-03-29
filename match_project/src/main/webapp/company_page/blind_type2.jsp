<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
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
</style>
</head>
<body>

<div class="container mt-10">
     <form name="companyFrm" id="companyForm" method="POST">
        <!-- 좌측 레이아웃 -->
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
                            <input type="text" class="input" id="posting_pcode" placeholder="우편번호" >
                            <input type="button" class="btn-search" onclick="execDaumPostcode()" value="우편번호 찾기">  
                        </div>
                    </div>

                    <!-- 회사주소와 상세주소 입력 -->
                    <div class="row">
                        <div class="col">
                            <input type="text" class="input_noq" id="posting_address" placeholder="회사주소" readonly>
                        </div>
                        <div class="col">
                            <input type="text" class="input_noq" id="posting_dcode" placeholder="상세주소">    
                        </div>
                    </div>
                </div>
            </div>
            <!-- 우측 레이아웃 -->
            <div class="col-md-3 d-flex flex-column align-items-center justify-content-center"> <!-- 버튼을 상하 중앙에 배치하기 위해 align-items-center 및 justify-content-center 클래스 추가 -->
                <!-- 등록 완료 버튼 -->
                <button id="registerButton" type="submit" class="btn btn-primary mb-2 btn-sm">등록완료</button>

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
        <h5 class="modal-title" id="exampleModalLabel">제목 입력</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form name ="nameFrm" id="titleForm" action="post_proc.jsp">
        <div class="modal-body">
          <input type="text" class="form-control" id="posting_name" name="posting_name" placeholder="제목 입력">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" onclick="submitAnnouncement()">확인</button>
        </div>
      </form>
    </div>
  </div>
</div>





<!-- 스크립트 부분 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
// 주소 찾기 기능 생략
document.getElementById("registerButton").addEventListener("click", function(event) {
    event.preventDefault(); // 폼 자동 제출 방지
    var companyName = document.getElementById("posting_cname").value.trim();
    var postalCode = document.getElementById("posting_pcode").value.trim();

    if (companyName === "" || postalCode === "") {
        alert("기업명과 우편번호를 모두 입력해주세요.");
    } else {
        $('#titleModal').modal('show');
    }
});

</script>

</body>
</html>