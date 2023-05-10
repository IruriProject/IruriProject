package spring.mvc.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import spring.mvc.dto.ApplicantDto;
import spring.mvc.dto.UserDto;

@Mapper
public interface UserMapperInter {

	public int userIdPassCheck(Map<String, String> map);
	public UserDto findUserById(String u_id);
	public void joinUser(UserDto dto);
	public int getSearchId(String u_id);
	public void insertResume(ApplicantDto dto);
	public UserDto findUserByNum(String u_num);
}
