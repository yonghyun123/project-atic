package com.keb.atic.companyCriteriaResult.mapper;

import java.util.List;

import com.keb.atic.companyCriteriaResult.domain.CompanyCriteriaResult;

/**심사기업결과 관련 Mapper 
 * @author 권현우
 *
 */
public interface CompanyCriteriaResultMapper {
	//심사업체 등록
	public void registCompanyCriteriaResult(CompanyCriteriaResult result);
	// 심사업체 별 조회 	
	public CompanyCriteriaResult readCompanyCriteriaResult(String companyID);
	// 전체 심사업체 조회
	public List<CompanyCriteriaResult> companyCriteriaResultListAll();
	// 심사업체 삭제 
	public void deleteCompanyCriteriaResult(String companyID);
	// 심사업체 업데이트
	public void updateCompanyCriteriaResult(CompanyCriteriaResult result);	

}
