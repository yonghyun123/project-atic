package com.keb.atic.companyCriteriaResult.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keb.atic.company.domain.Company;
import com.keb.atic.company.mapper.CompanyMapper;
import com.keb.atic.companyCriteriaResult.domain.CompanyCriteriaResult;
import com.keb.atic.companyCriteriaResult.mapper.CompanyCriteriaResultMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class CompanyCriteriaResultServiceImpl implements CompanyCriteriaResultService {	
	@Inject
	private CompanyCriteriaResultMapper companyCriteriaResultMapper;

	@Override
	public void registCompanyCriteriaResult(CompanyCriteriaResult result) {
		companyCriteriaResultMapper.registCompanyCriteriaResult(result);
		
	}

	@Override
	public CompanyCriteriaResult readCompanyCriteriaResult(String companyID) {
		// TODO Auto-generated method stub
		return companyCriteriaResultMapper.readCompanyCriteriaResult(companyID);
	}


	
}
