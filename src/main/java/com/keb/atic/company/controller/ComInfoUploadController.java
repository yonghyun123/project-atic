package com.keb.atic.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.keb.actic.common.evaluation.EvaluationModel;
import com.keb.atic.company.domain.Company;
import com.keb.atic.company.service.CompanyService;
import com.keb.atic.companyCriteriaResult.domain.CompanyCriteriaResult;
import com.keb.atic.companyCriteriaResult.mapper.CompanyCriteriaResultMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/company/*")
@AllArgsConstructor
public class ComInfoUploadController {
	private CompanyService companyService;
	private CompanyCriteriaResultMapper companyCriteriaResultMapper;
	@PostMapping("/demoregist")
	public String componyDemoRegist(Company company, Model model) {
		log.info(company.getEmail());
		log.info(company.getName());
		log.info(company.getComType());
		log.info(company.getBusiNum());
		log.info(company.getCertiNum());
		log.info(company.getCreateDate());
		log.info(company.getSns());
		companyService.registCompanyInfo(company);
		
		return "redirect:/loan";
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/checkMail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody Company emailAuth( @RequestBody String email) {
		String[] emailArray = email.split("=");
		String[] emailSplit = emailArray[1].split("%40");
		String emailOrigin = emailSplit[0]+"@"+emailSplit[1];
		log.info(emailOrigin);
		Company company = companyService.readCompanyInfo(emailOrigin);
		return company;
	}
	
	@PostMapping("/comregist")
	public String componyRegist(Company company, Model model, @RequestParam("uploadBiz") MultipartFile uploadBiz,
			@RequestParam("uploadBizAuth") MultipartFile uploadBizAuth,@RequestParam("uploadPatent") MultipartFile uploadPatent,
			@RequestParam("uploadBInvest") MultipartFile uploadBInvest, HttpServletRequest request) {
			//사업자등록증
			company.setFileBusiRegistration(uploadBiz.getOriginalFilename());
			//사업증명서
			company.setFileCompCertification(uploadBizAuth.getOriginalFilename());
			//투자유치증명서
			company.setFileInvestCertification(uploadBInvest.getOriginalFilename());
			//특허증명서
			company.setFilePatentCertification(uploadPatent.getOriginalFilename());			
			//평가모델
			EvaluationModel evalModel = new EvaluationModel();
			String bizRegistDir = request.getSession().getServletContext().getRealPath("resources/document/사업자등록증/");
			String bizAuthDir = request.getSession().getServletContext().getRealPath("resources/document/사업자인증서/");
			String bizPatentDir = request.getSession().getServletContext().getRealPath("resources/document/특허인증서/");
			String bizInvestDir = request.getSession().getServletContext().getRealPath("resources/document/투자유치증명/");
			log.info("company=" + company.toString());
			if(company.getCertiNum().equals("이노비즈인증")) {
				company.setCertiNum("1");
			}else if(company.getCertiNum().equals("메인비즈인증")) {
				company.setCertiNum("2");
			}else if(company.getCertiNum().equals("벤처비즈인증")) {
				company.setCertiNum("3");
			}else if(company.getCertiNum().equals("기타")) {
				company.setCertiNum("4");
			}else {
				company.setCertiNum("5");
			}
			log.info("CertiNum=" + company.getCertiNum());
			String[] uploadDirArray = new String[]{
					bizRegistDir,bizAuthDir,bizPatentDir,bizInvestDir
			};
			for (String eachDir : uploadDirArray) {
				File uploadDir = new File(eachDir);
				if(!uploadDir.isDirectory()) {
					uploadDir.mkdirs();
				}
			}
			
			File bizRegist = new File(bizRegistDir, uploadBiz.getOriginalFilename());
			File bizAuth = new File(bizAuthDir, uploadBizAuth.getOriginalFilename());
			File bizPatent = new File(bizPatentDir, uploadPatent.getOriginalFilename());
			File bizInvest = new File(bizInvestDir, uploadBInvest.getOriginalFilename());
			try {
				if(bizRegist.isFile())
				uploadBiz.transferTo(bizRegist);
				if(bizAuth.isFile())
				uploadBizAuth.transferTo(bizAuth);
				if(bizPatent.isFile())
				uploadPatent.transferTo(bizPatent);
				if(bizInvest.isFile())
				uploadBInvest.transferTo(bizInvest);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			List<Integer>ninethList = new ArrayList<Integer>();
			String firstEval = String.valueOf(evalModel.firstCriteria(company));
			String secondEval = String.valueOf(evalModel.secondCriteria(company));
			String thirdEval = String.valueOf(evalModel.thirdCriteria(company));
			String fourthEval = String.valueOf(evalModel.fourthCriteria(company));
			String fifthEval = String.valueOf(evalModel.fifthCriteria(company));
			String sixthEval = String.valueOf(evalModel.sixthCriteria(company));
			String seventhEval = String.valueOf(evalModel.seventhCriteria(company));
			String eighthEval = String.valueOf(evalModel.eighthCriteria(company));	
			ninethList = evalModel.ninethCriteria(company);
			String ninethEval = String.valueOf(ninethList.get(ninethList.size()-1));
			CompanyCriteriaResult result = new CompanyCriteriaResult(company.getEmail(), company.getId(), firstEval, secondEval, thirdEval, fourthEval, fifthEval, sixthEval, seventhEval, eighthEval, ninethEval);
			//개별점수 등록
			companyCriteriaResultMapper.registCompanyCriteriaResult(result);
			
			String totalEval = String.valueOf(evalModel.firstCriteria(company) + evalModel.secondCriteria(company) + evalModel.thirdCriteria(company)+evalModel.fourthCriteria(company)
								+evalModel.fifthCriteria(company) +evalModel.sixthCriteria(company) + evalModel.seventhCriteria(company) + evalModel.eighthCriteria(company)
								+ninethList.get(ninethList.size()-1));
			company.setTotalResult(totalEval);
			//총점수 등록
			companyService.updateCompanyInfo(company);
		return "redirect:/loan";
	}
	
}
