package com.keb.atic.userProject.service;

import java.util.List;
import java.util.Map;

import com.keb.atic.userProject.domain.UserProject;

public interface UserProjectService {
	// userProject 등록
	public void createUserProject(UserProject userProject);

	// 사업별 userProject 조회
	public List<UserProject> readUserProjectsByProject(String projectId);

	// project별 투자자 수
	public int countOfInvestor(String projectId);

	// 회원별 userProject 조회
	public List<UserProject> readUserProjectsByUser(String userId);

	// 기간별 투자한 회서 조회
	public List<UserProject> getCompanyListByDate(Map<String, Object> dateObj);

	// 기투자 방지하기 위한 체크 함수
	public int checkInvest(UserProject userProject);
}
