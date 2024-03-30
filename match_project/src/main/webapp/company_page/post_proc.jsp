<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mMgr" class="match.ManagerMgr"/>
<jsp:useBean id="mBean" class="match.ManagerBean"/>

<jsp:useBean id="pMgr" class="match.PostingMgr"/>
<jsp:useBean id="pBean" class="match.PostingBean"/>

<jsp:setProperty property="*" name="pBean"/>
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
	
	pMgr.insertBpost(pBean);
	
	String msg = "공고 등록이 완료 되었습니다.";
	String location = "company_home.jsp";
	
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
