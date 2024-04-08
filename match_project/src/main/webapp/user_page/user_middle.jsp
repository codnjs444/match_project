<%@page import="match.category.job_categoryBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="jcMgr" class="match.category.job_categoryMgr"/>
<%
	String name[] = {"기획·전략","마케팅·홍보·조사","회계·세무·재무","인사·노무·HRD","총무·법무·사무","IT개발·데이터","디자인","영업·판매·무역","고객상담·TM","구매·자재·물류","상품기획·MD","운전·운송·배송","서비스","생산","건설·건축","의료","연구·R&D","교육"};
%>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="../css/user_home_middle.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="row">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
		  	<li class="nav-item" role="presentation">
		    	<button class="nav-link active" id="my-tab" data-bs-toggle="tab" data-bs-target="#my-tab-pane" type="button" role="tab" aria-controls="my-tab-pane" aria-selected="true">나의 공고</button>
		  	</li>
		  	<li class="nav-item" role="presentation">
		   		<button class="nav-link" id="all-tab" data-bs-toggle="tab" data-bs-target="#all-tab-pane" type="button" role="tab" aria-controls="all-tab-pane" aria-selected="false">상세 공고</button>
		  	</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="my-tab-pane" role="tabpanel" aria-labelledby="my-tab" tabindex="0">
		  		<div class="col filter">
			    	<div class="row filter-btn-group" style="width: 1400px">
			        	<div class="col-12" style="padding-left:0px; padding-right:0px;">
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
				        			<%
				        				for(int i = 0; i < 18; i++){
				        			%>
				        					<button class="category" id="job-category<%=i%>"><%=name[i]%></button>
				        			<%
				        				}
				        			%>
				        			</div>
				        			<%
				        				for(int j = 0; j < 18; j++){
				        			%>
		        					<div class="col-6 sctgr mx-auto p-2" id="job-scategory<%=j%>">
	        						<%
			        					Vector<job_categoryBean> vlist0 = jcMgr.jobsnameList(name[j]);
			        					for(int i = 0; i < vlist0.size(); i++){
			        						job_categoryBean jcBean = vlist0.get(i);
			        				%>
			        						<button class="scategory"><%=jcBean.getJob_sname()%></button>
			        				<%
			        					}
			        				%>
		        					</div>
				        			<%
				        				}
				        			%>
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
				        </div>
			            <div class="row px-0 mx-0 search-form" style="height: 82px;">
			            	<div class="col form-content"></div>
			            	<div class="col form-content2" style="flex-grow:0;">
			            		<button class="form-btn">선택된 조건 검색하기</button>
			            	</div>
			            </div>
		            </div>
				</div>
		  	</div>
		  	<div class="tab-pane fade" id="all-tab-pane" role="tabpanel" aria-labelledby="all-tab" tabindex="0">
		  		<div class="col filter">
			    	<div class="row filter-btn-group" style="width: 1400px">
			        	<div class="col-12" style="padding-left:0px; padding-right:0px;">
				        	<div class="button-group d-flex justify-content-center" role="group" aria-label="Button Group">
			                	<button type="button" class="btn filter-btn" id="filter-btn13" onclick="toggleContent2('contentBox13')">직무</button>
				                <button type="button" class="btn filter-btn" id="filter-btn14" onclick="toggleContent2('contentBox14')">근무지역</button>
				                <button type="button" class="btn filter-btn" id="filter-btn15" onclick="toggleContent2('contentBox15')">경력</button>
				                <button type="button" class="btn filter-btn" id="filter-btn16" onclick="toggleContent2('contentBox16')">학력</button>
				                <button type="button" class="btn filter-btn" id="filter-btn17" onclick="toggleContent2('contentBox17')">기업형태</button>
				                <button type="button" class="btn filter-btn" id="filter-btn18" onclick="toggleContent2('contentBox18')">고용형태</button>
				            </div>
				        	<div class="box openposition" id="contentBox13">
				        		<div class="row box-border">
				        			<input class="filter-search" type="text" placeholder="직무 검색">
				        		</div>
				        		<div class="row">
				        			<div class="col-4 ctgr">
				        			<%
				        				for(int i = 18; i < 36; i++){
				        			%>
				        					<button class="category2" id="job-category<%=i%>"><%=name[i-18]%></button>
				        			<%
				        				}
				        			%>
				        			</div>
				        			<%
				        				for(int j = 18; j < 36; j++){
				        			%>
		        					<div class="col-6 sctgr mx-auto p-2" id="job-scategory<%=j%>">
	        						<%
			        					Vector<job_categoryBean> vlist0 = jcMgr.jobsnameList(name[j-18]);
			        					for(int i = 18; i < vlist0.size()+18; i++){
			        						job_categoryBean jcBean = vlist0.get(i-18);
			        				%>
			        						<button class="scategory2"><%=jcBean.getJob_sname()%></button>
			        				<%
			        					}
			        				%>
		        					</div>
				        			<%
				        				}
				        			%>
				        		</div>
							</div>
							<div class="box" id="contentBox14">
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
							<div class="box" id="contentBox15">
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
							<div class="box" id="contentBox16">
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
							<div class="box" id="contentBox17">
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
							<div class="box" id="contentBox18">
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
				                <button type="button" class="btn filter-btn" id="filter-btn19" onclick="toggleContent2('contentBox19')">산업</button>
				                <button type="button" class="btn filter-btn" id="filter-btn20" onclick="toggleContent2('contentBox20')">직급/급여</button>
				                <button type="button" class="btn filter-btn" id="filter-btn21" onclick="toggleContent2('contentBox21')">우대전공</button>
				                <button type="button" class="btn filter-btn" id="filter-btn22" onclick="toggleContent2('contentBox22')">스킬</button>
				                <button type="button" class="btn filter-btn" id="filter-btn23" onclick="toggleContent2('contentBox23')">자격증</button>
				                <button type="button" class="btn filter-btn" id="filter-btn24" onclick="toggleContent2('contentBox24')" style="border: 1px solid lightgrey; background-color: #F9FAFC;" disabled></button>
				            </div>
				        	<div class="box" id="contentBox19">
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
							<div class="box" id="contentBox20">
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
							<div class="box" id="contentBox21">
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
							<div class="box" id="contentBox22">
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
							<div class="box" id="contentBox23">
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
							<div class="box" id="contentBox24">
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
				        </div>
			            <div class="row px-0 mx-0 search-form2" style="height: 82px;">
			            	<div class="col form-content3"></div>
			            	<div class="col form-content4" style="flex-grow:0;">
			            		<button class="form-btn">선택된 조건 검색하기</button>
			            	</div>
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
	<div class="posting-header">전체 채용 정보</div>
	<div class="row alignment">
		<div class="col ps-0">
			<span>정렬 조건 </span>
			<button class="align-btn">조회수 순</button>
			<button class="align-btn">등록일 순</button>
			<button class="align-btn">연봉 순</button>
		</div>
	</div>
	<table class="posting-list">
    	<tr class="list-head">
    		<th class="check-box-head"></th>
    		<th class="company-name-head">기업명</th>
    		<th class="posting-name-head">공고제목/업무</th>
    		<th class="company-address-head">위치</th>
    		<th class="environment-type-head">고용형태</th>
    		<th class="environment-salary-head">연봉</th>
    		<th class="working-hour-head">근무시간</th>
    		<th class="application-edate-head">지원 기간</th>
    		<th class="application-sdate-head">등록일</th>
    	</tr>
    	<%for(int i = 0; i < 10; i++) 
    		{
    	%>
    	<tr class="list-body">
    		<td class="check-box-body">
    			<input class="check-box" type="checkbox">
    		</td>
    		<td class="company-name-body">
    			카카오
    		</td>
    		<td class="posting-name-body">
    			<div class="row testrow">
    				<div class="col testcol">
    					[카카오] 카카오메이커스 콘텐츠 어시스턴트
    				</div>
    				<div>
    					블라인드
    				</div>
    				<div class="col testcol">
    					<button class="scrab">스크랩</button>
    					<div style="width: 10px;"></div>
    					<button class="apply">즉시지원</button>
    				</div>
    			</div>
    		</td>
    		<td class="company-address-body">
    			경기도 성남시
    		</td>
    		<td class="environment-type-body">
    			정규직
    		</td>
    		<td class="environment-salary-body">
    			3000만원
    		</td>
    		<td class="working-hour-body">
    			09:00~18:00
    		</td>
    		<td class="application-edate-body">
    			~2024-04-15
    		</td>
    		<td class="application-sdate-body">
    			2024-04-02
    		</td>
    	</tr>
    	
    	<%
    		} 
    	%>
    </table>
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
	    function toggleContent2(contentId) {
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
		            // 현재 클릭한 버튼에 active 클래스 추가
		            if (!button.classList.contains('active')) {
		                // 모든 버튼의 active 클래스 제거 및 ">" 특수문자 삭제
		                categoryButtons.forEach(function (btn) {
		                    btn.classList.remove('active');
		                    btn.textContent = btn.textContent.replace(' >', '');
		                });
		                // 클릭한 버튼에 active 클래스 추가 및 ">" 특수문자 추가
		                button.classList.add('active');
		                button.innerHTML = button.innerHTML + ' >';
		            }
		        });
		    });
		});
	    document.addEventListener('DOMContentLoaded', function () {
	    	// 페이지 로드 시 모든 서브 카테고리 div를 숨김
	        var subCategoryDivs = document.querySelectorAll('[id^="job-scategory"]');
	        subCategoryDivs.forEach(function (div) {
	            div.style.display = 'none';
	        });
	        var categoryButtons = document.querySelectorAll('.category');

	        categoryButtons.forEach(function (button) {
	            button.addEventListener('click', function () {
	                // 현재 클릭한 버튼의 id 추출
	                var categoryId = button.id;
	                // 해당하는 서브 카테고리 div의 id 설정
	                var subCategoryId = categoryId.replace('job-category', 'job-scategory');

	                // 모든 서브 카테고리 div를 숨김
	                var subCategoryDivs = document.querySelectorAll('[id^="job-scategory"]');
	                subCategoryDivs.forEach(function (div) {
	                    div.style.display = 'none';
	                });

	                // 현재 클릭한 버튼에 해당하는 서브 카테고리 div만 보이게 함
	                var currentSubCategoryDiv = document.getElementById(subCategoryId);
	                if (currentSubCategoryDiv) {
	                    currentSubCategoryDiv.style.display = 'block';
	                }
	            });
	        });
	    });
	    document.addEventListener('DOMContentLoaded', function () {
		    var categoryButtons = document.querySelectorAll('.category2');
		
		    categoryButtons.forEach(function (button) {
		        button.addEventListener('click', function () {
		            // 현재 클릭한 버튼에 active 클래스 추가
		            if (!button.classList.contains('active')) {
		                // 모든 버튼의 active 클래스 제거 및 ">" 특수문자 삭제
		                categoryButtons.forEach(function (btn) {
		                    btn.classList.remove('active');
		                    btn.textContent = btn.textContent.replace(' >', '');
		                });
		                // 클릭한 버튼에 active 클래스 추가 및 ">" 특수문자 추가
		                button.classList.add('active');
		                button.innerHTML = button.innerHTML + ' >';
		            }
		        });
		    });
		});
	    document.addEventListener('DOMContentLoaded', function () {
	    	// 페이지 로드 시 모든 서브 카테고리 div를 숨김
	        var subCategoryDivs = document.querySelectorAll('[id^="job-scategory"]');
	        subCategoryDivs.forEach(function (div) {
	            div.style.display = 'none';
	        });
	        var categoryButtons = document.querySelectorAll('.category2');

	        categoryButtons.forEach(function (button) {
	            button.addEventListener('click', function () {
	                // 현재 클릭한 버튼의 id 추출
	                var categoryId = button.id;
	                // 해당하는 서브 카테고리 div의 id 설정
	                var subCategoryId = categoryId.replace('job-category', 'job-scategory');

	                // 모든 서브 카테고리 div를 숨김
	                var subCategoryDivs = document.querySelectorAll('[id^="job-scategory"]');
	                subCategoryDivs.forEach(function (div) {
	                    div.style.display = 'none';
	                });

	                // 현재 클릭한 버튼에 해당하는 서브 카테고리 div만 보이게 함
	                var currentSubCategoryDiv = document.getElementById(subCategoryId);
	                if (currentSubCategoryDiv) {
	                    currentSubCategoryDiv.style.display = 'block';
	                }
	            });
	        });
	    });
	    document.addEventListener('DOMContentLoaded', function () {
	        var subCategoryButtons = document.querySelectorAll('.scategory');

	        subCategoryButtons.forEach(function (button) {
	            button.addEventListener('click', function () {
	                // 클릭한 버튼에 active 클래스 추가 또는 제거
	                if (button.classList.contains('active')) {
	                    button.classList.remove('active');
	                    // 클릭한 버튼의 텍스트 값
	                    var buttonText = button.textContent.trim();
	                    // filter-save 클래스를 가진 div 내의 모든 버튼에 대해 반복
	                    var filterSaveButtons = document.querySelectorAll('.form-content button');
	                    filterSaveButtons.forEach(function (filterButton) {
	                        // 현재 버튼의 텍스트 값이 클릭한 버튼과 같다면 해당 버튼을 삭제
	                        if (filterButton.textContent.trim() === buttonText) {
	                            filterButton.remove();
	                        }
	                    });
	                } else {
	                    button.classList.add('active');
	                    // 클릭한 버튼의 텍스트 값을 가져와서 새로운 버튼을 생성하여 filter-save 클래스를 가진 div에 삽입
	                    var buttonText = button.textContent.trim();
	                    var newButton = document.createElement('button');
	                    newButton.textContent = buttonText;
	                    newButton.classList.add('form-content-btn'); // 새로운 클래스 추가
	                    document.querySelector('.form-content').appendChild(newButton);
	                }
	            });
	        });
	    });
	    document.addEventListener('DOMContentLoaded', function () {
	        // Add event listener to dynamically created filter-save-btn buttons
	        document.querySelector('.form-content').addEventListener('click', function (event) {
	            if (event.target && event.target.classList.contains('form-content-btn')) {
	                // Remove the clicked button from its parent element
	                event.target.parentNode.removeChild(event.target);

	                // Get the text content of the clicked filter-save-btn button
	                var buttonText = event.target.textContent.trim();
	                // Find the corresponding scategory button with the same text content
	                var scategoryButtons = document.querySelectorAll('.scategory');
	                scategoryButtons.forEach(function (button) {
	                    if (button.textContent.trim() === buttonText) {
	                        // Remove the active class from the corresponding scategory button
	                        button.classList.remove('active');
	                    }
	                });
	            }
	        });
	    });
	    document.addEventListener('DOMContentLoaded', function () {
	        var subCategoryButtons = document.querySelectorAll('.scategory2');

	        subCategoryButtons.forEach(function (button) {
	            button.addEventListener('click', function () {
	                // 클릭한 버튼에 active 클래스 추가 또는 제거
	                if (button.classList.contains('active')) {
	                    button.classList.remove('active');
	                    // 클릭한 버튼의 텍스트 값
	                    var buttonText = button.textContent.trim();
	                    // filter-save 클래스를 가진 div 내의 모든 버튼에 대해 반복
	                    var filterSaveButtons = document.querySelectorAll('.form-content3 button');
	                    filterSaveButtons.forEach(function (filterButton) {
	                        // 현재 버튼의 텍스트 값이 클릭한 버튼과 같다면 해당 버튼을 삭제
	                        if (filterButton.textContent.trim() === buttonText) {
	                            filterButton.remove();
	                        }
	                    });
	                } else {
	                    button.classList.add('active');
	                    // 클릭한 버튼의 텍스트 값을 가져와서 새로운 버튼을 생성하여 filter-save 클래스를 가진 div에 삽입
	                    var buttonText = button.textContent.trim();
	                    var newButton = document.createElement('button');
	                    newButton.textContent = buttonText;
	                    newButton.classList.add('form-content3-btn'); // 새로운 클래스 추가
	                    document.querySelector('.form-content3').appendChild(newButton);
	                }
	            });
	        });
	    });
	    document.addEventListener('DOMContentLoaded', function () {
	        // Add event listener to dynamically created filter-save-btn buttons
	        document.querySelector('.form-content3').addEventListener('click', function (event) {
	            if (event.target && event.target.classList.contains('form-content3-btn')) {
	                // Remove the clicked button from its parent element
	                event.target.parentNode.removeChild(event.target);

	                // Get the text content of the clicked filter-save-btn button
	                var buttonText = event.target.textContent.trim();
	                // Find the corresponding scategory button with the same text content
	                var scategoryButtons = document.querySelectorAll('.scategory2');
	                scategoryButtons.forEach(function (button) {
	                    if (button.textContent.trim() === buttonText) {
	                        // Remove the active class from the corresponding scategory button
	                        button.classList.remove('active');
	                    }
	                });
	            }
	        });
	    });
	</script>
</body>
</html>