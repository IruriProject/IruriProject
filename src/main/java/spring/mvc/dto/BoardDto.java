package spring.mvc.dto;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

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
	private int b_readcount; //추가
	private int b_acount; //추가
	private Timestamp b_writeday;
    private String b_time; //추가
    
	//추가(new아이콘)
	private boolean newFlag;

	public boolean isNewFlag() {
	    return newFlag;
	}

	public void setNewFlag(boolean newFlag) {
	    this.newFlag = newFlag;
	}
}
