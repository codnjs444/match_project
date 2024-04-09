<%@page import="match.ResumeBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="rMgr" class="match.ResumeMgr"/>
<jsp:useBean id="rBean" class="match.ResumeBean"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title> 이력서 관리 </title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<style>
			table.table th { background-color: #e2e3e5; line-height: 30px; vertical-align: middle; }
			table.table td { text-align: left; padding: 0.55rem 1.15rem; }
			table.table span { line-height: 35px; vertical-align: middle; }
			.applist-body{
				width:1400px;
				margin-left:50px;
			}
			.fixed-div1 {
				position: fixed; /* 고정 위치 */
				top: 174px; /* 위에서 20px 거리 */	
				right: 100px; /* 오른쪽에서 20px 거리 */
				width: 300px;
				height: 80px;
				display: flex;
				flex-direction: column;
				justify-content: space-between;
			}
			.fixed-div2 {
				position: fixed; /* 고정 위치 */
				top: 253px; /* 위에서 20px 거리 */
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
				cursor: pointer;
			}
			.info {
			    border: 1px solid lightgrey;
			    font-size: 11px;
			    width: 90px;
			}
			.my-btn-text{
				font-size: 11px;
				margin: 0px;
			}
			.my-btn-icon{
				height:25px;
				width:25px;
			}
			.my-btn-icon1 {
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
		<%@include file="../user_page/user_top.jsp" %>
		<%
			if(id == null){
				response.sendRedirect("login.jsp");
				return;
			}
			Vector<ResumeBean> rvlist = rMgr.getResumeIdxList(id);
		%>
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
	            			<div class="my-btn-div px-0 border-end border-light-subtitle" onclick="location.href='../login/applicationList.jsp'">
	           					<button class="my-btn-icon1 my-btn-icon"></button>
	           					<p class="my-btn-text">이력서 관리</p>
	            			</div>
	            			<div class="my-btn-div px-0 border-end border-light-subtitle">
	            				<button class="my-btn-icon2 my-btn-icon"></button>
	           					<p class="my-btn-text">이력서 열람</p>
	            			</div>
	            			<div class="my-btn-div px-0">
	            				<button class="my-btn-icon3 my-btn-icon"></button>
	           					<p class="my-btn-text">입사지원 현황</p>
	            			</div>
	            			<div class="my-btn-div px-0 border-end border-top border-light-subtitle">
	            				<button class="my-btn-icon4 my-btn-icon"></button>
	           					<p class="my-btn-text">최근 본 공고</p>
	            			</div>
	            			<div class="my-btn-div px-0 border-end border-top border-light-subtitle">
	            				<button class="my-btn-icon5 my-btn-icon"></button>
	           					<p class="my-btn-text">스크랩 공고</p>
	            			</div>
	            			<div class="my-btn-div px-0 border-top border-light-subtitle">
	            				<button class="my-btn-icon6 my-btn-icon"></button>
	           					<p class="my-btn-text">문의</p>
	            			</div>
		                </div>
		            </div>
		        </div>
		    </div>
	    </div>
		
		<div class="applist-body">
			<h2> 이력서 관리 </h2>
			
			<table class="table text-center text-nowrap">
				
				<colgroup>
					<col style="width: 5%;" />
					<col style="width: *;" />
					<col style="width: 10%;" />
					<col style="width: 9%;" />
					<col style="width: 9%;" />
					<col style="width: 9%;" />
					<col style="width: 9%;" />
				</colgroup> 
				<thead class="table-secondary">
					<tr>
						<th><input type="checkbox" class="form-check-input" id="all-check"></th>
						<th>이력서 제목</th>
						<th>최종수정일</th>
						<th>이력서 관리</th>
						<th>인쇄</th>
						<th>이메일 전송</th>
						<th>설정변경</th>
					</tr>
				</thead>
				<tbody>
				<%for(int i = 0; i < rvlist.size(); i++){ 
					rBean = rvlist.get(i);
				%>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td class="text-start"><span><%=rBean.getResume_name()%></span></td>
						<td><span><%=rBean.getResume_datetime().substring(0,10)%></span></td>
						<td><button type="button" class="btn btn-primary">수정</button></td>
						<td><button type="button" class="btn btn-light">인쇄</button></td>
						<td><button type="button" class="btn btn-light">이메일전송</button></td>
						<td>&nbsp;</td>
					</tr>
				<%
				}
				%>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td class="text-start"><span>삼성전자 지원용</span></td>
						<td><span>2024.04.12</span></td>
						<td><button type="button" class="btn btn-primary">수정</button></td>
						<td><button type="button" class="btn btn-light">인쇄</button></td>
						<td><button type="button" class="btn btn-light">이메일전송</button></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="form-check-input"></td>
						<td class="text-start"><span>삼성전자 지원용</span></td>
						<td><span>2024.04.12</span></td>
						<td><button type="button" class="btn btn-primary">수정</button></td>
						<td><button type="button" class="btn btn-light">인쇄</button></td>
						<td><button type="button" class="btn btn-light">이메일전송</button></td>
						<td>&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<div class="">
				<button type="button" class="btn btn-light" id="btn-delete">선택삭제</button>
			</div>
		</div>
		
		<script>
			$(document).ready(function() {
				// table > thead > th > input#all-check 
				$("#all-check").on("click", function() {
					if ( !$(this).is(":checked") ) {
						// 전체 선택 해제
						$("table.table tbody input.form-check-input[type='checkbox']").prop("checked", false);
					} else {
						// 전체 선택
						$("table.table tbody input.form-check-input[type='checkbox']").prop("checked", true);
					}
				});
				// 선택삭제 버튼 이벤트 
				$("#btn-delete").on("click", function() {
					var _cnt = 0;
					$("table.table tbody input.form-check-input[type='checkbox']").each(function() {
						// tbody 안의 checkbox만 확인
						if ( $(this).is(":checked") ) {
							_cnt++;
							// 체크된 것만 확인 
							
						}
					});
					if ( _cnt <= 0 ) {
						alert("선택된 항목이 없습니다.");
						return false;
					} else {
						// todo. 선택항목을 지우기 위한 내용
						
					}
				});
			});
		</script>
	</body>
</html>