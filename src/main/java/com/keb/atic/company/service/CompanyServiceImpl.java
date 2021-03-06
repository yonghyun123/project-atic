package com.keb.atic.company.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.keb.atic.company.domain.Company;
import com.keb.atic.company.mapper.CompanyMapper;
import com.keb.atic.companyCriteriaResult.domain.CompanyCriteriaResult;
import com.keb.atic.companyCriteriaResult.mapper.CompanyCriteriaResultMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class CompanyServiceImpl implements CompanyService {	
	@Inject
	private CompanyMapper companyMapper;
	@Inject
	private CompanyCriteriaResultMapper companyCriteriaResultMapper;



	@Override
	public void registCompanyInfo(Company company) {
		companyMapper.registCompanyInfo(company);
	}

	@Override
	public Company readCompanyInfo(String email) {
		return companyMapper.readCompanyInfo(email);
	}

	@Override
	public List<Company> companyListAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCompany(String id) {
		// TODO Auto-generated method stub
		
	}
	@Transactional
	@Override
	public void updateCompanyInfo(Map<String, Object> infoMap) {
		companyCriteriaResultMapper.registCompanyCriteriaResult((CompanyCriteriaResult)infoMap.get("result"));
		companyMapper.updateCompanyInfo((Company)infoMap.get("company"));
	}
	@Override
	public Company getCompanyDetail(String id) {
		return companyMapper.getCompanyDetail(id);
	}

	@Override
	public List<Company> getCompanyList() {
		return companyMapper.getCompanyList();
	}

	@Override
	public CompanyCriteriaResult getEvalById(String id) {

		return companyMapper.getEvalById(id);
	}

	@Override
	public void updateFlag(String id) {
		companyMapper.updateFlag(id);
	}


}
