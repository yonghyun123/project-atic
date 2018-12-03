package com.keb.atic.userEval.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keb.atic.userEval.domain.UserEval;
import com.keb.atic.userEval.mapper.UserEvalMapper;
import com.keb.atic.userReservation.domain.UserReservation;
import com.keb.atic.userReservation.mapper.UserReservationMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserEvalServiceImpl implements UserEvalService {
	@Inject
	UserEvalMapper userEvalMapper;
	@Inject
	UserReservationMapper userReservationMapper;

	@Override
	public void createUserEval(UserEval userEval, String userEmail) {
		userEvalMapper.createUserEval(userEval);
		String userId = userEval.getUser_id();
		String projectId = userEval.getProject_id();
		UserReservation userRes = new UserReservation();
		userRes.setProjectId(projectId);
		userRes.setUserId(userId);
		userRes.setUserEmail(userEmail);
		userReservationMapper.createReservation(userRes);
	}

	@Override
	public UserEval readUserEvalAvg(String product_id) {
		// TODO Auto-generated method stub
		return userEvalMapper.readUserEvalAvg(product_id);
	}

	@Override
	public List<UserEval> readUserEvalAvgByUser(String product_id) {
		// TODO Auto-generated method stub
		return userEvalMapper.readUserEvalAvgByUser(product_id);
	}
}
