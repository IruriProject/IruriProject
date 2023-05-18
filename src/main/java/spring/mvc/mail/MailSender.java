package spring.mvc.mail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailSender {

  //메일 보내는 함수(파라미터로 받는 사람의 email 주소를 넣어줬다)
  public static void mailSend(String email, String id) {
	  
      Properties props = new Properties();
      props.put("mail.smtp.host", "smtp.gmail.com");
      props.put("mail.smtp.port", "587");
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

      Session session = Session.getInstance(props, new Authenticator() {
          @Override
          protected PasswordAuthentication getPasswordAuthentication() {
              return new PasswordAuthentication("jkomi1203@gmail.com", "byiesdiapvvvowhs");
          }
      });
      
      String receiver = email; // 메일 받을 주소
      String title = "이루리 1:1문의 답변완료되었습니다.";
      String content = "<h3><b style='color: #4E9F3D;'>"+id+"님</b>&nbsp;&nbsp;이루리 1:1문의 답변완료되었습니다.</h3><h3>확인부탁드립니다.감사합니다.</h3>";
      Message message = new MimeMessage(session);
      try {
          message.setFrom(new InternetAddress("jkomi1203@gmail.com", "이루리관리자", "utf-8"));
          message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
          message.setSubject(title);
          message.setContent(content, "text/html; charset=utf-8");

          Transport.send(message);
      } catch (Exception e) {
          e.printStackTrace();
      }
  }
}