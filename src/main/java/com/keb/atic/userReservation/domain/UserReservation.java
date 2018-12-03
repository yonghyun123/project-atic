package com.keb.atic.userReservation.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**프로젝트 알림 Domain
 * @author 조희진
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserReservation {
	//예약 고유 id
	private String id;
	//사용자 Id
	private String userId;
	//project Id
	private String projectId;
	//이메일
	private String userEmail;
	//예약 일자
	private String createDate;
	//프로젝트 이름
	private String projectName;
}
