<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String[] envTypes = request.getParameterValues("environment_type");
    String[] qualification_eduTypes = request.getParameterValues("edu_type");
    String[] qualification_experiences = request.getParameterValues("experience_type");

    // 세션에 데이터 저장
    session.setAttribute("environment_type", envTypes);
    session.setAttribute("edu_type", qualification_eduTypes);
    session.setAttribute("experience_type", qualification_experiences);

    // user_middle.jsp로 리다이렉트
    response.sendRedirect("user_home.jsp");
%>