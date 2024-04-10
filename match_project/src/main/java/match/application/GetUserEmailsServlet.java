package match.application;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/api/getUserEmails")
public class GetUserEmailsServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		// 클라이언트로부터 받은 JSON 데이터 처리
		StringBuilder jsonInput = new StringBuilder();
		String line;
		while ((line = request.getReader().readLine()) != null) {
			jsonInput.append(line);
		}

		// JSON 파싱
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(jsonInput.toString());
			JSONArray passedUserIdsJson = (JSONArray) jsonObj.get("passedUserIds");
			List<String> passedUserIds = new ArrayList<>();
			for (int i = 0; i < passedUserIdsJson.size(); i++) {
				passedUserIds.add((String) passedUserIdsJson.get(i));
			}

			// 이메일 조회
			ApplicationMgr userManager = new ApplicationMgr(); // UserManager 클래스를 찾을 수 없음
			List<String> userEmails = userManager.searchPassedUserEmails(passedUserIds);

			// 결과 JSON 생성 및 응답
			JSONObject responseJson = new JSONObject();
			responseJson.put("emails", userEmails);
			response.getWriter().write(responseJson.toString());
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
