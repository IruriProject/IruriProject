package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import spring.mvc.service.UserService;

@Controller
public class JoinController {
	
	@Autowired
	UserService service;

	@GetMapping("/join")
	public String joinPage() {
		return "/join/select";
	}
	
	@GetMapping("/join/user")
	public String userJoin() {
		return "/join/userJoin";
	}
	
	@GetMapping("/join/enterprise")
	public String enterpriseJoin() {
		return "/join/enterpriseJoin";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "/join/login";
	}
	
}
