package spring.mvc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import spring.mvc.dto.TestDto;

@Mapper
public interface TestMapperInter {
	
	public List<TestDto> selectData();
	
}
