package spring.mvc.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import spring.mvc.controller.kakaoApi.KakaoLoginBO;
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
	
	@Autowired
    private KakaoLoginBO kakaoLoginBO;

	private String apiResult = null;
	
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
	public String loginPage(Model model, HttpSession session) {
		
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
        System.out.println("카카오:" + kakaoAuthUrl);
        model.addAttribute("urlKakao", kakaoAuthUrl);
        
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
	
	/////////////kakao
    @RequestMapping(value = "/callback/kakaotalk", method = {RequestMethod.GET, RequestMethod.POST})
    public String callbackKakao(Model model, @RequestParam String code, @RequestParam(value="state", required=false) String state, HttpSession session) throws Exception {

        System.out.println("카카오 로그인 성공 callbackKakao");
        OAuth2AccessToken oauthToken;
        oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
        apiResult = kakaoLoginBO.getUserProfile(oauthToken);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;

        jsonObj = (JSONObject) jsonParser.parse(apiResult);
        JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");
        JSONObject response_obj2 = (JSONObject) response_obj.get("profile");

        String email = (String) response_obj.get("email"); //선택동의
        String nickname = (String) response_obj2.get("nickname"); //필수동의

        //일반회원가입으로 가입된 이메일이 있다면 가입 거절
        if(service.userSearchEmail(email)== 1 && service.findUserByEmail(email).getU_pw()!=null) { 
        	return "redirect:/callback/kakaotalk/duplicatedemail";
        	
        //없는 경우 가입 진행 + 로그인
        }else {
	    	
	    	//email 있으면 1 없으면 0반환
	    	if (service.userSearchEmail(email) ==0) { //첫 로그인 ->회원가입 진행
	    		
		    	UserDto userDto = new UserDto();
		    	userDto.setU_id(email);
		    	userDto.setU_email(email);
		    	userDto.setU_name(nickname);
		
		    	session.setAttribute("loginStatus", "user");
		    	session.setAttribute("loginId", email);
		    	session.setAttribute("loginName", nickname);
	    		
	    		service.joinUser(userDto); //db저장
	    		String u_num=service.findUserByEmail(email).getU_num();
	    		return "/updateuser";
	    		
	    	}else { //가입된 아이디 존재 ->로그인 후 홈으로 이동
	    		
		    	session.setAttribute("loginStatus", "user");
		    	session.setAttribute("loginId", email);
		    	session.setAttribute("loginName", nickname);
		    	
	    		return "redirect:/";
	    	}
        }
        
    }
    
    @GetMapping("/callback/kakaotalk/duplicatedemail")
    public String kakaoFail() {
    	return "/join/kakaoFail";
    }
    @GetMapping("/join/kakaoCheck")
    public String kakaoCheck() {
    	return "/join/kakaoUserformCheck";
    }
    
   @GetMapping("/emailcheck")
   @ResponseBody
   public int emailCheck(String u_email){
	   return service.userSearchEmail(u_email);
   }

}
