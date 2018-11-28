package com.keb.atic.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
@SuppressWarnings("unchecked")
public class ProjectController {
	
	private ProjectService projectService;
	private UserProjectService userProjectService;

	@GetMapping("")
	public String listAll(Model model) {
		GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
		int thisMonth = cal.get(GregorianCalendar.MONTH)+1;
		int nextMonth = thisMonth +1;
		if(nextMonth >12) {
			nextMonth-=12;
		}
		String count = "3";
		Map<String, String>curMap = new HashMap<String,String>();
		curMap.put("month", String.valueOf(thisMonth)+"월");
		curMap.put("count", count);
		/**등록예정 프로젝트 리스트*/
		Map<String, String>preMap = new HashMap<String,String>();
		preMap.put("month", String.valueOf(nextMonth)+"월");
		preMap.put("count", count);
		
		model.addAttribute("curList",projectService.readMonthProjectByGoal(curMap));
		model.addAttribute("preList",projectService.readMonthProjectByGoal(preMap));
		model.addAttribute("count", projectService.projectListAll().size());
		return "/shop/shop";
	}
	
	@GetMapping("/currentShop")
	public void currentShop(Model model) {
		GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
		int thisMonth = cal.get(GregorianCalendar.MONTH)+1;
		int nextMonth = thisMonth +1;
		if(nextMonth >12) {
			nextMonth-=12;
		}
		Map<String, String>curMap = new HashMap<String,String>();
		curMap.put("month", String.valueOf(thisMonth)+"월");
		curMap.put("count", "10");
		model.addAttribute("curList",projectService.readMonthProjectByGoal(curMap));
	}
	
	@GetMapping("/preShop")
	public void preShop(Model model) {
		GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
		int thisMonth = cal.get(GregorianCalendar.MONTH)+1;
		int nextMonth = thisMonth +1;
		if(nextMonth >12) {
			nextMonth-=12;
		}
		Map<String, String>preMap = new HashMap<String,String>();
		preMap.put("month", String.valueOf(nextMonth)+"월");
		preMap.put("count", "20");
		model.addAttribute("preList",projectService.readMonthProjectByGoal(preMap));
	}
	
	/**프로젝트 검색*/
	@PostMapping("/search")
	public String listByConditon(@RequestParam("condition") String condition,@RequestParam("whichProject") String whichProject, HttpServletResponse response) {
		response.setContentType("applicaion/json; charset=utf-8");
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		List<Project> list = null;
		log.info("list by condition");
		log.info(whichProject);
		GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
		int thisMonth = cal.get(GregorianCalendar.MONTH)+1;
		int nextMonth = thisMonth +1;
		if(nextMonth >12) {
			nextMonth-=12;
		}
		Map<String, String>map = new HashMap<String,String>();
		if(condition != null) {
		map.put("condition", condition);
		}
		
		if(whichProject.equals("curProject")) {
			map.put("month", String.valueOf(thisMonth)+"월");

		}else {
			map.put("month", String.valueOf(nextMonth)+"월");
		}
			list = projectService.readProjectByCondition(map);
			
		for (Project project : list) {
			jsonObject = new JSONObject();
			jsonObject.put("id", project.getId());
			jsonObject.put("fileName", project.getFileName());
			jsonObject.put("name", project.getName());
			jsonObject.put("category", project.getCategory());
			jsonObject.put("goal", project.getGoal());
			jsonArray.add(jsonObject);
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println(jsonArray.toJSONString());

		return null;
	}

@GetMapping("/detail/{projectId}")
public String shopDetails(@PathVariable("projectId") String projectId , Model model) {
   log.info("detail :" + projectId);
   model.addAttribute("project",projectService.readProject(projectId));
   model.addAttribute("userProject", userProjectService.readUserProjectsByProject(projectId));
   model.addAttribute("countOfInvestor", userProjectService.countOfInvestor(projectId));
   return "/shop/shopDetails";
}

}
