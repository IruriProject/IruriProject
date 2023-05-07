package spring.mvc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dto.TestDto;
import spring.mvc.mapper.TestMapperInter;

@Service
public class TestService {
	
	@Autowired
	TestMapperInter inter;

	public List<TestDto> selectData(){
		
		List<TestDto> list=inter.selectData();
		
		return list;
	}
	
	public List<Map<String, Object>> applicantByPosting(String p_num){
		return inter.applicantByPosting(p_num);
	}
}
