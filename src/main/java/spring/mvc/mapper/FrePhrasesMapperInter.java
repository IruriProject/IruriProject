package spring.mvc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import spring.mvc.dto.FrePhrasesDto;

@Mapper
public interface FrePhrasesMapperInter {
	
	public void insertPhrases(FrePhrasesDto dto);
	
	public List<FrePhrasesDto> phrasesList(String e_num);
	
	public void deletePhrase(String f_num);
	
	public void updatePhrase(Map<String, String> map);
	
	public FrePhrasesDto getPhrase(String f_num);
	
	public int duplicatePhrase(Map<String, String> map);

}
