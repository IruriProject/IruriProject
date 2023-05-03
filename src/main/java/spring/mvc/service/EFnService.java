package spring.mvc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dto.MessageDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.mapper.EFnMapperInter;

@Service
public class EFnService {
	
	@Autowired
	EFnMapperInter mapper;
	
	public Map<String, Object> getPosting(String p_num) {
		return mapper.getPosting(p_num);
	}
	
	public void insertPosting(PostingDto dto) {
		mapper.insertPosting(dto);
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
	
	public List<Map<String, Object>> getAllMessages(String e_num){
		return mapper.getAllMessages(e_num);
	
	}
	public List<Map<String, Object>> getPreviewMessages(String e_num){
		return mapper.getPreviewMessages(e_num);
	}
	

}
