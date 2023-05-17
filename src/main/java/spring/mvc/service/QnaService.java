package spring.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dto.BCommentDto;
import spring.mvc.dto.QCommentDto;
import spring.mvc.dto.QnaDto;
import spring.mvc.mapper.QnaMapperInter;

@Service
public class QnaService {
	
	@Autowired
	QnaMapperInter mapperInter;
	
	
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	public int getQnaUserTotalCount(String q_loginid) {
		// TODO Auto-generated method stub
		
		return mapperInter.getQnaUserTotalCount(q_loginid);
	}

	public QnaDto getData(String q_num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(q_num);
	}
	
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapperInter.getMaxNum();
	}

	public List<QnaDto> getList(int start, int perpage) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map= new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);

		return mapperInter.getList(map);
	}	

	public void insertQna(QnaDto qdto) {
		// TODO Auto-generated method stub
		mapperInter.insertQna(qdto);
	}
	
	public List<QnaDto> getAllfiles(String q_num) {
		// TODO Auto-generated method stub
		 return mapperInter.getAllfiles(q_num);
	}
	
	public void updateQna(QnaDto qdto) {
		// TODO Auto-generated method stub
		mapperInter.updateQna(qdto);
	}
	
	public void deleteQna(String q_num) {
		
		mapperInter.deleteQna(q_num);
	}
	
	//comment
	public int countqnum(String q_num) {
		// TODO Auto-generated method stub
		return mapperInter.countqnum(q_num);
	}
	
	public void insertComment(QCommentDto qc_dto) {
		// TODO Auto-generated method stub
	      mapperInter.insertComment(qc_dto);
	}
	
	public List<QCommentDto> getAllComments(String qc_num) {
		// TODO Auto-generated method stub
		return mapperInter.getAllComments(qc_num);
	}

	
	public QCommentDto getComment(String qc_num) {
		// TODO Auto-generated method stub
		return mapperInter.getComment(qc_num);
	}
	
	public int getCommentMaxNum() {
		
		return mapperInter.getCommentMaxNum();
	}
	
	public void updateComment(QCommentDto qc_dto) {
		// TODO Auto-generated method stub
		mapperInter.updateComment(qc_dto);
	}

	public void deleteComment(String qc_num) {
		// TODO Auto-generated method stub
		mapperInter.deleteComment(qc_num);
	}
	
}
