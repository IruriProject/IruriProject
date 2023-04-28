package spring.mvc.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapperInter {

	public int userIdPassCheck(Map<String, String> map);
}
