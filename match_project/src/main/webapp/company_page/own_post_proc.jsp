<%@page import="java.util.ArrayList"%>
<%@page import="match.posting.procedureBean"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="match.posting.WelfareBean"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mMgr" class="match.ManagerMgr"/>
<jsp:useBean id="mBean" class="match.ManagerBean"/>

<jsp:useBean id="pMgr" class="match.PostingMgr"/>
<jsp:useBean id="pBean" class="match.PostingBean"/>

<jsp:useBean id="opBean" class="match.posting.OpenPositionBean"/>
<jsp:useBean id="qBean" class="match.posting.QualificationBean"></jsp:useBean>
<jsp:useBean id="eBean" class="match.posting.environmentBean"></jsp:useBean>
<jsp:useBean id="wBean" class="match.posting.WelfareBean"></jsp:useBean>
<jsp:useBean id="prBean" class="match.posting.procedureBean"></jsp:useBean>
<jsp:useBean id="aBean" class="match.posting.application_periodBean"></jsp:useBean>
<jsp:useBean id="adBean" class="match.posting.adddocumentBean"></jsp:useBean>
<jsp:useBean id="aqBean" class="match.posting.addquestionBean"></jsp:useBean>
<jsp:useBean id="apBean" class="match.posting.applicationBean"></jsp:useBean>

<jsp:setProperty property="*" name="pBean"/>
<jsp:setProperty property="*" name="opBean"/>
<jsp:setProperty property="*" name="qBean"/>
<jsp:setProperty property="*" name="eBean"/>
<jsp:setProperty property="*" name="wBean"/>
<jsp:setProperty property="*" name="prBean"/>
<jsp:setProperty property="*" name="aBean"/>
<jsp:setProperty property="*" name="adBean"/>
<jsp:setProperty property="*" name="aqBean"/>
<jsp:setProperty property="*" name="apBean"/>
<!DOCTYPE html>

<%
	String manager_id = (String)session.getAttribute("idKey");
	String company_idx = mMgr.getCompany_idx(manager_id);
	String posting_type = "일반채용";
	String posting_cname = request.getParameter("posting_cname");
	String posting_name = request.getParameter("posting_name");
	String posting_pcode = request.getParameter("posting_pcode");
	String posting_address = request.getParameter("posting_address");
	String posting_status = "진행중";
	int posting_view = 0;
	
	pBean.setManager_id(manager_id);
	pBean.setPosting_type(posting_type);
	pBean.setPosting_cname(posting_cname);
	pBean.setPosting_name(posting_name);
	pBean.setPosting_pcode(posting_pcode);
	pBean.setPosting_address(posting_address);
	pBean.setPosting_view(posting_view);
	pBean.setPosting_status(posting_status);
	/*--------------------------------------------------------------------------------*/
	int generatedKey = pMgr.insertBpost(pBean);
	/*--------------------------------------------------------------------------------*/
	String openposition_name = request.getParameter("openposition_name");
	String openposition_duty = request.getParameter("openposition_duty");
	
	String openposition_num_str = request.getParameter("openposition_num");
	int openposition_num = 0; // 초기값을 0으로 설정

	// 입력된 값이 null이 아니고, 숫자로 변환 가능한지 확인
	if(openposition_num_str != null && openposition_num_str.matches("\\d+")) {
	    openposition_num = Integer.parseInt(openposition_num_str);
	}


	String openposition_sname = request.getParameter("openposition_sname");
	String openposition_position = request.getParameter("openposition_position");

	opBean.setPosting_idx(generatedKey);
	opBean.setOpenposition_name(openposition_name);
	opBean.setOpenposition_duty(openposition_duty);
	opBean.setOpenposition_num(openposition_num);
	opBean.setOpenposition_sname(openposition_sname);
	opBean.setOpenposition_position(openposition_position);
	
	pMgr.insertOpenposition(opBean);
	/*--------------------------------------------------------------------------------*/
	String qualification_edutype = request.getParameter("qualification_edutype");
	String qualification_gender = request.getParameter("qualification_gender");
	String qualification_experience = request.getParameter("qualification_experience");
	String qualification_skill = request.getParameter("selectedSkills");
	/*수정 필요*/
 	String qualification_certificate = request.getParameter("qualification_certificate"); 
