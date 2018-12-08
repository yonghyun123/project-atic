package com.keb.atic.companyCriteriaResult.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**플랫폼에서 사용되는 file 정보를 가진 Domain
 * @author 권현우
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyCriteriaResult {
	
	//심사기업 이메일(식별자) 
	private String email;
	private String firstResult;
	private String secondResult;
	private String thirdResult;
	private String fourthResult;
	private String fifthResult;
	private String sixthResult;
	private String seventhResult;
	private String eighthResult;
	private String ninethResult;
	private String tenthResult;
}
