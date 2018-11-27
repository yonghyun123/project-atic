package com.keb.atic.userReply.mapper;

import java.util.List;
import java.util.Map;

import com.keb.atic.userReply.domain.UserReply;

/**사용자가 투자한 프로젝트를 관리하는 Mapper 
 * @author 권현우
 *
 */
public interface UserReplyMapper {
	//userEval 등록
	public void createUserReply(UserReply userReply);
	// 전체 userEval 조회
	public List<UserReply> userReplyListAll();
	//개별 댓글 read
	public UserReply read (String id);
	// 사용자별 userEval 조회
	public List<UserReply> readUserReplyByUser(String userId);
	// 사업별 userEval 조회
	public List<UserReply> readUserReplyByProject(String projectId);
	//userReply 삭제(condition key 값 : user_id or project_id or id)
	public void deleteUserReplyByCondition(Map<String, String> condition);
	//userEval 업데이트
	public void updateUserReply(UserReply userReply);
}
