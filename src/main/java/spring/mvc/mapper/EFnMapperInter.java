package spring.mvc.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import spring.mvc.dto.PostingDto;

import spring.mvc.dto.MessageDto;
import spring.mvc.dto.PostingDto;

@Mapper
public interface EFnMapperInter {
	
	//공고
	public Map<String, Object> getPosting(String p_num);
	public int getTotalCount();
	public List<PostingDto> getPagingList(Map<String, Object> map);
	public void insertPosting(PostingDto dto);
	public List<PostingDto> getAllPostings(String e_num);
	public void updatePostingStatus(Map<String, String> map);
	public List<PostingDto> getAddrPostings(String p_addr);
	public List<PostingDto> getPreviewPostings(String e_num);
	public void deletePosting(String p_num);
	public void updatePosting(PostingDto dto);
	
	
	//쪽지
	public List<Map<String, Object>> getAllMessages(String e_num);
	public List<Map<String, Object>> getPreviewMessages(String e_num);
	public void reposting(String p_num);
	public int getMaxNumOfPosting();
	public Map<String, Object> getMessage(String m_num);
	public void insertMessage(MessageDto dto);

}
