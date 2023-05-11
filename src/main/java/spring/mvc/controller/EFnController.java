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
import spring.mvc.dto.ViewerDto;
import spring.mvc.service.EFnService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.HeartDto;
import spring.mvc.dto.MessageDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.service.EFnService;
import spring.mvc.service.EnterpriseService;
import spring.mvc.service.UFnService;
import spring.mvc.service.UserService;

@Controller
@RequestMapping("/posting")
public class EFnController {

	@Autowired
	EFnService service;
	
	@Autowired
	EnterpriseService e_service;
	
	@Autowired
	UserService user_service;
	
	@Autowired
	UFnService ufn_service;

	@Autowired
	UserService u_service;


	@GetMapping("/insertForm")
	public String insertForm() {
		return "/posting/InsertForm";
	}

	@GetMapping("/search")
	public ModelAndView searchPage(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn", required = false) String sc,
			@RequestParam(value = "searchword", required = false) String sw) {

		ModelAndView model = new ModelAndView();

		int totalCount=service.getTotalCount();
		int searchCount=service.getTotalCountOfSearch(sc, sw); // 검색 결과에 따른 총 게시글 수

		int totalPage;
		int startPage;
		int endPage;
		int start;
		int perPage = 10;
		int perBlock = 5;

		// 총 페이지 갯수
		totalPage = searchCount / perPage + (searchCount % perPage == 0 ? 0 : 1);

		// 각 블럭의 시작 페이지
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;

		if (endPage > totalPage)
			endPage = totalPage;

		// 각 페이지에서 불러 올 시작번호
		start = (currentPage - 1) * perPage;

		List<PostingDto> list = service.getPagingList(sc, sw, start, perPage);

		int no = searchCount - (currentPage - 1) * perPage;

		// 출력에 필요한 변수를 model에 저장
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.addObject("totalPage", totalPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("perBlock", perBlock);
		model.addObject("currentPage", currentPage);
		model.addObject("no", no);
		model.addObject("searchCount", searchCount);
		model.addObject("column", sc);
		model.addObject("keyword", sw);
		

		model.setViewName("/posting/search");
		return model;

	}

	@GetMapping("")
	public String posting() {
		return "/posting/search";
	}

	@GetMapping("/write")
	public String writeForm(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto e_dto = e_service.findEnterdataById(loginId);

		model.addAttribute("draftCount", service.draftList(e_dto.getE_num()).size());
		model.addAttribute("enterNum", e_dto.getE_num());
		model.addAttribute("draftList", service.draftList(e_dto.getE_num()));
		
		return "/posting/writeForm";
	}

	
	@GetMapping("/loadingRecentPosting")
	@ResponseBody
	public PostingDto loadingRecentPosting(@RequestParam String e_num) {
		return service.loadingRecentPosting(e_num);
	}
	
	@GetMapping("/loadingDraftPosting")
	@ResponseBody
	public Object loadingDraftPosting(@RequestParam String p_num) {
		return service.getPosting(p_num);
	}


	@PostMapping("/writeposting")
	public String writeposting(@ModelAttribute PostingDto dto,HttpSession session) {
		if(service.findPostingNum(dto.getP_num())!=0) {
			service.deletePosting(dto.getP_num());
		}
		
		EnterpriseDto edto=e_service.findEnterdataById((String)session.getAttribute("loginId")); 

		String [] enterAddr=edto.getE_addr().split("구");
		String saveAddr=enterAddr[0]+" "+enterAddr[1];
		dto.setP_addr(saveAddr);
		service.insertPosting(dto);

		return "redirect:/";
	}
	
	@PostMapping("/draftposting")
	public String draftposting(@ModelAttribute PostingDto dto) {
		service.draftPosting(dto);
		
		return "/posting/draftPosting";

	}
	
	@PostMapping("/draftdelete")
	public String draftdelete(@RequestParam String p_num) {
		service.deletePosting(p_num);
		
		return "redirect:/posting/write";
	}
	

	@GetMapping("/detailpage")
	public ModelAndView detailPage(String p_num,HttpSession session) {
		ModelAndView mview = new ModelAndView();

		//p_num에 해당하는 posting 정보
		mview.addObject("dto", service.getPosting(p_num));
		
		//유저 로그인 상태인 경우, u_num에 해당하는 이력서 목록
		String myId=(String)session.getAttribute("loginId");
		String loginStatus=(String)session.getAttribute("loginStatus");
		

		//좋아요 여부 확인 및 insert
		String unum=u_service.findUserdataById(myId).getU_num();
		String e_num=service.getEnumOfPosting(p_num);
		HeartDto hdto=ufn_service.checkLikeEnter(unum, e_num);

		if(hdto!=null) {
			mview.addObject("h_num", hdto.getH_num());
		}
		
		mview.addObject("hdto", hdto);
		mview.addObject("u_num",unum);
		

		if(loginStatus != null && loginStatus.equals("user")) {
			String u_num=user_service.findUserdataById(myId).getU_num();
			mview.addObject("rlist", ufn_service.getMyResume(u_num));
		}

		if (session.getAttribute("loginStatus") == "user") {
			ViewerDto vdto = new ViewerDto();

			vdto.setP_num(p_num);

			String u_num = u_service.findUserdataById((String) session.getAttribute("loginId")).getU_num();
			vdto.setU_num(u_num);

			if (ufn_service.getSearchUnum(u_num, p_num) == 0) {
				ufn_service.insertViewer(vdto);
			}

		}

		mview.addObject("dto", service.getPosting(p_num));
		mview.addObject("scrapCount", service.scrapByPosting(p_num));
		mview.addObject("viewerCount", service.viewerByPosting(p_num));


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
	
	@GetMapping("/postinglist")
	public ModelAndView getAllPostings(HttpSession session) {
		ModelAndView mview=new ModelAndView();
		
		String loginId=(String)session.getAttribute("loginId");
		EnterpriseDto dto= e_service.findEnterdataById(loginId);
		
		mview.addObject("list", service.getAllPostings(dto.getE_num()));
		mview.setViewName("/posting/postingList");
		
		return mview;
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

	
	//쪽지
	@GetMapping("/messagedetail")
	public ModelAndView messagedetail(@RequestParam String m_num) {
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("dto", service.getMessage(m_num));
		mview.setViewName("/message/detailPage");

		return mview;
	}
	
	@GetMapping("/reposting")
	public String reloadPosting(String p_num) {
		service.reposting(p_num);
		
		int maxNum=service.getMaxNumOfPosting();
		return "redirect:/posting/detailpage?p_num="+maxNum;
	}
	
	@GetMapping("/writemessage")
	public String writemessageForm(HttpSession session, Model model) {
		
		String loginId=(String)session.getAttribute("loginId");
		EnterpriseDto edto= e_service.findEnterdataById(loginId);
		
		model.addAttribute("edto", edto);
		
		
		return "/message/writeForm";
	}
	
	@PostMapping("/writemessageAction")
	public String writemessageAction(@ModelAttribute MessageDto dto) {
		service.insertMessage(dto);
		
		return "redirect:/enterprise";
	}
	
	@GetMapping("/allMessages")
	public ModelAndView allMessages(HttpSession session) {
		ModelAndView mview=new ModelAndView();
		
		String loginId=(String)session.getAttribute("loginId");
		EnterpriseDto dto= e_service.findEnterdataById(loginId);
		
		mview.addObject("list", service.getAllMessages(dto.getE_num()));
		mview.setViewName("/message/messageList");
		
		return mview;
	}
}
