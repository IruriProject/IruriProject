package spring.mvc.controller;

import java.util.HashMap;
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
		EnterpriseDto dto=service.findEnterdataById(loginId);
		String e_num=service.findEnterdataById(loginId).getE_num();

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
	public Map<String, Integer> counting(@RequestParam String p_num){
		Map<String, Integer> map=new HashMap<>();
		
		map.put("scrapcounting", efn_service.scrapByPosting(p_num));
		map.put("viewercounting", efn_service.viewerByPosting(p_num));
		
		return map;
	}
	
	
	@GetMapping("/scraplist")
	public ModelAndView scrapList(@RequestParam String p_num) {
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("list", efn_service.scrapUserByPosting(p_num));
		mview.setViewName("/posting/scrapList");
		
		return mview;
	}
	
	@GetMapping("/viewerlist")
	public ModelAndView viewerList(@RequestParam String p_num) {
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("list", efn_service.viewerUserByPosting(p_num));
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
		
		String e_id=(String)session.getAttribute("loginId");
		
		EnterpriseDto dto=service.findEnterdataById(e_id);
		model.addAttribute("dto", dto);
		
		return "/enterprise/applyForm";
	}
	
	@GetMapping("/accessProcess")
	public String accessApplyProcess(@RequestParam String e_name, String e_res_access) {
		
		service.updateResAccessStatus(e_name,e_res_access);
		return "/enterprise/resAccessAlert";
	}
	
	@GetMapping("/applicant")
	public ModelAndView getApplicants(HttpSession session) {
		
		ModelAndView model=new ModelAndView();
		
		String loginId=(String)session.getAttribute("loginId");
		String e_num=service.findEnterdataById(loginId).getE_num();
		
		model.addObject("adto", service.getAllResumeOfEnter(e_num));
		
		model.setViewName("/enterprise/applicants");
		return model;
	}
	
	@GetMapping("/certificate")
	public String enterCertificate(HttpSession session, Model model) {
		
		String loginId=(String)session.getAttribute("loginId");
		EnterpriseDto dto=service.findEnterdataById(loginId);
		
		model.addAttribute("dto", dto);
		
		return "/enterprise/certificate";
	}
	
	@PostMapping("/certificateAction")
	public String certificateAction(@RequestParam String e_num) {

		service.authCertificate(e_num);
		
		return "redirect:/enterprise";
	}
}
