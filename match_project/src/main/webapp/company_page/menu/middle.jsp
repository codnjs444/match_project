<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 공고 관리</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
	    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%!
    	int i =0;
    	String type = "일반 채용";
    	String name = "온종합병원 전산 직원(개발자) 모집";
    	String proceduretest = "서류전형->1차 면접->2차 면접->최종발표";
    %>
    <style>
    /*전체 컨테이너 스타일*/
	.custom-container {
	    max-width: 1400px;
	} 
	.custom-container {
	    max-width: 1400px;
	    margin: auto;
	}
	/*상단 부분 버튼*/
	.top_btn {
	    border: none; /* 테두리 제거 */
	    background-color: transparent; /* 배경색 제거 */
	    font-size: 18px; /* 폰트 사이즈 설정 */
	    color: #606060; /* 폰트 색상 설정 */
	    margin-right: 40px;
	    font-weight: bold;
	}
	
	.filt_btn {
	    border: none; /* 테두리 제거 */
	    background-color: transparent; /* 배경색 제거 */
	    font-size: 16px; /* 폰트 사이즈 설정 */
	    color: #606060; /* 폰트 색상 설정 */
	    margin-top: 6px;
	    margin-right: 20px;
	    font-weight: bolder;
	}	
	.filt_btn2 {
	    border: none; /* 테두리 제거 */
	    background-color: transparent; /* 배경색 제거 */
	    font-size: 16px; /* 폰트 사이즈 설정 */
	    color: #606060; /* 폰트 색상 설정 */
	    margin-top: 6px;
	    font-weight: bolder;
	}		
	.top_btn:hover {
	    color: #fff; /* 호버 시 폰트 색상 변경 */
	    background-color: #606060; /* 호버 시 배경색 변경 */
	}
	
	.top_btn.active {
	    color: #4698EA; !important; /* 클릭된 상태의 폰트 색상 설정 */
	}
	
	.dropdown-toggle {
	    background-color: transparent !important; /* 채용 전체 버튼의 배경색 제거 */
	    font-size: 17px; /* 폰트 사이즈 설정 */
	    font-weight: bolder;
	    color: #606060 !important; /* 폰트 색상 설정 */
	    border: none !important; /* 채용 전체 버튼의 테두리 제거 */
	    margin-right: 895px;
	    margin-left: -7px;
	    text-align: left; /* 드롭다운 텍스트를 좌측 정렬합니다 */
	}

	.filter-buttons {
	    position: relative;
	    margin-right: 10px;
	    padding-bottom: 10px; 
	}
	
	.filter-buttons::after {
	    content: "";
	    position: absolute;
	    bottom: 0;
	    right: 0;
	    width: 99%;
	    height: 2px;
	    background-color: #ccc;
	}
    /*공고 부분 스타일*/
	.job-post {
	    border: 1px solid #C4C4C4;
	    padding: 20px;
	    padding-top: 0; /* 상단 패딩 제거 */
	    padding-bottom: 0; /* 상단 패딩 제거 */
	    padding-right: 0; /* 상단 패딩 제거 */
	    padding-left: 0; /* 상단 패딩 제거 */
	    margin-bottom: 20px;
	    margin-right: auto;
	    margin-top: 0; /* 상단 마진 제거 */
	    margin-bottom: 0; /* 상단 마진 제거 */
	    margin-left: 0; /* 상단 마진 제거 */
	    margin-right: 0; /* 상단 마진 제거 */
	    min-height: 200px;
	    width: 100%;
	}
    /*공고 부분  구역 나누기 스타일*/
    .section {
        display: flex;
        justify-content: space-between;
    }

    .top, .middle, .bottm {
        flex: 1; /* 가로 공간을 동일하게 채움 */
        color: white; /* 텍스트 색상을 흰색으로 설정 */
    }

    /* 개별 섹션의 높이를 다르게 설정 */
    .top {
        height: 30px; /* 상단 부분의 높이 */
    }

    .middle {
        height: 160px; /* 중간 부분의 높이 */
    }

    .bottom {
        height: 30px; /* 하단 부분의 높이 */
    }
	.procedure-box {
	    display: inline-flex; /* 내용에 맞게 너비 조정 */
	    justify-content: center;
	    align-items: center;
	    padding: 0 10px; /* 좌우 패딩 추가 */
	    min-width: 100px; /* 최소 너비 설정 */
	    height: 37px;
	    background-color: white;
	    color: black;
	    margin: 20px auto;
	    border: 1px solid #606060;
	    border-radius: 5px;
	    font-weight: bold;
	    white-space: nowrap; /* 텍스트가 줄 바뀜 없이 한 줄로 표시 */
	}

	
	.section.middle {
	    height: 160px; /* 기존의 높이 설정 유지 */
	    display: flex;
	    flex-direction: column;
	}
	
	.vertical-section {
	    flex: 1; /* 부모 컨테이너의 높이에 따라 동일한 비율로 높이 설정 */
	}
    .middle-container {
        display: flex; /* Flexbox를 사용하여 가로로 요소를 배치 */
        height: 100%; /* 부모 컨테이너의 높이를 전부 차지 */
    }
    
    .horizontal-section {
        position: relative; /* 자식 요소인 .oval-shape를 절대 위치로 배치하기 위함 */
        height: 100%;
        display: flex;
    }

	.posting_type {
		margin-left: 10px;
	    position: absolute;
	    width: 80px;
	    height: 30px;
	    background-color: white;
	    border-radius: 30%;
	    border: 2px solid #C4C4C4;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    color: #606060;
	    font-size: 14px;
	    font-weight: bold;
	    left: 50%;
	    top: 0; /* 타원을 상단에 위치시킴 */
	    transform: translate(-50%, +100%); /* 왼쪽으로 50%, 위로 50% 이동하여 중앙 정렬 */
	}    

    .posting_name {
    	margin-top: 22px;
    	margin-left: 20px;
        font-size: 18px;
        font-weight: bolder;
        color: black;
        text-align: left; /* 좌측 정렬 */
        margin-bottom: 8px; /* 이름과 날짜 사이에 여백 */
    }

    .posting_date, .posting_service {
    	margin-left: 20px;
        font-size: 14px;
        color: #606060;
        text-align: left; /* 좌측 정렬 */
        margin-bottom: 8px; /* 날짜와 서비스 사이에 여백 */
    }

    .horizontal-section {
        flex-direction: column; /* 세로로 쌓기 */
        padding: 10px; /* 안쪽 여백 */
    }



	/*나머지 스타일*/
    .row-between {
        padding-right: 80px; /* 우측 간격을 늘립니다 */
    }
	
	/* 페이지 네비게이션 링크 색상 변경 */
	.pagination a {
	    color: #606060; /* 변경하고 싶은 색상 코드로 수정하세요 */
	}
	
	/* 활성 페이지 아이템 색상 변경 */
	.pagination .active a {
	    color: white !important; /* 변경하고 싶은 색상 코드로 수정하세요 */
	    background-color: #4698EA !important; /* 배경 색상도 변경하고 싶다면 수정하세요 */
	    border-color: #4698EA !important; /* 테두리 색상도 변경하고 싶다면 수정하세요 */
	}
	
	/* 페이지 네비게이션 링크에 호버했을 때의 색상 변경 */
	.pagination a:hover {
	    color: #333 !important; /* 변경하고 싶은 색상 코드로 수정하세요 */
	}

    </style>
