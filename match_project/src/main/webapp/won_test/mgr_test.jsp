<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.Vector" %>
<%@ page import="match.job_categoryBean" %>
<%@ page import="match.job_categoryMgr" %>

<jsp:useBean id="jMgr" class="match.job_categoryMgr"/>
<jsp:useBean id="jBean" class="match.job_categoryBean"/>

<%
    // jobsnameList() 메서드를 호출하여 Vector를 받아옴
    String name = "마케팅·홍보·조사";
    Vector<job_categoryBean> vlist = jMgr.jobsnameList(name);
    // Vector를 반복하여 출력
    for (job_categoryBean jbean : vlist) {
        out.println("job_sname: " + jbean.getJob_sname() + "<br>");
    } 
%>
