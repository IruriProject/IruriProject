package spring.mvc.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.ObjectProvider;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.ResumeDto;
import spring.mvc.dto.UserDto;

@Mapper
public interface UFnMapperInter {
	public void updateUser(UserDto dto);
	public void updatePhoto(Map<String, String> map);
	public int countLikeEnterprise(String num);
	public EnterpriseDto getEnterPrise(String num);
	public ResumeDto getResume(String u_num);
}
