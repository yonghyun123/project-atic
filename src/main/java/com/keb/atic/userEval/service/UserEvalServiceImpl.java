package com.keb.atic.userEval.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keb.atic.userEval.domain.UserEval;
import com.keb.atic.userEval.mapper.UserEvalMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserEvalServiceImpl implements UserEvalService {
	@Inject
	UserEvalMapper userEvalMapper;

	@Override
	public void createUserEval(UserEval userEval) {
		userEvalMapper.createUserEval(userEval);
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
