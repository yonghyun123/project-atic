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
	private String user_id;
	//projectId
	private String project_id;
	//createDate
	private String create_date;
}
