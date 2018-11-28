package com.keb.atic.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.keb.atic.project.domain.Project;
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
		JsonArray jsonArray = new JsonArray();
		JsonObject jsonObject = null;
		List<Project> list = null;
		list = projectService.projectListAll();
		for (Project project : list) {
			jsonObject = new JsonObject();
			jsonObject.put(,project.get)
		}
		
		model.addAttribute("count", projectService.projectListAll().size());
		return "/shop" ;
	}
	
	@PostMapping("/search")
	public String listByConditon(@RequestParam("condition") String condition, RedirectAttributes rttr) {
		log.info("list by condition");
		log.info(condition);
		if(condition.equals("1")) {
			rttr.addFlashAttribute("list", projectService.readProjectsByGoal());
			rttr.addFlashAttribute("count", projectService.readProjectsByGoal().size());
		} else if(condition.equals("2")) {
			rttr.addFlashAttribute("list", projectService.readProjectsByPercent());
			rttr.addFlashAttribute("count", projectService.readProjectsByPercent().size());
		} else if(condition.equals("3")){
			rttr.addFlashAttribute("list", projectService.readProjectsByEval());
			rttr.addFlashAttribute("count", projectService.readProjectsByEval().size());
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
