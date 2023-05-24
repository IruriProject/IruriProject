package spring.mvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.ApplicantDto;
import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.UserDto;
import spring.mvc.service.EnterpriseService;
import spring.mvc.service.UFnService;
import spring.mvc.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	
	@Autowired
	UFnService ufn_service;

	@Autowired
	EnterpriseService eservice;
	
	@PostMapping("/apply")
	public String applyResume(ApplicantDto dto,String p_num,String currentPage) {
		service.insertResume(dto);
		
		return "redirect:/posting/detailpage?p_num="+p_num+"&currentPage="+currentPage;
	}

	@GetMapping("/resume/detail")
	public ModelAndView getResumeDetail(String r_num) {
		
		ModelAndView mview=new ModelAndView();
		String u_num=ufn_service.getResumeOfRNum(r_num).getU_num();
		
		mview.addObject("resume", ufn_service.getResumeOfRNum(r_num));
		mview.addObject("user", service.findUserByNum(u_num));
		
		mview.setViewName("/newpage/enterprise/resumeDetail");
		return mview;
	}
	
	//회원관리
	@GetMapping("/member/usermemberlist")
	public String usermemberlist(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			Model model)
	{


	    int totalCount = service.getTotalCount();
	    int totalPage; // 총 페이지수
	    int startPage; // 각 블럭의 시작페이지
	    int endPage; // 각 블럭의 끝페이지
	    int start; // 각 페이지의 시작번호
	    int perPage = 10; // 한 페이지에 보여질 글의 갯수
	    int perBlock = 5; // 한 블럭당 보여지는 페이지 갯수

	    // 총 페이지 갯수
	    totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
	    // 각 블럭의 시작페이지
	    startPage = (currentPage - 1) / perBlock * perBlock + 1;
	    endPage = startPage + perBlock - 1;

	    // 총페이지=8일 경우 endpage를 8로 수정한다.
	    if (endPage > totalPage)
	        endPage = totalPage;

	    // 각 페이지에서 불러올 시작번호
	    start = (currentPage - 1) * perPage;

	    
		//전체조회
		List<UserDto> list = service.getAllUsers(start, perPage);
		
		int no = totalCount - (currentPage - 1) * perPage;
		
		// 출력에 필요한 변수들을 model에 저장
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("list", list);
	    model.addAttribute("totalPage", totalPage);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("perBlock", perBlock);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("no", no);
		model.addAttribute("count", list.size());
		
		return "/member/usermemberlist";
	}
	

	@PostMapping("/member/delete")
	public String delete(@RequestParam("u_num") String[] u_nums) {
	    for (String u_num : u_nums) {
	        service.deleteUser(u_num);
	    }
	    return "redirect:usermemberlist";
	}
		
	//회원관리
	@GetMapping("/member/entermemberlist")
	public String entermemberlist(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			Model model)
	{
	    int totalCount = eservice.getTotalCount();
	    int totalPage; // 총 페이지수
	    int startPage; // 각 블럭의 시작페이지
	    int endPage; // 각 블럭의 끝페이지
	    int start; // 각 페이지의 시작번호
	    int perPage = 10; // 한 페이지에 보여질 글의 갯수
	    int perBlock = 5; // 한 블럭당 보여지는 페이지 갯수

	    // 총 페이지 갯수
	    totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
	    // 각 블럭의 시작페이지
	    startPage = (currentPage - 1) / perBlock * perBlock + 1;
	    endPage = startPage + perBlock - 1;

	    // 총페이지=8일 경우 endpage를 8로 수정한다.
	    if (endPage > totalPage)
	        endPage = totalPage;

	    // 각 페이지에서 불러올 시작번호
	    start = (currentPage - 1) * perPage;

	    
		//전체조회
		List<EnterpriseDto> list = eservice.getAllEnters(start, perPage);
		
		int no = totalCount - (currentPage - 1) * perPage;
		
		// 출력에 필요한 변수들을 model에 저장
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("list", list);
	    model.addAttribute("totalPage", totalPage);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("perBlock", perBlock);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("no", no);
		model.addAttribute("count", list.size());
		
		return "/member/entermemberlist";
	}
	
	@PostMapping("/member/enterdelete")
	public String enterdelete(@RequestParam("e_num") String[] e_nums) {
	    for (String e_num : e_nums) {
	        eservice.deleteEnter(e_num);
	    }
	    return "redirect:entermemberlist";
	}
}
