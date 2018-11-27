package com.keb.atic.userEval.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**프로젝트 사용자 예비평가 Domain
 * @author 권현우
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
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
	//전체 카테고리 평균 평점
	private String total_avg;
	
	public UserEval(String user_id, String project_id, String stable_grade, String market_grade, String favor_grade,
			String growth_grade) {
		super();
		this.user_id = user_id;
		this.project_id = project_id;
		this.stable_grade = stable_grade;
		this.market_grade = market_grade;
		this.favor_grade = favor_grade;
		this.growth_grade = growth_grade;
	}
	
	
				
}
