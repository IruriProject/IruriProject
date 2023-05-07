package spring.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.service.TestService;

@Controller
public class TestController {

	@Autowired
	TestService service;

	@GetMapping("/")
	public String start() {

		return "/layout/main";
	}

	@GetMapping("/test")
	@ResponseBody
	public List<Map<String, Object>> test(@RequestParam String p_num) {

		List<Map<String, Object>> list = service.applicantByPosting(p_num);

		int female = 0;
		int male = 0;

		for (Map<String, Object> a : list) {
			Object b = a.get("u_gender");
			if (b.equals("여"))
				female++;
			else
				male++;
		}

		List<Map<String, Object>> result = new ArrayList<>();
		
		Map<String, Object> map1 = new HashMap<>();
		map1.put("gender", "여자");
		map1.put("count", female);

		Map<String, Object> map2 = new HashMap<>();
		map2.put("gender", "남자");
		map2.put("count", male);

		result.add(map1);
		result.add(map2);

		return result;
	}

	@GetMapping("/testChart")
	public String testChart() {

		return "/test/chartTest";
	}
}
