package spring.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.ResumeDto;
import spring.mvc.dto.HeartDto;
import spring.mvc.dto.UserDto;
import spring.mvc.service.UFnService;
import spring.mvc.service.UserService;

@Controller
public class UFnController {

	@Autowired
	UFnService uservice;

	@Autowired
	UserService service;

	// 마이페이지 이동
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

	// 수정메인페이지 이동
	@GetMapping("/update")
	public ModelAndView update(HttpSession session) {
		ModelAndView model = new ModelAndView();
		String u_id = (String) session.getAttribute("loginId");
		UserDto dto = service.findUserdataById(u_id);
		model.addObject("dto", dto);
		model.setViewName("/user/updatemain");
		return model;
	}

	// 이력서목록 페이지로 이동
	@GetMapping("/resumelist")
	public String list() {
		return "/user/resumelist";
	}

	// 비밀번호변경페이지로 이동
	@GetMapping("/updatepw")
	public ModelAndView upw(HttpSession session) {
		ModelAndView model = new ModelAndView();
		String u_id = (String) session.getAttribute("loginId");
		UserDto dto = service.findUserdataById(u_id);
		model.addObject("dto", dto);
		model.setViewName("/user/updatepw");
		return model;
	}

	// 이력서등록 페이지로 이동
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

	// 개인정보수정페이지로 이동
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

	// 회원탈퇴 페이지로 이동
	@GetMapping("/deleteform")
	public String deleteform(HttpSession session, Model model) {
		String u_id = (String) session.getAttribute("loginId");
		UserDto dto = service.findUserdataById(u_id);
		model.addAttribute("dto", dto);
		return "/user/deletepage";
	}

	//탈퇴
	@PostMapping("/delete")
	public String delete(String u_num, HttpSession session) {
		uservice.deleteUser(u_num);
		session.removeAttribute("loginId");
		session.removeAttribute("loginStatus");
		session.removeAttribute("loginName");
		return "redirect:/";
	}

	// 유저정보 변경
	@PostMapping("/updateUserInfo")
	public String uInfo(UserDto dto, String addr1, String addr2, String addr3) {
		if(addr1!="") {
			dto.setU_addr(addr1 + " " + addr2 + " " + addr3);			
			uservice.updateUser(dto);
			return "redirect:mypage";
		}else {
			uservice.updateUserNoAddr(dto);
			return "redirect:mypage";
		}
	}

	// 비밀번호 변경
	@PostMapping("/updatePw")
	public String uPw(String u_id, String u_pw) {
		uservice.updatePw(u_id, u_pw);
		return "redirect:mypage";
	}

	// 사진등록
	@PostMapping("/updatePhoto")
	@ResponseBody
	public void photoUpload(String u_id, MultipartFile u_photo, HttpSession session) {
		// 업로드될 경로 구하기
		String path = session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		// 파일명 구하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "f_" + sdf.format(new Date()) + u_photo.getOriginalFilename();

		try {
			u_photo.transferTo(new File(path + "\\" + fileName));

			uservice.updatePhoto(u_id, fileName);

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 관심기업페이지
	@GetMapping("/enterLike")
	public ModelAndView likeEnterList(String num) {

		ModelAndView model = new ModelAndView();

		EnterpriseDto dto = uservice.getEnterPrise(num);
		int countLikeEnter = uservice.countLikeEnterprise(num);

		model.addObject("countLikeEnter", countLikeEnter);
		model.addObject("dto", dto);
		model.setViewName("/user/likeenterprise");

		return model;
	}

	// 버튼 누르면 좋아요 테이블에 데이터 insert
	@PostMapping("/hinsert")
	@ResponseBody
	public void likeEnterPrise(@RequestParam String e_num, @RequestParam String u_id) {

		UserDto udto = service.findUserdataById(u_id);// UserService의 findUserdataById라는 u_id로 dto를 찾는 sql을 불러와 이 dto를
														// UserDto의 udto라고 말해준다
		String u_num = udto.getU_num();// 그리고 그 udto의 U_num을 갖고와 u_num이라고 저장해준다
		HeartDto hdto = new HeartDto();// HeartDto를 hdto라고 말해준다
		hdto.setU_num(u_num);// 위에서 말해준 u_num을 hdto의 U_num이라는 공간에다가 넣어준다(데이터를 넣어준다고 생각하면 됨)
		hdto.setE_num(e_num);// e_num은 detailpage에서 받아올 수 있는 것이므로(dto.e_num으로 가져왔기 때문에) hdto의 E_num자리에 e_num을
								// 넣어준다
		uservice.insertlikeEnter(hdto);// uservice의 insert하는 sql불러와줌(넣어짐)

		System.out.println(e_num);
		System.out.println(u_id);
	}

	// 버튼 누르면 좋아요 테이블에 데이터 delete
	@GetMapping("/likeEnter")
	@ResponseBody
	public void deleteLikeEnter(String num) {

		uservice.deleteLikeEnter(num);
	}

}
