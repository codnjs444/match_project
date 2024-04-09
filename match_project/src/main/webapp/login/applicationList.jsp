<%@page contentType="text/html; charset=UTF-8"%>
<%
		
%>

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
		</style>	
	</head>
	<body>
		<div class="container">
			<h2> 이력서 관리 </h2>
			
			<table class="table text-center text-nowrap mt-5 mb-4 ">
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