package com.keb.atic.user.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
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
		String profile = null;
		profile = user.getProfile();
		String imageName = null;
		
		if(!profile.equals("0")) {
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
	
	@GetMapping(value = "/user/download/{fileName}", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@PathVariable("fileName") String fileName, HttpServletRequest request) {
		log.info("download");
		String folder = "/resources/img/profile-img/";
		Resource resource = new FileSystemResource(folder + fileName);
		log.info("resource : " + resource);
		String resourceName = resource.getFilename();
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Disposition",  "attachment; filename=" + new String(resourceName.getBytes("UTF-8"),
					"ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
}
