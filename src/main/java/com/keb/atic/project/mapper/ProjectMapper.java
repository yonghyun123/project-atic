package com.keb.atic.project.mapper;

import java.util.List;
import java.util.Map;

import com.keb.atic.project.domain.Project;

/**Project 관련 Mapper 
 * @author 권현우
 *
 */
public interface ProjectMapper {
	//프로젝트 등록
	public void createProject(Project project);
	// 단일 프로젝트 조회
	public Project readProject(String id);
	// 조건별 프로젝트 조회(condition key: 목표 금액 순)
	public List<Project> readProjectsByGoal();
	// 조건별  등록 예정 프로젝트 조회(condition key: 목표 금액 순);
	public List<Project> readMonthProjectByGoal(Map<String, String> map);
	// 조건별 프로젝트 조회(condition key: 달성률 순)
	public List<Project> readProjectsByPercent();
	// 조건별 프로젝트 조회(condition key: 매력도 순)
	public List<Project> readProjectsByEval();
	// 전체 프로젝트 조회
	public List<Project> projectListAll();
	// 조건부 프로젝트 조회
	public List<Project> readProjectByCondition(Map<String, String> map);
	//프로젝트 삭제
	public void deleteProject(String id);
	//사용자 정보 업데이트
	public void updateProject(Project project);
}
