package com.keb.atic.userEval.domain;

import lombok.Data;

/**프로젝트 사용자 예비평가 Domain
 * @author 권현우
 *
 */
@Data
public class UserEval {
	//UserEval 식별자
	private String id;
	//평가자 Id
	private String user_id;
	//평가 프로젝트 식별자
	private String project_id;
	//안정성
	private String stable_grade;
	//시장성
	private String market_grade;
	//호감도
	private String favor_grade;
	//성장성
	private String growth_grade;
				
}
