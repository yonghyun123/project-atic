package com.keb.atic.userReply.service;

import java.util.List;

import com.keb.atic.userReply.domain.UserReply;

public interface UserReplyService {
	public void createUserReply(UserReply userReply);
	// 사업별 userEval 조회
	public List<UserReply> readUserReplyByProject(String projectId);
}
