package com.keb.atic.userStatus.mapper;

import java.util.List;

import com.keb.atic.userStatus.domain.UserStatus;

/**사용자가 투자내역 Mapper 
 * @author 권현우
 *
 */
public interface UserStatusMapper {
	//userStatus 등록
	public void createUserStatus(UserStatus userStatus);
	//개별 userStatus 읽기
	public UserStatus readUserStatus(String id);
	// 사용자 별 userStatus 조회
	public List<UserStatus> userStatusListByUser();
	//사용자 별 userStatus 삭제
	public void deleteUserStatus(String user_id);
	//userStatus 업데이트
	public void updateUserStatus(UserStatus userStatus);
}
