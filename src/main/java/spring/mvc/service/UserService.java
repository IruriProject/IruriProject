package spring.mvc.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.mapper.UserMapperInter;

@Service
public class UserService {
	
	@Autowired
	UserMapperInter mapper;

	public int userIdPassCheck(String u_id, String u_pw) {
		
		Map<String, String> map=new HashMap<>();
		
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);
		
		return mapper.userIdPassCheck(map);
	}
}
