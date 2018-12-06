package com.keb.atic.company.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keb.atic.company.domain.Company;
import com.keb.atic.company.service.CompanyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/company/*")
@AllArgsConstructor
public class ComInfoUploadController {
	private CompanyService companyService;
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
	public @ResponseBody boolean emailAuth( @RequestBody String email) {
		String[] emailArray = email.split("=");
		String[] emailSplit = emailArray[1].split("%40");
		String emailOrigin = emailSplit[0]+"@"+emailSplit[1];
		log.info(emailOrigin);
		return false;
	}
/*	@GetMapping("/user/profile/{id}")
	@ResponseBody
	public ResponseEntity<Resource> getImage(@PathVariable("id") String id, HttpServletRequest request) throws Exception {
		String imagePath = "/resources/img/profile-img/";
		User user = userService.readUser(id);
		String imageName = null;
		
		if(user.getProfile() != null) {
			imageName = user.getProfile() + ".png";
		} else {
			imageName = "default.png";
		}
		
		String fullPath = imagePath + imageName;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		Resource resource = new ServletContextResource(servletContext, fullPath);
		return new ResponseEntity<>(resource, headers, HttpStatus.OK);
	}*/
	
}
