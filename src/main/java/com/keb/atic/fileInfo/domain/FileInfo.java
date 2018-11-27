package com.keb.atic.fileInfo.domain;

import lombok.Data;

/**플랫폼에서 사용되는 file 정보를 가진 Domain
 * @author 권현우
 *
 */
@Data
public class FileInfo {
	//file 식별자
	private String id;
	//file 명
	private String file_name;
	//file 등록일자
	private String create_date;
}
