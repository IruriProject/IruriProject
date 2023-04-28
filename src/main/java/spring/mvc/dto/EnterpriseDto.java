package spring.mvc.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("edto")
public class EnterpriseDto {
	
	private String e_num;
	private String e_id;
	private String e_pw;
	private String e_name;
	private String e_registnum;
	private String e_logo;
	private String e_tel;
	private String e_addr;
	private String e_email;
	private int e_auth;
	private int e_res_access;
	
}
