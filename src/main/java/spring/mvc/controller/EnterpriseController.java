package spring.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
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
	
	@GetMapping("/enterprisepage")
	public ModelAndView enterprisePageForUser(String e_num) {
		ModelAndView mview = new ModelAndView();

		mview.addObject("dto", service.findEnterByNum(e_num));
		mview.addObject("heartCount", service.heartByEnter(e_num));
		mview.addObject("postings", efn_service.getPreviewPostings(e_num));
		mview.addObject("postingCount", efn_service.getAllPostings(e_num).size());

		mview.setViewName("/enterprise/enterprisePageForUser");

		return mview;
	}
	
	
	@GetMapping("/gendergraph")
	@ResponseBody
	public List<Map<String, Object>> genderGraph(@RequestParam String e_num) {

		List<Map<String, Object>> list = service.applicantByEnterprise(e_num);

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
	public List<Map<String, Object>> ageGraph(@RequestParam String e_num) {

		List<Map<String, Object>> list = service.applicantByEnterprise(e_num);

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
	
	 // 사진등록
	   @PostMapping("/updatelogo")
	   @ResponseBody
	   public void photoUpload(String e_id, MultipartFile e_logo, HttpSession session) {
	      // 업로드될 경로 구하기
	      String path = session.getServletContext().getRealPath("/photo");
	      // 파일명 구하기
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	      String fileName = "f_" + sdf.format(new Date()) + e_logo.getOriginalFilename();

	      try {
	         e_logo.transferTo(new File(path + "\\" + fileName));

	         service.updatelogo(e_id, fileName);

	      } catch (IllegalStateException | IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	   }
}
