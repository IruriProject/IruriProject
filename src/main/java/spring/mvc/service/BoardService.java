package spring.mvc.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dto.BCommentDto;
import spring.mvc.dto.BoardDto;
import spring.mvc.mapper.BoardMapperInter;

@Service
public class BoardService {

	@Autowired
	BoardMapperInter mapperInter;
	
	
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
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


	public List<BoardDto> getList(int start, int perpage) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map= new HashMap<>();
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
