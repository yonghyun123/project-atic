package com.keb.atic.userProject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keb.atic.project.domain.Project;
import com.keb.atic.userProject.domain.UserProject;
import com.keb.atic.userProject.mapper.UserProjectMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserProjectServiceImpl implements UserProjectService{
	@Setter(onMethod_ = { @Autowired })
	private UserProjectMapper userProjectMapper;

	@Override
	public void createUserProject(UserProject userProject) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<UserProject> readUserProjectsByProject(String projectId) {
		return userProjectMapper.readUserProjectsByProject(projectId);
	}

	@Override
	public int countOfInvestor(String projectId) {
		return userProjectMapper.countOfInvestor(projectId);
	}
	
	// 회원별 userProject 조회
	@Override
	public List<UserProject> readUserProjectsByUser(String userId){
		return userProjectMapper.readUserProjectsByUser(userId);
	}

	@Override
	public List<UserProject> getCompanyListByDate(Map<String, Object> dateObj) {
		return userProjectMapper.getCompanyListByDate(dateObj);
	}
	
	
}
