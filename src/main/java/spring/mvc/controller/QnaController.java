package spring.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import spring.mvc.dto.BCommentDto;
import spring.mvc.dto.BoardDto;
import spring.mvc.dto.QCommentDto;
import spring.mvc.dto.QnaDto;
import spring.mvc.mail.MailSender;
import spring.mvc.mapper.QnaMapperInter;
import spring.mvc.service.QnaService;
import spring.mvc.service.UserService;

@Controller
public class QnaController {

	
	@Autowired
	QnaMapperInter mapper;
	
	@Autowired
	QnaService qservice;
	
	@Autowired
	UserService uservice;

	//user
	@PostMapping("/qna/insertQna")
	public String insertQna(@ModelAttribute QnaDto qdto, 
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session)
	{
		
		//세션에 로그인한 아이디 얻기 
		String myid=(String)session.getAttribute("loginId");

		//아이디 넘겨서 num값 얻기 	
		//String usernum = uservice.findUserdataById(myid).getU_num();

		qdto.setQ_loginid(myid);
	
		String path= session.getServletContext().getRealPath("/photo");

		//System.out.println(path);

		String uploadName="";

		int idx=1;

		if(upload.get(0).getOriginalFilename().equals("")) 
			uploadName="no"; 
		else {
			for(MultipartFile f:upload) { 
				SimpleDateFormat sdf= new
						SimpleDateFormat("yyyyMMddHHmmss");
				String fName=idx++ +"_"+sdf.format(new
						Date())+"_"+f.getOriginalFilename(); 
				uploadName+=fName+","; //누적
				
				//업로드 
				try { f.transferTo(new File(path+"\\"+fName));
				} catch  (IllegalStateException | IOException e) { // TODO Auto-generated catch block
					e.printStackTrace(); }

			}

			//마지막 컴마제거 
			uploadName=uploadName.substring(0, uploadName.length()-1); }

		qdto.setQ_file(uploadName);
		
		mapper.insertQna(qdto);

		return "redirect:qnawriteform";
	}
	
