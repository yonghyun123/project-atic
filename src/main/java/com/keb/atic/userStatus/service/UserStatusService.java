package com.keb.atic.userStatus.service;

import java.util.List;

import com.keb.atic.userStatus.domain.UserStatus;
/**
 * UserStatusService (회원별 투자금액 관리)
 * @author yonghyun
 *
 */
public interface UserStatusService {
	//userStatus 등록
	public void createUserStatus(UserStatus userStatus);
	
	public UserStatus getMaxStatus(String userId);
	// 사용자 별 userStatus 조회
	public List<UserStatus> userStatusListByUser(String userId);
	//업데이트 해야할 이자율
	public List<UserStatus> calInterest(String userId);
	// 성공 project에 투자한 사람들 업데이트 해야 할 목록
	public List<UserStatus> updateListByMonth();
}
