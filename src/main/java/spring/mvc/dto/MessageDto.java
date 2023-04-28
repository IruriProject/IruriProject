package spring.mvc.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("mdto")
public class MessageDto {

	private String m_num;
	private String e_num;
	private String u_num;
	private String m_content;
	private Timestamp m_day;
}
