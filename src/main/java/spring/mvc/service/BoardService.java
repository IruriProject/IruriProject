package spring.mvc.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dto.BCommentDto;
import spring.mvc.dto.BoardDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.mapper.BoardMapperInter;

@Service
public class BoardService {

	@Autowired
	BoardMapperInter mapperInter;
	
	//출력
	public List<BoardDto> recentBoard(){
		return mapperInter.recentBoard();
		
	}
	
	
	//pre,next
	public Integer getPrevNum(String b_num) {
	    Integer prevNum = mapperInter.getPrevNum(b_num);
	    return prevNum != null ? prevNum : 0;
	}

	public Integer getNextNum(String b_num) {
	    Integer nextNum = mapperInter.getNextNum(b_num);
	    return nextNum != null ? nextNum : 0;
	}
	
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
	
	 public void updateRestep(int bc_regroup, int bc_restep) {
	      // TODO Auto-generated method stub
	      Map<String, Integer> map=new HashMap<>();
	      
	      map.put("bc_regroup", bc_regroup);
	      map.put("bc_restep", bc_restep);
	      mapperInter.updateRestep(map);
	   }
	 
	public void insertComment(BCommentDto bc_dto) {
		// TODO Auto-generated method stub
		
		  String bc_num=bc_dto.getBc_num();
	      int bc_regroup=bc_dto.getBc_regroup();
	      int bc_restep=bc_dto.getBc_restep();
	      int bc_relevel= bc_dto.getBc_relevel();
	      
	      if(bc_num.equals("0")) {  //새글
	         
	    	  bc_regroup=this.getCommentMaxNum()+1;
	    	  bc_restep=0;
	    	  bc_relevel=0;
	    	  
	      }  else {     //답글
	         	       
	         this.updateRestep(bc_regroup, bc_restep);
	         
	         //그 이후에 전달받은 값보다 1크게 db에 저장
	         bc_restep++;
	         bc_relevel++;
	      }
	      
	      //변경된 값을 다시 dto에 담는다
	      bc_dto.setBc_regroup(bc_regroup);
	      bc_dto.setBc_restep(bc_restep);
	      bc_dto.setBc_relevel(bc_relevel);

	      mapperInter.insertComment(bc_dto);
	}

	
	public List<BCommentDto> getAllComments(String bc_num) {
		// TODO Auto-generated method stub
		return mapperInter.getAllComments(bc_num);
	}

	
	public BCommentDto getComment(String bc_num) {
		// TODO Auto-generated method stub
		return mapperInter.getComment(bc_num);
	}
	
	public int getCommentMaxNum() {
		
		return mapperInter.getCommentMaxNum();
	}
	
	public void updateComment(BCommentDto bc_dto) {
		// TODO Auto-generated method stub
		mapperInter.updateComment(bc_dto);
	}

	public void deleteComment(String bc_num) {
		// TODO Auto-generated method stub
		mapperInter.deleteComment(bc_num);
	}

	//추가
	public List<BCommentDto> getchildComments(int bc_regroup, int bc_restep) {
		// TODO Auto-generated method stub
		Map<String, Integer> map= new HashMap<>();
		map.put("bc_regroup", bc_regroup);
		map.put("bc_restep", bc_restep);
		
		return mapperInter.getchildComments(map);
	}

	
	public void deletechildComment(int bc_regroup) {
		// TODO Auto-generated method stub
		mapperInter.deletechildComment(bc_regroup);
	}


}
