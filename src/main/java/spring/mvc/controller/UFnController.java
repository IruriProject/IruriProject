package spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UFnController {

	@GetMapping("/mypage")
	public String home() {
		return "/user/mypagetest";
	}
	@GetMapping("/updatephoto")
	public String uphoto() {
		return "/user/updatephoto";
	}
	@GetMapping("/edit")
	public String euser() {
		return "/user/editmain";
	}
	
}
