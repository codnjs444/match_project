package match;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import match.application.ApplicationMgr;

@WebServlet("/SaveMemoServlet")
public class SaveMemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		String postingIdxStr = jsonObject.getString("posting_idx");
		int postingIdx = Integer.parseInt(postingIdxStr); // 문자열을 정수로 변환
		String memo = jsonObject.getString("memo");

		ApplicationMgr mgr = new ApplicationMgr();
		mgr.saveMemo(postingIdx, userId, memo);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(userId + "님의 메모가 추가되었습니다.");

	}
}
