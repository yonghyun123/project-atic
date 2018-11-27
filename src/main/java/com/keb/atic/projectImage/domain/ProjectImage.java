package com.keb.atic.projectImage.domain;

import lombok.Data;

/**Project의 Image 정보를 담고 있는 Domain
 * @author 권현우
 *
 */
@Data
public class ProjectImage {
	//projectImage 식별자
	private String id;
	//projectImage type
	private String image_type;
	//해당 project id
	private String project_id;
	// file id
	private String file_info_id;
}
