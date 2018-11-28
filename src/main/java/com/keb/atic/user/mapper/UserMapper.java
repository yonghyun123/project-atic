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
	// 사용자 삭제
	public int deleteUser(String id);
	// 기존 은행 회원 유무 확인
	public BankUser certifyBankUser(String id);
	// 사용자 정보 업데이트
	public int updateUser(User user);
	// 닉네임 중복여부 확인을 위한 조회
	public int searchNickname(String nickname);
	// 가상계좌 생성
	public int updateUserVt(String nickname);
}
