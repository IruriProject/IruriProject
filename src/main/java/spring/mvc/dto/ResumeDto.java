package spring.mvc.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("rdto")
public class ResumeDto {

	private String r_num;
	private String u_num;
	private String r_title;
	private String r_larea;
	private String r_ltask;
	private String r_ltype;
	private String r_lperiod;
	private String r_lday;
	private String r_content;
	private int r_presume;
	private int r_private;
	private Timestamp r_writeday;
}
