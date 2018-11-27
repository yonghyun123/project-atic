package com.keb.atic.project.mapper;

import javax.inject.Inject;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProjectMapperTests {
	@Inject
	private ProjectMapper projectMapper;
	
	//@Test
	public void testReadProject() {
		String id = "1";
		log.info(projectMapper.readProject(id));
	}
	//@Test
	public void testListAll() {
		log.info(projectMapper.projectListAll());
	}
	//@Test
	public void testSearchGoals() {
		log.info(projectMapper.readProjectsByEval());
	}
	//@Test
	public void testSearchPercents() {
		log.info(projectMapper.readProjectsByPercent());
	}
	//@Test
	public void testSearchEval() {
		log.info(projectMapper.readProjectsByEval());
	}
}
