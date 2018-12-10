package com.keb.atic.mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.inject.Inject;
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

import com.keb.atic.company.service.CompanyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/email")
public class MailController {
	
	@Inject
	private CompanyService companyService;
	
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
	
	@SuppressWarnings("unchecked")
	@PostMapping("/preauth")
	public String RegisterPrePost(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
	
	//@SuppressWarnings("unchecked")
	@PostMapping("/filelist")
	public String sendFilelist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/json; charset=utf-8");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		
		String host = "smtp.gmail.com";
		String subject = "A-TiC 스타트업 대출 신청 준비 서류입니다.";
		String fromName = "atic-Manager";
		String from = "gmlwls008@gmail.com";
		String to1 = email;
		
		companyService.updateFlag(id);
		
		String content = "<img src='http://localhost/resources/img/logoss.png'><h1>고객님께서 준비하셔야 할 서류 목록입니다.</h1><br>"
				+"<h3>사업자등록증, 사업인증서, 특허인증서</h3><br>"
				+ "사업인증서와 특허인증서는 있으신 경우에만 구비해놓으시면 됩니다.<br>"
				+ "그 외 설립년월, 회사의 업종, 초기 자본금, 투자유치 이력(2회까지) 등의 내용을 홈페이지에 들어오셔서 입력해주셔야 합니다.<br><br>"
				+ "<img src='http://localhost/resources/img/aply.png' style=\"width: 922px;\">";
		
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
		

		return null;
	}
	
	private void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com";
		String subject = "A-TiC 인증번호 입니다.";
		String fromName = "atic-Manager";
		String from = "gmlwls008@gmail.com";
		String to1 = email;
		
		String content = " <div style=\"background-image: url(http://localhost/resources/img/mailbackground.jpg);\">" 
				+ "<img src='http://localhost/resources/img/logoss.png' style='width: 300px; height:90px; margin-left: 35%;'><br><br>"
				+ "<p style='font-size:12pt; margin-left: 30%;'>고객님의 인증번호는 <span style=\"font-weight: 1000; font-size:15pt\">"+ authNum +"</span> 입니다. 정확하게 입력해주세요.</p>"
				+"<br><br>    </div>";
		
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
