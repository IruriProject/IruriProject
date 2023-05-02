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
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.service.EFnService;
import spring.mvc.service.EnterpriseService;

@Controller
@RequestMapping("/posting")
public class EFnController {

	@Autowired
	EFnService service;

	@Autowired
	EnterpriseService e_service;
	
	@GetMapping("")
	public String posting() {
		return "/posting/search";
	}

	@GetMapping("/write")
	public String writeForm(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto e_dto = e_service.findEnterdataById(loginId);

		model.addAttribute("enterNum", e_dto.getE_num());

		return "/posting/writeForm";
	}

	@GetMapping("/detailpage")
	public ModelAndView detailPage(String p_num) {
		ModelAndView mview = new ModelAndView();

		mview.addObject("dto", service.getPosting(p_num));
		mview.setViewName("/posting/detailPage");

		return mview;
	}

	@PostMapping("/writeposting")
	public String writeposting(@ModelAttribute PostingDto dto) {
		service.insertPosting(dto);

		return "redirect:/";
	}
	
	@GetMapping("/updateStatus")
	public String updatePostingStatus(@RequestParam String p_status, @RequestParam String p_num) {
		Map<String, String> map=new HashMap<>();
		map.put("p_status", p_status);
		map.put("p_num", p_num);
		
		service.updatePostingStatus(map);
		
		return "redirect:../enterprise";
		
	}

}
