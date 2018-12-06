package com.keb.atic.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keb.atic.project.domain.Project;
import com.keb.atic.project.service.ProjectService;
import com.keb.atic.user.domain.User;
import com.keb.atic.user.service.UserService;
import com.keb.atic.userEval.domain.UserEval;
import com.keb.atic.userEval.service.UserEvalService;
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
	private UserEvalService userEvalService;
	@Inject
	private UserService userService;

	@GetMapping("")
	public String listAll(Model model) {
		Map<String, String> curMap = new HashMap<String, String>();
		Map<String, String> preMap = new HashMap<String, String>();
		
		int thisMonth = 11;
		int nextMonth = thisMonth + 1;
		
		Date date = new Date();
		SimpleDateFormat hour = new SimpleDateFormat("hh");
		SimpleDateFormat minute = new SimpleDateFormat("mm");
		if (Integer.parseInt(minute.format(date)) >= 10 && Integer.parseInt(hour.format(date)) == 8) {
				model.addAttribute("finishList", projectService.readFinishProject("2018" + String.valueOf(thisMonth+1)));
				thisMonth = 0;
		} else {
			model.addAttribute("finishList", projectService.readFinishProject("2018" + String.valueOf(thisMonth)));
		}
			curMap.put("month", String.valueOf(thisMonth));
			preMap.put("month", String.valueOf(nextMonth));

		String count = "3";
		curMap.put("count", count);
		/** 등록예정 프로젝트 리스트 */
		preMap.put("count", count);

		model.addAttribute("curList", projectService.readMonthProjectByGoal(curMap));
		model.addAttribute("preList", projectService.readMonthProjectByGoal(preMap));
		model.addAttribute("count", projectService.projectListAll().size());
		return "/shop/shop";
	}

	@GetMapping("/currentShop")
	public void currentShop(Model model) {
		Map<String, String> curMap = new HashMap<String, String>();
		
		int thisMonth = 11;
		
		Date date = new Date();
		SimpleDateFormat hour = new SimpleDateFormat("hh");
		SimpleDateFormat minute = new SimpleDateFormat("mm");
		
		if (Integer.parseInt(minute.format(date)) >= 10 && Integer.parseInt(hour.format(date)) == 8) {
				thisMonth = 0;
		}
		curMap.put("month", String.valueOf(thisMonth));
		curMap.put("condition", "goal");
		model.addAttribute("curList", projectService.readProjectByCondition(curMap));
	}

	@GetMapping("/preShop")
	public void preShop(Model model) {
		Map<String, String> preMap = new HashMap<String, String>();
		int nextMonth = 12;
		preMap.put("month", String.valueOf(nextMonth));
		preMap.put("count", "20");
		model.addAttribute("preList", projectService.readMonthProjectByGoal(preMap));
	}

	@GetMapping("/finishShop")
	public void finishShop(Model model) {
		log.info("종료 펀딩 리스트");
		int thisMonth = 11;
		Date date = new Date();
		SimpleDateFormat hour = new SimpleDateFormat("hh");
		SimpleDateFormat minute = new SimpleDateFormat("mm");
		if (Integer.parseInt(minute.format(date)) >= 10 && Integer.parseInt(hour.format(date)) == 8) {
				model.addAttribute("finishList", projectService.readFinishProject("2018" + String.valueOf(thisMonth+1)));
		} else {
			model.addAttribute("finishList", projectService.readFinishProject("2018" + String.valueOf(thisMonth)));
		}
	}

	/** 프로젝트 검색 */
	@PostMapping("/search")
	public String listByConditon(@RequestParam("condition") String condition,
			@RequestParam("whichProject") String whichProject, HttpServletResponse response) {
		response.setContentType("applicaion/json; charset=utf-8");
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		List<Project> list = null;
		log.info("list by condition");
		log.info(whichProject);
		Map<String, String> map = new HashMap<String, String>();

		int thisMonth = 11;
		
		if (condition != null) {
			map.put("condition", condition);
		}

		if (whichProject.equals("curProject")) {
				map.put("month", String.valueOf(thisMonth));

		} 
		list = projectService.readProjectByCondition(map);

		for (Project project : list) {
			jsonObject = new JSONObject();
			jsonObject.put("id", project.getId());
			jsonObject.put("fileName", project.getFileName());
			jsonObject.put("name", project.getName());
			jsonObject.put("category", project.getCategory());
			jsonObject.put("goal", project.getGoal());
			jsonObject.put("progress", project.getProgress());
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
	public String shopDetails(@PathVariable("projectId") String projectId, Model model) {
		log.info("detail :" + projectId);
		model.addAttribute("project", projectService.readProject(projectId));
		model.addAttribute("userProject", userProjectService.readUserProjectsByProject(projectId));
		model.addAttribute("countOfInvestor", userProjectService.countOfInvestor(projectId));
		model.addAttribute("recommend", projectService.recommendProject(projectId));
		model.addAttribute("succRate", projectService.getSuccessCagetory(projectId));
		return "/shop/shopDetails";
	}

// 등록 예정프로젝트 상세
	@GetMapping("/detail/pre/{projectId}")
	public String shopPreDetails(@PathVariable("projectId") String projectId, Model model) {
		int nextMonth = 12;
		
		Map<String, String> preMap = new HashMap<String, String>();
		preMap.put("month", String.valueOf(nextMonth));
		preMap.put("count", "20");
		List<Project> list = projectService.readMonthProjectByGoal(preMap);
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getId().equals(projectId)) {
				list.remove(i);
			}
		}
		model.addAttribute("preList", list);
		model.addAttribute("project", projectService.readProject(projectId));
		model.addAttribute("userProject", userProjectService.readUserProjectsByProject(projectId));
		model.addAttribute("countOfInvestor", userProjectService.countOfInvestor(projectId));
		return "/shop/preShopDetails";
	}

