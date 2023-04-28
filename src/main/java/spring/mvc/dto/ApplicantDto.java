package spring.mvc.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("adto")
public class ApplicantDto {

	private String a_num;
	private String p_num;
	private String r_num;
}
