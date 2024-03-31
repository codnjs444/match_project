<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
		.row-cols-4{
			padding-left: 65px;
		}
		.zero{
			flex: 2;
		}
		.first{
			flex: 10;
			padding-left: 0px;
			padding-right: 0px;
		}
		.second{
			flex: 3;
			padding-left: 100px;
		}
		.third{
			flex: 2;
		}
		.acc-btn {
			padding-left: 0px;
			padding-right: 0px;
		}
		.accordion-button {
			padding-left: 5px;
		}
		.accordion-button{
			font-size: 14px;
		}
		.fixed-div1 {
		    position: fixed; /* 고정 위치 */
		    top: 129px; /* 위에서 20px 거리 */
		    right: 220px; /* 오른쪽에서 20px 거리 */
		    width: 300px;
		    height: 80px;
		    display: flex;
            flex-direction: column;
            justify-content: space-between;
	  	}
		.fixed-div2 {
		    position: fixed; /* 고정 위치 */
		    top: 208px; /* 위에서 20px 거리 */
		    right: 220px; /* 오른쪽에서 20px 거리 */
		    width: 300px;
		    height: 160px;
		    border: 1px solid lightgrey;
	  	}
        .id-picture{
        	margin-left: 10px;
        	margin-top: 10px;
        	width: 60px;
	        height: 60px;
	        border-radius: 50%; /* 반지름이 너비와 높이의 절반 */
	        border: 1px solid
        }
        .name{
        	width: 70px;
        }
        .my-btn-div{
        	width: 100px;
        	height: 79px;
        	display: flex;
    		justify-content: center;
    		align-items: center;
    		flex-direction: column;
        }
        .info {
	        border: 1px solid lightgrey;
	        font-size: 11px;
	        width: 90px;
	    }
	    .my-btn-text{
	    	font-size: 11px;
	    }
	    .my-btn-icon1 {
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('../img/user_btn1.png'); /* 첫 번째 이미지 링크 추가 */
            background-size: contain; /* 이미지를 버튼에 맞게 조정 */
            background-position: center; /* 이미지를 가운데 정렬 */
            background-repeat: no-repeat; /* 배경 이미지 반복 방지 */
	    	border: none;
	    	background-color: white;
        }
	    .my-btn-icon2 {
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('../img/user_btn2.png'); /* 첫 번째 이미지 링크 추가 */
            background-size: contain; /* 이미지를 버튼에 맞게 조정 */
            background-position: center; /* 이미지를 가운데 정렬 */
            background-repeat: no-repeat; /* 배경 이미지 반복 방지 */
	    	border: none;
	    	background-color: white;
        }
	    .my-btn-icon3 {
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('../img/user_btn3.png'); /* 첫 번째 이미지 링크 추가 */
            background-size: contain; /* 이미지를 버튼에 맞게 조정 */
            background-position: center; /* 이미지를 가운데 정렬 */
            background-repeat: no-repeat; /* 배경 이미지 반복 방지 */
	    	border: none;
	    	background-color: white;
        }
	    .my-btn-icon4 {
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('../img/user_btn4.png'); /* 첫 번째 이미지 링크 추가 */
            background-size: contain; /* 이미지를 버튼에 맞게 조정 */
            background-position: center; /* 이미지를 가운데 정렬 */
            background-repeat: no-repeat; /* 배경 이미지 반복 방지 */
	    	border: none;
	    	background-color: white;
        }
	    .my-btn-icon5 {
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('../img/user_btn5.png'); /* 첫 번째 이미지 링크 추가 */
            background-size: contain; /* 이미지를 버튼에 맞게 조정 */
            background-position: center; /* 이미지를 가운데 정렬 */
            background-repeat: no-repeat; /* 배경 이미지 반복 방지 */
	    	border: none;
	    	background-color: white;
        }
	    .my-btn-icon6 {
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('../img/user_btn6.png'); /* 첫 번째 이미지 링크 추가 */
            background-size: contain; /* 이미지를 버튼에 맞게 조정 */
            background-position: center; /* 이미지를 가운데 정렬 */
            background-repeat: no-repeat; /* 배경 이미지 반복 방지 */
	    	border: none;
	    	background-color: white;
        }
    </style>
