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
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        StringBuilder builder = new StringBuilder();
        String line;
        while ((line = request.getReader().readLine()) != null) {
            builder.append(line);
        }
        String body = builder.toString();

        JSONParser parser = new JSONParser();
        try {
        	
            JSONObject json = (JSONObject) parser.parse(body);
            JSONArray passedUserIdsJson = (JSONArray) json.get("passedUserIds");
            JSONArray failedUserIdsJson = (JSONArray) json.get("failedUserIds");
            String passedEmailSubject = (String) json.get("passedEmailSubject");
            String passedEmailContent = (String) json.get("passedEmailContent");
            String failedEmailSubject = (String) json.get("failedEmailSubject");
            String failedEmailContent = (String) json.get("failedEmailContent");
            String postingIdxStr = (String) json.get("postingIdx");
            Long procedureNumObj = (Long) json.get("procedureNum");
            Long procedureCountObj = (Long) json.get("procedureCount");

            
            if (postingIdxStr == null || procedureNumObj == null || procedureCountObj == null) {
                throw new IllegalArgumentException("Required data missing in JSON payload");
            }

            int postingIdx = Integer.parseInt(postingIdxStr);
            int procedureNum = procedureNumObj.intValue();
            int procedureCount = procedureCountObj.intValue();
            
            List<String> passedUserIds = new ArrayList<>();
            for (Object userIdObj : passedUserIdsJson) {
                passedUserIds.add((String) userIdObj);
            }

            List<String> failedUserIds = new ArrayList<>();
            for (Object userIdObj : failedUserIdsJson) {
                failedUserIds.add((String) userIdObj);
            }

            ApplicationMgr aMgr = new ApplicationMgr();
            List<String> passedUserEmails = aMgr.searchPassedUserEmails(passedUserIds);
            List<String> failedUserEmails = aMgr.searchPassedUserEmails(failedUserIds);

            // Handle the procedure count logic
            if (procedureCount + 1 < procedureNum) {
                aMgr.insertApplicationResults(passedUserIds, postingIdx, procedureCount);
                response.getWriter().write("결과 발표가 완료되었습니다.!");
            } else {
                // Last procedure handling: Finalizing results and closing the posting
                aMgr.closePostingByPostingIdx(postingIdx);
                aMgr.updateApplicationResultsToFinalSelection(passedUserIds, postingIdx, procedureCount);
                response.getWriter().write("모든 채용 절차가 종료되었습니다. 감사합니다.");
            }

            // Send emails to passed users
            SendEmail.sendMail(passedUserEmails, passedEmailSubject, passedEmailContent);

            // Send emails to failed users
            SendEmail.sendMail(failedUserEmails, failedEmailSubject, failedEmailContent);

        } catch (MessagingException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "메시지 전송에 실패하였습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid JSON format");
        }
    }
}
