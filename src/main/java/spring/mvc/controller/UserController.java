package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.ApplicantDto;
import spring.mvc.service.UFnService;
import spring.mvc.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	
	@Autowired
	UFnService ufn_service;

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
		
		mview.setViewName("/enterprise/resumeDetail");
		return mview;
	}
}
