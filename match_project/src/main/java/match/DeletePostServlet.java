package match;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeletePostServlet
 */
@WebServlet("/DeletePostServlet")
public class DeletePostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String postingIdx = request.getParameter("postingIdx");
        // pMgr 객체 초기화 및 deletePost 메소드 호출
        PostingMgr pMgr = new PostingMgr(); pMgr.deletePost(postingIdx);
        
        // 처리 결과를 클라이언트에 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"status\":\"success\"}");
    }
}
