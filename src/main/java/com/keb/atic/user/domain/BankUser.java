package com.keb.atic.user.domain;

import lombok.Data;

/**기존 은행 사용자의 정보를 담는 Domain
 * @author 권현우
 *
 */
@Data
public class BankUser {
	//User 은행 id
	private String id;
	//User 이름
	private String name;
	//User 기존 계좌
	private String acc_num;
	//User 기존 계좌 pass
	private String acc_pw;
	//User 휴대전화 번호
	private String phone;

}
