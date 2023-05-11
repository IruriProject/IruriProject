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
	public String writephrases(@ModelAttribute FrePhrasesDto dto) {

		List<String> fPhraseList = dto.getFPhraseList();

		for (int i = 0; i < fPhraseList.size(); i++) {
			dto.setF_phrase(fPhraseList.get(i));
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
	
	@GetMapping("/getphrase")
	@ResponseBody
	public FrePhrasesDto getphrase(@RequestParam String f_num){
		return service.getPhrase(f_num);
	}

}
