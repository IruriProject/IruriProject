package spring.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.BCommentDto;
import spring.mvc.dto.BoardDto;
import spring.mvc.mapper.BoardMapperInter;
import spring.mvc.service.BoardService;
import spring.mvc.service.UserService;

@Controller
public class BoardController {

	@Autowired
	BoardMapperInter mapper;
	
	@Autowired
	BoardService bservice;
	
	@Autowired
	UserService uservice;
	
	@GetMapping("/board/form")
	public String form()
	{
		return "/board/insertboardform";
	}

	
	//board
	@GetMapping("/board/boardlist")
    public ModelAndView boardlist(@RequestParam (value="currentPage", defaultValue = "1")int currentPage,
    		@RequestParam(required=false) String keyword,
    		@RequestParam(defaultValue = "b_writeday") String sort) {
       
		ModelAndView model=new ModelAndView();

		
		boolean noticeFirst = true; // 공지사항 우선 여부 설정
		
		List<BoardDto> noticeList = new ArrayList<>();
		noticeList = bservice.getNoticeList(keyword);
		
		int noticeCount=noticeList.size();
		
        int totalCount =bservice.getTotalCount(keyword); //총 글의 개수 //keyword 갯수
        int totalPage; //총 페이지수
        int startPage; //각 블럭의 시작페이지
        int endPage; //각 블럭의 끝페이지
        int start;    //각 페이지의 시작번호
        int perPage=5; //한 페이지에 보여질 글의 갯수
        int perBlock=5; //한 블럭당 보여지는 페이지 갯수
       

        //총 페이지 갯수     
        totalPage=(totalCount-noticeCount)/perPage+((totalCount-noticeCount)%perPage==0?0:1);
        //각 블럭의 시작페이지
        startPage=(currentPage-1)/perBlock*perBlock+1;
        endPage=startPage+perBlock-1;

        //총페이지=8일 경우 endpage를 8로 수정한다.     
        if(endPage>totalPage)
        	endPage=totalPage;

        //각 페이지에서 불러올 시작번호
        start=(currentPage-1)*perPage;
    
        
        //List<BoardDto> noticeList=bservice.getNoticeList(keyword, start, perPage);
        
        
        //각 페이지에서 필요한 게시글 가져오기
       
        List<BoardDto> list=bservice.getList(sort,keyword,start, perPage,noticeFirst);
        
        //new표시
        // 게시물의 작성일자와 현재 날짜 비교하여 "뉴" 아이콘 표시 여부 결정
        String now = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        for (BoardDto dto : list) {
            String writeDate = new SimpleDateFormat("yyyy-MM-dd").format(dto.getB_writeday());
            dto.setNewFlag(writeDate.equals(now));
        }
        
       //댓글갯수
	
		 for(BoardDto d:list) {
			 
			 d.setB_acount(bservice.getAllComments(d.getB_num()).size());
			// System.out.println(bservice.getAllComments(d.getB_num()).size());		 
			 
			 //시간변환 몇분전...등
		        Date boardnow = new  Date(); //현재시간
		        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		        
		        Date writeday= new Date();
		        
		        try {
					writeday= sdf.parse(d.getB_writeday().toString());
				
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        
		        //초차이
		        long diffSec= boardnow.getTime()-writeday.getTime(); //밀리세컨
		        
		        diffSec-=32400000L; //LONG타입 명시 32400000 -> 9시간을 msec으로 바꿈

		        long day=(diffSec/(60*60*24*1000L))%365; //일
		        long hour=(diffSec/(60*60*1000L))%24; //시
		        long minute=(diffSec/(60*1000L))%60; //분
		        long second=(diffSec/(1000L))%60; //초
		        
		        String resultTime="";
		        
		        if(day!=0) {

		        	resultTime=""+day+"일 전";

		        }else {

		        	if(hour!=0) {

		        		resultTime=""+hour+"시간 전";
		        	}else {

		        		if(minute!=0) {
		        			resultTime=""+minute+"분 전";

		        		}else {

		        			resultTime = ""+second+"초 전";
		        		}
		        	}

		        }
		        
		        d.setB_time(resultTime);
		 }
		 
        //각 페이지에 출력할 시작번호
        int no=totalCount-(currentPage-1)*perPage;
        
        String queryString= String.format("currentPage=%d&keyword=%s&sort=%s", currentPage, keyword, sort);
        String url=queryString;

        
        //출력에 필요한 변수들을 model에 저장
        model.addObject("totalCount", totalCount);
        model.addObject("list", list);
        model.addObject("noticeList", noticeList);
        model.addObject("totalPage", totalPage);
        model.addObject("startPage", startPage);
        model.addObject("endPage", endPage);
        model.addObject("perBlock", perBlock);
        model.addObject("currentPage", currentPage);
        model.addObject("no", no);
        model.addObject("sort",sort);
        model.addObject("url",url);  
        
        model.setViewName("/board/boardlist");
        
        return model;
        
	}
	
	
	
	@PostMapping("/board/insertBoard")
	public String insertBoard(@ModelAttribute BoardDto bdto, 
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session)
	{
		
		//세션에 로그인한 아이디 얻기 
		String myid=(String)session.getAttribute("loginId");

		//아이디 넘겨서 num값 얻기 	
		//String usernum = uservice.findUserdataById(myid).getU_num();

		bdto.setB_loginid(myid);

		String path= session.getServletContext().getRealPath("/photo");

		//System.out.println(path);

		String uploadName="";

	    String b_content = bdto.getB_content().replace("\r\n","<br>");
	    bdto.setB_content(b_content);
	    
	    
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

		bdto.setB_photo(uploadName);

		mapper.insertBoard(bdto);


		return "redirect:boardlist";
	}

	
	@GetMapping("/board/updateform")
	public ModelAndView updateform(@RequestParam String b_num)
	{
		ModelAndView model = new ModelAndView();
		
		BoardDto bdto= mapper.getData(b_num);
		
	    String b_content = bdto.getB_content().replace("<br>","\r\n");
	    bdto.setB_content(b_content);
		
		model.addObject("bdto",bdto);
		model.setViewName("/board/updateboardform");
		return model;
	}


	@PostMapping("/board/updateBoard")
	public String updateBoard(@ModelAttribute BoardDto bdto, 
			@RequestParam ArrayList<MultipartFile> upload,
			@RequestParam String b_num,
			HttpSession session)
	{
		
		//세션에 로그인한 아이디 얻기 
		String myid=(String)session.getAttribute("loginId");

		//아이디 넘겨서 num값 얻기 	
		//String usernum = uservice.findUserdataById(myid).getU_num();

		bdto.setB_loginid(myid);

		String path= session.getServletContext().getRealPath("/photo");

		//System.out.println(path);

		String uploadName="";
		

	    String b_content = bdto.getB_content().replace("\r\n","<br>");
	    bdto.setB_content(b_content);
	    

		int idx=1;

		if(upload.get(0).getOriginalFilename().equals("")) 
			uploadName="no"; 
		else {
			for(MultipartFile f:upload) { 
				SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmmss");
				String fName=idx++ +"_"+sdf.format(new Date())+"_"+f.getOriginalFilename(); 
				uploadName+=fName+","; //누적
				
				//업로드된 파일명
				String uploadfile= mapper.getData(b_num).getB_photo();
				
				//파일객체 생성
				File file= new File(path+"\\"+uploadfile);
				
				bdto.setB_photo(fName);
				
				//업로드 
				try {
					f.transferTo(new File(path+"\\"+fName));
					file.delete();
				
				} catch  (IllegalStateException | IOException e) { // TODO Auto-generated catch block
					e.printStackTrace(); }

			}

			//마지막 컴마제거 
			uploadName=uploadName.substring(0, uploadName.length()-1); }

		bdto.setB_photo(uploadName);

		mapper.updateBoard(bdto);


		return "redirect:boardlist";
	}

	
	@GetMapping("/board/delete")
	public String delete(String b_num,
			HttpSession session)
	{
		String path= session.getServletContext().getRealPath("/photo");
		String uploadfile= mapper.getData(b_num).getB_photo();
		
		File file= new File(path+"\\"+uploadfile);
		file.delete();
	
		mapper.deleteBoard(b_num);
		
		return "redirect:boardlist";
	}
		
	
	@GetMapping("/board/detailboard")
	public ModelAndView detailboard(@RequestParam String b_num,
			@RequestParam(defaultValue = "1") int currentPage)
	{
		ModelAndView mview= new ModelAndView();
		
		bservice.updateReadCount(b_num);//조회수증가
		
		BoardDto bdto= bservice.getData(b_num);
		
		List<BoardDto> photoList= mapper.getAllphotos(b_num);
		List<String> photoUrls = new ArrayList<>(); // 이미지 URL을 담을 리스트
	
		for(BoardDto dto:photoList)
		{
			String [] photos=dto.getB_photo().split(",");
			for(String photo : photos) {
		        photoUrls.add(photo); // URL을 리스트에 추가
		    }
			//dto.setB_photo(photos[0]);
		}
		
		
		
		// 이전 글 번호와 다음 글 번호를 가져옴
	    int prevNum = bservice.getPrevNum(b_num);
	    int nextNum = bservice.getNextNum(b_num);
	    
	    String prevTitle= bservice.getPrevTitle(b_num);
	    String nextTitle= bservice.getNextTitle(b_num);
	    
		//업로드파일의 확장자
		int dotLoc =bdto.getB_photo().lastIndexOf('.'); //마지막 .의 위치
		String ext= bdto.getB_photo().substring(dotLoc+1); //현재위치 다음부터 끝까지 // . 의 다음글자부터 끝까지 추출 (.은 포함되면 안되기때문)
		
		//System.out.println(dotLoc+","+ext);
		
		if(ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("gif") || ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("jpeg"))
			mview.addObject("b_photo", true);
		else
			mview.addObject("b_photo", false); // 이미지 인지 아닌지를 보고 출력하기 위해서
		
		mview.addObject("prevTitle",prevTitle);
		mview.addObject("nextTitle",nextTitle);
		mview.addObject("prevNum",prevNum);
		mview.addObject("nextNum",nextNum);
		mview.addObject("bdto",bdto);
		mview.addObject("photoUrls", photoUrls); // 이미지 URL 리스트 추가
		//mview.addObject("photoList", photoList); // 이미지 파일명 리스트 추가
		mview.addObject("currentPage", currentPage);
		mview.setViewName("/board/detailboard");
		
		return mview;
	}

	//boardComment
	@ResponseBody
	@PostMapping("/board/commentinsert")
	public void commentinsert(@ModelAttribute BCommentDto bc_dto,
			HttpSession session)
	{
		//세션에 로그인한 아이디 얻기 
		String myid=(String)session.getAttribute("loginId");
		/*
		 * String bc_content = bc_dto.getBc_content().replace("\r\n","<br>");
		 * bc_dto.setBc_content(bc_content);
		 */
	    
		//dto에 넣기
		bc_dto.setBc_loginid(myid);
		
		if (!bc_dto.getBc_num().equals("0")) {
			bc_dto.setBc_regroup(bservice.getComment(bc_dto.getBc_num()).getBc_regroup());
		    bc_dto.setBc_restep(bservice.getComment(bc_dto.getBc_num()).getBc_restep());
		    bc_dto.setBc_relevel(bservice.getComment(bc_dto.getBc_num()).getBc_relevel());
		}
		//insert
		bservice.insertComment(bc_dto);
	}

	//list
	@ResponseBody
	@GetMapping("/board/commentlist")
	public List<BCommentDto> commentlist(String b_num)
	{
		
		return bservice.getAllComments(b_num);
		
	}

	
	//update
	@ResponseBody
	@PostMapping("/board/commentupdate")
	public void commentupdate(@ModelAttribute BCommentDto bc_dto,
			HttpSession session)
	{
		//세션에 로그인한 아이디 얻기 
		String myid=(String)session.getAttribute("loginId");

		/*
		 * String bc_content = bc_dto.getBc_content().replace("<br>","\r\n");
		 * bc_dto.setBc_content(bc_content);
		 */
		
		//dto에 넣기
		bc_dto.setBc_loginid(myid);
		
		if (!bc_dto.getBc_num().equals("0")) {
			bc_dto.setBc_regroup(bservice.getComment(bc_dto.getBc_num()).getBc_regroup());
		    bc_dto.setBc_restep(bservice.getComment(bc_dto.getBc_num()).getBc_restep());
		    bc_dto.setBc_relevel(bservice.getComment(bc_dto.getBc_num()).getBc_relevel());
		}
		//update
		bservice.updateComment(bc_dto);
		
		session.setAttribute("content", bc_dto.getBc_content());
	}
	
	@ResponseBody
	@GetMapping("/board/answerupdateform")
	public BCommentDto getComment(String bc_num) //data
	{
		
		BCommentDto bc_dto= mapper.getComment(bc_num);
		/*
		 * String bc_content = bc_dto.getBc_content().replace("\r\n","<br>");
		 * bc_dto.setBc_content(bc_content);
		 */
		
		return bservice.getComment(bc_num);
	}
	
	@GetMapping("/board/commentdelete")
	@ResponseBody
	public String commentdelete(String bc_num) {
	    BCommentDto comment = bservice.getComment(bc_num); // 삭제할 댓글 조회

	    int level = comment.getBc_relevel(); // 댓글의 bc_relevel 값 가져오기

	    if (level == 0) { 
	        int bc_regroup = comment.getBc_regroup(); // 댓글의 bc_regroup 값 가져오기
	        mapper.deletechildComment(bc_regroup);
	    } else {
	        int bc_regroup = comment.getBc_regroup(); // 댓글의 bc_regroup 값 가져오기
	        int bc_restep = comment.getBc_restep(); // 댓글의 bc_restep 값 가져오기

	        List<BCommentDto> list = bservice.getchildComments(bc_regroup, bc_restep); // 해당 bc_regroup의 모든 댓글들 조회

	        // 자식 댓글들을 삭제 처리하기 위해 list가 해당 bc_regroup의 모든 댓글들이 있을 동안..
	        for (int i = 0; i < list.size(); i++) {
	            BCommentDto childComment = list.get(i); // 자식 댓글 정보 가져오기
	            int child_restep = childComment.getBc_restep(); // 자식 댓글의 bc_restep 값 가져오기
	            int child_relevel = childComment.getBc_relevel(); // 자식 댓글의 bc_relevel 값 가져오기

	            if (child_relevel > level) { // bc_restep보다 크고 bc_relevel이 큰 경우에만 삭제
	                String child_bc_num = childComment.getBc_num(); // 자식 댓글의 bc_num 가져오기

	                // 자식 댓글 삭제
	                mapper.deleteComment(child_bc_num);
	            }else
	            	break;
	        }
	    }

	    // 부모 댓글 삭제
	    mapper.deleteComment(bc_num);

	    return "redirect:boardlist";
	}


}
