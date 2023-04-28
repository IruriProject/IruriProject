package spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/posting")
public class EFnController {
	
	@GetMapping("/insertForm")
	public String insertForm() {
		return "/posting/InsertForm";
	}
	
	@GetMapping("/DetailPage")
	public String DetailPage() {
		return "/posting/DetailPage";
	}

}
