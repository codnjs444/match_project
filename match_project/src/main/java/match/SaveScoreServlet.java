package match;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;

import match.PostingMgr;

@WebServlet("/SaveScoreServlet")
public class SaveScoreServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        JsonObject jsonObject;
        try (JsonReader jsonReader = Json.createReader(new StringReader(sb.toString()))) {
            jsonObject = jsonReader.readObject();
        }

        String userId = jsonObject.getString("user_id");
        int postingIdx = jsonObject.getInt("posting_idx"); // Assuming posting_idx is sent as an integer
        String score = jsonObject.getString("score");

        PostingMgr postingMgr = new PostingMgr();
        // Ensure PostingMgr can handle setting a DataSource if necessary, not shown here
        try {
            postingMgr.updateOrInsertComment(postingIdx, userId, score);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": true, \"message\": \"" + userId + "님의 점수를 등록하셨습니다.\"}");
        } catch (Exception e) {
            response.getWriter().write("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
        }
    }
}
