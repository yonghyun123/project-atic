package com.keb.atic.user.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keb.atic.user.domain.User;
import com.keb.atic.user.service.UserService;
import com.keb.atic.userStatus.domain.UserStatus;
import com.keb.atic.userStatus.service.UserStatusService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * create : post
 * read : get
 * update : put
 * delete : delete
 */

@Log4j
@Controller
@RequestMapping("/users/*")
@AllArgsConstructor
public class UserController {
	@Inject
	private UserService userService;
	@Inject
	private UserStatusService statusService;
	
	@GetMapping(value = "/{id}")
	public ResponseEntity<User> get(@PathVariable("id") String id) throws Exception {
		return userService.readUser(id) != null ? new ResponseEntity<User>(userService.readUser(id), HttpStatus.OK)
				: new ResponseEntity<User>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	/*My page 정보 조회 Controller */
	@GetMapping(value="/mypage/{id}")
	public String getMyInfoById(Model model, @PathVariable("id") String userId) throws Exception{
		UserStatus userStatus = statusService.getMaxStatus(userId);
		User user = userService.readUser(userId);
		log.info(userStatus);
		log.info(user);
		
		model.addAttribute("userStatus",userStatus);
		model.addAttribute("user",user);
		return "my-page/mypage";
	}
}
