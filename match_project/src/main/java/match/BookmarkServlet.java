package match;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookmarkServlet
 */
@WebServlet("/BookmarkServlet")
public class BookmarkServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        int postingIdx = Integer.parseInt(request.getParameter("postingId"));
        String action = request.getParameter("action");
        
        // 여기서 coMgr 는 BookmarkManager 등의 실제 객체 이름이어야 합니다.
        CompanyMgr mgr = new CompanyMgr(); // BookmarkManager는 가상의 클래스입니다.

        if ("insert".equals(action)) {
            mgr.insertBookmark(userId, postingIdx);
        } else if ("delete".equals(action)) {
            mgr.deleteBookmark(userId, postingIdx);
        }
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\": true}");
    }
}
