package spring.mvc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.UserDto;
import spring.mvc.service.EnterpriseService;
import spring.mvc.service.UserService;

@Controller
public class JoinController {
	
	@Autowired
	UserService service;
	
	@Autowired
	EnterpriseService eservice;

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
	
	//개인 로그인
	@PostMapping("/login/user")
	public String loginUser(@RequestParam String u_id,
			@RequestParam String u_pw,
			HttpSession session,
			Model model) {
		
		int logincheck=service.userIdPassCheck(u_id, u_pw);
		
		if (logincheck==1) { //로그인 성공시 세션 저장
			session.setMaxInactiveInterval(60*60*8); //8시간 세션저장
			
			session.setAttribute("loginId", u_id);
			session.setAttribute("loginStatus", "user");
			
			//id에 대한 데이터
			UserDto dto=service.findUserdataById(u_id);
			session.setAttribute("loginName", dto.getU_name());
			
			return "redirect:/";
		
		}else { //로그인 실패시 
			
			return "/join/passfail";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginId");
		session.removeAttribute("loginStatus");
		session.removeAttribute("loginName");
		
		return "redirect:/";
	}

	//기업 로그인
	@PostMapping("/login/enterprise")
	public String loginEnterprise(@RequestParam String e_id,
			@RequestParam String e_pw,
			HttpSession session,
			Model model) {
		
		int logincheck=eservice.enterIdPassCheck(e_id, e_pw);
		
		if (logincheck==1) { //로그인 성공시 세션 저장
			session.setMaxInactiveInterval(60*60*8); //8시간 세션저장
			
			session.setAttribute("loginId", e_id);
			session.setAttribute("loginPw", e_pw);
			session.setAttribute("loginStatus", "enterprise");
			
			//id에 대한 데이터
			EnterpriseDto dto=eservice.findEnterdataById(e_id);
			session.setAttribute("loginName", dto.getE_name());
			
			return "redirect:/";
		
		}else { //로그인 실패시 
			
			return "/join/passfail";
		}
		
	}
	
	//개인 회원가입
	@PostMapping("/join/action")
	public String joinUser(UserDto dto,
			String addr1, String addr2, String addr3) {
		
		String addr=addr1+" "+addr2+" "+addr3;
		dto.setU_addr(addr);
		
		service.joinUser(dto);
		
		return "/join/joinPassSuccess";
	}
	
	//기업 회원가입
	@PostMapping("/join/action/enter")
	public String joinUser(EnterpriseDto dto,
			String addr1, String addr2, String addr3) {
		
		String addr=addr1+" "+addr2+" "+addr3;
		dto.setE_addr(addr);
		
		eservice.joinEnterprise(dto);
		
		return "/join/joinPassSuccess";
	}
	
	//회원가입 상세-유저 아이디 중복체크
	@GetMapping("/user/idcheck")
	@ResponseBody
	public Map<String, Integer> userIdCheck(String u_id) {
		
		Map<String, Integer> map=new HashMap<>();
		map.put("count", service.getSearchId(u_id));
		return map;
	}
	
}
