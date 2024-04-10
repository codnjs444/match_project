package match;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import match.application.ApplicationMgr;

@WebServlet("/GetUserEmailsServlet")
public class GetUserEmailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 본문에서 JSON 데이터를 읽어옵니다.
		StringBuilder builder = new StringBuilder();
		String line;
		while ((line = request.getReader().readLine()) != null) {
			builder.append(line);
		}
		String body = builder.toString();

		// JSON 파싱
		JSONParser parser = new JSONParser();
		List<String> userEmails = new ArrayList<>();
		try {
			JSONObject json = (JSONObject) parser.parse(body);
			JSONArray userIdsJson = (JSONArray) json.get("passedUserIds"); // "passedUserIds"라는 키에 대한 배열을 가져옵니다.
			List<String> userIds = new ArrayList<>();
			for (Object userIdObj : userIdsJson) {
				userIds.add((String) userIdObj);
			}

			// ApplicationMgr을 사용하여 user_id에 해당하는 이메일 주소를 조회
			ApplicationMgr aMgr = new ApplicationMgr();
			userEmails = aMgr.searchPassedUserEmails(userIds);

			// 이메일 전송
			try {
				SendEmail.sendMail(userEmails);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("{\"message\":\"Emails sent successfully.\"}");
			} catch (MessagingException e) {
				e.printStackTrace();
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error sending emails");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid JSON format");
		}
	}
}
