package spring.mvc.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import spring.mvc.dto.ApplicantDto;
import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.UserDto;

@Mapper
public interface EnterpriseMapperInter {
	
	public EnterpriseDto findEnterByNum(String e_num);
	public int EnterIdPassCheck(Map<String, String> map);
	public EnterpriseDto findEnterById(String e_id);
	public void joinEnterprise(EnterpriseDto dto);
	public int getSearchEnterId(String e_id);
	public void withdrawEnterprise(Map<String, String> map);
	public void updateResAccessStatus(Map<String, String> map);
	
	/*
	 * @Results(id = "applicantResult", value = {
	 * 
	 * @Result(property = "a_num", column = "a_num"),
	 * 
	 * @Result(property = "p_num", column = "p_num"),
	 * 
	 * @Result(property = "r_num", column = "r_num"),
	 * 
	 * @Result(property = "a_writeday", column = "a_writeday"),
	 * 
	 * @Result(property = "posting.p_title", column = "p_title") })
	 */
		/*
		 * @Select("SELECT a.a_num, a.p_num, a.r_num, a.a_writeday, p.p_title " +
		 * "FROM APPLICANT a " + "INNER JOIN POSTING p ON a.p_num = p.p_num " +
		 * "WHERE p.e_num = #{e_num}")
		 */
	
	public List<Map<String, Object>> getAllResumeOfEnter(String e_num);
	
	public int heartByEnter(String e_num);
	public List<Map<String, Object>> heartUserByEnter(Map<String, Object> map);
	
	public void authCertificate(String e_num);
	public void authCertificateCancel(String e_num);
	
	public List<Map<String, Object>> applicantByEnterprise(String e_num);
	
	public void updatelogo(Map<String, String> map);

	public List<Map<String, Object>> searchAllUserResume(Map<String, Object> map);
	public int getTotalCountOfResumeSearch(Map<String, Object> map);

	//기업회원관리
	public int getTotalCount();
	public List<EnterpriseDto> getAllEnters(HashMap<String, Object> map);
	public void deleteEnter(String e_num);
	public UserDto getDataByNum(String e_num);
	
	public void updateRegistnum(Map<String, String> map);
}

