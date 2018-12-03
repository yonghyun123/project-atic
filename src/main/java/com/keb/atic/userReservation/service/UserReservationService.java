package com.keb.atic.userReservation.service;

import java.util.List;

import com.keb.atic.userReservation.domain.UserReservation;
/**
 * UserReservationService (회원별 예약 관리)
 * @author 조희진
 *
 */
public interface UserReservationService {
		// 이달에 예약한 userList
		public List<UserReservation> userList();
		// 각각의 유저가 예약한 프로젝트리스트
		public List<UserReservation> reservationList(String userId);
}
