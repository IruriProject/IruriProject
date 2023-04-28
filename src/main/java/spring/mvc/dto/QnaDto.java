package spring.mvc.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("qdto")
public class QnaDto {

	private String q_num;
	private String q_loginid;
	private String q_title;
	private String q_content;
	private String q_email;
	private String q_file;
	private Timestamp q_writeday;
}
