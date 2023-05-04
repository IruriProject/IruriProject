package spring.mvc.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import spring.mvc.dto.BCommentDto;
import spring.mvc.dto.BoardDto;

@Mapper
public interface BoardMapperInter {

	public int getTotalCount();
	public void updateReadCount(String b_num);
	public BoardDto getData(String b_num);
	public int getMaxNum();
	public List<BoardDto> getList(HashMap<String, Integer> map);
	public List<BoardDto> getAllphotos(String b_num);
	public void insertBoard(BoardDto bdto);
	
	//comment
	public void insertComment(BCommentDto bc_dto);
	public List<BCommentDto> getAllComments(String bc_num);
	public BCommentDto getComment(String b_num);
	public void updateComment(BCommentDto bc_dto);
	public void deleteComment(String bc_num);
}
