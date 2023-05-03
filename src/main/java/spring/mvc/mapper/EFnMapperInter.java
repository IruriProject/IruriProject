package spring.mvc.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import spring.mvc.dto.PostingDto;

@Mapper
public interface EFnMapperInter {
	
	public Map<String, Object> getPosting(String p_num);
	public int getTotalCount();
	public List<PostingDto> getPagingList(Map<String, Object> map);
}
