package com.keb.atic.userReservation.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keb.atic.userReservation.domain.UserReservation;
import com.keb.atic.userReservation.mapper.UserReservationMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserReservationServiceImpl implements UserReservationService{
	@Inject
	UserReservationMapper userReservationMapper;



	@Override
	public List<UserReservation> userList() {
		return userReservationMapper.userList();
	}

	@Override
	public List<UserReservation> reservationList(String userId) {
		return userReservationMapper.reservationList(userId);
	}
	
	
	
	

}
