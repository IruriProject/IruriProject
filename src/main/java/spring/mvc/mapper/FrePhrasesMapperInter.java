package spring.mvc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import spring.mvc.dto.FrePhrasesDto;

@Mapper
public interface FrePhrasesMapperInter {
	
	public void insertPrases(FrePhrasesDto dto);
	
	public List<FrePhrasesDto> prasesList(String e_num);

}
