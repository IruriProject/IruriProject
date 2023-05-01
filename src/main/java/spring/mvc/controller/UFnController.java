package spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UFnController {

	@GetMapping("/mypage")
	public String home() {
		return "/user/mypage";
	}
	@GetMapping("/updatephoto")
	public String uphoto() {
		return "/user/updatephoto";
	}
	@GetMapping("/update")
	public String edit() {
		return "/user/updatemain";
	}
	@GetMapping("/update/user")
	public String euser() {
		return "/user/updateuser";
	}
	
}
