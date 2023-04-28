package spring.mvc.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("qcdto")
public class QCommentDto {

	private String qc_num;
	private String q_num;
	private String qc_content;
	private Timestamp qc_writeday;
}
