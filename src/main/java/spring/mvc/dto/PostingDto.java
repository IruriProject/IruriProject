package spring.mvc.dto;

import java.sql.Time;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("pdto")
public class PostingDto {

	private String p_num;
	private String e_num;
	private String p_title;
	private String p_type;
	private int p_pay;
	private String p_period;
	private String p_workday;
	private String p_starttime;
	private String p_endtime;
	private String p_employtype;
	private String p_addr;
	private String p_content;
	private Timestamp p_writeday;
	private String p_status;
	private int p_hirenum;
	private Timestamp p_startdate;
	private String p_enddate;
	
	private String e_name;
}
