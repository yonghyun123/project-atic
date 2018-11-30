package com.keb.atic.userReply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keb.atic.userReply.domain.UserReply;
import com.keb.atic.userReply.mapper.UserReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class UserReplyServiceImpl implements UserReplyService {	
	@Inject
	private UserReplyMapper userReplyMapper;

	@Override
	public void createUserReply(UserReply userReply) {
		userReplyMapper.createUserReply(userReply);
	}

	@Override
	public List<UserReply> readUserReplyByProject(String projectId) {
		return userReplyMapper.readUserReplyByProject(projectId);
	}

}