/*  	String[] skillsArray = qualification_skill.split(","); */

	
	qBean.setPosting_idx(generatedKey);
	qBean.setQualification_edutype(qualification_edutype);
	qBean.setQualification_gender(qualification_gender);
	qBean.setQualification_experience(qualification_experience);
	qBean.setQualification_skill(qualification_skill);
	qBean.setQualification_certificate(qualification_certificate);
	
	pMgr.insertQualification(qBean);
	/*--------------------------------------------------------------------------------*/

	String environment_minsalary_str = request.getParameter("environment_minsalary");
	int environment_minsalary = Integer.parseInt(environment_minsalary_str);
	String environment_maxsalary_str = request.getParameter("environment_maxsalary");
	int environment_maxsalary = Integer.parseInt(environment_maxsalary_str);
	String environment_type = request.getParameter("environment_type");
	String working_day = request.getParameter("working_day");
	String working_hour = request.getParameter("working_hour");
	
	eBean.setPosting_idx(generatedKey);
	eBean.setEnvironment_minsalary(environment_minsalary);
	eBean.setEnvironment_maxsalary(environment_maxsalary);
	eBean.setEnvironment_type(environment_type);
	eBean.setWorking_day(working_day);
	eBean.setWorking_hour(working_hour);
	
	pMgr.insertEnvironment(eBean);
	/*--------------------------------------------------------------------------------*/
	String[] welfareContentArray = request.getParameterValues("Welfare_content[]");
	    if(welfareContentArray != null) { // null 체크 추가
	        List<String> welfareContents = Arrays.asList(welfareContentArray);
	        wBean.setPosting_idx(generatedKey);
	        wBean.setWelfareContents(welfareContents);
	        pMgr.insertWelfare(wBean); // 수정된 메서드를 호출해야 합니다. 이 메서드는 List를 처리할 수 있어야 합니다.
	    }
	 /*--------------------------------------------------------------------------------*/
	 String application_sdatetime = request.getParameter("application_sdatetime");
	 String application_edatetime = request.getParameter("application_edatetime");
	 
	 aBean.setPosting_idx(generatedKey);
	 aBean.setApplication_sdatetime(application_sdatetime);
	 aBean.setApplication_edatetime(application_edatetime);
	 
	 pMgr.insertApplication_period(aBean);
	 /*--------------------------------------------------------------------------------*/
	String[] procedureNames = request.getParameterValues("procedure_name[]");
	String[] procedureSdatetimes = request.getParameterValues("procedure_sdatetime[]");
	String[] procedureEdatetimes = request.getParameterValues("procedure_edatetime[]");
	
	// 기존 절차 처리
	if (procedureNames != null) {
	    List<procedureBean> procedures = new ArrayList<>();
	    int minLength = Math.min(procedureNames.length, Math.min(procedureSdatetimes.length, procedureEdatetimes.length)); // 가장 짧은 배열의 길이를 찾습니다.

	    for (int i = 0; i < minLength; i++) { // 가장 짧은 배열의 길이를 기준으로 반복
	        procedureBean bean = new procedureBean();
	        bean.setPosting_idx(generatedKey);
	        bean.setProcedure_name(procedureNames[i]);
	        bean.setProcedure_sdatetime(procedureSdatetimes[i]);
	        bean.setProcedure_edatetime(procedureEdatetimes[i]);
	        bean.setProcedure_num(i);
	        procedures.add(bean);
	    }

	    // 최종 합격 정보 추가
	    // 마지막 `procedure_edatetime[]` 값 사용
	    procedureBean finalProcedure = new procedureBean();
	    finalProcedure.setPosting_idx(generatedKey);
	    finalProcedure.setProcedure_name("최종 합격"); // 고정 값
	    // finalProcedure.setProcedure_sdatetime(null); // 필요에 따라 설정
	    finalProcedure.setProcedure_edatetime(procedureEdatetimes[procedureEdatetimes.length - 1]); // 마지막 종료 날짜를 사용
	    finalProcedure.setProcedure_num(procedures.size()); // 다음 번호 할당
	    procedures.add(finalProcedure);

	    // DB에 채용 절차 정보 삽입
	    pMgr.insertProcedure(procedures); // 리스트 전체를 한 번에 처리
	}
	/*--------------------------------------------------------------------------------*/
// 추가 문서 데이터 처리
	String[] adddocumentDocumentArray = request.getParameterValues("adddocument_document[]");
	if (adddocumentDocumentArray != null) {
	    List<String> adddocumentDocument = Arrays.asList(adddocumentDocumentArray);
	    adBean.setPosting_idx(generatedKey); // 게시글의 고유 ID 설정
	    adBean.setAdddocument_document(adddocumentDocument); // 추가 문서 설정
	    pMgr.insertadddocument(adBean); // 추가 문서 데이터를 데이터베이스에 저장하는 메소드 호출
	}
	// 추가 문서 데이터 처리
		String[] addquestionQuestionArray = request.getParameterValues("addquestion_question[]");
		if (addquestionQuestionArray != null) {
		    List<String> addquestionQuestion = Arrays.asList(addquestionQuestionArray);
		    aqBean.setPosting_idx(generatedKey); // 게시글의 고유 ID 설정
		    aqBean.setAddquestion_question(addquestionQuestion);
		    pMgr.insertaddquestion(aqBean); // 추가 문서 데이터를 데이터베이스에 저장하는 메소드 호출
		}
	apBean.setPosting_idx(generatedKey);
	pMgr.insertApplication(apBean);
	
	String msg = "공고 등록이 완료 되었습니다.";
	String location = "company_home.jsp";
	
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
