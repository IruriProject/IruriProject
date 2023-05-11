package spring.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.ResumeDto;
import spring.mvc.dto.ScrapDto;
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
      List<ResumeDto> list=uservice.getMyResume(dto.getU_num());
      
      model.addObject("list", list);
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
	public ModelAndView insertResume(HttpServletRequest request, HttpSession session) {
	    ModelAndView model = new ModelAndView();
	    String u_id = (String) session.getAttribute("loginId");
	    String loginStatus = (String) session.getAttribute("loginStatus");
	    List<ResumeDto> list=uservice.getResumeByUserId(u_id);
	    
	    if(loginStatus==null) {
	    	String loginmessage = "로그인 후 사용 가능합니다.";
	    	model.addObject("loginmessage", loginmessage);
	    }
	    if (list.size()> 4) {
	        String message = "이력서는 최대 5개까지만 저장됩니다. \\n이력서 관리페이지로 이동합니다.";
	        model.addObject("message", message);
	    } else {
	        UserDto dto = service.findUserdataById(u_id);
	        model.addObject("dto", dto);
	    }
	    model.setViewName("/user/insertresume");
	    return model;
	}
	@GetMapping("/resumelist")
	public ModelAndView resumeList(HttpSession session) {
		 ModelAndView model=new ModelAndView();
		 String u_id = (String) session.getAttribute("loginId");
		 UserDto dto = service.findUserdataById(u_id);
		 List<ResumeDto> list=uservice.getMyResume(dto.getU_num());
		 ResumeDto rdto = uservice.getResume(dto.getU_num());
		 
		 model.addObject("rdto", rdto);
		 model.addObject("dto", dto);
		 model.addObject("list", list);
		 model.setViewName("/user/resumelist");
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
   @PostMapping("/insertResume")
   public String insert(ResumeDto dto) {
      uservice.insertResume(dto);
      return "redirect:mypage";
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
	
	@PostMapping("/updatePrivate")
	public String updatePrivate(int r_num) {
		uservice.updatePrivate(r_num);
		return "redirect:resumelist";
	}
	
	@PostMapping("/updatePublic")
	public String updatePublic(int r_num) {
		uservice.updatePublic(r_num);
		return "redirect:resumelist";
	}
	@PostMapping("/updateMainOff")
	public String updateMainOff(int r_num) {
		uservice.updateMainOff(r_num);
		return "redirect:resumelist";
	}
	@PostMapping("/updateMainOn")
	public String updateMainOn(int r_num) {
		uservice.updateAllOff();
		uservice.updateMainOn(r_num);
		return "redirect:resumelist";
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

	// 버튼 누르면 HEART 테이블에 데이터 insert
	@PostMapping("/hinsert")
	@ResponseBody
	public void likeEnterPrise(HeartDto dto) {

		uservice.insertlikeEnter(dto);// uservice의 insert하는 sql불러와줌(넣어짐)

	}

	// 버튼 누르면 HEART 테이블에 데이터 delete
	@GetMapping("/hdelete")
	@ResponseBody
	public void deleteLikeEnter(String h_num) {

		uservice.deleteLikeEnter(h_num);
	}
	
	
	//관심 공고(스크랩)
	// 관심공고페이지-아직
	/*
	 * @GetMapping("/enterScrap") public ModelAndView ScrapPostingList(String num) {
	 * 
	 * ModelAndView model = new ModelAndView();
	 * 
	 * EnterpriseDto dto = uservice.getEnterPrise(num); int countLikeEnter =
	 * uservice.countLikeEnterprise(num);
	 * 
	 * model.addObject("countLikeEnter", countLikeEnter); model.addObject("dto",
	 * dto); model.setViewName("/user/likeenterprise");
	 * 
	 * return model; }
	 */
	
		// 버튼 누르면 SCRAP 테이블에 데이터 delete
		@GetMapping("/ScrapPosting")
		@ResponseBody
		public void deleteScrapPosting(String s_num) {

			//uservice.deleteScrapPosting(s_num);
		}
		

}