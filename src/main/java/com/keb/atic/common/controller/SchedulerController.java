package com.keb.atic.common.controller;

import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.keb.atic.userStatus.domain.UserStatus;
import com.keb.atic.userStatus.service.UserStatusService;

@Component
public class SchedulerController {

	@Autowired
	private UserStatusService userStatusService;

	@Scheduled(cron = "0 0 0 1 * *")
	public void updateInterest() {
		// id별 각 달에 추가 되어야 할 interest 과 deposit
		List<UserStatus> updateList = userStatusService.updateListByMonth();
		//변수
		double totalMoney =0.0 , totalProfit = 0.0 , curProfit = 0.0;
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
				totalMoney += (curMoney) * (double) (Math.pow((totalProfit + 1),(endMonth - curMonth) / 12));
				curProfit = Double.parseDouble(interestList.getCurProfit());
			}
			totalProfit = totalProfit + curProfit ;
			totalProfit = Math.round(totalProfit*1000)/1000.0;
			
			// insert
			userStatus = new UserStatus();
			userStatus.setUserId(userId);
			userStatus.setYear(year);
//			userStatus.setMonth(month); 나중에 바꿔줘야함
			userStatus.setMonth("12");
			userStatus.setTotalProfit(String.valueOf(totalProfit));
			userStatus.setCurProfit(interest);
			userStatus.setTotalMoney(String.valueOf( (int) totalMoney) );
			userStatus.setCurMoney(deposit);
			System.out.println(userStatus.toString());
			userStatusService.createUserStatus(userStatus);
		}

	}
}
