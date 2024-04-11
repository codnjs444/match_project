<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="match.ManagerMgr, match.ManagerBean"%>
<%
    // 요청으로부터 파라미터 값들을 가져옵니다.
    String managerId = request.getParameter("manager_id");
    String managerName = request.getParameter("manager_name");
    String managerEmail = request.getParameter("manager_email");
    String managerPhoneNum = request.getParameter("manager_phonenum");

    // ManagerBean 객체에 파라미터 값들을 설정합니다.
    ManagerBean manager = new ManagerBean();
    manager.setManager_id(managerId);
    manager.setManager_name(managerName);
    manager.setManager_email(managerEmail);
    manager.setManager_phonenum(managerPhoneNum);

    // ManagerMgr 객체를 사용하여 데이터베이스에 정보를 업데이트합니다.
    ManagerMgr mgr = new ManagerMgr();
    boolean isUpdated = mgr.updateManager(manager);
    
    String message = "";
    String redirectUrl = "Edit_admin_page.jsp"; // 기본 리다이렉션 URL

    if(isUpdated) {
        // 성공 메시지 설정
        message = "수정이 완료되었습니다.";
        redirectUrl += "?update=success"; // URL에 성공 쿼리 파라미터 추가
    } else {
        // 실패 메시지 설정
        message = "수정이 실패하였습니다.";
        redirectUrl += "?update=fail"; // URL에 실패 쿼리 파라미터 추가
    }
%>
<script>
    alert("<%=message%>"); // 메시지 표시
    window.location.href="<%=redirectUrl%>"; // 적절한 페이지로 리다이렉션
</script>