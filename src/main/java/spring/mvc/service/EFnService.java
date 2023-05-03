package spring.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.mvc.dto.PostingDto;
import spring.mvc.mapper.EFnMapperInter;

@Service
public class EFnService {
	
	@Autowired
	EFnMapperInter mapper;

	public int getTotalCount() {
		return mapper.getTotalCount();
	}

	public List<PostingDto> getPagingList(String searchcolumn, String searchword, int start, int perpage){

		Map<String, Object> map=new HashMap<>();
		
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getPagingList(map);
	}
}
