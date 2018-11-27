package com.keb.atic.userEval.mapper;

import java.util.List;
import java.util.Map;

import com.keb.atic.userEval.domain.UserEval;

/**사용자가 투자한 프로젝트를 관리하는 Mapper 
 * @author 권현우
 *
 */
public interface UserEvalMapper {
	//userEval 등록
	public void createUserEval(UserEval userEval);
	//개별 userEval 조회
	public UserEval readUserEval(String id);
	// 전체 userEval 조회
	public List<UserEval> userEvalListAll();
	// 사용자별 userEval 조회
	public List<UserEval> readUserEvalByUser(String userId);
	// 사업별 userEval 조회
	public List<UserEval> readUserEvalByProject(String projectId);
	//userEval 삭제(condition key : id or user_id or project_id)
	public void deleteUserEvalByCondition(Map<String, String> condition);
	//userEval 업데이트
	public void updateUserEval(UserEval userEval);
	//사업별 평균 userEval 조회
	public UserEval readUserEvalAvg(String product_id);
}