</head>
<body>

<div class="container custom-container"> <!-- 여기에 custom-container 클래스 추가 -->
	<div style="padding-left: 20px;"> <!-- 여기에 내부 패딩 추가 -->
    <div class="row">
		<div class="col filter-buttons">
		    <button class="top_btn">진행중 <span><%= i %></span></button>
		    <button class="top_btn">미완성 <span><%= i %></span></button>
		    <button class="top_btn">마감 <span><%= i %></span></button>
		    <button class="top_btn">전체 <span><%= i %></span></button>
		</div>
    </div>
    <div class="row mt-1">
        <div class="col d-flex justify-content-between">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    채용유형
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#">일반채용</a>
                    <a class="dropdown-item" href="#">블라인드</a>
                </div>
            </div>
            <!-- 추가 필터링 옵션 드롭다운 버튼들 -->
		<div class="col buttons">
		    <button class="filt_btn">최신등록일순</button>
		    <button class="filt_btn">마감일순</button>
		    <button class="filt_btn2">지원자순</button>
		</div>
        </div>
    </div>
    <div class="row mt-1">
        <!-- 공고 리스트 출력 -->
        <div class="col-12">
            <div class="job-post">
			    <div class="section top">
			        <div class="procedure-box"><%= proceduretest %></div> <!-- 변수 값을 표시하는 박스 -->
			    </div>
				<div class="section middle">
				    <div class="middle-container">
				        <div class="horizontal-section" style="width: 8%;">
				            <div class="posting_type"><%= type %></div> <!-- 변수 값을 표시하는 타원형 도형 -->
				        </div> <!-- Gold, 너비 25% -->
				        <div class="horizontal-section" style="width: 62%;">
				            <div class="posting_name"><%= name %></div>
				            <div class="posting_date">2023-04-03~2023-04-03</div>
				            <div class="posting_service">이용중이신 홍보 서비스가 없습니다.</div>
				        	
				        </div> <!-- GreenYellow, 너비 25% -->	   
				        
						<div class="horizontal-section" style="width: 35%;">
						    <!-- 버튼 추가 -->
						    <div class="btn-group" role="group" aria-label="Basic example" style="padding: 10px; display: flex; justify-content: space-around; margin-top: 10px;">
						        <button type="button" class="btn" style="color: #606060; font-weight: bold;">홍보</button>
						        <button type="button" class="btn" style="color: #606060; font-weight: bold;">권한</button>
						        <button type="button" class="btn" style="color: #606060; font-weight: bold;">수정</button>
						        <button type="button" class="btn" style="color: #606060; font-weight: bold;">복사</button>
						        <button type="button" class="btn" style="color: #606060; font-weight: bold;">마감</button>
						    </div>
						    <!-- 지원자 및 합격자 수 표시 박스 -->
						    <div style="border: 1px solid #C4C4C4; color: #606060; font-weight: bold; padding: 10px; width: 240px; border-radius: 8px; text-align: center; margin-left: 100px;">
						        <span style="margin-right: 30px;">지원자: <%= i %>명</span>
						        <span>합격자: <%= i %>명</span>
						    </div>
						</div>

				    </div>
				</div>

                <div class="section bottom"></div>
            </div>
        </div>
        <!-- 두 번째와 세 번째 공고 또한 이와 같은 방법으로 추가 -->
    </div>
    <div class="row">
        <div class="col">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </div>
    </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.9.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const buttons = document.querySelectorAll(".top_btn");
	    buttons.forEach(function(button) {
	        button.addEventListener("click", function() {
	            buttons.forEach(function(btn) {
	                btn.classList.remove("active");
	            });
	            this.classList.add("active");
	            // 클릭된 버튼에 대해 테두리 제거
	            this.style.outline = "none";
	        });
	    });
	});
	
</script>


</body>
</html>
