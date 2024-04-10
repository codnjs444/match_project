package match;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

	public static void sendMail(List<String> recipientEmails) throws MessagingException {
		String host = "smtp.gmail.com"; // 이메일 서버 (Gmail의 경우)
		final String user = "rldrhd131@gmail.com"; // 발신자의 이메일 주소
		final String password = "yino trwo uvqd bbzy"; // 발신자 이메일의 비밀번호

		// SMTP 서버 정보 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 여기에 TLSv1.2 프로토콜 사용을 명시적으로 지정
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// 메시지 작성
		for (String recipient : recipientEmails) {
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

				// 메일 제목
				message.setSubject("합격을 축하드립니다!");

				// 메일 내용
				message.setText("귀하가 지원하신 포지션에 대해 합격하셨음을 알려드립니다.");

				// 메일 전송
				Transport.send(message);
				System.out.println("Sent message successfully to: " + recipient);
			} catch (MessagingException mex) {
				mex.printStackTrace();
			}
		}
	}
}
