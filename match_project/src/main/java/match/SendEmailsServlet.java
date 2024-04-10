package match;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sendEmails")
public class SendEmailsServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] emailArray = request.getParameterValues("passedUserEmails");
		List<String> emails = Arrays.asList(emailArray);
		String emailSubject = request.getParameter("emailSubject"); // 메일 제목 받기
		String emailContent = request.getParameter("emailContent"); // 메일 내용 받기

		try {
			SendEmail.sendMail(emails, emailSubject, emailContent);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"message\":\"Success\"}");
		} catch (MessagingException e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"message\":\"Failed to send emails.\"}");
		}
	}
}
