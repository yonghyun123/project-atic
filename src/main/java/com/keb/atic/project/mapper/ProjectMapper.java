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
	// 조건별 프로젝트 조회(condition key:category_id or goal_flag or regDate)
	public List<Project> readProjectsByCondition(Map<String, String> condition);
	// 전체 프로젝트 조회
	public List<Project> projectListAll();
	//프로젝트 삭제
	public void deleteProject(String id);
	//사용자 정보 업데이트
	public void updateProject(Project project);
}
