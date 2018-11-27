package com.keb.atic.user.service;

import java.util.List;

import com.keb.atic.user.domain.BankUser;
import com.keb.atic.user.domain.User;

/**고객의 요구사항을 반영한 도메인별(개발하고자 하는 업무영역)별 비즈니스 메소드 선언
 * 복잡한 트랜잭션 처리나 예외처리 등 
 * @author 권현우
 *
 */
public interface UserService {
	
	/* 회원 가입시 회원 생성*/
	public void createUser(User user) throws Exception;
	
	/* id를 이용한 회원 조회 */
	public User readUser(String id) throws Exception;

	/* 회원 정보 수정 */
	public void updateUser(User user) throws Exception;

	/* 회원 정보 삭제 */
	public void deleteUser(String userId) throws Exception;
	
	/* 회원 리스트 전체 조회 */
	public List<User> userListAll() throws Exception;
	
	/* 로그인 시 id와 비밀번호를 통한 회원 조회 */
	public BankUser certifyBankUser(String userId) throws Exception;
	
}