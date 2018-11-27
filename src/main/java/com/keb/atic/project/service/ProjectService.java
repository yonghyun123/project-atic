package com.keb.atic.project.service;

import java.util.List;

import com.keb.atic.project.domain.Project;

public interface ProjectService {
	//프로젝트 등록
	public void createProject(Project project);
	// 단일 프로젝트 조회
	public Project readProject(String id);
	// 조건별 프로젝트 조회(condition key: 목표 금액 순)
	public List<Project> readProjectsByGoal();
	// 조건별 프로젝트 조회(condition key: 달성률 순)
	public List<Project> readProjectsByPercent();
	// 조건별 프로젝트 조회(condition key: 매력도 순)
	public List<Project> readProjectsByEval();
	// 전체 프로젝트 조회
	public List<Project> projectListAll();
	//프로젝트 삭제
	public void deleteProject(String id);
	//사용자 정보 업데이트
	public void updateProject(Project project);
}