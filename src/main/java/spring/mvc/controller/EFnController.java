package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.service.EFnService;

@Controller
@RequestMapping("/posting")
public class EFnController {

	@Autowired
	EFnService service;

	@GetMapping("/insertForm")
	public String insertForm() {
		return "/posting/InsertForm";
	}

	@GetMapping("/DetailPage")
	public ModelAndView DetailPage(String p_num) {
		ModelAndView mview = new ModelAndView();

		mview.addObject("dto", service.getPosting(p_num));
		mview.setViewName("/posting/DetailPage");

		return mview;
	}

}
