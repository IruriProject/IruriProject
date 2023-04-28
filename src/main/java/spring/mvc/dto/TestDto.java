package spring.mvc.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("testdto")
public class TestDto {

	private String t_num;
	private String t_name;
	
}
