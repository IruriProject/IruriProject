package spring.mvc.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("bcdto")
public class BCommentDto {

	private String bc_num;
	private String b_num;
	private String bc_loginid;
	private String bc_content;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm")
	private Timestamp bc_writeday;
}
