package spring.mvc.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("fdto")
public class FrePhrasesDto {
	
	private String f_num;
	private String e_num;
	private String f_phrase;
	
	private List<String> fPhraseList;

}
