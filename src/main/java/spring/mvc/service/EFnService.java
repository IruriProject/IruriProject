package spring.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.mvc.dto.PostingDto;
import spring.mvc.mapper.EFnMapperInter;

import spring.mvc.dto.MessageDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.mapper.EFnMapperInter;

@Service
public class EFnService {
	
	@Autowired
	EFnMapperInter mapper;
	
	
	//공고
	public Map<String, Object> getPosting(String p_num) {
		return mapper.getPosting(p_num);
	}
	
	public void insertPosting(PostingDto dto) {
		mapper.insertPosting(dto);
	}
	
	public void draftPosting(PostingDto dto) {
		mapper.draftPosting(dto);
	}
	
	public List<PostingDto> draftList(String e_num){
		return mapper.draftList(e_num);
	}
	
	public int findPostingNum(String p_num) {
		return mapper.findPostingNum(p_num);
	}
	
	public List<PostingDto> getAllPostings(String e_num){
		return mapper.getAllPostings(e_num);
	}	
	public List<PostingDto> getPreviewPostings(String e_num){
		return mapper.getPreviewPostings(e_num);
	}
	
	public void updatePostingStatus(Map<String, String> map) {
		mapper.updatePostingStatus(map);
	}
	
	public void deletePosting(String p_num) {
		mapper.deletePosting(p_num);
	}
	
	public void updatePosting(PostingDto dto) {
		mapper.updatePosting(dto);
	}
	public List<Map<String, Object>> applicantByPosting(String p_num){
		return mapper.applicantByPosting(p_num);
	}
	
	public PostingDto loadingRecentPosting(String e_num) {
		return mapper.loadingRecentPosting(e_num);
	}
	
	
	//스크랩
	public int scrapByPosting(String p_num) {
		return mapper.scrapByPosting(p_num);
	}
	
	public List<Map<String, Object>> scrapUserByPosting(String p_num){
		return mapper.scrapUserByPosting(p_num);
	}
	
	
	//열람
	public int viewerByPosting(String p_num) {
		return mapper.viewerByPosting(p_num);
	}
	
	public List<Map<String, Object>> viewerUserByPosting(String p_num){
		return mapper.viewerUserByPosting(p_num);
	}
	
	
	//쪽지
	public List<Map<String, Object>> getAllMessages(String e_num){
		return mapper.getAllMessages(e_num);
	}
	public List<Map<String, Object>> getPreviewMessages(String e_num){
		return mapper.getPreviewMessages(e_num);
	}
	
	public Map<String, Object> getMessage(String m_num) {
		return mapper.getMessage(m_num);
	}
	
	public void insertMessage(MessageDto dto) {
		mapper.insertMessage(dto);
	}

	
	public int getTotalCount() {
		return mapper.getTotalCount();
	}


	
	public int getsearchTotalCount(String allkeyword) {
		Map<String, String> map= new HashMap<>();
		map.put("allkeyword", allkeyword);
		return mapper.getsearchTotalCount(map);
	}

	
	public List<PostingDto> getSearchList(String sort,String allkeyword, int start, int perpage){
		
		Map<String, Object> map= new HashMap<>();
		
		map.put("sort", sort);
		map.put("allkeyword", allkeyword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getSearchList(map);
	}
	
	public List<PostingDto> autoSearchTitle(String allkeyword){
		
		return mapper.autoSearchTitle(allkeyword);
	}
	
	public List<PostingDto> getPagingList(String searchcolumn, String searchword, int start, int perpage){

		Map<String, Object> map=new HashMap<>();
		
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getPagingList(map);
	}
	
	public int getTotalCountOfSearch(String searchcolumn, String searchword) {
		
		Map<String, Object> map=new HashMap<>();
		
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		
		return mapper.getTotalCountOfSearch(map);
	}
	
	public List<PostingDto> getAddrSearch(String p_addr){
		return mapper.getAddrPostings(p_addr);
	}
	
	public void reposting(String p_num) {
		mapper.reposting(p_num);
	}
	
	public int getMaxNumOfPosting() {
		return mapper.getMaxNumOfPosting();
	}
	
	public String getEnumOfPosting(String p_num) {
		return mapper.getEnumOfPosting(p_num);
	}
}
