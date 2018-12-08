package com.keb.atic.common.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		if(user != null && user.getPassword().equals(password)) {
			log.info("로그인");
			Cookie cookie = new Cookie("loginId", username);
			cookie.setPath("/");
			response.addCookie(cookie);
			
			if(user.getId() == null) {
				out.println("nickNone");
			} else if (user.getId().equals("admin")) {
				log.info("admin");
				out.println("admin");
			}
			
		} else {
			out.println("userNone");
		}
		return null;
	}
	
	@GetMapping("/user/logout")
	public String userLogout(HttpServletRequest request, HttpServletResponse response) {
		log.info("로그아웃");
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if(cookie.getName().equals("loginId")) {
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
				break;
			}
		}
		return "redirect:/";
	}
	
}
