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
</style>
<!-- 추가: 사용자 정의 스타일 시트 -->

</head>

<body>

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
                <input type="text" class="form-control q1-input1" id="companyName" name="companyName" placeholder="기업명을 입력하세요">
            </div>
        </div>
		 <!-- 기업명 텍스트와 텍스트 필드 -->
        <div class="row align-items-center"> <!-- align-items-center 클래스 추가 -->
            <div class="col">
                <label for="companyName" class="q1-label1">대표 근무지역</label>
            </div>
                            <span class="q1-required">[필수]</span> <!-- 필수 문구 추가 -->
            <div class="col">
                <input type="text" class="form-control q1-input1" id="companyName" name="companyName" placeholder="주소 입력">
            </div>
                    <div id="map" style="width:500px;height:400px;"></div>
        </div>
        
    </div>
</div>



<!-- 부트스트랩 JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b28368048064031cb16c46ec4323c355"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>
