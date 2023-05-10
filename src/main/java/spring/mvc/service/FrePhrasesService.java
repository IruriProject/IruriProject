package spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dto.FrePhrasesDto;
import spring.mvc.mapper.FrePhrasesMapperInter;

@Service
public class FrePhrasesService {
	
	@Autowired
	FrePhrasesMapperInter mapper;
	
	public void insertPrases(FrePhrasesDto dto) {
		mapper.insertPrases(dto);
	}
	
	public List<FrePhrasesDto> prasesList(String e_num){
		return mapper.prasesList(e_num);
	}
	
	
}
