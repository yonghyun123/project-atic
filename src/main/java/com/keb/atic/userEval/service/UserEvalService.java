package com.keb.atic.userEval.service;

import com.keb.atic.userEval.domain.UserEval;
/**
 * UserEvalService (회원별 예비평가 관리)
 * @author 권현우
 *
 */
public interface UserEvalService {
	//userEval 등록
	public void createUserEval(UserEval userEval);
}
