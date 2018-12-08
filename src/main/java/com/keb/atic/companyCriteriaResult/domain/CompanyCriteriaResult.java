package com.keb.atic.companyCriteriaResult.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**플랫폼에서 사용되는 기업심사정보 정보를 가진 Domain
 * @author 권현우
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyCriteriaResult {
	//결과 식별자
	private String id;
	//심사기업 이메일 
	private String email;
	//심사기업 id
	private String companyId;
	//첫번째 기준 심사결과
	private String firstEval;
	//두번째 기준 심사결과
	private String secondEval;
	//세번째 기준 심사결과
	private String thirdEval;
	//네번째 기준 심사결과
	private String fourthEval;
	//디섯번째 기준 심사결과
	private String fifthEval;
	//여섯번째 기준 심사결과
	private String sixthEval;
	//일곱번째 기준 심사결과
	private String seventhEval;
	//여덟번째 기준 심사결과
	private String eighthEval;
	//아홉번째 기준 심사결과
	private String ninethEval;
	public CompanyCriteriaResult(String email, String companyId, String firstEval, String secondEval, String thirdEval,
			String fourthEval, String fifthEval, String sixthEval, String seventhEval, String eighthEval,
			String ninethEval) {
		super();
		this.email = email;
		this.companyId = companyId;
		this.firstEval = firstEval;
		this.secondEval = secondEval;
		this.thirdEval = thirdEval;
		this.fourthEval = fourthEval;
		this.fifthEval = fifthEval;
		this.sixthEval = sixthEval;
		this.seventhEval = seventhEval;
		this.eighthEval = eighthEval;
		this.ninethEval = ninethEval;
	}
	
	
	
}
