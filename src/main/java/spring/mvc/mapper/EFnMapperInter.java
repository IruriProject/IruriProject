package spring.mvc.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import spring.mvc.dto.PostingDto;
import spring.mvc.dto.ApplicantDto;
import spring.mvc.dto.MessageDto;
import spring.mvc.dto.PostingDto;

@Mapper
public interface EFnMapperInter {
	
	//공고출력
	public List<PostingDto> recentPosting();
	public List<ApplicantDto> bestPosting();
	
	//공고
	public Map<String, Object> getPosting(String p_num);

	public int getTotalCount(); 
	public List<PostingDto> getPagingList(Map<String, Object> map);
	public int getTotalCountOfSearch(Map<String, Object> map);
	public void insertPosting(PostingDto dto);
	public void draftPosting(PostingDto dto);
	public List<PostingDto> draftList(String e_num);
	public int findPostingNum(String p_num);
	
	public List<PostingDto> getAllPostings(String e_num);
	public List<PostingDto> getAllPostingsWithPagingSearch(Map<String, Object> map);
	public int getPostingSearchCountWithPagingSearch(Map<String, Object> map);
	
	public void updatePostingStatus(Map<String, String> map);
	public List<Map<String, Object>> getAddrPostings(String p_addr);
	public List<PostingDto> getPreviewPostings(String e_num);
	public void deletePosting(String p_num);
	public void updatePosting(PostingDto dto);
	public List<Map<String, Object>> applicantByPosting(String p_num);
	public PostingDto loadingRecentPosting(String e_num);
	public String getEnumOfPosting(String p_num);
	
	//스크랩
	public int scrapByPosting(String p_num);
	public List<Map<String, Object>> scrapUserByPosting(Map<String, Object> map);
	
	//열람
	public int viewerByPosting(String p_num);
	public List<Map<String, Object>> viewerUserByPosting(Map<String, Object> map);

	public List<PostingDto> getSearchList(Map<String, Object> map);
	public int getsearchTotalCount(Map<String, String>map);
	public List<PostingDto> autoSearchTitle(String allkeyword);
	
	//쪽지
	public List<Map<String, Object>> getAllMessages(String e_num);
	public List<Map<String, Object>> getPreviewMessages(String e_num);
	public void reposting(String p_num);
	public int getMaxNumOfPosting();
	public void insertMessage(MessageDto dto);
	public int duplicateUserOfMessage(Map<String, String> map);
	
	public List<Map<String, Object>> getAllMessageWithPagingSearch(Map<String, Object> map);
	public int getMessageSearchCountWithPagingSearch(Map<String, Object> map);
	
	public void updatePostingStatusAuto(String p_num);
	public List<PostingDto> getAllPostingsAllEnter();

}
