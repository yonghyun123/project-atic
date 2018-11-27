package com.keb.atic.project.domain;

import lombok.Data;

/** Project의 정보를 담는 Domain
 * @author 권현우
 *
 */
@Data
public class Project {
	//project 식별자
	private String id;
	//project 사업아이템
	private String name;
	//project 타이틀
	private String title;
	//project 세부 설명
	private String description;
	//project 목표 모금액
	private String goal;
	//project 현재 모금액
	private String cur_price;
	// project 기업 홈페이지
	private String homepage;
	// project 기업 전화번호
	private String tel;
	//project 기업명 
	private String company;
	//project 최대 이율
	private String interest;
	//project 등록 일자
	private String create_date;
	//project 목표 모금 달성 여부
	private String goal_flag;
	//project 카테고리 식별자
	private String category_id;
	//project 카테고리 이름
	private String category;
	//project 이미지 이름
	private String file_name;
	//project 이미지 타입
}
