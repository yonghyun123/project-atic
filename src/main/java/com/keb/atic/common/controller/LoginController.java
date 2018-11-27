package com.keb.atic.common.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.keb.atic.user.domain.User;
import com.keb.atic.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@AllArgsConstructor
public class LoginController {
	private UserService userService;
	
	// 정상적인 로그인
	@GetMapping("/user/login")
	public String userLogin(String username, String password, HttpServletRequest request, HttpServletResponse response) {
		User user = null;
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		try {
			user = userService.readUser(username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(user != null) {
			Cookie cookie = new Cookie("loginId", username);
			cookie.setPath("/");
			response.addCookie(cookie);
			if(user.getNickname() == null) {
				out.println("nickNone");
			}
		} else {
			out.println("userNone");
		}
		return null;
	}
	
	// 권한이 필요한 로그인
	// 경로로는 모달을 띄울 수 없으므로 로그인 페이지인 security-login.jsp로 이동
	// 테이블에 유저별 권한 테이블이 없으면 쓸모 없슴.
//	@RequestMapping("/customLogin")
//	public void loginInput(String error, String logout, Model model) {
//		log.info("error : " + error);		
//		log.info("logout : " + logout);		
//		
//		if(error != null) {
//			model.addAttribute("error", "Login Error");
//		}
//		
//		if(logout != null) {
//			model.addAttribute("logout", "Logout");
//		}
//	}
	
}
