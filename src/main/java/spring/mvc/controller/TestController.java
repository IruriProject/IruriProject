package spring.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.dto.ApplicantDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.service.EFnService;
import spring.mvc.service.TestService;

@Controller
public class TestController {

	@Autowired
	TestService service;

	@Autowired
	EFnService eservice;
	
	@GetMapping("/")
	public String start(Model model) {
		
		 List<PostingDto> recentPostings = eservice.recentPosting();
		
		 
	     model.addAttribute("recentPostings", recentPostings);

		
		return "/layout/main";
	}


}
