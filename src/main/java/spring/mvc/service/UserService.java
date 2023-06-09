package spring.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dto.ApplicantDto;
import spring.mvc.dto.QnaDto;
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
	
	public int checkApply(String p_num,String u_num) {
		
		Map<String, String> map=new HashMap<>();
		map.put("p_num", p_num);
		map.put("u_num", u_num);		
		
		return mapper.checkApply(map);
	}
	
	public UserDto findUserByNum(String u_num) {
		return mapper.findUserByNum(u_num);
	}
	
	public UserDto findUserByEmail(String u_email) {
		return mapper.findUserByEmail(u_email);
	}
	
	public int userSearchEmail(String u_email) {
		return mapper.userSearchEmail(u_email);
	}
	
	public void updateKakaoInfo(String u_num) {
		mapper.updateKakaoInfo(u_num);
	}
	
	public int userSearchId(String u_id) {
		return mapper.userSearchId(u_id);
	}
	
	
	//회원관리
	
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}
	
	
	public List<UserDto> getAllUsers(int start, int perpage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map= new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);

		return mapper.getAllUsers(map);
	}	
	
	public void deleteUser(String u_num) {
		
		mapper.deleteUser(u_num);
	}
	
	public UserDto getDataByNum(String u_num) {
		
		return mapper.getDataByNum(u_num);
		
	}
}
