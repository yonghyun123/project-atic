package com.keb.atic.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keb.atic.project.service.ProjectService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop")
@AllArgsConstructor
public class ProjectController {
	private ProjectService service;

	@GetMapping("")
	public String listAll( Model model) {
		log.info("list ");
		model.addAttribute("list", service.projectListAll());
		return "/shop" ;
	}
	
	@PostMapping("/search")
	public String listByConditon(String condition, RedirectAttributes rttr) {
		log.info("list ");
		if(condition.equals("목표 금액 순")) {
			rttr.addFlashAttribute("list", service.readProjectsByGoal());
		} else if(condition.equals("달성률 순")) {
			rttr.addFlashAttribute("list", service.readProjectsByPercent());
		} else {
			rttr.addFlashAttribute("list", service.readProjectsByEval());
		}
		return "redirect:/shop" ;
	}
	
//	@GetMapping("/detail")
//	public String read(String id, Model model) {
//		log.info("detail :" + id);
//		model.addAttribute("list", service.readProject(id));
//		return "/shop-details";
//	}

}
