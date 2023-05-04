package spring.mvc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.PostingDto;
import spring.mvc.service.EFnService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.service.EFnService;
import spring.mvc.service.EnterpriseService;

@Controller
@RequestMapping("/posting")
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

	@Autowired
	EnterpriseService e_service;

	@GetMapping("")
	public String posting() {
		return "/posting/search";
	}

	@GetMapping("/write")
	public String writeForm(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto e_dto = e_service.findEnterdataById(loginId);

		model.addAttribute("enterNum", e_dto.getE_num());

		return "/posting/writeForm";
	}

	@PostMapping("/writeposting")
	public String writeposting(@ModelAttribute PostingDto dto) {
		service.insertPosting(dto);

		return "redirect:/";
	}

	@GetMapping("/detailpage")
	public ModelAndView detailPage(String p_num) {
		ModelAndView mview = new ModelAndView();

		mview.addObject("dto", service.getPosting(p_num));
		mview.setViewName("/posting/detailPage");

		return mview;
	}

	@GetMapping("/updateStatus")
	public String updatePostingStatus(@RequestParam String p_status, @RequestParam String p_num) {
		Map<String, String> map = new HashMap<>();
		map.put("p_status", p_status);
		map.put("p_num", p_num);

		service.updatePostingStatus(map);

		return "redirect:../enterprise";
	}
	
	@ResponseBody
	@GetMapping("/addrsearch")
	public List<PostingDto> addrSearch(String p_addr) {
		
		return service.getAddrSearch(p_addr);
	}


	@GetMapping("/confirmpw")
	public String confirmpw(@RequestParam String p_num, Model model) {
		model.addAttribute("p_num", p_num);

		return "/posting/confirmPw";
	}

	@PostMapping("/confirmpwAction")
	public String confirmpassAction(@RequestParam String p_num, @RequestParam String inputpw, HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto dto = e_service.findEnterdataById(loginId);

		if (inputpw.equals(dto.getE_pw())) {

			service.deletePosting(p_num);

			return "redirect:/enterprise";

		} else
			return "/enterprise/confirmFail";

	}

	@GetMapping("/update")
	public ModelAndView updateForm(@RequestParam String p_num) {
		ModelAndView mview = new ModelAndView();
		mview.addObject("dto", service.getPosting(p_num));
		mview.setViewName("/posting/updateForm");
		return mview;
	}

	@PostMapping("/updateposting")
	public String updateAction(@ModelAttribute PostingDto dto) {

		service.updatePosting(dto);

		return "redirect:/posting/detailpage?p_num=" + dto.getP_num();

	}

	@GetMapping("/messagedetail")
	public String messagedetail() {

		return "/message/detailPage";
	}
	
	@GetMapping("/reposting")
	public String reloadPosting(String p_num) {
		service.reposting(p_num);
		
		int maxNum=service.getMaxNumOfPosting();
		return "redirect:/posting/detailpage?p_num="+maxNum;
	}
}
