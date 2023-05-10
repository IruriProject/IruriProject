package spring.mvc.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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
	
}
