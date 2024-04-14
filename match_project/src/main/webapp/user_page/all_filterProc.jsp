<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String[] envTypes = request.getParameterValues("environment_type");
    String[] qualification_eduTypes = request.getParameterValues("edu_type");
    String[] qualification_experiences = request.getParameterValues("experience_type");

    if (envTypes == null) envTypes = new String[0];
    if (qualification_eduTypes == null) qualification_eduTypes = new String[0];
    if (qualification_experiences == null) qualification_experiences = new String[0];

    // 세션에 데이터 저장
    session.setAttribute("environment_type", envTypes);
    session.setAttribute("edu_type", qualification_eduTypes);
    session.setAttribute("experience_type", qualification_experiences);

    // user_middle.jsp로 리다이렉트
    response.sendRedirect("user_home.jsp");
%>
