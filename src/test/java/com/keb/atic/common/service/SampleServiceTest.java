package com.keb.atic.common.service;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SampleServiceTest{
	@Inject
	private SampleService service;

	//@Test
	public void testClass() {
		log.info(service);
		log.info(service.getClass().getName());
		
	}
	
	@Test
	public void testAdd() {
		try {
			log.info(service.doAdd("123", "456"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
