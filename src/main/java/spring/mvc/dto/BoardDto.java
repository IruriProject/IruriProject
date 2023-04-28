package spring.mvc.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("bdto")
public class BoardDto {

	private String b_num;
	private String b_loginid;
	private String b_title;
	private String b_content;
	private String b_photo;
	private Timestamp b_writeday;
}
