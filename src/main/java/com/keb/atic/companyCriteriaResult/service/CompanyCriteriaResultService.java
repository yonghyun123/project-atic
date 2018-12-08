package com.keb.atic.companyCriteriaResult.service;

import com.keb.atic.companyCriteriaResult.domain.CompanyCriteriaResult;

public interface CompanyCriteriaResultService {
	//심사업체 등록
	public void registCompanyCriteriaResult(CompanyCriteriaResult result);
	// 심사업체 별 조회 	
	public CompanyCriteriaResult readCompanyCriteriaResult(String companyID);

}
