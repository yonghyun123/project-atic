package com.keb.atic.project.service;

import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProjectServiceTest{
	@Inject
	private ProjectService service;

	//@Test
	public void testClass() {
		log.info(service.projectListAll());
		
	}
	
	//@Test
	public void testOrderByGoal() {
		log.info(service.readProjectsByGoal());
	}
	//@Test
	public void testNextProject() {
		GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
		int month = cal.get(GregorianCalendar.MONTH)+2;
		if(month >12) {
			month-=12;
		}
		Map<String, String>map = new HashMap<String, String>();
		map.put("month",String.valueOf(month) + "월" );
		map.put("count", "4");
		log.info(service.readMonthProjectByGoal(map));
	}
	
	@Test
	public void testByCondition() {
		GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
		int month = cal.get(GregorianCalendar.MONTH)+1;
		if(month >12) {
			month-=12;
		}
		Map<String, String>map = new HashMap<String, String>();
		map.put("month",String.valueOf(month) + "월" );
		map.put("condition", "eval");
		log.info(service.readProjectByCondition(map));
	}

}
