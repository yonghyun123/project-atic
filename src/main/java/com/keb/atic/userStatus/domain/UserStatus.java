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
	private String user_id;
	//적금 년
	private String year;
	//적금 월
	private String month;
	//누적 총 이윤
	private String total_profit;
	//당월 추가 이윤
	private String cur_profit;
	//누적 총 적금액
	private String total_money;
	//당월 추가 적금액
	private String cur_money;
	
	public UserStatus(String user_id, String total_profit, String cur_profit, String total_money, String cur_money) {
		super();
		this.user_id = user_id;
		this.total_profit = total_profit;
		this.cur_profit = cur_profit;
		this.total_money = total_money;
		this.cur_money = cur_money;
	}
	
	
}
