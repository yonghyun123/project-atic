package com.keb.atic.company.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.keb.atic.user.service.UserService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ComInfoUploadController {
	@Autowired
	private UserService userService;
	@Autowired
	private ServletContext servletContext;
	
	@PostMapping("/upload/registInfo")
	public void uploadAjaxPost(MultipartFile []  uploadFile, HttpServletRequest request) {
		
		String uploadFolder = request.getSession().getServletContext().getRealPath("resources/companyInfo/");
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
