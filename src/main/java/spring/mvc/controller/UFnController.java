package spring.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import spring.mvc.dto.ApplicantDto;
import spring.mvc.dto.BoardDto;
import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.ResumeDto;
import spring.mvc.dto.ScrapDto;
import spring.mvc.dto.HeartDto;
import spring.mvc.dto.MessageDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.dto.UserDto;
import spring.mvc.service.BoardService;
import spring.mvc.service.EnterpriseService;
import spring.mvc.service.UFnService;
import spring.mvc.service.UserService;

@Controller
public class UFnController {

   @Autowired
   UFnService uservice;

   @Autowired
   UserService service;
   
	@Autowired
	EnterpriseService e_service;
	
	@Autowired
	BoardService bservice;

   // 마이페이지 이동
   @GetMapping("/mypage")
   public ModelAndView home(HttpSession session, String h_num, String s_um) {
      ModelAndView model = new ModelAndView();
      String u_id = (String) session.getAttribute("loginId");
      String loginStatus = (String) session.getAttribute("loginStatus");
      UserDto dto = service.findUserdataById(u_id);
      ResumeDto rdto = uservice.getResume(dto.getU_num());
      List<ResumeDto> list=uservice.getMyResume(dto.getU_num());
      //List<Map<String, Object>> getEnterlist =uservice.getLikeEnterprise(u_id); //기업데이터
      List<EnterpriseDto> getMypageLikeEnter=uservice.getMypageLikeEnter(dto.getU_num());//세션의 아이디 통해 dto를 갖고오고 그 dto통해 U_num갖고오기, U_num통해 관심 기업과 관심 공고 갖고옴
      List<Map<String, Object>> getMypageScrapPosting=uservice.getMypageScrapPosting(dto.getU_num());
      List <BoardDto>getMypageBoard= bservice.getMypageBoard(u_id);
      
      model.addObject("mlist", uservice.getMessageByUserNum(dto.getU_num()));
      model.addObject("list", list);
      model.addObject("dto", dto);
      model.addObject("rdto", rdto);
      model.setViewName("/user/mypage");
      
      //마이페이지에 관심기업, 관심 공고 불러오기
      model.addObject("getMypageLikeEnter", getMypageLikeEnter);
      model.addObject("getMypageScrapPosting", getMypageScrapPosting);
      model.addObject("getMypageBoard", getMypageBoard);
      //좋아요한 기업 수 
      if (u_id!=null && loginStatus.equals("user")) {
    	  
		 String u_num=service.findUserdataById(u_id).getU_num(); 
		 int countLikeEnter = uservice.countLikeEnterprise(u_num);
		 model.addObject("countLikeEnter", countLikeEnter);
	    
      }
      
      //스크랩한 공고 수
      if (u_id!=null && loginStatus.equals("user")) {
    	  String u_num=service.findUserdataById(u_id).getU_num(); 
	      int countPosting = uservice.countScrapPosting(u_num);
	      model.addObject("countPosting", countPosting);
      }
      
      
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
	public ModelAndView insertResume(HttpSession session) {
	    ModelAndView model = new ModelAndView();
	    String u_id = (String) session.getAttribute("loginId");
	    String loginStatus = (String) session.getAttribute("loginStatus");
	    List<ResumeDto> list=uservice.getResumeByUserId(u_id);
	    
	    if(loginStatus==null) {
	    	String loginmessage = "로그인이 필요합니다.";
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
	//수정페이지이동
	@GetMapping("/updateresume")
	public ModelAndView updateResume(HttpSession session, String r_num) {
	    ModelAndView model = new ModelAndView();
	    String u_id = (String) session.getAttribute("loginId");
	    UserDto dto = service.findUserdataById(u_id);
	    ResumeDto rdto = uservice.getResumeOfRNum(r_num);

	    String r_content = rdto.getR_content().replace("<br>", "\r\n");
	    rdto.setR_content(r_content);
	    
	    model.addObject("rdto", rdto);
	    model.addObject("dto", dto);
	    model.setViewName("/user/updateresume");
	    
	    return model;
	}
	
	//내가 쓴 게시글 디테일페이지
	@GetMapping("/myboardlist")
	public ModelAndView myboardlist(HttpSession session,
			  @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		
	      ModelAndView model = new ModelAndView();
	      String myId = (String) session.getAttribute("loginId");
		  String loginStatus = (String) session.getAttribute("loginStatus");
		  UserDto dto = service.findUserdataById(myId);
		  //BoardDto bdto= bservice.getData(myId);
			    String u_num=service.findUserdataById(myId).getU_num();
				//System.out.println(u_num);
				
				 if(myId!=null && loginStatus.equals("user")) {
			
					   
			      	int totalCount = bservice.getCountMypageBoard(myId);	
			      	int totalPage; // 총 페이지수
					int startPage; // 각 블럭(1,2,3..)의 시작페이지
					int endPage;
					
					// 각 블럭의 마지막 페이지
					int start; // 각 페이지의 시작번호
					int perpage = 5; // 한 페이지당 보여질 글 개수
					int perBlock = 5; // 한 블럭당 보여지는 페이지 개수
	
					// 총 페이지 개수
					totalPage = totalCount / perpage + (totalCount % perpage == 0 ? 0 : 1);
	
					// 각 블럭의 시작페이지 -> 현재페이지가 3 -> s:1, e:5 / 6 -> s:6, e:10
					startPage = (currentPage - 1) / perBlock * perBlock + 1;
					endPage = startPage + perBlock - 1;
	
					// 총 페이지가 8이면 (6~10 -> end페이지를 8로 수정)
					if (endPage > totalPage)
						endPage = totalPage;
	
					// 각페이지에서 불러올 시작번호
					start = (currentPage - 1) * perpage;
	
					// 메서드 불러오기
					List<Map<String, Object>> list =bservice.getMypagedetailBoard(dto.getU_id(), start, perpage);
					
					// 게시글 앞에 붙을 번호
					int no = totalCount - (currentPage - 1) * perpage;
					
					// 출력에 필요한 변수들 model에 저장
					model.addObject("u_num", u_num);
					model.addObject("totalCount", totalCount);
					model.addObject("list", list);
					model.addObject("totalPage", totalPage);
					model.addObject("startPage", startPage);
					model.addObject("endPage", endPage);
					model.addObject("perBlock", perBlock);
					model.addObject("currentPage", currentPage);
					model.addObject("no", no);
					model.setViewName("/user/myboardlist");
		  
	
				 }
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
   //이력서 삭제
   @GetMapping("/deleteResume")
   @ResponseBody
   public void deleteResume(String r_num) {
	   uservice.deleteResume(r_num);
   }
   
   @PostMapping("/insertResume")
   public String insert(ResumeDto dto, String r_content) {
	   r_content = r_content.replace("\r\n","<br>");
	   dto.setR_content(r_content);
      uservice.insertResume(dto);
      return "redirect:resumelist";
   }
   @PostMapping("/updateResume")
   public String update(ResumeDto dto, String r_content) {
	   r_content = r_content.replace("\r\n","<br>");
	   dto.setR_content(r_content);
	   uservice.updateResume(dto);
	   return "redirect:resumelist";
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
	@ResponseBody
	@PostMapping("/updateMainOff")
	public void updateMainOff(int r_num) {
		uservice.updateMainOff(r_num);
	}
	@ResponseBody
	@PostMapping("/updateMainOn")
	public void updateMainOn(int r_num, HttpSession session) {
		String u_id = (String) session.getAttribute("loginId");
	    UserDto dto = service.findUserdataById(u_id);
		uservice.updateAllOff(dto.getU_num());
		uservice.updateMainOn(r_num);
	}
	
	@GetMapping("/mymessage")
	public ModelAndView getAllMessages(HttpSession session) {
		ModelAndView model = new ModelAndView();
		
		String loginId = (String) session.getAttribute("loginId");
		UserDto udto = service.findUserdataById(loginId);
		
		model.addObject("list", uservice.getMessageByUserNum(udto.getU_num()));
		model.setViewName("/user/mymessage");
		return model;
	}

	// 사진 등록
	@PostMapping("/updatePhoto")
	@ResponseBody
	public void photoUpload(MultipartFile u_photo, HttpSession session) {
	   // 업로드될 경로 구하기
	   String path = session.getServletContext().getRealPath("/photo");
	   
	   String u_id = (String) session.getAttribute("loginId");
	   UserDto dto = service.findUserdataById(u_id);
	   // 파일명 구하기
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	   String fileName = "f_" + sdf.format(new Date()) + u_photo.getOriginalFilename();

	   try {
	      u_photo.transferTo(new File(path + "\\" + fileName));

	      // 이전 사진 파일 삭제
	      String previousFileName = dto.getU_photo(); // 이전 사진 파일 이름 가져오기
	      if (previousFileName != null) {
	         String previousFilePath = path + "\\" + previousFileName;
	         File previousFile = new File(previousFilePath);
	         if (previousFile.exists()) {
	            previousFile.delete();
	         }
	      }

	      uservice.updatePhoto(u_id, fileName);

	   } catch (IllegalStateException | IOException e) {
	      e.printStackTrace();
	   }
	}
   
   
   // 관심기업페이지
   @GetMapping("/enterLike")
   public ModelAndView likeEnterList(HttpSession session, 
		   @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

      ModelAndView model = new ModelAndView();
      String myId = (String) session.getAttribute("loginId");
	  String loginStatus = (String) session.getAttribute("loginStatus");

	  if(myId!=null && loginStatus.equals("user")) {
		  
		  String u_num=service.findUserdataById(myId).getU_num();
		  
	      	int totalCount = uservice.countLikeEnterprise(u_num);

			int totalPage; // 총 페이지수
			int startPage; // 각 블럭(1,2,3..)의 시작페이지
			int endPage;
			
			// 각 블럭의 마지막 페이지
			int start; // 각 페이지의 시작번호
			int perpage = 5; // 한 페이지당 보여질 글 개수
			int perBlock = 5; // 한 블럭당 보여지는 페이지 개수

			// 총 페이지 개수
			totalPage = totalCount / perpage + (totalCount % perpage == 0 ? 0 : 1);

			// 각 블럭의 시작페이지 -> 현재페이지가 3 -> s:1, e:5 / 6 -> s:6, e:10
			startPage = (currentPage - 1) / perBlock * perBlock + 1;
			endPage = startPage + perBlock - 1;

			// 총 페이지가 8이면 (6~10 -> end페이지를 8로 수정)
			if (endPage > totalPage)
				endPage = totalPage;

			// 각페이지에서 불러올 시작번호
			start = (currentPage - 1) * perpage;

			// 메서드 불러오기
			List<Map<String, Object>> list =uservice.getLikeEnterprise(u_num, start, perpage); //기업데이터

			// 게시글 앞에 붙을 번호
			int no = totalCount - (currentPage - 1) * perpage;
			
			// 출력에 필요한 변수들 model에 저장
			model.addObject("u_num", u_num);
			model.addObject("totalCount", totalCount);
			model.addObject("list", list);
			model.addObject("totalPage", totalPage);
			model.addObject("startPage", startPage);
			model.addObject("endPage", endPage);
			model.addObject("perBlock", perBlock);
			model.addObject("currentPage", currentPage);
			model.addObject("no", no);
			model.setViewName("/user/likeenterprise");
	      
	      uservice.deleteLikeEnter(u_num);
	  }
	  
	  
	  //System.out.println(u_num);
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
	
	
	//관심 공고(스크랩)페이지
	@GetMapping("/scrap")
	public ModelAndView ScrapList(HttpSession session,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		
		  ModelAndView model=new ModelAndView();
		  String myId=(String) session.getAttribute("loginId"); 
		  String loginStatus=(String) session.getAttribute("loginStatus");
		 
		
		  if(myId!=null && loginStatus.equals("user")) {
		  
		  String u_num=service.findUserdataById(myId).getU_num();
		  int totalCount  = uservice.countScrapPosting(u_num);
		  
		  	int totalPage; // 총 페이지수
			int startPage; // 각 블럭(1,2,3..)의 시작페이지
			int endPage;
			
			// 각 블럭의 마지막 페이지
			int start; // 각 페이지의 시작번호
			int perpage = 5; // 한 페이지당 보여질 글 개수
			int perBlock = 5; // 한 블럭당 보여지는 페이지 개수

			// 총 페이지 개수
			totalPage = totalCount / perpage + (totalCount % perpage == 0 ? 0 : 1);

			// 각 블럭의 시작페이지 -> 현재페이지가 3 -> s:1, e:5 / 6 -> s:6, e:10
			startPage = (currentPage - 1) / perBlock * perBlock + 1;
			endPage = startPage + perBlock - 1;

			// 총 페이지가 8이면 (6~10 -> end페이지를 8로 수정)
			if (endPage > totalPage)
				endPage = totalPage;

			// 각페이지에서 불러올 시작번호
			start = (currentPage - 1) * perpage;
			
			// 메서드 불러오기
			List<Map<String, Object>> list =uservice.getScrapPosting(u_num, start, perpage); //기업데이터
			
			// 게시글 앞에 붙을 번호
			int no = totalCount - (currentPage - 1) * perpage;
			
			// 출력에 필요한 변수들 model에 저장
			model.addObject("u_num", u_num);
			model.addObject("totalCount", totalCount);
			model.addObject("list", list);
			model.addObject("totalPage", totalPage);
			model.addObject("startPage", startPage);
			model.addObject("endPage", endPage);
			model.addObject("perBlock", perBlock);
			model.addObject("currentPage", currentPage);
			model.addObject("no", no);
			model.setViewName("/user/likescrap");
		  }
		  
		return model;
	}
	
	//버튼 누르면 SCRAP 테이블에 데이터 insert
	@PostMapping("/sinsert")
	@ResponseBody
	public void ScrapPosting(ScrapDto dto) {
		
		uservice.insertScrapPosting(dto);
	}
	
	// 버튼 누르면 SCRAP 테이블에 데이터 delete
	@GetMapping("/sdelete")
	@ResponseBody
	public void deleteScrapPosting(String s_num) {

		uservice.deleteScrapPosting(s_num);
	}
	
	//지원 현황
	//지원 취소
	@GetMapping("/adelete")
	@ResponseBody
	public void deleteApply(String a_num) {
		uservice.deleteApply(a_num);
	}
	
	//지원 현황 리스트
	@GetMapping("/applicationstate")
	public ModelAndView applicationList(HttpSession session, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		
		ModelAndView model=new ModelAndView();
		String myId = (String) session.getAttribute("loginId");
		String loginStatus = (String) session.getAttribute("loginStatus");
		
		if (myId!=null && loginStatus.equals("user")) {
			
			String u_num = service.findUserdataById(myId).getU_num();
			int totalCount = uservice.countApplicantList(u_num);

			int totalPage; // 총 페이지수
			int startPage; // 각 블럭(1,2,3..)의 시작페이지
			int endPage;
			
			// 각 블럭의 마지막 페이지
			int start; // 각 페이지의 시작번호
			int perpage = 5; // 한 페이지당 보여질 글 개수
			int perBlock = 5; // 한 블럭당 보여지는 페이지 개수

			// 총 페이지 개수
			totalPage = totalCount / perpage + (totalCount % perpage == 0 ? 0 : 1);

			// 각 블럭의 시작페이지 -> 현재페이지가 3 -> s:1, e:5 / 6 -> s:6, e:10
			startPage = (currentPage - 1) / perBlock * perBlock + 1;
			endPage = startPage + perBlock - 1;

			// 총 페이지가 8이면 (6~10 -> end페이지를 8로 수정)
			if (endPage > totalPage)
				endPage = totalPage;

			// 각페이지에서 불러올 시작번호
			start = (currentPage - 1) * perpage;

			// 메서드 불러오기
			List<Map<String, Object>> list =uservice.getApplicantList(u_num, start, perpage);
			
			// 게시글 앞에 붙을 번호
			int no = totalCount - (currentPage - 1) * perpage;
			
			// 출력에 필요한 변수들 model에 저장
			model.addObject("u_num", u_num);
			model.addObject("totalCount", totalCount);
			model.addObject("list", list);
			model.addObject("totalPage", totalPage);
			model.addObject("startPage", startPage);
			model.addObject("endPage", endPage);
			model.addObject("perBlock", perBlock);
			model.addObject("currentPage", currentPage);
			model.addObject("no", no);
			model.setViewName("/user/applicationstate");
		}
		
		return model;
	}
	
	
	
	//맞춤 일자리
	//맞춤 일자리 리스트
	@GetMapping("/customjob")
	public String customList() {
		
		return "/customjob/customjob";
	}
	
	
	@GetMapping("/customjobaction")
	@ResponseBody
	public List<Map<String, Object>> customListAction(@RequestParam(value = "p_type", required = false) String p_type) {
		String [] p_types=p_type.split(",");

		List<Map<String, Object>> list=new ArrayList<>();
			
		for(String a:p_types) {
			Map<String, Object> map=new HashMap<>();
		  	map.put("list", uservice.searchCustomJobList(a));
		  	list.add(map);
		}

		return list;
	}
		

}