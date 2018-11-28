package com.keb.atic.common.mapper;


import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keb.atic.userStatus.domain.UserStatus;
import com.keb.atic.userStatus.mapper.UserStatusMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserStatusMapperTest {
	@Inject
	private UserStatusMapper userStatusMapper;
	

	
//	@Test
	public void testCreate() {
//		UserStatus userStatus = new UserStatus("test2","0.031","0.001","100000","10000");
//		userStatusMapper.createUserStatus(userStatus);
		log.info("생성완료!");
	}
	
//	@Test
	public void testListAll() {
		List<UserStatus> list = userStatusMapper.userStatusListByUser("test2");
		for (UserStatus user : list) {
			log.info(user);
		}
	}
	
//	@Test
	public void testRead() {
	}
	
}
