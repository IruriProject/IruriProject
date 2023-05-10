package spring.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dto.FrePhrasesDto;
import spring.mvc.mapper.FrePhrasesMapperInter;

@Service
public class FrePhrasesService {
	
	@Autowired
	FrePhrasesMapperInter mapper;
	
	public void insertPhrases(FrePhrasesDto dto) {
		mapper.insertPhrases(dto);
	}
	
	public List<FrePhrasesDto> phrasesList(String e_num){
		return mapper.phrasesList(e_num);
	}
	
	public void deletePhrase(String f_num) {
		mapper.deletePhrase(f_num);
	}
	
	public void updatePhrase(String f_num, String f_phrase) {
		Map<String, String> map=new HashMap<>();
		
		map.put("f_num", f_num);
		map.put("f_phrase", f_phrase);
		
		mapper.updatePhrase(map);
	}
	
	
}
