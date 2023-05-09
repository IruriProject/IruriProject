package spring.mvc.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dto.ApplicantDto;
import spring.mvc.dto.UserDto;
import spring.mvc.mapper.UserMapperInter;

@Service
public class UserService {
	
	@Autowired
	UserMapperInter mapper;

	//로그인
	public int userIdPassCheck(String u_id, String u_pw) {
		
		Map<String, String> map=new HashMap<>();
		
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);
		
		return mapper.userIdPassCheck(map);
	}
	
	//id로 유저정보 찾기
	public UserDto findUserdataById(String u_id) {
		return mapper.findUserById(u_id);
	}
	
	//회원가입
	public void joinUser(UserDto dto) {
		mapper.joinUser(dto);
	}

	//id 중복확인
	public int getSearchId(String u_id) {
		return mapper.getSearchId(u_id);
	}
	
	public void insertResume(ApplicantDto dto) {
		mapper.insertResume(dto);
	}
	
	public UserDto findUserByNum(String u_num) {
		return mapper.findUserByNum(u_num);
	}

}
