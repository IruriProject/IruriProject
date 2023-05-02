package spring.mvc.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import spring.mvc.dto.EnterpriseDto;

@Mapper
public interface EnterpriseMapperInter {

	public int EnterIdPassCheck(Map<String, String> map);
	public EnterpriseDto findEnterById(String e_id);
	public void joinEnterprise(EnterpriseDto dto);
	public void withdrawEnterprise(Map<String, String> map);
}
