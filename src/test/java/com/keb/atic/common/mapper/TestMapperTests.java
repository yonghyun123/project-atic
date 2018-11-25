package com.keb.atic.common.mapper;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TestMapperTests {
	@Inject
	private TestMapper testMapper;
	
	@Test
	public void testGetTime() {
		log.info(testMapper.getClass().getName());
		log.info(testMapper.getTime());
		
	}
}
