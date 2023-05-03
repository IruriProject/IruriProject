package spring.mvc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import spring.mvc.dto.MessageDto;
import spring.mvc.dto.PostingDto;

@Mapper
public interface EFnMapperInter {
	
	public Map<String, Object> getPosting(String p_num);
	
	public void insertPosting(PostingDto dto);
	
	public List<PostingDto> getAllPostings(String e_num);
	public List<PostingDto> getPreviewPostings(String e_num);
	
	public void updatePostingStatus(Map<String, String> map);
	
	public void deletePosting(String p_num);
	
	public void updatePosting(PostingDto dto);
	
	public List<Map<String, Object>> getAllMessages(String e_num);
	public List<Map<String, Object>> getPreviewMessages(String e_num);


}
