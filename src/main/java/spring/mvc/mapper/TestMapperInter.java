package spring.mvc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import spring.mvc.dto.TestDto;

@Mapper
public interface TestMapperInter {
	
	public List<TestDto> selectData();
}
