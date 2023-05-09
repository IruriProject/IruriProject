package spring.mvc.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dto.BCommentDto;
import spring.mvc.dto.BoardDto;
import spring.mvc.mapper.BoardMapperInter;

@Service
public class BoardService {

	@Autowired
	BoardMapperInter mapperInter;
	
	
	public int getTotalCount(String keyword) {
		// TODO Auto-generated method stub
		
		Map<String, String> map= new HashMap<>();
		map.put("keyword", keyword);
		return mapperInter.getTotalCount(map);
	}


	public void updateReadCount(String b_num) {
		// TODO Auto-generated method stub
		mapperInter.updateReadCount(b_num);
	}

	
	public BoardDto getData(String b_num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(b_num);
	}
	

	
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapperInter.getMaxNum();
	}


	public List<BoardDto> getList(String sort, String keyword, int start, int perpage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map= new HashMap<>();
		map.put("sort", sort);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("perpage", perpage);

		return mapperInter.getList(map);
	}
	

	public void insertBoard(BoardDto bdto) {
		// TODO Auto-generated method stub
		mapperInter.insertBoard(bdto);
	}
	
	public List<BoardDto> getAllphotos(String b_num) {
		// TODO Auto-generated method stub
		 return mapperInter.getAllphotos(b_num);
	}
	
	public void updateBoard(BoardDto bdto) {
		// TODO Auto-generated method stub
		mapperInter.updateBoard(bdto);
	}
	
	public void deleteBoard(String b_num) {
		
		mapperInter.deleteBoard(b_num);
	}
	
	//boardComment
	public void insertComment(BCommentDto bc_dto) {
		// TODO Auto-generated method stub
		mapperInter.insertComment(bc_dto);
	}

	
	public List<BCommentDto> getAllComments(String b_num) {
		// TODO Auto-generated method stub
		return mapperInter.getAllComments(b_num);
	}

	
	public BCommentDto getComment(String b_num) {
		// TODO Auto-generated method stub
		return mapperInter.getComment(b_num);
	}

	
	public void updateComment(BCommentDto bc_dto) {
		// TODO Auto-generated method stub
		mapperInter.updateComment(bc_dto);
	}

	
	public void deleteComment(String b_num) {
		// TODO Auto-generated method stub
		mapperInter.deleteComment(b_num);
	}

}
