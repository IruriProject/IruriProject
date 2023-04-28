package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import spring.mvc.service.TestService;

@Controller
public class TestController {
	
	@Autowired
	TestService service;

	@GetMapping("/")
	   public String start()
	   {
	      
	      return "/layout/main";
	   }
}
