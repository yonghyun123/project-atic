package com.keb.atic.user.mapper;

import java.util.List;

import com.keb.atic.user.domain.BankUser;
import com.keb.atic.user.domain.User;

/**사용자 Mapper 
 * @author 권현우
 *
 */
public interface UserMapper {
	//사용자 등록
	public void createUser(User user);
	// 개인 사용자 조회
	public User readUser(String id);
	// 전체 사용자 조회
	public List<User> userListAll();
	//사용자 삭제
	public void deleteUser(String id);
	//기존 은행 회원 유무 확인
	public BankUser certifyBankUser(BankUser user);
	//사용자 정보 업데이트
	public void updateUser(User user);
}