//등록 예정 프로젝트 평가
	@PostMapping("/preEval/{projectId}/{loginId}")
	public String userEvaluate(@PathVariable("loginId") String loginId, @PathVariable("projectId") String projectId,
			@RequestParam("profit") String profit, @RequestParam("stable") String stable,
			@RequestParam("potential") String potential, @RequestParam("favor") String favor,
			@RequestParam("EmailAddress") String userEmail) {
		UserEval userEval = new UserEval(loginId, projectId, stable, profit, favor, potential);
		userEvalService.createUserEval(userEval, userEmail);
		return "redirect:/shop/detail/pre/" + projectId;
	}

//등록 예정 프로젝트 평점
	@GetMapping("/preEval/graph/{projectId}")
	public void getEvalPoint(@PathVariable("projectId") String projectId, HttpServletResponse response) {
		response.setContentType("applicaion/json; charset=utf-8");
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = null;
		UserEval userEval = userEvalService.readUserEvalAvg(projectId);
		if (userEval != null) {
			jsonObject = new JSONObject();
			jsonObject.put("id", userEval.getId());
			jsonObject.put("Favor", userEval.getFavor_grade());
			jsonObject.put("Growth", userEval.getGrowth_grade());
			jsonObject.put("Market", userEval.getMarket_grade());
			jsonObject.put("Stable", userEval.getStable_grade());
			jsonObject.put("Total", userEval.getTotal_avg());
		} else {
			jsonObject = new JSONObject();
			jsonObject.put("id", projectId);
			jsonObject.put("Favor", 0);
			jsonObject.put("Growth", 0);
			jsonObject.put("Market", 0);
			jsonObject.put("Stable", 0);
			jsonObject.put("Total", 0);
		}

		jsonArray.add(jsonObject);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println(jsonObject.toJSONString());
	}

	@GetMapping(value = "/preEval/eval/{projectId}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody Map<String, Object> getUserEval(@PathVariable("projectId") String projectId) throws Exception {
		List<UserEval> evalList = userEvalService.readUserEvalAvgByUser(projectId);
		Map<String, Object> evalMap = new HashMap<>();
		for (UserEval userEval : evalList) {
			log.info(userEval);
		}
		evalMap.put("userEvalList", evalList);
		return evalMap;
	}

	@PostMapping(value = "/check/{userId}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody Map<String, Object> checkPasswd(@PathVariable("userId") String userId,
			@RequestBody Map<String, Object> passwdObj) throws Exception {

		Map<String, Object> returnMap = new HashMap<>();
		log.info(passwdObj.get("passwd"));
		User user = userService.readUser(userId);
		if (user.getAcc_pw().equals((String) passwdObj.get("passwd"))) {
			returnMap.put("result", "true");
		} else {
			returnMap.put("result", "false");
		}
		return returnMap;
	}
}
