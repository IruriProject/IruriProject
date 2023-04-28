package spring.mvc.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("udto")
public class UserDto {

	private String u_num;
	private String u_name;
	private String u_gender;
	private String u_birth;
	private String u_hp;
	private String u_email;
	private String u_addr;
	private String u_photo;
}
