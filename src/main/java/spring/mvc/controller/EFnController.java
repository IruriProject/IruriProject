package spring.mvc.controller;

import org.springframework.stereotype.Controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.PostingDto;
import spring.mvc.service.EFnService;

@Controller
public class EFnController {

	@Autowired
	EFnService service;

	@GetMapping("/insertForm")
	public String insertForm() {
		return "/posting/InsertForm";
	}

	@GetMapping("/search")
	public ModelAndView l(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn",required = false) String sc, 
			@RequestParam(value = "searchword",required = false) String sw) {
		
		ModelAndView model=new ModelAndView();
		
		int totalCount=service.getTotalCount();

		  int totalPage; 
	      int startPage; 
	      int endPage; 
	      int start; 
	      int perPage=10; 
	      int perBlock=5; 
	           
	      //총 페이지 갯수
	      totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	      
	      //각 블럭의 시작 페이지 
	      startPage=(currentPage-1)/perBlock*perBlock+1;
	      endPage=startPage+perBlock-1;
	          
	      if(endPage>totalPage)
	         endPage=totalPage;
	       
	       //각 페이지에서 불러 올 시작번호
	       start=(currentPage-1)*perPage; 
	       
	       List<PostingDto> list=service.getPagingList(sc, sw, start, perPage);
	       
	       int no=totalCount-(currentPage-1)*perPage;
	       
	       //출력에 필요한 변수를 model에 저장
	       model.addObject("totalCount", totalCount);
	       model.addObject("list", list);
	       model.addObject("totalPage", totalPage);
	       model.addObject("startPage", startPage);
	       model.addObject("endPage", endPage);
	       model.addObject("perBlock", perBlock);
	       model.addObject("currentPage", currentPage);
	       model.addObject("no", no);
	       
		model.setViewName("/posting/search");
		return model;
	}

}
