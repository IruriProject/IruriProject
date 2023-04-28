package spring.mvc.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("hdto")
public class HeartDto {

	private String h_num;
	private String u_num;
	private String e_num;
}
