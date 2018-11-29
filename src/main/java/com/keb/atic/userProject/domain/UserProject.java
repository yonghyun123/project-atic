package com.keb.atic.userProject.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**사용자가 투자한 프로젝트 Domain
 * @author 권현우
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserProject {
	//userProject 식별자
	private String id;
	//user 투자금액
	private String deposit;
	//userId
	private String userId;
	//projectId
	private String projectId;
	
	/*도메인 추가 (yonghyun 2018-11-28) */
	//목표금액
	private String goal;
	//현재금액
	private String curPrice;
	//사업이름
	private String name;
	//회사이름
	private String company;
	//투자한 날짜
	private String createDate;
	
	public UserProject(String deposit, String userId, String projectId) {
		super();
		this.deposit = deposit;
		this.userId = userId;
		this.projectId = projectId;
	}
	
	
}
