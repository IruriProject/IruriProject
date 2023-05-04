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
import spring.mvc.dto.MessageDto;
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

	@PostMapping("/writeposting")
	public String writeposting(@ModelAttribute PostingDto dto) {
		service.insertPosting(dto);

		return "redirect:/";
	}

	@GetMapping("/detailpage")
	public ModelAndView detailPage(String p_num) {
		ModelAndView mview = new ModelAndView();

		mview.addObject("dto", service.getPosting(p_num));
		mview.setViewName("/posting/detailPage");

		return mview;
	}

	@GetMapping("/updateStatus")
	public String updatePostingStatus(@RequestParam String p_status, @RequestParam String p_num) {
		Map<String, String> map = new HashMap<>();
		map.put("p_status", p_status);
		map.put("p_num", p_num);

		service.updatePostingStatus(map);

		return "redirect:../enterprise";
	}

	@GetMapping("/confirmpw")
	public String confirmpw(@RequestParam String p_num, Model model) {
		model.addAttribute("p_num", p_num);

		return "/posting/confirmPw";
	}

	@PostMapping("/confirmpwAction")
	public String confirmpassAction(@RequestParam String p_num, @RequestParam String inputpw, HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");
		EnterpriseDto dto = e_service.findEnterdataById(loginId);

		if (inputpw.equals(dto.getE_pw())) {

			service.deletePosting(p_num);

			return "redirect:/enterprise";

		} else
			return "/enterprise/confirmFail";

	}

	@GetMapping("/update")
	public ModelAndView updateForm(@RequestParam String p_num) {
		ModelAndView mview = new ModelAndView();
		mview.addObject("dto", service.getPosting(p_num));
		mview.setViewName("/posting/updateForm");
		return mview;
	}

	@PostMapping("/updateposting")
	public String updateAction(@ModelAttribute PostingDto dto) {

		service.updatePosting(dto);

		return "redirect:/posting/detailpage?p_num=" + dto.getP_num();

	}

	
	//쪽지
	@GetMapping("/messagedetail")
	public ModelAndView messagedetail(@RequestParam String m_num) {
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("dto", service.getMessage(m_num));
		mview.setViewName("/message/detailPage");

		return mview;

	}
	
	@GetMapping("/writemessage")
	public String writemessageForm(HttpSession session, Model model) {
		
		String loginId=(String)session.getAttribute("loginId");
		EnterpriseDto edto= e_service.findEnterdataById(loginId);
		
		model.addAttribute("edto", edto);
		
		
		return "/message/writeForm";
	}
	
	@PostMapping("/writemessageAction")
	public String writemessageAction(@ModelAttribute MessageDto dto) {
		service.insertMessage(dto);
		
		return "redirect:/enterprise";
	}
	
	@GetMapping("/allMessages")
	public ModelAndView allMessages(HttpSession session) {
		ModelAndView mview=new ModelAndView();
		
		String loginId=(String)session.getAttribute("loginId");
		EnterpriseDto dto= e_service.findEnterdataById(loginId);
		
		mview.addObject("list", service.getAllMessages(dto.getE_num()));
		mview.setViewName("/message/messageList");
		
		return mview;
	}
}
