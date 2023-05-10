package spring.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dto.ApplicantDto;
import spring.mvc.dto.EnterpriseDto;
import spring.mvc.mapper.EnterpriseMapperInter;

@Service
public class EnterpriseService {
	
	@Autowired
	EnterpriseMapperInter mapper;

	public int enterIdPassCheck(String e_id, String e_pw) {
		
		Map<String, String> map=new HashMap<>();
		
		map.put("e_id", e_id);
		map.put("e_pw", e_pw);
		
		return mapper.EnterIdPassCheck(map);
	}
	
	public EnterpriseDto findEnterdataById(String e_id) {
		return mapper.findEnterById(e_id);
	}
	
	public void joinEnterprise(EnterpriseDto dto) {
		mapper.joinEnterprise(dto);
	}
	
	public void withdrawEnterprise(String e_num,String e_pw) {
		Map<String, String> map=new HashMap<>();
		map.put("e_num", e_num);
		map.put("e_pw", e_pw);
		
		mapper.withdrawEnterprise(map);
	}
	
	public void updateResAccessStatus(String e_name, String e_res_access) {
		
		Map<String, String> map=new HashMap<>();
		map.put("e_name", e_name);
		map.put("e_res_access", e_res_access);
		
		mapper.updateResAccessStatus(map);
	}
	
	public List<ApplicantDto> getAllResumeOfEnter(String e_num){
		return mapper.getApplicantsByEnterprise(e_num);
  }  
	public int heartByEnter(String e_num) {
		return mapper.heartByEnter(e_num);
	}
}
