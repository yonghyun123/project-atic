package com.keb.atic.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@RequestMapping("/login")
public class LoginController {
	@GetMapping("/some")
	public String goSome() {
		log.info("Welcome MainPage! You need to SignUp");
		return "some";
	}
	
}
