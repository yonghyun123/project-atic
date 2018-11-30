package com.keb.atic.userReply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keb.atic.userReply.domain.UserReply;
import com.keb.atic.userReply.service.UserReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop")
@AllArgsConstructor
public class UserReplyController {
	@Inject
	private UserReplyService userReplyService;
	
	@GetMapping(value="/reply/{projectId}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody Map<String,Object> getReviewByid(@PathVariable("projectId") String projectId) throws Exception{
		List<UserReply> replyList = userReplyService.readUserReplyByProject(projectId);
		Map<String,Object> replyMap = new HashMap();
		replyMap.put("replyList", replyList);
		
		return replyMap;
	}
	
	
	@PostMapping(value="/reply/{projectId}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody Map<String,Object> createReviewById(@PathVariable("projectId") String projectId,
			@RequestBody Map<String, Object> reviewObj) throws Exception{
		
		UserReply userReply = new UserReply();
		log.info((String)reviewObj.get("content"));
		log.info((String)reviewObj.get("userId"));
		log.info((String)reviewObj.get("projectId"));
		userReply.setContent((String)reviewObj.get("content"));
		userReply.setUserId((String)reviewObj.get("userId"));
		userReply.setProjectId((String)reviewObj.get("projectId"));
		
		userReplyService.createUserReply(userReply);
		List<UserReply> replyList = userReplyService.readUserReplyByProject(projectId);
		
		Map<String,Object> replyMap = new HashMap();
		replyMap.put("replyList", replyList);
		
		return replyMap;
	}
}
