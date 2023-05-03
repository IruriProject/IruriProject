package spring.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.ResumeDto;
import spring.mvc.dto.UserDto;
import spring.mvc.service.UFnService;
import spring.mvc.service.UserService;

@Controller
public class UFnController {
	
	@Autowired
	UFnService uservice;
	
	@Autowired
	UserService service;
	

	@GetMapping("/mypage")
	public ModelAndView home(HttpSession session) {
		  ModelAndView model = new ModelAndView();
		    String u_id = (String) session.getAttribute("loginId");
		    UserDto dto = service.findUserdataById(u_id);
		    ResumeDto rdto = uservice.getResume(dto.getU_num());
		    model.addObject("dto", dto);
		    model.addObject("rdto", rdto);
		    model.setViewName("/user/mypage");
		return model;
	}
	
	@GetMapping("/update")
	public String update() {
		return "/user/updatemain";
	}
	@GetMapping("/insertresume")
	public ModelAndView insertResume(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		String u_id = (String) session.getAttribute("loginId");
		UserDto dto = service.findUserdataById(u_id);
		model.addObject("dto", dto);
		model.setViewName("/user/insertresume");
		return model;
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
		uservice.updateUser(dto);
		return "redirect:mypage";
	}
	@PostMapping("/updatePhoto")
	@ResponseBody
	public void photoUpload(String u_id, MultipartFile u_photo, HttpSession session) {
		//업로드될 경로 구하기
		String path = session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		//파일명 구하기
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "f_"+sdf.format(new Date())+u_photo.getOriginalFilename();
		
		try {
			u_photo.transferTo(new File(path+"\\"+fileName));
			
			uservice.updatePhoto(u_id, fileName);
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//관심기업페이지
	@GetMapping("/enterLike")
	public ModelAndView likeEnterList(String num) {
			
		ModelAndView model=new ModelAndView();
			
		EnterpriseDto dto=uservice.getEnterPrise(num);
		int countLikeEnter= uservice.countLikeEnterprise(num);
		
		model.addObject("countLikeEnter", countLikeEnter);
		model.addObject("dto", dto);
		model.setViewName("/user/likeenterprise");
			
		return model;
	}
}
