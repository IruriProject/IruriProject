package spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EnterpriseController {

	@GetMapping("/posting")
	public String posting() {
		return "/posting/search";
	}
}
