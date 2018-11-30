package com.keb.atic.userReply.domain;

import lombok.Data;

/**프로젝트 상세 페이지 댓글 Domain
 * @author 권현우
 *
 */
@Data
public class UserReply {
	//댓글 고유 식별자
	private String id;
	//사용자 Id
	private String userId;
	//profile
	private String profile;
	//댓글 프로젝트 식별자
	private String projectId;
	//댓글 내용
	private String content;
	//댓글 생성일자
	private String regDate;
}
