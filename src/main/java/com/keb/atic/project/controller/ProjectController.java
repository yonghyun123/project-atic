package com.keb.atic.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keb.atic.project.domain.Project;
import com.keb.atic.project.service.ProjectService;
import com.keb.atic.userProject.service.UserProjectService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop")
@AllArgsConstructor
public class ProjectController {
	private ProjectService projectService;
	private UserProjectService userProjectService;

	@GetMapping("")
	public String listAll( Model model) {
		log.info("list ");
		model.addAttribute("list", projectService.projectListAll());
		model.addAttribute("count", projectService.projectListAll().size());
		return "/shop" ;
	}
	
	@PostMapping("/search")
		public String listByConditon(@RequestParam("condition") String condition, HttpServletResponse response) {
			response.setContentType("applicaion/json; charset=utf-8");
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = null;
			List<Project> list = null;
			log.info("list by condition");
			log.info(condition);
			if(condition.equals("1")) {
				list = projectService.readProjectsByGoal();
			} else if(condition.equals("2")) {
				list = projectService.readProjectsByPercent();
			} else if(condition.equals("3")){
				list = projectService.readProjectsByEval();
			} else {
				list = projectService.projectListAll();
			}
			for (Project project : list) {
				jsonObject = new JSONObject();
				jsonObject.put("id",project.getId());
				jsonObject.put("fileName",project.getFile_name());
				jsonObject.put("name",project.getName());
				jsonObject.put("category",project.getCategory());
				jsonObject.put("goal",project.getGoal());
				jsonArray.add(jsonObject);
			}
			PrintWriter out=null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.println(jsonArray.toJSONString());
			
			return null ;
	}
	
	   @GetMapping("/detail")
	   public String shopDetails(@RequestParam("project_id") String project_id , Model model) {
	      log.info("detail :" + project_id);
	      model.addAttribute("project",projectService.readProject(project_id));
	      model.addAttribute("userProject", userProjectService.readUserProjectsByProject(project_id));
	      return "shopDetails";
	   }

}
