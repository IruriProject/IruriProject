package spring.mvc.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.HeartDto;
import spring.mvc.dto.UserDto;
import spring.mvc.mapper.UFnMapperInter;

@Service
public class UFnService {

	@Autowired
	UFnMapperInter mapper;
	
	public void updateUser(UserDto dto) {
		mapper.updateUser(dto);
	}
	public void updatePhoto(String u_id, String u_photo) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		
		map.put("u_id", u_id);
		map.put("u_photo", u_photo);
		
		mapper.updatePhoto(map);
	}
	
	public int countLikeEnterprise(String num) {
		
		return mapper.countLikeEnterprise(num);
	}
	
	public EnterpriseDto getEnterPrise(String num) {
		
		
		return mapper.getEnterPrise(num);
	}
	
}
