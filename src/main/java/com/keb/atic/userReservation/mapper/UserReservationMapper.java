package com.keb.atic.userReservation.mapper;

import java.util.List;

import com.keb.atic.userReservation.domain.UserReservation;

/**사용자가 예약한 프로젝트를 관리하는 Mapper 
 * @author 조희진
 *
 */
public interface UserReservationMapper {
	//userReservation 등록
	public void createReservation(UserReservation userReservation);
	// 이달에 예약한 userList
	public List<UserReservation> userList();
	// 각각의 유저가 예약한 프로젝트리스트
	public List<UserReservation> reservationList(String userId);
}
