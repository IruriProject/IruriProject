package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import spring.mvc.dto.ApplicantDto;
import spring.mvc.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService service;

	@PostMapping("/apply")
	public String applyResume(ApplicantDto dto) {
		service.insertResume(dto);
		
		return "redirect:/";
	}
}
