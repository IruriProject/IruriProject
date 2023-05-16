package spring.mvc.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import spring.mvc.dto.BCommentDto;
import spring.mvc.dto.QCommentDto;
import spring.mvc.dto.QnaDto;

@Mapper
public interface QnaMapperInter {


	public int getTotalCount();
	public int getQnaUserTotalCount(String q_loginid);
	public QnaDto getData(String q_num);
	public int getMaxNum();
	public List<QnaDto> getList(HashMap<String, Object> map);
	public List<QnaDto> getAllfiles(String q_num); //filelist
	public void insertQna(QnaDto qdto);
	public void updateQna(QnaDto qdto);
	public void deleteQna(String q_num);
	public int countqnum(String q_num);
	public void deleteComment(String qc_num);
	public QCommentDto getComment(String qc_num);
	public int getCommentMaxNum();
	public void updateComment(QCommentDto qc_dto);
	public void insertComment(QCommentDto qc_dto);
	public List<QCommentDto> getAllComments(String qc_num);
}
