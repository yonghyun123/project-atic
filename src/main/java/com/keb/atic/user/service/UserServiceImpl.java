package com.keb.atic.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keb.atic.user.domain.BankUser;
import com.keb.atic.user.domain.User;
import com.keb.atic.user.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;

	@Override
	public void createUser(User user) throws Exception {
		log.info("유저 등록");
		userMapper.createUser(user);
	}

	@Override
	public User readUser(String id) throws Exception {
		log.info("유저 읽기");
		return userMapper.readUser(id);
	}

	@Override
	public void updateUser(User user) throws Exception {
		log.info("유저 수정");
		userMapper.updateUser(user);
	}

	@Override
	public void deleteUser(String userId) throws Exception {
		log.info("유저 삭제");
		userMapper.deleteUser(userId);
	}

	@Override
	public List<User> userListAll() throws Exception {
		log.info("유저 전체 리스트");
		return userMapper.userListAll();
	}

	@Override
	public BankUser certifyBankUser(String userId) throws Exception {
		log.info("유저 인증");
		return userMapper.certifyBankUser(userId);
	}
	
	
	
}