package spring.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
