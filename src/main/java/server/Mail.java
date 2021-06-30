package server;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/*import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
*/
/*import java.io.IOException;
import java.io.PrintWriter;*/

public class Mail {
	
    final String username = /* mail address */;
    final String password = /* Password */;
	
	public Mail(String towhome,String sub , String text) 
	{
		
		String from = ; // username or mail 
		 String to=towhome;
		 
		 String host = "smtp.gmail.com";

	      Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", "587");
	      props.put("mail.smtp.ssl.trust","smtp.gmail.com");
	      
	      // Get the Session object.
	      Session session = Session.getInstance(props,
	      new javax.mail.Authenticator() {
	         protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	         }
	      });
	      
	      try {
	         // Create a default MimeMessage object.
                 Message message = new MimeMessage(session);
                 
               // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));
	         
	         // Set To: header field of the header.
	         message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
	         
	         // Set Subject: header field
	         message.setSubject(sub);
	         
	       //set content type and actual message
	         message.setContent(text, "text/html");
	         
	         // Now set the actual message
	         //message.setText(text);
                
	         // Send message
	         Transport.send(message);
	       
	      } catch (MessagingException e) {
	            throw new RuntimeException(e);
	      }  
	}

}
