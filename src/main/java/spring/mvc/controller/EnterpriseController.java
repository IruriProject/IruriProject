package spring.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.service.EFnService;
import spring.mvc.service.EnterpriseService;
import spring.mvc.service.UFnService;

@Controller
@RequestMapping("/enterprise")
public class EnterpriseController {

	@Autowired
	EnterpriseService service;

	@Autowired
	EFnService efn_service;

	@GetMapping("")
	public ModelAndView enterprisePage(HttpSession session) {
		ModelAndView mview = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto dto = service.findEnterdataById(loginId);
		String e_num = service.findEnterdataById(loginId).getE_num();

		mview.addObject("dto", dto);
		mview.addObject("heartCount", service.heartByEnter(dto.getE_num()));
		mview.addObject("postings", efn_service.getPreviewPostings(dto.getE_num()));
		mview.addObject("postingCount", efn_service.getAllPostings(dto.getE_num()).size());
		mview.addObject("messages", efn_service.getPreviewMessages(dto.getE_num()));
		mview.addObject("applicant_size", service.getAllResumeOfEnter(e_num).size());

		mview.setViewName("/enterprise/enterprisePage");

		return mview;
	}

	@GetMapping("/counting")
	@ResponseBody
	public Map<String, Integer> counting(@RequestParam String p_num) {
		Map<String, Integer> map = new HashMap<>();

		map.put("scrapcounting", efn_service.scrapByPosting(p_num));
		map.put("viewercounting", efn_service.viewerByPosting(p_num));

		return map;
	}

	@GetMapping("/scraplist")
	public ModelAndView scrapList(@RequestParam String p_num,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

		ModelAndView mview = new ModelAndView();

		int totalCount = efn_service.scrapByPosting(p_num);

		int totalPage; // 총 페이지수
		int startPage; // 각 블럭(1,2,3..)의 시작페이지
		int endPage;

		// 각 블럭의 마지막 페이지
		int start; // 각 페이지의 시작번호
		int perpage = 5; // 한 페이지당 보여질 글 개수
		int perBlock = 5; // 한 블럭당 보여지는 페이지 개수

		// 총 페이지 개수
		totalPage = totalCount / perpage + (totalCount % perpage == 0 ? 0 : 1);

		// 각 블럭의 시작페이지 -> 현재페이지가 3 -> s:1, e:5 / 6 -> s:6, e:10
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;

		// 총 페이지가 8이면 (6~10 -> end페이지를 8로 수정)
		if (endPage > totalPage)
			endPage = totalPage;

		// 각페이지에서 불러올 시작번호
		start = (currentPage - 1) * perpage;

		// 메서드 불러오기
		List<Map<String, Object>> list = efn_service.scrapUserByPosting(p_num, start, perpage);

		// 게시글 앞에 붙을 번호
		int no = totalCount - (currentPage - 1) * perpage;

		// 출력에 필요한 변수들 mview에 저장
		mview.addObject("p_num", p_num);
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("totalPage", totalPage);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("perBlock", perBlock);
		mview.addObject("currentPage", currentPage);
		mview.addObject("no", no);

		mview.setViewName("/posting/scrapList");

		return mview;
	}

	@GetMapping("/viewerlist")
	public ModelAndView viewerList(@RequestParam String p_num,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		ModelAndView mview = new ModelAndView();

		int totalCount = efn_service.viewerByPosting(p_num);

		int totalPage; // 총 페이지수
		int startPage; // 각 블럭(1,2,3..)의 시작페이지
		int endPage;

		// 각 블럭의 마지막 페이지
		int start; // 각 페이지의 시작번호
		int perpage = 5; // 한 페이지당 보여질 글 개수
		int perBlock = 5; // 한 블럭당 보여지는 페이지 개수

		// 총 페이지 개수
		totalPage = totalCount / perpage + (totalCount % perpage == 0 ? 0 : 1);

		// 각 블럭의 시작페이지 -> 현재페이지가 3 -> s:1, e:5 / 6 -> s:6, e:10
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;

		// 총 페이지가 8이면 (6~10 -> end페이지를 8로 수정)
		if (endPage > totalPage)
			endPage = totalPage;

		// 각페이지에서 불러올 시작번호
		start = (currentPage - 1) * perpage;

		// 메서드 불러오기
		List<Map<String, Object>> list = efn_service.viewerUserByPosting(p_num, start, perpage);

		// 게시글 앞에 붙을 번호
		int no = totalCount - (currentPage - 1) * perpage;

		// 출력에 필요한 변수들 mview에 저장
		mview.addObject("p_num", p_num);
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("totalPage", totalPage);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("perBlock", perBlock);
		mview.addObject("currentPage", currentPage);
		mview.addObject("no", no);

		mview.setViewName("/posting/viewerList");

		return mview;
	}

