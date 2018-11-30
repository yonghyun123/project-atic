package com.keb.atic.common.controller;

import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.keb.atic.project.service.ProjectService;
import com.keb.atic.userProject.service.UserProjectService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@AllArgsConstructor
public class CommonController {
	private ProjectService projectService;
	private UserProjectService userProjectService;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
		int thisMonth = cal.get(GregorianCalendar.MONTH)+1;
		int nextMonth = thisMonth +1;
		if(nextMonth >12) {
			nextMonth-=12;
		}
		String count = "3";
		/**인기 프로젝트 리스트*/
		Map<String, String>hotMap = new HashMap<String,String>();
		hotMap.put("month", String.valueOf(thisMonth));
		hotMap.put("count", count);
		/**등록예정 프로젝트 리스트*/
		Map<String, String>nextMap = new HashMap<String,String>();
		nextMap.put("month", String.valueOf(nextMonth));
		nextMap.put("count", count);
		
		model.addAttribute("hotList",projectService.readMonthProjectByGoal(hotMap));
		model.addAttribute("nextList",projectService.readMonthProjectByGoal(nextMap));
		model.addAttribute("riseProject",userProjectService.riseProject());
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
	
	@RequestMapping(value="/preshop" , method = RequestMethod.GET)
	public String preShop(Locale locale, Model model) {
		log.info("Welcome preShop");		
		return "preShop";
	}
	
	@RequestMapping(value = "/shop-details", method = RequestMethod.GET)
	public String shopDetails(Locale locale, Model model) {
		log.info("Welcome Shop-DetailsPage");		
		return "shop-details";
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
