package com.lab;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import Storage.Data;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
					maxFileSize = 1024 * 1024 * 10 ,
					maxRequestSize = 1024 * 1024 * 50 )

public class UploadReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("hello");
		String tid=request.getParameter("tid");
		String to=request.getParameter("email");
		Part part = request.getPart("report");
		String uid=request.getParameter("uid");
		String filename = extractFileName(part);
		//System.out.println(filename);
		String savepath ;
 		savepath="C:\\eclipse-workspace\\careforyou\\src\\main\\webapp\\assets\\img\\reports"+ File.separator + filename;
		part.write(savepath + File.separator);
		System.out.println("file uploded suceesfully..");
		
		try {
			Data dt= new Data();
			dt.st=dt.cn.createStatement();
			
			String insert="insert into notification_tbl(vNotificationTo,iId,iFacilityId,vFacilityTable,vNotificationDetails,dNotificationDate) ";
			insert+="values('user',"+uid+","+tid+",'testappointment_tbl','Your Lab Report is here','"+java.time.LocalDate.now().toString()+"')"; 
			dt.st.executeUpdate(insert);
			
			String update="update testappointment_tbl set vReports = '"+filename+"' where iTappointId = "+tid;
			dt.st.executeUpdate(update);
			final String username = "care4you2019@gmail.com";
		    final String password = "care@2019";
		    String from = "care4you2019@gmail.com";
			// String to;//=towhome;
			 //to="rutuchudasama.2000@gmail.com";
			 String host = "smtp.gmail.com";

		      Properties props = new Properties();
		      props.put("mail.smtp.auth", "true");
		      props.put("mail.smtp.starttls.enable", "true");
		      props.put("mail.smtp.host", host);
		      props.put("mail.smtp.port", "587");
		      props.put("mail.smtp.ssl.trust","smtp.gmail.com");
		      
		      Session session = Session.getInstance(props,
		    	      new javax.mail.Authenticator() {
		    	         protected PasswordAuthentication getPasswordAuthentication() {
		    	            return new PasswordAuthentication(username, password);
		    	         }
		    	      });
			  MimeMessage message = new MimeMessage(session);
			  message.setFrom(new InternetAddress(from));
			  message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			  message.setSubject("Your Report");
			  BodyPart messageBody = new MimeBodyPart();
			  messageBody.setText("Your Report of test :: ");
			  Multipart multipart = new MimeMultipart();
			  multipart.addBodyPart(messageBody);
			  messageBody = new MimeBodyPart();
			  DataSource source = new FileDataSource(savepath);
			  messageBody.setDataHandler(new DataHandler(source));
			  messageBody.setFileName(filename);
			  multipart.addBodyPart(messageBody);
			  message.setContent(multipart);
			  Transport.send(message);
		      System.out.println("Send Report Succesfully..");
			 response.sendRedirect(request.getHeader("Referer"));
		}
		catch(Exception e)
		{	System.out.println(e); }
		
		
	}
	
	private String extractFileName(Part part) throws IOException, NullPointerException {
		try {
			String contentDisp = part.getHeader("content-disposition");
			String[] items = contentDisp.split(";");
			for (String s : items) {
				if (s.trim().startsWith("filename")) {
					return s.substring(s.indexOf("=") + 2, s.length() - 1);
				}
			}
			return "";
		} catch (Exception e) {
			System.out.println(e);
		}
		return "";
	}
	
}
