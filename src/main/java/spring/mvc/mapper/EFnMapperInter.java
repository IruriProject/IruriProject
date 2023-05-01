package spring.mvc.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EFnMapperInter {
	
	public Map<String, Object> getPosting(String p_num);

}
