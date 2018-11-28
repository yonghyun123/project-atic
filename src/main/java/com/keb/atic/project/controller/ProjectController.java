package com.keb.atic.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keb.atic.project.service.ProjectService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop")
@AllArgsConstructor
public class ProjectController {
	private ProjectService projectService;

	@GetMapping("")
	public String listAll( Model model) {
		log.info("list ");
		model.addAttribute("list", projectService.projectListAll());
		return "/shop" ;
	}
	
	@PostMapping("/search")
	public String listByConditon(@RequestParam("condition") String condition, RedirectAttributes rttr) {
		log.info("list by condition");
		log.info(condition);
		if(condition.equals("목표 금액 순")) {
			rttr.addFlashAttribute("list", projectService.readProjectsByGoal());
		} else if(condition.equals("달성률 순")) {
			rttr.addFlashAttribute("list", projectService.readProjectsByPercent());
		} else if(condition.equals("예비 평점 순")){
			rttr.addFlashAttribute("list", projectService.readProjectsByEval());
		}
		return null ;
	}
	
//	@GetMapping("/detail")
//	public String read(String id, Model model) {
//		log.info("detail :" + id);
//		model.addAttribute("list", projectService.readProject(id));
//		return "/shop-details";
//	}

}
