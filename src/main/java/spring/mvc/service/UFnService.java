package spring.mvc.service;

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
	
	public void updatePhoto(UserDto dto) {
		mapper.updatePhoto(dto);
	}
	
	public int countLikeEnterprise(String num) {
		
		return mapper.countLikeEnterprise(num);
	}
	
	public EnterpriseDto getEnterPrise(String num) {
		
		
		return mapper.getEnterPrise(num);
	}
	
}
