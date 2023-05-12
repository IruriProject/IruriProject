package spring.mvc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.BoardDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.service.EFnService;
import spring.mvc.service.EnterpriseService;

@Controller
public class HomeController {


	@Autowired
	EFnService service;

	@Autowired
	EnterpriseService eservice;

	//board
	@GetMapping("/search/allsearchlist")
	public ModelAndView allsearchlist(@RequestParam (value="currentPage", defaultValue = "1")int currentPage,
			@RequestParam(required=false) String allkeyword,
			@RequestParam(defaultValue = "p_writeday") String sort)
		{

		ModelAndView model=new ModelAndView();

		int totalCount =service.getsearchTotalCount(allkeyword);  //keyword 갯수
		int totalPage; //총 페이지수
		int startPage; //각 블럭의 시작페이지
		int endPage; //각 블럭의 끝페이지
		int start;    //각 페이지의 시작번호
		int perPage=10; //한 페이지에 보여질 글의 갯수
		int perBlock=5; //한 블럭당 보여지는 페이지 갯수

		//총 페이지 갯수     
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		//각 블럭의 시작페이지
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;

		//총페이지=8일 경우 endpage를 8로 수정한다.     
		if(endPage>totalPage)
			endPage=totalPage;

        //각 페이지에서 불러올 시작번호
        start=(currentPage-1)*perPage;

		//각 페이지에서 필요한 게시글 가져오기
		List<PostingDto> list=service.getSearchList(sort,allkeyword, start, perPage);

		//int searchtotalCount=list.size();
	     //각 페이지에 출력할 시작번호
        int no=totalCount-(currentPage-1)*perPage;
        
		//출력에 필요한 변수들을 model에 저장
		/* model.addObject("searchtotalCount", searchtotalCount); */
		
        model.addObject("totalCount", totalCount);
        model.addObject("list", list);
        model.addObject("totalPage", totalPage);
        model.addObject("startPage", startPage);
        model.addObject("endPage", endPage);
        model.addObject("perBlock", perBlock);
        model.addObject("currentPage", currentPage);
        model.addObject("no", no);
        model.addObject("sort",sort);  

		model.setViewName("/search/allsearchlist");

		return model;

	}
	
	
	 @ResponseBody
	 @GetMapping("/search/wordSearchShow") 
	 public List<PostingDto> wordSearchShow(String allkeyword) {
		
		 List<PostingDto> list= service.autoSearchTitle(allkeyword);
		 
	 	return list;
	 }
	 
	
		
		
}
