package com.keb.atic.projectImage.mapper;

import java.util.List;
import java.util.Map;

import com.keb.atic.projectImage.domain.ProjectImage;

/**ProjectImage 관련 Mapper 
 * @author 권현우
 *
 */
public interface ProjectImageMapper {
	//프로젝트 이미지 등록
	public void registProjectImage(ProjectImage projectImage);
	// projectImage type 별 조회 (project_id, image_type)	
	public ProjectImage readProjectImage(Map<String, String>map);
	// 전체 ProjectImage 조회
	public List<ProjectImage> projectImageListAll();
	// ProjectImage 삭제 (project_id, image_type)
	public void deleteProjectImage(Map<String, String>map);
	// ProjectImage 업데이트
	public void updateProjectImage(ProjectImage projectImage);
}
