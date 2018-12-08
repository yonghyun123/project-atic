package com.keb.atic.userStatus.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**사용자 투자내역 Domain
 * @author 권현우
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserStatus {
	//사용자 투자내역 고유 식별자
	private String id;
	//사용자 Id
	private String userId;
	//적금 년
	private String year;
	//적금 월
	private String month;
	//누적 총 이윤
	private String totalProfit;
	//당월 추가 이윤
	private String curProfit;
	//누적 총 적금액
	private String totalMoney;
	//당월 추가 적금액
	private String curMoney;
	
	private String sumInterest;
	
	private String sumDeposit;
	//월별 누적금액
	private String accumulateMoney;
}
