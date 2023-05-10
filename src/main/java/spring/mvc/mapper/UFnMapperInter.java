package spring.mvc.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.ObjectProvider;

import spring.mvc.dto.BoardDto;
import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.ResumeDto;
import spring.mvc.dto.HeartDto;
import spring.mvc.dto.UserDto;
import spring.mvc.dto.ViewerDto;

@Mapper
public interface UFnMapperInter {
	public void updateUser(UserDto dto);
	public void updateUserNoAddr(UserDto dto);
	public void updatePw(Map<String, String> map);
	public void updatePhoto(Map<String, String> map);
	public int countLikeEnterprise(String num);
	public EnterpriseDto getEnterPrise(String num);
	public ResumeDto getResume(String u_num);
	public void insertLikeEnter(HeartDto dto);
	public void deleteLikeEnter(String num);
	public UserDto findUserByNum(String u_num);
	public void deleteUser(String u_num);
	public void insertResume(ResumeDto dto);
	public void updatePrivate(int r_num);
	public void updatePublic(int r_num);

	//열람
	public void insertViewer(ViewerDto dto);
	public int getSearchUnum(Map<String, String> map);
	public List<ResumeDto> getMyResume(String u_num);

	public ResumeDto getResumeOfRNum(String r_num);

}