	@GetMapping("/qna/qnawriteform")
	public ModelAndView qnalist(@RequestParam (value="currentPage", defaultValue = "1")int currentPage,
			HttpSession session) {

		ModelAndView model=new ModelAndView();

		//세션에 로그인한 아이디 얻기 
		String myid=(String)session.getAttribute("loginId");

		int usertotalCount=qservice.getQnaUserTotalCount(myid);
		int totalPage; //총 페이지수
		int startPage; //각 블럭의 시작페이지
		int endPage; //각 블럭의 끝페이지
		int start;    //각 페이지의 시작번호
		int perPage=10; //한 페이지에 보여질 글의 갯수
		int perBlock=5; //한 블럭당 보여지는 페이지 갯수

		//user
		//총 페이지 갯수     
		totalPage=usertotalCount/perPage+(usertotalCount%perPage==0?0:1);
		//각 블럭의 시작페이지
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;

		//총페이지=8일 경우 endpage를 8로 수정한다.     
		if(endPage>totalPage)
			endPage=totalPage;

		//각 페이지에서 불러올 시작번호
		start=(currentPage-1)*perPage;

		//각 페이지에서 필요한 게시글 가져오기
		List<QnaDto> list=qservice.getList(start, perPage);

	    for (QnaDto qnaDto : list) {
	        QCommentDto qc_dto = new QCommentDto();
	        qc_dto.setQ_num(qnaDto.getQ_num());
	        String qnum = qc_dto.getQ_num();
	        int qnaCount = qservice.countqnum(qnum);
	        
	        // QnaDto에 qnaCount 값을 저장
	        qnaDto.setQnaCount(qnaCount);
	        //System.out.println(qnaCount);
	    }
	    
	    
		//각 페이지에 출력할 시작번호
		int no=usertotalCount-(currentPage-1)*perPage;

		//출력에 필요한 변수들을 model에 저장
		model.addObject("usertotalCount", usertotalCount);
		model.addObject("list", list);
		model.addObject("totalPage", totalPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("perBlock", perBlock);
		model.addObject("currentPage", currentPage);
		model.addObject("no", no);

		model.setViewName("/qna/qnawriteform");
		return model;

	}

	
	@GetMapping("/qna/detailqna")
	public ModelAndView detailqna(@RequestParam String q_num,
			@RequestParam(defaultValue = "1") int currentPage)
	{
		ModelAndView mview= new ModelAndView();
		
		QnaDto qdto= qservice.getData(q_num);
	
		List<QnaDto> fileList= mapper.getAllfiles(q_num);
		List<String> fileUrls = new ArrayList<>(); // 이미지 URL을 담을 리스트
	
		for(QnaDto dto:fileList)
		{
			String [] files=dto.getQ_file().split(",");
			for(String file : files) {
		        fileUrls.add(file); // URL을 리스트에 추가
		    }
			//dto.setB_photo(photos[0]);
		}
		
		
		int qnaCount= qservice.countqnum(q_num);
		
		
		//업로드파일의 확장자
		int dotLoc =qdto.getQ_file().lastIndexOf('.'); //마지막 .의 위치
		String ext= qdto.getQ_file().substring(dotLoc+1); //현재위치 다음부터 끝까지 // . 의 다음글자부터 끝까지 추출 (.은 포함되면 안되기때문)
		
		//System.out.println(dotLoc+","+ext);
		
		if(ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("gif") || ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("jpeg"))
			mview.addObject("b_photo", true);
		else
			mview.addObject("b_photo", false); // 이미지 인지 아닌지를 보고 출력하기 위해서
		
		mview.addObject("qnaCount",qnaCount);
		mview.addObject("qdto", qdto);
		mview.addObject("fileUrls", fileUrls); // 이미지 URL 리스트 추가
		//mview.addObject("photoList", photoList); // 이미지 파일명 리스트 추가
		mview.addObject("currentPage", currentPage);
		mview.setViewName("/qna/detailqna");
		
		return mview;
	}
	
	@GetMapping("/qna/delete")
	public String delete(String q_num, HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/photo");
		String uploadfile= mapper.getData(q_num).getQ_file();
		
		
		File file= new File(path+"\\"+uploadfile);
		file.delete();
		
		mapper.deleteQna(q_num);
		return "redirect:qnawriteform";
	}

	

	//admin
	@GetMapping("/qna/adminqnalist")
	public ModelAndView adminqnalist(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
	        HttpSession session) {

	    ModelAndView model = new ModelAndView();

	    // 세션에 로그인한 아이디 얻기
	    String myid = (String) session.getAttribute("loginId");

	    int totalCount = qservice.getTotalCount();
	    int totalPage; // 총 페이지수
	    int startPage; // 각 블럭의 시작페이지
	    int endPage; // 각 블럭의 끝페이지
	    int start; // 각 페이지의 시작번호
	    int perPage = 10; // 한 페이지에 보여질 글의 갯수
	    int perBlock = 5; // 한 블럭당 보여지는 페이지 갯수

	    // 총 페이지 갯수
	    totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
	    // 각 블럭의 시작페이지
	    startPage = (currentPage - 1) / perBlock * perBlock + 1;
	    endPage = startPage + perBlock - 1;

	    // 총페이지=8일 경우 endpage를 8로 수정한다.
	    if (endPage > totalPage)
	        endPage = totalPage;

	    // 각 페이지에서 불러올 시작번호
	    start = (currentPage - 1) * perPage;

	    // 각 페이지에서 필요한 게시글 가져오기
	    List<QnaDto> list = qservice.getList(start, perPage);
	      
	    for (QnaDto qnaDto : list) {
	        QCommentDto qc_dto = new QCommentDto();
	        qc_dto.setQ_num(qnaDto.getQ_num());
	        String qnum = qc_dto.getQ_num();
	        int qnaCount = qservice.countqnum(qnum);
	        
	        // QnaDto에 qnaCount 값을 저장
	        qnaDto.setQnaCount(qnaCount);
	        //System.out.println(qnaCount);
	    }
	    
	    // 각 페이지에 출력할 시작번호
	    int no = totalCount - (currentPage - 1) * perPage;

	    // 출력에 필요한 변수들을 model에 저장
	    model.addObject("totalCount", totalCount);
	    model.addObject("list", list);
	    model.addObject("totalPage", totalPage);
	    model.addObject("startPage", startPage);
	    model.addObject("endPage", endPage);
	    model.addObject("perBlock", perBlock);
	    model.addObject("currentPage", currentPage);
	    model.addObject("no", no);

	    model.setViewName("/qna/adminqnalist");
	    return model;
	}


	@ResponseBody
	@PostMapping("/qna/commentinsert")
	public void commentinsert(@ModelAttribute QCommentDto qc_dto,
			HttpSession session, Model model)
	{		
		String qnum= qc_dto.getQ_num(); 
		String email = qservice.getData(qnum).getQ_email();
		String id= qservice.getData(qnum).getQ_loginid();
		MailSender.mailSend(email,id);
		int qnaCount= qservice.countqnum(qnum);
		model.addAttribute("qnaCount", qnaCount);
		
		//insert
		qservice.insertComment(qc_dto);
	}
	
	

	//update
	@ResponseBody
	@PostMapping("/qna/commentupdate")
	public void commentupdate(@ModelAttribute QCommentDto qc_dto,
			HttpSession session)
	{
		
		//update
		qservice.updateComment(qc_dto);
		
		session.setAttribute("content", qc_dto.getQc_content());
		
	}
	
	@ResponseBody
	@GetMapping("/qna/answerupdateform")
	public QCommentDto getComment(String qc_num) //data
	{
		return qservice.getComment(qc_num);
	}
	
	
	//list
	@ResponseBody
	@GetMapping("/qna/qnacommentlist")
	public List<QCommentDto> qnacommentlist(String q_num)
	{
		
		return qservice.getAllComments(q_num);
		
	}
	
	
	@ResponseBody
	@GetMapping("/qna/deleteqnacomment")
	public String deleteqnacomment(String qc_num) {
		
		
		mapper.deleteComment(qc_num);
		
		return "redirect:detailqna";
	}
	
	
}