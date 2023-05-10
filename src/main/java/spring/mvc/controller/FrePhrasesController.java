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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.FrePhrasesDto;
import spring.mvc.service.EnterpriseService;
import spring.mvc.service.FrePhrasesService;
import spring.mvc.service.UserService;

@Controller
@RequestMapping("/phrases")
public class FrePhrasesController {
	
	@Autowired
	FrePhrasesService service;
	
	@Autowired
	EnterpriseService e_service;
	
	@GetMapping("/list")
	public ModelAndView phrasesList(HttpSession session){
		ModelAndView mview=new ModelAndView();
		
		String loginId=(String)session.getAttribute("loginId");
		EnterpriseDto e_dto= e_service.findEnterdataById(loginId);
		
		mview.addObject("list", service.prasesList(e_dto.getE_num()));
		mview.setViewName("/phrases/phrasesList");
		
		
		return mview;
	}
	
	@GetMapping("/write")
	public String writeform(HttpSession session, Model model){
		String loginId=(String)session.getAttribute("loginId");
		EnterpriseDto e_dto= e_service.findEnterdataById(loginId);
		
		model.addAttribute("e_num", e_dto.getE_num());
		
		return "/phrases/writeForm";
	}
	
	@PostMapping("/writephrases")
	public String writephrases(@ModelAttribute FrePhrasesDto dto) {
		
		service.insertPrases(dto);
		
		return "redirect:/enterprise";
	}
	

}
