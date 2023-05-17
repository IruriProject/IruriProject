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
import spring.mvc.dto.BoardDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.service.BoardService;
import spring.mvc.service.EFnService;
import spring.mvc.service.TestService;

@Controller
public class TestController {

	@Autowired
	TestService service;

	@Autowired
	EFnService eservice;
	
	@Autowired
	BoardService bservice;
	
	@GetMapping("/")
	public String start(@RequestParam (value="currentPage", defaultValue = "1")int currentPage,Model model) {
		
		 List<PostingDto> recentPostings = eservice.recentPosting();
		 List<ApplicantDto> bestPostings = eservice.bestPosting();
		 List<BoardDto> recentboards = bservice.recentBoard();
		 
	     model.addAttribute("recentPostings", recentPostings);
	     model.addAttribute("bestPostings", bestPostings);
	     model.addAttribute("recentboards", recentboards);
	     model.addAttribute("currentPage",currentPage);
		
		return "/layout/main";
	}


}
