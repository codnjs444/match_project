<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Announcement Form with Bootstrap</title>
<!-- 최신 버전의 부트스트랩 CSS 추가 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
.title1 {
    font-size: 16px;
    font-weight: bold;
    color: blue; /* 파란색으로 설정 */
    margin-bottom: 10px; /* 아래 여백 설정 */
    margin-top: 20px; /* 위 여백 설정 */
}

.stitle1 {
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
.input1 {
    font-size: 18px; /* 입력 필드 텍스트 크기 조정 */
    padding: 10px; /* 입력 필드 내부 여백 조정 */
    margin-bottom: 10px; /* 입력 필드 아래 여백 조정 */
    width: 500px;
    height: 40px;
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
    <!-- 좌측 레이아웃 -->
    <div class="row">
        <div class="col-md-8 offset-md-1"> <!-- 오른쪽으로 옮길 컨테이너 -->
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
                        <input type="text" class="input1" id="posting_company" name="posting_company">
                    </div>
                </div>
            </div>
        </div>
        <!-- 우측 레이아웃 -->
        <div class="col-md-3 d-flex flex-column align-items-center justify-content-center"> <!-- 버튼을 상하 중앙에 배치하기 위해 align-items-center 및 justify-content-center 클래스 추가 -->
            <button type="button" class="btn btn-primary mb-2 btn-sm">등록완료</button>
            <button type="button" class="btn btn-secondary btn-sm">임시저장</button>
        </div>
    </div>
</div>






<!-- 부트스트랩 JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
