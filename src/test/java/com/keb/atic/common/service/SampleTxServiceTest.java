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
public class SampleTxServiceTest{
	@Inject
	private SampleTxService service;

	//@Test
	public void testClass() {
		log.info(service);
		log.info(service.getClass().getName());
		
	}
	
	@Test
	public void testLong() {
		String str = "Starry\r\n"+
				"Starry night\r\n" +
				"Paint your palette blue and grey\r\n"+
				"Look out a summer's day";
		log.info(str.getBytes().length);
		service.addData(str);
				
	}
}
