package spring.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.service.EFnService;
import spring.mvc.service.EnterpriseService;

@Controller
@RequestMapping("/enterprise")
public class EnterpriseController {

	@Autowired
	EnterpriseService service;
	
	@Autowired
	EFnService efn_service;

	@GetMapping("")
	public ModelAndView enterprisepage(HttpSession session) {
		ModelAndView mview = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");
		
		EnterpriseDto dto=service.findEnterdataById(loginId);

		mview.addObject("dto", dto);
		mview.addObject("postings", efn_service.getAllPostings(dto.getE_num()));
		mview.setViewName("/enterprise/enterprisepage");

		return mview;
	}

	@GetMapping("/confirmpass")
	public String confirmpass(@RequestParam String e_num, Model model) {
		model.addAttribute("e_num", e_num);

		return "/enterprise/confirmPass";
	}

	@PostMapping("/confirmpassAction")
	public String confirmpassAction(@RequestParam String e_num, @RequestParam String inputpass, HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto dto = service.findEnterdataById(loginId);

		if (inputpass.equals(dto.getE_pw())) {

			service.withdrawEnterprise(e_num, inputpass);

			session.removeAttribute("loginId");
			session.removeAttribute("loginStatus");

			return "redirect:/";
		} else
			return "/enterprise/confirmFail";

	}

}
