package com.keb.atic.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keb.atic.project.domain.Project;
import com.keb.atic.project.mapper.ProjectMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProjectServiceImpl implements ProjectService{
	@Setter(onMethod_ = { @Autowired })
	private ProjectMapper mapper;
	
	@Override
	public void createProject(Project project) {
		log.info("create.." + project);
		mapper.createProject(project);
	}

	@Override
	public Project readProject(String id) {
		log.info("readProject.." + id);
		return mapper.readProject(id);
	}

	@Override
	public List<Project> readProjectsByGoal() {
		log.info("list by Goal..  " );
		return mapper.readProjectsByGoal();
	}
	
	@Override
	public List<Project> readProjectsByPercent() {
		log.info("list by Percent..   " );
		return mapper.readProjectsByPercent();
	}
	
	@Override
	public List<Project> readProjectsByEval() {
		log.info("list by Percent..   " );
		return mapper.readProjectsByEval();
	}

	@Override
	public List<Project> projectListAll() {
		log.info("listAll시작");
		return mapper.projectListAll();
	}

	@Override
	public void deleteProject(String id) {
		log.info("delete : id= " + id);
		
	}

	@Override
	public void updateProject(Project project) {
		log.info("update : project = " + project);
	}
}
