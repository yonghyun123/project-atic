package com.keb.atic.user.domain;

import lombok.Data;

/**플랫폼 사용자의 정보를 담는 Domain
 * @author 권현우
 *
 */
@Data
public class User {
	//User 은행 id
	private String id;
	//User 이름
	private String name;
	//User 닉네임
	private String nickname;
	//User 프로필
	private String profile;
	//User 기존 계좌
	private String acc_num;
	//User 기존 계좌 pass
	private String acc_pw;
	//적금을 위한 User 가상 계좌
	private String vt_acc_num;
	//User 휴대전화 번호
	private String phone;
	//가상계좌 유무
	private String vt_acc_flag;
	//적금 총액
	private String total_money;
	//현재 이윤
	private String profit;
}
