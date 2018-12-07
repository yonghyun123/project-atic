package com.keb.atic.userProject.mapper;

import java.util.List;
import java.util.Map;

import com.keb.atic.userProject.domain.UserProject;

/**사용자가 투자한 프로젝트를 관리하는 Mapper 
 * @author 권현우
 *
 */
public interface UserProjectMapper {
	//userProject 등록
	public void createUserProject(UserProject userProject);
	//개별 userProject 조회
	public UserProject readUserProject(String id);
	// 전체 userProject 조회
	public List<UserProject> userProjectListAll();
	// 회원별 userProject 조회
	public List<UserProject> readUserProjectsByUser(String userId);
	// 사업별 userProject 조회
	public List<UserProject> readUserProjectsByProject(String projectId);
	//userProject 삭제(condition key: id, user_id, project_id)
	public void deleteUserProjectByCondition(Map<String, String> condition);
	//userProject 업데이트
	public void updateUserProject(UserProject userProject);
	//project별 투자자 수
	public int countOfInvestor(String projectId);
	
	//기간별 투자 회사 리스트 검색
	public List<UserProject> getCompanyListByDate(Map<String,Object> dateObj);
	
	//기투자 방지하기 위한 체크 함수
	public int checkInvest(UserProject userProject);
	
	//오늘의 투자액 상승 순위
	public List<UserProject> riseProject();
	
	//투자액 100만원 이상인지 체크하는 함수
	public int checkDeposit(String userId);
}
