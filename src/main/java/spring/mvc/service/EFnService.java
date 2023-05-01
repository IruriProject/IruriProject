package spring.mvc.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.mapper.EFnMapperInter;

@Service
public class EFnService {
	
	@Autowired
	EFnMapperInter mapper;
	
	public Map<String, Object> getPosting(String p_num) {
		return mapper.getPosting(p_num);
	};

}
