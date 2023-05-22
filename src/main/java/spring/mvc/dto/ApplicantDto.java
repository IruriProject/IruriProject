package spring.mvc.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("adto")
public class ApplicantDto {

	private String a_num;
	private String p_num;
	private String r_num;
	private Timestamp a_writeday;
	private PostingDto posting;
	
	public PostingDto getPosting() {
	    return posting;
	}
	
	public void setPosting(PostingDto posting) {
	    this.posting = posting;
	}
	
	
	private String p_title;
	private int p_pay;
	private String p_addr;
	private String e_logo;
	private String p_employtype;
}

