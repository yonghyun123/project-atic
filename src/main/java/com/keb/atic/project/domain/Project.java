package com.keb.atic.project.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/** Project의 정보를 담는 Domain
 * @author 권현우
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
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
	private String curPrice;
	// project 기업 홈페이지
	private String homepage;
	// project 기업 전화번호
	private String tel;
	//project 기업명 
	private String company;
	//project 최대 이율
	private String interest;
	//project 등록 일자
	private String createDate;
	//project 목표 모금 달성 여부
	private String goalFlag;
	//project 카테고리 식별자
	private String categoryId;
	//project 카테고리 이름
	private String category;
	//project 이미지 이름
	private String fileName;
	//project 목표율
	private String progress;
	//projcet 달성여부
	private String finish;
	public Project(String id, String curPrice) {
		super();
		this.id = id;
		this.curPrice = curPrice;
	}
	
	
	
}
