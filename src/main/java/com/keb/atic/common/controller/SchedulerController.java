package com.keb.atic.common.controller;

import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.keb.atic.project.service.ProjectService;
import com.keb.atic.userProject.service.UserProjectService;
import com.keb.atic.userReservation.domain.UserReservation;
import com.keb.atic.userReservation.service.UserReservationService;
import com.keb.atic.userStatus.domain.UserStatus;
import com.keb.atic.userStatus.service.UserStatusService;

@Component
public class SchedulerController {

	@Autowired
	private UserStatusService userStatusService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private UserProjectService userProjectService;
	@Autowired
	private UserReservationService userReservationService;

	@Scheduled(cron = "0 0 0 1 * *")
	public void updateInterest() {
		// id별 각 달에 추가 되어야 할 interest 과 deposit
		List<UserStatus> updateList = userStatusService.updateListByMonth();
		// 변수
		double totalMoney = 0.0, totalProfit = 0.0, curProfit = 0.0;
		String userId, year, month, deposit, interest;
		GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
		if ((cal.get(GregorianCalendar.MONTH) + 2) == 1) {
			year = String.valueOf(cal.get(GregorianCalendar.YEAR) - 1);
		} else {
			year = String.valueOf(cal.get(GregorianCalendar.YEAR));
		}
		month = String.valueOf(cal.get(GregorianCalendar.MONTH));

		UserStatus userStatus;
		for (UserStatus userStatusList : updateList) {
			// id 뽑기
			userId = userStatusList.getUserId();
			interest = userStatusList.getSumInterest();
			deposit = userStatusList.getSumDeposit();
			// 이자율 계산하기
			// id의 전체 이자율 리스트 : input = id
			List<UserStatus> calInterestList = userStatusService.calInterest(userId);
			// 최초 입금 달
			Double endMonth = Double.parseDouble(calInterestList.get(0).getMonth()) + 12;
			for (UserStatus interestList : calInterestList) {
				totalProfit = Double.parseDouble(interestList.getTotalProfit());
				double curMoney = Double.parseDouble(interestList.getCurMoney());
				double curMonth = Double.parseDouble(interestList.getMonth());
				totalMoney += (curMoney) * (double) (Math.pow((totalProfit + 1), (endMonth - curMonth) / 12));
				curProfit = Double.parseDouble(interestList.getCurProfit());
			}
			totalProfit = totalProfit + curProfit;
			totalProfit = Math.round(totalProfit * 1000) / 1000.0;

			// insert
			userStatus = new UserStatus();
			userStatus.setUserId(userId);
			userStatus.setYear(year);
//			userStatus.setMonth(month); 나중에 바꿔줘야함
			userStatus.setMonth("12");
			userStatus.setTotalProfit(String.valueOf(totalProfit));
			userStatus.setCurProfit(interest);
			userStatus.setTotalMoney(String.valueOf((int) totalMoney));
			userStatus.setCurMoney(deposit);
			System.out.println(userStatus.toString());
			userStatusService.createUserStatus(userStatus);
		}
		
		List<UserReservation> list = userReservationService.userList();
		for (UserReservation userReservation : list) {
			String userId2 = userReservation.getUserId();
			String email = userReservation.getUserEmail();
			List<UserReservation> resList = userReservationService.reservationList(userId2);
			sendEmail(email, resList);
		}

	}

//	@Scheduled(cron = "*/30 * * * * *")
//	public void sendReservation() {
//		Calendar cal = Calendar.getInstance();
//		// 오늘이 월의 마지막 일인지 확인
//		boolean isLastDay = cal.get(Calendar.DATE) == cal.getActualMaximum(Calendar.DATE);
//		//if (isLastDay) {
//			// 실행 내용
//			List<UserReservation> list = userReservationService.userList();
//			for (UserReservation userReservation : list) {
//				String userId = userReservation.getUserId();
//				String email = userReservation.getUserEmail();
//				List<UserReservation> resList = userReservationService.reservationList(userId);
//				sendEmail(email, resList);
//			}
//			
//		}
//	//}
	
	private void sendEmail(String email, List<UserReservation> list) {
		String host = "smtp.gmail.com";
		String subject = "A-TiC 예약하신 프로젝트 투자가 곧 열립니다!";
		String fromName = "atic-Manager";
		String from = "gmlwls008@gmail.com";
		String to1 = email;
		
		
		String content = "<h1>예약하신 프로젝트 투자가 곧 시작됩니다! </h1>"+"<br>"
				+ "<h2>고객님께서 알림 신청하신 프로젝트 입니다.</h2>"+"<br>"
				+ "======================================================================"+"<br><br>";
		for (UserReservation userReservation : list) {
			String projectName = userReservation.getProjectName();
			String projectId = userReservation.getProjectId();
			content += "<h3><a href='http://localhost/shop/detail/"+projectId+"'>"+projectName+"</a></h3><br>";
		}
		
		
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

}
