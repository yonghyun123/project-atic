package com.keb.atic.userEval.service;

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
}