</head>
<body>
	<div class="row row-cols-4">
		<div class="col zero">
		</div>
		<div class="col first">
		    <div class="accordion" id="accordionExample">
		        <div class="row row-cols-6">
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		                            직무
		                        </button>
		                    </h2>
		                    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		                            근무지역
		                        </button>
		                    </h2>
		                    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		                            경력
		                        </button>
		                    </h2>
		                    <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
		                            학력
		                        </button>
		                    </h2>
		                    <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
		                            기업형태
		                        </button>
		                    </h2>
		                    <div id="collapseFive" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
		                            고용형태
		                        </button>
		                    </h2>
		                    <div id="collapseSix" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
		                            산업
		                        </button>
		                    </h2>
		                    <div id="collapseSeven" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
		                            직급/직책/급여
		                        </button>
		                    </h2>
		                    <div id="collapseEight" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
		                            우대전공
		                        </button>
		                    </h2>
		                    <div id="collapseNine" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
		                            스킬
		                        </button>
		                    </h2>
		                    <div id="collapseTen" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="col acc-btn">
		                <div class="accordion-item">
		                    <h2 class="accordion-header">
		                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
		                            자격증
		                        </button>
		                    </h2>
		                    <div id="collapseEleven" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                        <div class="accordion-body">
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	    <!-- New button added here -->
	    <div class="col second">
		    <div class="row">
		        <div class="col">
		            <div class="fixed-div1 border border-light-subtitle">
		            	<div class="row" style="width:300px;">
		            		<div class="col">
		            			<div class="id-picture px-0"></div>
		            		</div>
		            		<div class="col name border-0 bg-body px-0">
		            			<input class="name border-0 bg-body" type="text" disabled placeholder="한우진">
		            		</div>
		            		<div class="col px-0">
		            			<button class="info border-light-subtitle bg-body">
		            				로그 아웃
		            			</button>
		            			<button class="info border-light-subtitle bg-body">
		            				회원 정보 수정
		            			</button>
		            			<button class="info border-light-subtitle bg-body">
		            				채용 공고 설정
		            			</button>
		            		</div>
		            	</div>
		            </div>
		            <div class="fixed-div2">
		            	<div class="row justify-content-center align-items-center">
	            			<div class="my-btn-div px-0 border-end border-light-subtitle">
            					<button class="my-btn-icon1"></button>
            					<p class="my-btn-text">이력서 관리</p>
	            			</div>
	            			<div class="my-btn-div px-0 border-end border-light-subtitle">
	            				<button class="my-btn-icon2"></button>
            					<p class="my-btn-text">이력서 열람</p>
	            			</div>
	            			<div class="my-btn-div px-0">
	            				<button class="my-btn-icon3"></button>
            					<p class="my-btn-text">입사지원 현황</p>
	            			</div>
	            			<div class="my-btn-div px-0 border-end border-top border-light-subtitle">
	            				<button class="my-btn-icon4"></button>
            					<p class="my-btn-text">최근 본 공고</p>
	            			</div>
	            			<div class="my-btn-div px-0 border-end border-top border-light-subtitle">
	            				<button class="my-btn-icon5"></button>
            					<p class="my-btn-text">스크랩 공고</p>
	            			</div>
	            			<div class="my-btn-div px-0 border-top border-light-subtitle">
	            				<button class="my-btn-icon6"></button>
            					<p class="my-btn-text">문의</p>
	            			</div>
		                </div>
		            </div>
		        </div>
		    </div>
	    </div>
	    <div class="col third">
	    </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</body>
</html>