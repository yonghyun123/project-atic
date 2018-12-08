package com.keb.atic.company.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keb.atic.company.domain.Company;
import com.keb.atic.company.service.CompanyService;
import com.keb.atic.companyCriteriaResult.domain.CompanyCriteriaResult;
import com.keb.atic.userStatus.domain.UserStatus;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/judge/*")
@AllArgsConstructor
public class CompanyJudgeController {
	@Inject
	private CompanyService companyService;
	
	
	@GetMapping(value="/detail/{id}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody Map<String, Object> getGraphById(@PathVariable("id") String id) throws Exception{
		Company company = companyService.getCompanyDetail(id);
		Map<String, Object> companyMap = new HashMap<>();
		companyMap.put("detailCompany", company);
		return companyMap;
	}
	
	@GetMapping(value="/list", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody Map<String, Object> getCompanyList() throws Exception{
		List<Company> company = companyService.getCompanyList();
		Map<String, Object> companyMap = new HashMap<>();
		companyMap.put("companyList", company);
		return companyMap;
	}
	
	
	@GetMapping(value="/eval/{id}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody Map<String, Object> getEvalById(@PathVariable("id") String id) throws Exception{
		CompanyCriteriaResult company = companyService.getEvalById(id);
		Map<String, Object> companyMap = new HashMap<>();
		companyMap.put("evalCompany", company);
		return companyMap;
	}
	
}
