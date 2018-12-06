package com.keb.atic.company.domain;

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
public class Company {
	
	public Company(String email, String name, String comType, String busiNum, String certiNum, String createDate,
			String sns) {
		super();
		this.email = email;
		this.name = name;
		this.comType = comType;
		this.busiNum = busiNum;
		this.certiNum = certiNum;
		this.createDate = createDate;
		this.sns = sns;
	}
	//심사기업 식별자
	private String id;
	//심사기업 이메일 
	private String email;
	// 심사기업  명
	private String name;
	//심사기업 기업 분류
	private String comType;
	//심사기업 사업자등록번호
	private String busiNum;
	//심사기업 기업인증내역
	private String certiNum;	
	//심사기업 설립일자
	private String createDate;
	//심사기업 snsURL
	private String sns;
	//업종정보
	private String categoryId;
	//초기자본금
	private String baseFund;
	//투자 유치이력
	private String fundHistory;
	//1차 유치액
	private String firstFund;
	//1차 유치 일자
	private String firstDate;
	//2차 유치액
	private String secondFund;
	//2차 유치 일자
	private String secondDate;
	//특허권 보유여부
	private String hasPatent;
	//사업자 등록증
	private String fileBusiRegistration;
	//기업 인증서
	private String fileCompCertification;
	//특허 인증서
	private String filePatentCertification;
	//투자 유치 인증서
	private String fileInvestCertification;
	
		
}
