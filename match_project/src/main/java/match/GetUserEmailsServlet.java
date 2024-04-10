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
		StringBuilder builder = new StringBuilder();
		String line;
		while ((line = request.getReader().readLine()) != null) {
			builder.append(line);
		}
		String body = builder.toString();

		JSONParser parser = new JSONParser();
		try {
			JSONObject json = (JSONObject) parser.parse(body);
			JSONArray userIdsJson = (JSONArray) json.get("passedUserIds");
			String emailSubject = (String) json.get("emailSubject");
			String emailContent = (String) json.get("emailContent");
			int postingIdx = Integer.parseInt((String) json.get("postingIdx"));
			int procedureNum = ((Long) json.get("procedureNum")).intValue();
			int procedureCount = ((Long) json.get("procedureCount")).intValue();

			System.out.println("ProcedureNum: " + postingIdx);
			System.out.println("ProcedureNum: " + postingIdx);
			System.out.println("ProcedureNum: " + procedureNum);
			System.out.println("ProcedureCount: " + procedureCount);

			List<String> userIds = new ArrayList<>();
			for (Object userIdObj : userIdsJson) {
				userIds.add((String) userIdObj);
			}

			ApplicationMgr aMgr = new ApplicationMgr();
			List<String> userEmails = aMgr.searchPassedUserEmails(userIds);

			if (procedureCount + 1 < procedureNum) {
				aMgr.insertApplicationResults(userIds, postingIdx, procedureCount);
			} else {
				// 마지막 절차 이후의 로직: 최종 합격자 업데이트 및 공고 마감 처리
				aMgr.closePostingByPostingIdx(postingIdx);
				aMgr.updateApplicationResultsToFinalSelection(userIds, postingIdx, procedureCount);
			}

			try {
				SendEmail.sendMail(userEmails, emailSubject, emailContent);
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
