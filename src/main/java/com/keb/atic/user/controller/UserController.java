package com.keb.atic.user.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	private UserStatusService userStatusService;
	
	@GetMapping(value = "/{id}")
	public ResponseEntity<User> get(@PathVariable("id") String id) throws Exception {
		return userService.readUser(id) != null ? new ResponseEntity<User>(userService.readUser(id), HttpStatus.OK)
				: new ResponseEntity<User>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	/*My page 정보 조회 Controller */
	@GetMapping(value="/mypage/{id}")
	public String getMyInfoById(Model model, @PathVariable("id") String userId) throws Exception{
		UserStatus userStatus = userStatusService.getMaxStatus(userId);
		User user = userService.readUser(userId);
		log.info(userStatus);
		log.info(user);
		
		model.addAttribute("userStatus",userStatus);
		model.addAttribute("user",user);
		return "my-page/mypage";
	}
	
	@GetMapping(value="/mypage/graph/{id}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody Map<String, Object> getGraphById(@PathVariable("id") String userId) throws Exception{
		List<UserStatus> statusList = userStatusService.userStatusListByUser(userId);
		Map<String, Object> statusMap = new HashMap<>();
		for (UserStatus userStatus : statusList) {
			log.info(userStatus);
		}
		statusMap.put("graphList", statusList);
		return statusMap;
	}
	
	
	/* 닉네임 조회 Controller */
	@GetMapping(value="/id/{id}/nickname/{nickname}")
	public String getNickname(@PathVariable("nickname") String nickname, @PathVariable("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		log.info("닉네임 중복 조회");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		if(userService.searchNickname(nickname) != 0) {
			out.println("duplicate");
		} else {
			User user = userService.readUser(id);
			user.setNickname(nickname);
//			userService.updateUser(user);
			out.println("nick-success");
		}
		return null; 
	}

	/* 닉네임 조회 Controller */
	@GetMapping(value="/vt/{id}")
	public String updateVt(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		log.info("가상계좌 생성");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		if(userService.updateUserVt(id) == 0) {
			out.println("updateFail");
		} else {
			out.println("updateSuccess");
		}
		
		return null; 
	}
	
	
}
