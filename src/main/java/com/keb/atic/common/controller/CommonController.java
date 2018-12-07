package com.keb.atic.common.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String home(Locale locale, Model model, HttpServletRequest request) {
		
		int thisMonth = 11;
		int nextMonth = thisMonth + 1;
		
		Date date = new Date();
		SimpleDateFormat hour = new SimpleDateFormat("hh");
		SimpleDateFormat minute = new SimpleDateFormat("mm");
			
		if (Integer.parseInt(minute.format(date)) >= 10 && Integer.parseInt(hour.format(date)) == 8) {
			thisMonth = 0;
		}
		String count = "3";
		String thisMonthString = null;
		
		thisMonthString = String.valueOf(thisMonth);
		/**인기 프로젝트 리스트*/
		Map<String, String>hotMap = new HashMap<String,String>();
		
		hotMap.put("month",thisMonthString);
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
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String getAdminPage(Locale locale, Model model, HttpServletRequest request) {
		if(request.getAttribute("loginId").equals("admin")) {
			return "admin/admin";
		} else {
			return "index";
		}
		
	}
	
	@RequestMapping(value = "/loan", method = RequestMethod.GET)
	public String getLoanPage(Locale locale, Model model) {
		log.info("Welcome loan-main");
		Date date = new Date();
		SimpleDateFormat hour = new SimpleDateFormat("hh");
		SimpleDateFormat minute = new SimpleDateFormat("mm");
		int thisMonth = 11;
		if (Integer.parseInt(minute.format(date)) >= 10 && Integer.parseInt(hour.format(date)) == 8) {
			thisMonth ++;
		}
		String count = "10";
		Map<String, String>hotMap = new HashMap<String,String>();
		hotMap.put("month",String.valueOf(thisMonth));
		hotMap.put("count", count);
		model.addAttribute("successProjectList",projectService.readMonthProjectByGoal(hotMap));
		return "loan/main";
	}
	
	
}
