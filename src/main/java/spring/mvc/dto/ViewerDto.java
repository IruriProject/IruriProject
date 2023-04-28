package spring.mvc.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("vdto")
public class ViewerDto {

	private String v_num;
	private String u_num;
	private String p_num;
}
