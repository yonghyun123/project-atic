package com.keb.atic.mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/email")
public class MailController {
	
	@SuppressWarnings("unchecked")
	@PostMapping("/auth")
	public String RegisterPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/json; charset=utf-8");
		String email = request.getParameter("email");
		String authNum = "";
		
		authNum = RandomNum();
		
		sendEmail(email.toString(), authNum);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("email", email);
		jsonObject.put("authNum", authNum);
		
		 PrintWriter out = null;
         try {
           out = response.getWriter();
        } catch (IOException e) {
           e.printStackTrace();
        }
		out.println(jsonObject.toJSONString());
		return null;
	}
	
	private void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com";
		String subject = "결제 인증번호 전달";
		String fromName = "aticManager";
		String from = "gmlwls008@gmail.com";
		String to1 = email;
		
		String content = "인증번호 [" + authNum + "]";
		
		try {
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props,
					new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("gmlwls008@gmail.com", "atic1111");
				}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=utf-8");
			
			Transport.send(msg);
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i =0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		
		return buffer.toString();
	}

}
