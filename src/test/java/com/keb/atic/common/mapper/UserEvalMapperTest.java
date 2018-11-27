package com.keb.atic.common.mapper;


import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keb.atic.userEval.domain.UserEval;
import com.keb.atic.userEval.mapper.UserEvalMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserEvalMapperTest {
	@Inject
	private UserEvalMapper userEvalMapper;
	

	
//	@Test
	public void testCreate() {
		UserEval userEval = new UserEval("test2", "10", "5", "5", "5", "5");
		userEvalMapper.createUserEval(userEval);
		log.info("생성완료!");
	}
	
//	@Test
	public void testListAll() {
		List<UserEval> list = userEvalMapper.userEvalListAll();
		for (UserEval userEval : list) {
			log.info(userEval);
		}
	}
	
//	@Test
	public void testreadUserEvalByProject() {
		List<UserEval> list = userEvalMapper.readUserEvalByProject("34");
		for (UserEval userEval : list) {
			log.info(userEval);
		}
	}
	@Test
	public void testRead() {
		UserEval userEval = userEvalMapper.readUserEvalAvg("34");
		log.info(userEval);
	}
	
//	@Test
	public void testReadId() {
		List<UserEval> list = userEvalMapper.readUserEvalByUser("test1");
		for (UserEval userEval : list) {
			log.info(userEval);
		}
		
	}
	
}
