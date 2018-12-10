package com.keb.atic.userStatus.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keb.atic.userStatus.domain.UserStatus;
import com.keb.atic.userStatus.mapper.UserStatusMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserStatusServiceImpl implements UserStatusService {
	@Inject
	UserStatusMapper userStatusMapper;
	
	@Override
	public UserStatus getMaxStatus(String userId) {
		return userStatusMapper.getMaxStatus(userId);
	}

	@Override
	public List<UserStatus> userStatusListByUser(String userId) {
		return userStatusMapper.userStatusListByUser(userId);
	}

	@Override
	public List<UserStatus> updateListByMonth(String month) {
		return userStatusMapper.updateListByMonth(month);
	}

	@Override
	public List<UserStatus> calInterest(String userId) {
		return userStatusMapper.calInterest(userId);
	}

	@Override
	public void createUserStatus(UserStatus userStatus) {
		userStatusMapper.createUserStatus(userStatus);
	}

	@Override
	public List<UserStatus> leftListByMonth(String month) {
		return userStatusMapper.leftListByMonth(month);
	}

}
