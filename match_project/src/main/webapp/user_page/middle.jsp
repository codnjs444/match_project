<%@page import="match.category.job_categoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="jcMgr" class="match.category.job_categoryMgr"/>
<%
	Vector<job_categoryBean> jcvlist1 = jcMgr.jobnameList();
	Vector<job_categoryBean> jcvlist2 = jcMgr.jobsnameList();
%>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
    	.filter{
    		margin-left: 35px;
    	}
		.fixed-div1 {
		    position: fixed; /* 고정 위치 */
		    top: 129px; /* 위에서 20px 거리 */	
		    right: 100px; /* 오른쪽에서 20px 거리 */
		    width: 300px;
		    height: 80px;
		    display: flex;
            flex-direction: column;
            justify-content: space-between;
	  	}
		.fixed-div2 {
		    position: fixed; /* 고정 위치 */
		    top: 208px; /* 위에서 20px 거리 */
		    right: 100px; /* 오른쪽에서 20px 거리 */
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
		.box {
	        padding-left: 20px;
	        padding-right: 20px;
	        padding-top: 10px;
	        padding-bottom: 1px;
	        border: 1px solid #000;
	        text-align: center;
	        display: none;
	    }
	    .box.active {
	        display: block;
	    }
	    .filter-btn.active {
		    background-color: #3d3d3d;
		    color: #fff;
		    border-color: #000;
		}
	    .filter-btn {
	        padding: 10px 20px;
	        cursor: pointer;
	        background-color: #F9FAFC;
	        color: #000;
	        border: 1px solid lightgrey;
	        margin: 0;
	        border-radius: 0;
	        width: 200px;
	        font-size: 14px;
	    }
	    .btn:hover {
	        background-color: #0056b3;
	    }
	    .button-group{
	    	width: 100%;
	    }
	    .filter-search{
	    	border:1px solid lightgrey;
	    	width:33%;
	    	margin-bottom: 10px;
	    }
	    .ctgr {
		    width:33%;
		}
		
		.sctgr {
			width:66%;
		    border-left: 1px solid; /* 우측에 경계선 추가 */
		}
		.box-border{
			border-bottom: 1px solid
		}
		.category {
		    display: inline-block;
		    width: 99%; /* Adjust the width as needed */
		    text-align: center; /* Center the text within the span */
		    margin-top: 20px;
		    margin-bottom: 20px;
		    border: none;
		    background-color: #fff;
		    font-size: 14px;
		}
		.category.active{
			color: #0000ff
		}
		.scategory {
		    display: inline-block;
		    width: 32%; /* Adjust the width as needed */
		    text-align: center; /* Center the text within the span */
		    margin-top: 20px;
		    margin-bottom: 20px;
		    border: none;
		    background-color: #fff;
		    font-size: 14px;
		}
    </style>
</head>
<body>
	<div class="row">
		<div class="col filter">
			<div class="container">
			    <div class="row filter-btn-group">
			        <div class="col-12">
				        <div class="button-group d-flex justify-content-center" role="group" aria-label="Button Group">
			                <button type="button" class="btn filter-btn" id="filter-btn1" onclick="toggleContent('contentBox1')">직무</button>
			                <button type="button" class="btn filter-btn" id="filter-btn2" onclick="toggleContent('contentBox2')">근무지역</button>
			                <button type="button" class="btn filter-btn" id="filter-btn3" onclick="toggleContent('contentBox3')">경력</button>
			                <button type="button" class="btn filter-btn" id="filter-btn4" onclick="toggleContent('contentBox4')">학력</button>
			                <button type="button" class="btn filter-btn" id="filter-btn5" onclick="toggleContent('contentBox5')">기업형태</button>
			                <button type="button" class="btn filter-btn" id="filter-btn6" onclick="toggleContent('contentBox6')">고용형태</button>
			            </div>
			        	<div class="box openposition" id="contentBox1">
			        		<div class="row box-border">
			        			<input class="filter-search" type="text" placeholder="직무 검색">
			        		</div>
			        		<div class="row">
			        			<div class="col-4 ctgr">
			        				<button class="category">IT개발,데이터</button>
			        				<button class="category">회계,세무,재무</button>
			        				<button class="category">총무,법무,사무</button>
			        				<button class="category">인사,노무,HRD</button>
			        				<button class="category">마케팅,홍보,조사</button>
			        				<button class="category">기획,전략</button>
			        			</div>
			        			<div class="col-6 sctgr">
			        				<%
			        					for(int i = 0; i < jcvlist2.size(); i++){
			        						job_categoryBean jcbean = jcvlist2.get(i);
			        				%>
			        						<button class="scategory"><%=jcbean.getJob_sname()%></button>
			        				<%
			        					}
			        				%>
			        			</div>
			        		</div>
						</div>
						<div class="box" id="contentBox2">
						    <div class="row box-border">
			        			<input class="filter-search" type="text" placeholder="근무지역 검색">
			        		</div>
			        		<div class="row">
			        			<div class="col-4 ctgr">
			        				<button class="btn">a</button>
			        			</div>
			        			<div class="col-6 sctgr">
			        				<button class="btn">b</button>
			        			</div>
			        		</div>
						</div>
						<div class="box" id="contentBox3">
						    <div class="row box-border">
			        			<input class="filter-search" type="text" placeholder="경력 검색">
			        		</div>
			        		<div class="row">
			        			<div class="col-4 ctgr">
			        				<button class="btn">a</button>
			        			</div>
			        			<div class="col-6 sctgr">
			        				<button class="btn">b</button>
			        			</div>
			        		</div>
						</div>
						<div class="box" id="contentBox4">
						    <div class="row box-border">
			        			<input class="filter-search" type="text" placeholder="학력 검색">
			        		</div>
			        		<div class="row">
			        			<div class="col-4 ctgr">
			        				<button class="btn">a</button>
			        			</div>
			        			<div class="col-6 sctgr">
			        				<button class="btn">b</button>
			        			</div>
			        		</div>
						</div>
						<div class="box" id="contentBox5">
						    <div class="row box-border">
			        			<input class="filter-search" type="text" placeholder="기업형태 검색">
			        		</div>
			        		<div class="row">
			        			<div class="col-4 ctgr">
			        				<button class="btn">a</button>
			        			</div>
			        			<div class="col-6 sctgr">
			        				<button class="btn">b</button>
			        			</div>
			        		</div>
						</div>
						<div class="box" id="contentBox6">
						    <div class="row box-border">
			        			<input class="filter-search" type="text" placeholder="고용형태 검색">
			        		</div>
			        		<div class="row">
			        			<div class="col-4 ctgr">
			        				<button class="btn">a</button>
			        			</div>
			        			<div class="col-6 sctgr">
			        				<button class="btn">b</button>
			        			</div>
			        		</div>
						</div>
				        <div class="button-group d-flex justify-content-center col" role="group" aria-label="Button Group">
			                <button type="button" class="btn filter-btn" id="filter-btn7" onclick="toggleContent('contentBox7')">산업</button>
			                <button type="button" class="btn filter-btn" id="filter-btn8" onclick="toggleContent('contentBox8')">직급/급여</button>
			                <button type="button" class="btn filter-btn" id="filter-btn9" onclick="toggleContent('contentBox9')">우대전공</button>
			                <button type="button" class="btn filter-btn" id="filter-btn10" onclick="toggleContent('contentBox10')">스킬</button>
			                <button type="button" class="btn filter-btn" id="filter-btn11" onclick="toggleContent('contentBox11')">자격증</button>
			                <button type="button" class="btn filter-btn" id="filter-btn12" onclick="toggleContent('contentBox12')" style="border: 1px solid lightgrey; background-color: #F9FAFC;" disabled></button>
			            </div>
			        	<div class="box" id="contentBox7">
						    <div class="row box-border">
			        			<input class="filter-search" type="text" placeholder="산업 검색">
			        		</div>
			        		<div class="row">
			        			<div class="col-4 ctgr">
			        				<button class="btn">a</button>
			        			</div>
			        			<div class="col-6 sctgr">
			        				<button class="btn">b</button>
			        			</div>
			        		</div>
						</div>
						<div class="box" id="contentBox8">
						    <div class="row box-border">
			        			<input class="filter-search" type="text" placeholder="직급/급여 검색">
			        		</div>
			        		<div class="row">
			        			<div class="col-4 ctgr">
			        				<button class="btn">a</button>
			        			</div>
			        			<div class="col-6 sctgr">
			        				<button class="btn">b</button>
			        			</div>
			        		</div>
						</div>
						<div class="box" id="contentBox9">
						    <div class="row box-border">
			        			<input class="filter-search" type="text" placeholder="우대전공 검색">
			        		</div>
			        		<div class="row">
			        			<div class="col-4 ctgr">
			        				<button class="btn">a</button>
			        			</div>
			        			<div class="col-6 sctgr">
			        				<button class="btn">b</button>
			        			</div>
			        		</div>
						</div>
						<div class="box" id="contentBox10">
						    <div class="row box-border">
			        			<input class="filter-search" type="text" placeholder="스킬 검색">
			        		</div>
			        		<div class="row">
			        			<div class="col-4 ctgr">
			        				<button class="btn">a</button>
			        			</div>
			        			<div class="col-6 sctgr">
			        				<button class="btn">b</button>
			        			</div>
			        		</div>
						</div>
						<div class="box" id="contentBox11">
						    <div class="row box-border">
			        			<input class="filter-search" type="text" placeholder="자격증 검색">
			        		</div>
			        		<div class="row">
			        			<div class="col-4 ctgr">
			        				<button class="btn">a</button>
			        			</div>
			        			<div class="col-6 sctgr">
			        				<button class="btn">b</button>
			        			</div>
			        		</div>
						</div>
						<div class="box" id="contentBox12">
						    <div class="row box-border">
			        			<input class="filter-search" type="text" placeholder="직무 검색">
			        		</div>
			        		<div class="row">
			        			<div class="col-4 ctgr">
			        				<button class="btn">a</button>
			        			</div>
			        			<div class="col-6 sctgr">
			        				<button class="btn">b</button>
			        			</div>
			        		</div>
						</div>

			            <!-- 모집 정보 -->
			            <div class="">모집 정보</div>
			            <div class="">
			               
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	    <!-- New button added here -->
	    <div class="col">
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
		            			<button class="info border-light-subtitle bg-body" onclick="location.href='../login/logout.jsp'">
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
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script>
	    function toggleContent(contentId) {
	        var selectedBox = document.getElementById(contentId);
	        
	        // 현재 상태 확인하여 반대로 설정
	        if (selectedBox.classList.contains('active')) {
	            selectedBox.classList.remove('active'); // 활성화 클래스 제거하여 숨김
	            // 해당하는 버튼의 active 클래스도 제거
	            var btnId = 'filter-btn' + (contentId.slice(-2) >= 10 ? contentId.slice(-2) : contentId.slice(-1));
	            document.getElementById(btnId).classList.remove('active');
	        } 
	        else {
	            // 모든 박스 숨기기
	            var boxes = document.getElementsByClassName('box');
	            for (var i = 0; i < boxes.length; i++) {
	                boxes[i].classList.remove('active');
	            }
	            // 모든 버튼의 active 클래스 제거
	            var buttons = document.getElementsByClassName('filter-btn');
	            for (var j = 0; j < buttons.length; j++) {
	                buttons[j].classList.remove('active');
	            }
	            // 선택한 박스만 보이게 하기
	            selectedBox.classList.add('active');
	            // 해당하는 버튼의 active 클래스도 추가
	            var btnId = 'filter-btn' + (contentId.slice(-2) >= 10 ? contentId.slice(-2) : contentId.slice(-1));
	            document.getElementById(btnId).classList.add('active');
	        }
	    }
	 	// 새로운 기능 추가
	    document.addEventListener('DOMContentLoaded', function () {
	        var categoryButtons = document.querySelectorAll('.category');

	        categoryButtons.forEach(function (button) {
	            button.addEventListener('click', function () {
	                // 모든 버튼의 active 클래스 제거
	                categoryButtons.forEach(function (btn) {
	                    btn.classList.remove('active');
	                    btn.innerHTML = btn.innerHTML.replace(' >', '');
	                });
	                // 현재 클릭한 버튼에 active 클래스 추가
	                button.classList.add('active');
	             	// 버튼 뒤에 ">" 특수문자 추가
	                button.innerHTML = button.innerHTML + ' >';
	            });
	        });
	    });
	</script>
</body>
</html>