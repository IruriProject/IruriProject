package spring.mvc.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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
import spring.mvc.dto.UserDto;
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
import spring.mvc.dto.MessageDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.service.EFnService;
import spring.mvc.service.EnterpriseService;
import spring.mvc.service.FrePhrasesService;
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
	
	@Autowired
	FrePhrasesService f_service;

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
		
		model.addAttribute("phraseList", f_service.phrasesList(e_dto.getE_num()));
		
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
	public String writeposting(@ModelAttribute PostingDto dto) {
		if(service.findPostingNum(dto.getP_num())!=0) {
			service.deletePosting(dto.getP_num());
		}
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

	@GetMapping("/gendergraph")
	@ResponseBody
	public List<Map<String, Object>> genderGraph(@RequestParam String p_num) {

		List<Map<String, Object>> list = service.applicantByPosting(p_num);

		int female = 0;
		int male = 0;

		for (Map<String, Object> a : list) {
			Object b = a.get("u_gender");
			if (b.equals("여"))
				female++;
			else
				male++;
		}

		List<Map<String, Object>> result = new ArrayList<>();

		Map<String, Object> map1 = new HashMap<>();
		map1.put("gender", "여자");
		map1.put("count", female);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("gender", "남자");
		map2.put("count", male);

		result.add(map1);
		result.add(map2);

		return result;
	}

	@GetMapping("/agegraph")
	@ResponseBody
	public List<Map<String, Object>> ageGraph(@RequestParam String p_num) {

		List<Map<String, Object>> list = service.applicantByPosting(p_num);

		int underthirties = 0;
		int thirties = 0;
		int fourties = 0;
		int fifties = 0;
		int sixties = 0;
		int others = 0;

		for (Map<String, Object> a : list) {
			String b = a.get("u_birth").toString();
			String[] bb = b.split("-");

			LocalDate now = LocalDate.now();

			int age = now.getYear() - Integer.parseInt(bb[0]) + 1;

			switch (age / 10) {
			case 2:
				underthirties++;
				break;
			case 3:
				thirties++;
				break;
			case 4:
				fourties++;
				break;
			case 5:
				fifties++;
				break;
			case 6:
				sixties++;
				break;
			default:
				others++;
				break;
			}

		}

		List<Map<String, Object>> result = new ArrayList<>();

		Map<String, Object> map1 = new HashMap<>();
		map1.put("age", "30대 이하");
		map1.put("count", underthirties);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("age", "30대");
		map2.put("count", thirties);

		Map<String, Object> map3 = new HashMap<>();
		map3.put("age", "40대");
		map3.put("count", fourties);

		Map<String, Object> map4 = new HashMap<>();
		map4.put("age", "50대");
		map4.put("count", fifties);

		Map<String, Object> map5 = new HashMap<>();
		map5.put("age", "60대");
		map5.put("count", sixties);

		Map<String, Object> map6 = new HashMap<>();
		map6.put("age", "60대 이상");
		map6.put("count", others);

		result.add(map1);
		result.add(map2);
		result.add(map3);
		result.add(map4);
		result.add(map5);
		result.add(map6);

		return result;
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
		ModelAndView mview = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto dto = e_service.findEnterdataById(loginId);

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

	@GetMapping("/reposting")
	public String reloadPosting(String p_num) {
		service.reposting(p_num);

		int maxNum = service.getMaxNumOfPosting();
		return "redirect:/posting/detailpage?p_num=" + maxNum;
	}

	// 쪽지
	@GetMapping("/writemessage")
	public String writemessageForm(HttpSession session, Model model, @RequestParam String u_id) {

		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto edto = e_service.findEnterdataById(loginId);

		UserDto udto = u_service.findUserdataById(u_id);

		model.addAttribute("udto", udto);
		model.addAttribute("edto", edto);

		return "/message/writeForm";
	}

	@PostMapping("/writemessageAction")
	public String writemessageAction(@ModelAttribute MessageDto dto) {
		service.insertMessage(dto);

		return "redirect:/enterprise";
	}

	@GetMapping("/messagelist")
	public ModelAndView allMessages(HttpSession session) {
		ModelAndView mview = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto dto = e_service.findEnterdataById(loginId);

		mview.addObject("list", service.getAllMessages(dto.getE_num()));
		mview.setViewName("/message/messageList");

		return mview;
	}
}
