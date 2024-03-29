<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="cMgr" class="match.CompanyMgr"/>
<jsp:useBean id="cBean" class="match.CompanyBean"/>
<jsp:useBean id="mMgr" class="match.ManagerMgr"/>
<jsp:useBean id="mBean" class="match.ManagerBean"/>
<jsp:setProperty property="*" name="cBean"/>
<jsp:setProperty property="*" name="mBean"/>
<!DOCTYPE html>
<%
	int company_rnum = Integer.parseInt(request.getParameter("company_rnum"));
	String company_name = request.getParameter("company_name");
	String company_head = request.getParameter("company_head");
	
	String manager_id = request.getParameter("manager_id");
	int company_idx = cMgr.getCompanyIdx(company_rnum, company_name, company_head);
	String manager_pwd = request.getParameter("manager_pwd");
	String manager_name = request.getParameter("manager_name");
	String manager_email = request.getParameter("manager_email");
	String manager_phonenum = request.getParameter("manager_phonenum");
	
	mBean.setManager_id(manager_id);
	mBean.setCompany_idx(company_idx);
	mBean.setManager_name(manager_name);
	mBean.setManager_pwd(manager_pwd);
	mBean.setManager_email(manager_email);
	mBean.setManager_phonenum(manager_phonenum);
	
	boolean result = mMgr.signUpManager(mBean);
	
	String msg = "가입실패";
	String location = "signup.jsp";
	
	if(company_idx != 0){
		if(result){
			msg = "가입성공";
			location = "login.jsp";
		}
	}
	else
		msg = "기업 정보 틀림";
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>