	@GetMapping("/confirmpw")
	public String confirmpass(@RequestParam String e_num, Model model) {
		model.addAttribute("e_num", e_num);

		return "/enterprise/confirmPw";
	}

	@PostMapping("/confirmpwAction")
	public String confirmpassAction(@RequestParam String e_num, @RequestParam String inputpw, HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto dto = service.findEnterdataById(loginId);

		if (inputpw.equals(dto.getE_pw())) {

			service.withdrawEnterprise(e_num, inputpw);

			session.removeAttribute("loginId");
			session.removeAttribute("loginStatus");

			return "redirect:/";
		} else
			return "/enterprise/confirmFail";

	}

	@GetMapping("/update")
	public String updateForm() {
		return "/enterprise/updateForm";
	}

	@GetMapping("/applyaccess")
	public String getApplyAuth() {
		return "/enterprise/applyAccess";
	}

	@GetMapping("/applyform")
	public String getApplyForm(HttpSession session, Model model) {

		String e_id = (String) session.getAttribute("loginId");

		EnterpriseDto dto = service.findEnterdataById(e_id);
		model.addAttribute("dto", dto);

		return "/enterprise/applyForm";
	}

	@GetMapping("/accessProcess")
	public String accessApplyProcess(@RequestParam String e_name, String e_res_access) {

		service.updateResAccessStatus(e_name, e_res_access);
		return "/enterprise/resAccessAlert";
	}

	@GetMapping("/applicant")
	public ModelAndView getApplicants(HttpSession session) {

		ModelAndView model = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");
		String e_num = service.findEnterdataById(loginId).getE_num();

		model.addObject("adto", service.getAllResumeOfEnter(e_num));

		model.setViewName("/enterprise/applicants");
		return model;
	}

	@GetMapping("/certificate")
	public String enterCertificate(HttpSession session, Model model) {

		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto dto = service.findEnterdataById(loginId);

		model.addAttribute("dto", dto);

		return "/enterprise/certificate";
	}

	@PostMapping("/certificateAction")
	public String certificateAction(@RequestParam String e_num) {

		service.authCertificate(e_num);

		return "redirect:/enterprise";
	}

	@GetMapping("/heartlist")
	public ModelAndView heartList(HttpSession session,@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		ModelAndView mview = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto dto = service.findEnterdataById(loginId);

		int totalCount = service.heartByEnter(dto.getE_num());

		int totalPage; // 총 페이지수
		int startPage; // 각 블럭(1,2,3..)의 시작페이지
		int endPage;

		// 각 블럭의 마지막 페이지
		int start; // 각 페이지의 시작번호
		int perpage = 5; // 한 페이지당 보여질 글 개수
		int perBlock = 5; // 한 블럭당 보여지는 페이지 개수

		// 총 페이지 개수
		totalPage = totalCount / perpage + (totalCount % perpage == 0 ? 0 : 1);

		// 각 블럭의 시작페이지 -> 현재페이지가 3 -> s:1, e:5 / 6 -> s:6, e:10
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;

		// 총 페이지가 8이면 (6~10 -> end페이지를 8로 수정)
		if (endPage > totalPage)
			endPage = totalPage;

		// 각페이지에서 불러올 시작번호
		start = (currentPage - 1) * perpage;

		// 메서드 불러오기
		List<Map<String, Object>> list = service.heartUserByEnter(dto.getE_num(), start, perpage);

		// 게시글 앞에 붙을 번호
		int no = totalCount - (currentPage - 1) * perpage;

		// 출력에 필요한 변수들 mview에 저장
		mview.addObject("e_num", dto.getE_num());
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("totalPage", totalPage);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("perBlock", perBlock);
		mview.addObject("currentPage", currentPage);
		mview.addObject("no", no);

		mview.setViewName("/enterprise/heartList");
		return mview;
	}
}
