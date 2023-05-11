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
	public ModelAndView phrasesList(HttpSession session) {
		ModelAndView mview = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto e_dto = e_service.findEnterdataById(loginId);

		mview.addObject("list", service.phrasesList(e_dto.getE_num()));
		mview.setViewName("/phrases/phrasesList");

		return mview;
	}

	@GetMapping("/write")
	public String writeform(HttpSession session, Model model) {
		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto e_dto = e_service.findEnterdataById(loginId);

		model.addAttribute("e_num", e_dto.getE_num());

		return "/phrases/writeForm";
	}

	@PostMapping("/writephrases")
	public String writephrases(@ModelAttribute FrePhrasesDto dto, @RequestParam String f_phrase1,
			@RequestParam String f_phrase2, @RequestParam String f_phrase3) {
		String[] f_phraseList = new String[3];
		f_phraseList[0] = f_phrase1;
		f_phraseList[1] = f_phrase2;
		f_phraseList[2] = f_phrase3;

		for (int i = 0; i < f_phraseList.length; i++) {
			dto.setF_phrase(f_phraseList[i]);
			service.insertPhrases(dto);
		}

		return "redirect:/phrases/list";
	}

	@PostMapping("/deletephrase")
	public String deletephrase(@RequestParam String f_num) {
		service.deletePhrase(f_num);

		return "redirect:/phrases/list";
	}

	@PostMapping("/updatephrase")
	public String updatephrase(@RequestParam String f_num, @RequestParam String f_phrase) {
		service.updatePhrase(f_num, f_phrase);

		return "redirect:/phrases/list";
	}

}
