package spring.mvc.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import spring.mvc.dto.BCommentDto;
import spring.mvc.dto.BoardDto;

@Mapper
public interface BoardMapperInter {

	//board
	public int getTotalCount(Map<String, String>map);
	public void updateReadCount(String b_num);
	public BoardDto getData(String b_num);
	public int getMaxNum();
	public List<BoardDto> getList(HashMap<String, Object> map);
	public List<BoardDto> getAllphotos(String b_num); //사진list
	public void insertBoard(BoardDto bdto);
	public void updateBoard(BoardDto bdto);
	public void deleteBoard(String b_num);
	
	//comment
	public void deleteComment(String bc_num);
	public BCommentDto getComment(String bc_num);
	public int getCommentMaxNum();
	public void updateComment(BCommentDto bc_dto);
	public void insertComment(BCommentDto bc_dto);
	public List<BCommentDto> getAllComments(String bc_num);
	public void updateRestep(Map<String, Integer> map);
	
	//추가
	public List<BCommentDto> getchildComments(Map<String, Integer> map);
	public void deletechildComment(int bc_regroup);
	/*
	 * 	public void insertComment(BCommentDto bc_dto);
	 public void updateRestep(Map<String, Integer> map); //추가
	public List<BCommentDto> getAllComments(int bc_num);//기존

	public BCommentDto getComment(int bc_num); //기존과동일
	public void updateComment(BCommentDto bc_dto); //기존과 동일
	public void deleteComment(int bc_num);  //기존과 동일
	*/
	
}
