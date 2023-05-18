package spring.mvc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import spring.mvc.dto.PostingDto;
import spring.mvc.service.EFnService;

@Controller
public class ScheduleController {

	@Autowired
	EFnService service;
	
	@Scheduled(cron = "0 * * * * *")
    public void updatePostingStatusAuto() {
        //System.out.println("현재 시간은 " + new Date());
        
        List<PostingDto> postings = service.getAllPostingsAllEnter(); // 모든 포스팅을 가져오는 메서드를 PostingMapper에 추가해야 함


        Date currentDate = new Date();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for (PostingDto posting : postings) {
            String date = posting.getP_enddate();

            try {
                Date enddate = sdf.parse(date);

                if (enddate.compareTo(currentDate) <= 0) {
                    String pNum = posting.getP_num();

                    service.updatePostingStatusAuto(pNum);
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
    }

}
