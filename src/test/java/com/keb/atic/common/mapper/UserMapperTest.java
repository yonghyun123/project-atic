package com.keb.atic.common.mapper;


import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keb.atic.user.domain.User;
import com.keb.atic.user.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {
	@Inject
	private UserMapper userMapper;
	
//	@Test
	public void testCreate() {
		User user = new User("hee","1111","희지니","흐딘","test","1111-1111-2222","1111","9999-9999-9999","01058837760","0","10000");
		userMapper.createUser(user);
		log.info("성공");
	}
	
//	@Test
	public void testListAll() {
		List<User> list = userMapper.userListAll();
		for (User user : list) {
			log.info(user);
		}
	}
	
//	@Test
	public void testRead() {
		log.info(userMapper.readUser("test1"));
	}
	
}
