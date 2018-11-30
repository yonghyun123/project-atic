package com.keb.atic.user.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.MultipartFile;

import com.keb.atic.user.domain.User;
import com.keb.atic.user.service.UserService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ProfileUploadController {
	@Autowired
	private UserService userService;
	@Autowired
	private ServletContext servletContext;
	
	@PostMapping("/upload/profile/{id}")
	@ResponseBody
	public void uploadAjaxPost(MultipartFile uploadFile, @PathVariable("id") String id, HttpServletRequest request) {
		log.info("파일 업로드");
		
		String fileName = id + ".png";
		String uploadFolder = request.getSession().getServletContext().getRealPath("resources/img/profile-img/");
//		여기 경로 읽어서 거기에 고대로 default 이미지 넣기
		System.out.println(uploadFolder);
		File saveFile = new File(uploadFolder, fileName);
		try {
			uploadFile.transferTo(saveFile);
			User user = userService.readUser(id);
			user.setProfile(id);
			userService.updateUser(user);
		} catch (Exception e) {
			e.getMessage();
		}
	}
	
	@GetMapping("/user/profile/{id}")
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
	}
	
}
