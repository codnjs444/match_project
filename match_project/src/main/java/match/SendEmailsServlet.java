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
		// 합격자 이메일 목록을 파라미터에서 받아옵니다. 예시는 JSON 문자열 형태로 받아온다고 가정합니다.
		// 실제 구현에서는 프론트엔드와의 연동 방식에 따라 이 부분의 구현이 달라질 수 있습니다.
		String[] emailArray = request.getParameterValues("passedUserEmails"); // 파라미터 이름은 실제 요청과 일치해야 합니다.
		List<String> emails = Arrays.asList(emailArray); // 배열을 리스트로 변환

		try {
			// 이메일 전송 메소드 호출
			SendEmail.sendMail(emails);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"message\":\"Success\"}"); // 성공 메시지 반환
		} catch (MessagingException e) {
			e.printStackTrace();
			// 오류 응답
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"message\":\"Failed to send emails.\"}"); // 실패 메시지 반환
		}
	}
}
