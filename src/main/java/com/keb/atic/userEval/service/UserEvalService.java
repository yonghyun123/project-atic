package com.keb.atic.userEval.service;

import java.util.List;

import com.keb.atic.userEval.domain.UserEval;
/**
 * UserEvalService (회원별 예비평가 관리)
 * @author 권현우
 *
 */
public interface UserEvalService {
	//userEval 등록
	public void createUserEval(UserEval userEval, String userEmail);
	//사업별 평균 userEval 조회
	public UserEval readUserEvalAvg(String product_id);
	//사업별 사용자 평균 userEvalList 조회
	public List<UserEval> readUserEvalAvgByUser(String product_id);
}
