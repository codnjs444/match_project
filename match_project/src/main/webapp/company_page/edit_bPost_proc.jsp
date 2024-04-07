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
	String posting_type = "블라인드";
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
	String posting_idx = request.getParameter("posting_idx");
	pMgr.updateBpost(pBean);
	
	String msg = "공고 수정이 완료 되었습니다.";
	String location = "company_home.jsp";
	
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
