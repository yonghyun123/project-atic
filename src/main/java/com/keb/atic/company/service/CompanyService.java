package com.keb.atic.company.service;

import java.util.List;

import com.keb.atic.company.domain.Company;
import com.keb.atic.companyCriteriaResult.domain.CompanyCriteriaResult;

public interface CompanyService {
	//심사업체 등록
	public void registCompanyInfo(Company company);
	// 심사업체 별 조회 	
	public Company readCompanyInfo(String email);
	// 전체 심사업체 조회
	public List<Company> companyListAll();
	// 심사업체 삭제 
	public void deleteCompany(String id);
	// 심사업체 업데이트
	public void updateCompanyInfo(Company company);
	// 기업 정보 디테일
	public Company getCompanyDetail(String id);
	//전체 조회
	public List<Company> getCompanyList();
	
	public CompanyCriteriaResult getEvalById(String id);
}
