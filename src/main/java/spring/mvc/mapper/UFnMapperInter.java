package spring.mvc.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.ObjectProvider;

import spring.mvc.dto.BoardDto;
import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.ResumeDto;
import spring.mvc.dto.ScrapDto;
import spring.mvc.dto.HeartDto;
import spring.mvc.dto.MessageDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.dto.UserDto;
import spring.mvc.dto.ViewerDto;

@Mapper
public interface UFnMapperInter {
	public void updateUser(UserDto dto);
	public void updateUserNoAddr(UserDto dto);
	public void updatePw(Map<String, String> map);
	public void updatePhoto(Map<String, String> map);
	public ResumeDto getResume(String u_num);
	public UserDto findUserByNum(String u_num);
	public void deleteUser(String u_num);
	
	//이력서 등록/수정/삭제
	public void insertResume(ResumeDto dto);
	public void updateResume(ResumeDto dto);
	public void deleteResume(String r_num);
	
	//쪽지
	public List<Map<String, Object>> getMessageByUserNum(String u_num);
	
	//주소, 대표 변경
	public void updatePrivate(int r_num);
	public void updatePublic(int r_num);
	public void updateMainOn(int r_num);
	public void updateMainOff(int r_num);
	public void updateAllOff(String u_num);
	//아이디에 해당하는 이력서 찾기
	public List<ResumeDto> getResumeByUserId(String u_id);
	
	//관심 기업
	public int countLikeEnterprise(String u_num);//관심기업 수
	public List<Map<String, Object>> getLikeEnterprise(Map<String, Object> map);//기업 데이터 가져오기
	public void insertLikeEnter(HeartDto dto);//관심기업 인서트
	public void deleteLikeEnter(String h_num);//관심기업 딜리트
	public HeartDto checkLikeEnter (Map<String, String> map);//좋아요했는지 체크
	public List<EnterpriseDto> getMypageLikeEnter(String u_num);//마이페이지에 관심기업
	
	//관심 공고(스크랩)
	public int countScrapPosting(String u_num);//관심공고 수
	public List<Map<String, Object>> getScrapPosting(Map<String, Object> map);//관심 공고 데이터 가져오기
	public void insertScrapPosting(ScrapDto dto);//관심공고 인서트
	public void deleteScrapPosting(String s_num);//관심공고 딜리트
	public ScrapDto checkScrapPosting(Map<String, String> map);//스크랩했는지 체크
	public List<Map<String, Object>> getMypageScrapPosting (String u_num);
	
	//지원현황
	public int countApplicantList(String u_um);
	public void deleteApply(String a_num);
	public List<Map<String, Object>> getApplicantList(Map<String, Object> map);//유저별 지원현황 리스트
	
	//맞춤 일자리
	public List<Map<String, Object>> searchCustomJobList (String p_type);//검색 된 공고
	
	//열람
	public void insertViewer(ViewerDto dto);
	public int getSearchUnum(Map<String, String> map);
	public List<ResumeDto> getMyResume(String u_num);
	public ResumeDto getResumeOfRNum(String r_num);

}
