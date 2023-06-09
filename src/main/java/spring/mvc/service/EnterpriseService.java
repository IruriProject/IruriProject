package spring.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dto.ApplicantDto;
import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.UserDto;
import spring.mvc.mapper.EnterpriseMapperInter;

@Service
public class EnterpriseService {
	
	@Autowired
	EnterpriseMapperInter mapper;
	
	public EnterpriseDto findEnterByNum(String e_num) {
		return mapper.findEnterByNum(e_num);
	}

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
	
	public int getSearchEnterId(String e_id) {
		return mapper.getSearchEnterId(e_id);
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
	
	public List<Map<String, Object>> getAllResumeOfEnter(String e_num){
		return mapper.getAllResumeOfEnter(e_num);
	}
	
	public int heartByEnter(String e_num) {
		return mapper.heartByEnter(e_num);
	}
	
	public List<Map<String, Object>> heartUserByEnter(String e_num, int start, int perpage) {
		
		Map<String, Object> map = new HashMap<>();

		map.put("e_num", e_num);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.heartUserByEnter(map);
	}
	
	public void authCertificate(String e_num) {
		mapper.authCertificate(e_num);
	}
	
	public void authCertificateCancel(String e_num) {
		mapper.authCertificateCancel(e_num);
	}
	
	public List<Map<String, Object>> applicantByEnterprise(String e_num) {
		return mapper.applicantByEnterprise(e_num);
	}
	

	public void updatelogo(String e_id, String e_logo) {
	      // TODO Auto-generated method stub
	      Map<String, String> map = new HashMap<>();

	      map.put("e_id", e_id);
	      map.put("e_logo", e_logo);

	      mapper.updatelogo(map);
	   }

	public List<Map<String, Object>> searchAllUserResume(int start, int perpage,
			String r_larea, String r_ltask, String r_ltype){
		
		Map<String, Object> map=new HashMap<>();
		map.put("r_larea", r_larea);
		map.put("r_ltask", r_ltask);
		map.put("r_ltype", r_ltype);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.searchAllUserResume(map);
	}
	
	public int getTotalCountOfResumeSearch(String r_larea, String r_ltask, String r_ltype) {
		
		Map<String, Object> map=new HashMap<>();
		map.put("r_larea", r_larea);
		map.put("r_ltask", r_ltask);
		map.put("r_ltype", r_ltype);
		
		return mapper.getTotalCountOfResumeSearch(map);
	}

	

	//기업회원관리
	
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}
	
	
	public List<EnterpriseDto> getAllEnters(int start, int perpage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map= new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);

		return mapper.getAllEnters(map);
	}	
	
	public void deleteEnter(String e_num) {
		
		mapper.deleteEnter(e_num);
	}
	
	public UserDto getDataByNum(String e_num) {
		
		return mapper.getDataByNum(e_num);
		
	}
	
	public void updateRegistnum(String e_registnum,String e_num) {
		Map<String, String> map =new HashMap<>();
		
		map.put("e_registnum", e_registnum);
		map.put("e_num", e_num);
		
		mapper.updateRegistnum(map);
	}
	
	public void updateEnterInfo(String e_id) {
		mapper.updateEnterInfo(e_id);
	}
}
