package com.keb.atic.fileInfo.mapper;

import java.util.List;
import java.util.Map;

import com.keb.atic.fileInfo.domain.FileInfo;
import com.keb.atic.projectImage.domain.ProjectImage;

/**FileInfo 관련 Mapper 
 * @author 권현우
 *
 */
public interface FileInfoMapper {
	//파일 등록
	public void registFile(FileInfo fileInfo);
	// file id 별 조회 	
	public FileInfo readFile(String id);
	// 전체 file 조회
	public List<FileInfo> fileListAll();
	// file 삭제 
	public void deleteFile(String id);
	// file 업데이트
	public void updateFile(FileInfo fileInfo);
}
