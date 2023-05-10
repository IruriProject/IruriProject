package spring.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.HeartDto;
import spring.mvc.dto.ResumeDto;
import spring.mvc.dto.UserDto;
import spring.mvc.dto.ViewerDto;
import spring.mvc.mapper.UFnMapperInter;

@Service
public class UFnService {

	@Autowired
	UFnMapperInter mapper;

	public void updateUser(UserDto dto) {
		mapper.updateUser(dto);
	}

	public void updateUserNoAddr(UserDto dto) {
		mapper.updateUserNoAddr(dto);
	}

	public void updatePw(String u_id, String u_pw) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();

		map.put("u_id", u_id);
		map.put("u_pw", u_pw);

		mapper.updatePw(map);
	}
	
	public void updatePrivate(int r_num) {
		mapper.updatePrivate(r_num);
	}
	
	public void updatePublic(int r_num) {
		mapper.updatePublic(r_num);
	}

	public void updatePhoto(String u_id, String u_photo) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();

		map.put("u_id", u_id);
		map.put("u_photo", u_photo);

		mapper.updatePhoto(map);
	}
	
	public void insertResume(ResumeDto dto) {
		mapper.insertResume(dto);
	}

	public int countLikeEnterprise(String num) {

		return mapper.countLikeEnterprise(num);
	}

	public EnterpriseDto getEnterPrise(String num) {

		return mapper.getEnterPrise(num);
	}

	// num으로 이력서 찾기
	public ResumeDto getResume(String u_num) {
		return mapper.getResume(u_num);
	}
	

	// num으로 유저정보 찾기
	public UserDto findUserdataByNum(String u_num) {
		return mapper.findUserByNum(u_num);
	}

	// 회원삭제
	public void deleteUser(String u_num) {
		mapper.deleteUser(u_num);
	}

	// 좋아요 한 회원과 기업 데이터 추가
	public void insertlikeEnter(HeartDto dto) {

		mapper.insertLikeEnter(dto);
	}

	// 좋아요 한 회원과 기업 데이터 삭제
	public void deleteLikeEnter(String num) {

		mapper.deleteLikeEnter(num);
	}
	
	//열람
	public void insertViewer(ViewerDto dto) {
		mapper.insertViewer(dto);
	}
  
	public int getSearchUnum(String u_num, String p_num) {
		Map<String, String> map=new HashMap<>();
		
		map.put("u_num", u_num);
		map.put("p_num", p_num);
		
		return mapper.getSearchUnum(map);
	}
	public List<ResumeDto> getMyResume(String u_num){
		return mapper.getMyResume(u_num);
	}

	public ResumeDto getResumeOfRNum(String r_num) {
		return mapper.getResumeOfRNum(r_num);
	}
}
