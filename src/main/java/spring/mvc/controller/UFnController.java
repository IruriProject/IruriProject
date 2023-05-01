package spring.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.UserDto;
import spring.mvc.service.UserService;

@Controller
public class UFnController {
	
	@Autowired
	UserService service;

	@GetMapping("/mypage")
	public String home() {
		return "/user/mypage";
	}
	@GetMapping("/update")
	public String update() {
		return "/user/updatemain";
	}
	@GetMapping("/updateuser")
	public ModelAndView uuser(HttpServletRequest request) {
	    ModelAndView model = new ModelAndView();
	    HttpSession session = request.getSession();
	    String u_id = (String) session.getAttribute("loginId");
	    UserDto dto = service.findUserdataById(u_id);
	    model.addObject("dto", dto);
	    model.setViewName("/user/updateuser");
	    return model;
	}
	@PostMapping("/updateUserInfo")
	public String uInfo(UserDto dto, String addr1, String addr2, String addr3) {
		dto.setU_addr(addr1+" "+addr2+" "+addr3);
		service.updateUser(dto);
		System.out.println(dto);
		return "redirect:mypage";
	}
}
