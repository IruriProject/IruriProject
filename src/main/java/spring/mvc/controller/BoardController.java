package spring.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    public ModelAndView boardlist(@RequestParam (value="currentPage", defaultValue = "1")int currentPage) {
        ModelAndView model=new ModelAndView();
        
        //총 글의 개수
        int totalCount =bservice.getTotalCount();
        
        int totalPage; //총 페이지수
        int startPage; //각 블럭의 시작페이지
        int endPage; //각 블럭의 끝페이지
        int start;    //각 페이지의 시작번호
        int perPage=5; //한 페이지에 보여질 글의 갯수
        int perBlock=5; //한 블럭당 보여지는 페이지 갯수
    
             
        //총 페이지 갯수     
              totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
        //각 블럭의 시작페이지
              startPage=(currentPage-1)/perBlock*perBlock+1;
              endPage=startPage+perBlock-1;
            
        //총페이지=8일 경우 endpage를 8로 수정한다.     
              if(endPage>totalPage)
                    endPage=totalPage;

        //각 페이지에서 불러올 시작번호
        start=(currentPage-1)*perPage;

        //각 페이지에서 필요한 게시글 가져오기
        List<BoardDto> list=bservice.getList(start, perPage);

        //new표시
        // 게시물의 작성일자와 현재 날짜 비교하여 "뉴" 아이콘 표시 여부 결정
        String now = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        for (BoardDto dto : list) {
            String writeDate = new SimpleDateFormat("yyyy-MM-dd").format(dto.getB_writeday());
            dto.setNewFlag(writeDate.equals(now));
        }
        
       //댓글갯수
		/*
		 * for(BoardDto d:list) {
		 * d.setAcount(aservice.getAllAnswers(d.getNum()).size());
		 * System.out.println(aservice.getAllAnswers(d.getNum()).size()); }
		 */
        
        //각 페이지에 출력할 시작번호
        int no=totalCount-(currentPage-1)*perPage;
        
        //출력에 필요한 변수들을 model에 저장
        model.addObject("totalCount", totalCount);
        model.addObject("list", list);
        model.addObject("totalPage", totalPage);
        model.addObject("startPage", startPage);
        model.addObject("endPage", endPage);
        model.addObject("perBlock", perBlock);
        model.addObject("currentPage", currentPage);
        model.addObject("no", no);
        
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

		System.out.println(path);

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

		bdto.setB_photo(uploadName);

		mapper.insertBoard(bdto);


		return "/board/insertboardform";
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
		
		
		//업로드파일의 확장자
		int dotLoc =bdto.getB_photo().lastIndexOf('.'); //마지막 .의 위치
		String ext= bdto.getB_photo().substring(dotLoc+1); //현재위치 다음부터 끝까지 // . 의 다음글자부터 끝까지 추출 (.은 포함되면 안되기때문)
		
		System.out.println(dotLoc+","+ext);
		
		if(ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("gif") || ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("jpeg"))
			mview.addObject("b_photo", true);
		else
			mview.addObject("b_photo", false); // 이미지 인지 아닌지를 보고 출력하기 위해서
		
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
			@RequestParam String b_num,
			HttpSession session)
	{
		//세션에 로그인한 아이디 얻기 
		String myid=(String)session.getAttribute("loginId");

		//dto에 넣기
		bc_dto.setB_num(b_num);
		bc_dto.setBc_loginid(myid);

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
}
