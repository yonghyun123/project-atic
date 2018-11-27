package com.keb.atic.userStatus.service;

import com.keb.atic.userStatus.domain.UserStatus;
/**
 * UserStatusService (회원별 투자금액 관리)
 * @author yonghyun
 *
 */
public interface UserStatusService {
	public UserStatus getMaxStatus(String userId);
}
