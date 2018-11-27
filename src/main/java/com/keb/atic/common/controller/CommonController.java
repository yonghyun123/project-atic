package com.keb.atic.common.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class CommonController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome IndexPage");		
		return "index";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Locale locale, Model model) {
		log.info("Welcome AboutPage");		
		return "about";
	}
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String blog(Locale locale, Model model) {
		log.info("Welcome BlogPage");		
		return "blog";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Locale locale, Model model) {
		log.info("Welcome CartPage");		
		return "cart";
	}
	
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(Locale locale, Model model) {
		log.info("Welcome CheckoutPage");		
		return "checkout";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(Locale locale, Model model) {
		log.info("Welcome ContactPage");		
		return "contact";
	}
	
	@RequestMapping(value = "/portfolio", method = RequestMethod.GET)
	public String portfolio(Locale locale, Model model) {
		log.info("Welcome PortfolioPage");		
		return "portfolio";
	}
	
	@RequestMapping(value = "/shop-details", method = RequestMethod.GET)
	public String shopDetails(Locale locale, Model model) {
		log.info("Welcome Shop-DetailsPage");		
		return "shop-details";
	}
	
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String shop(Locale locale, Model model) {
		log.info("Welcome ShopPage");		
		return "shop";
	}
	
	@RequestMapping(value = "/single-portfolio", method = RequestMethod.GET)
	public String singlePortfolio(Locale locale, Model model) {
		log.info("Welcome Single-PortfolioPage");		
		return "single-portfolio";
	}
	
	@RequestMapping(value = "/single-post", method = RequestMethod.GET)
	public String singlePost(Locale locale, Model model) {
		log.info("Welcome Single-PostPage");		
		return "single-post";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String getAdminPage(Locale locale, Model model) {
		log.info("Welcome Admin-page");		
		return "admin/admin";
	}
	
}
