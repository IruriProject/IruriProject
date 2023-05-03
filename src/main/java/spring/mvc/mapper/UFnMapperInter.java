package spring.mvc.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.ObjectProvider;

import spring.mvc.dto.UserDto;

@Mapper
public interface UFnMapperInter {
	public void updateUser(UserDto dto);
	public void updatePhoto(UserDto dto);
}
