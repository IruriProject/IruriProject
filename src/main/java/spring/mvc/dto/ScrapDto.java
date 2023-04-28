package spring.mvc.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("sdto")
public class ScrapDto {

	private String s_num;
	private String u_num;
	private String p_num;
}
