package spring.mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.EnterpriseDto;
import spring.mvc.dto.HeartDto;
import spring.mvc.dto.MessageDto;
import spring.mvc.dto.PostingDto;
import spring.mvc.dto.ResumeDto;
import spring.mvc.dto.ScrapDto;
import spring.mvc.dto.UserDto;
import spring.mvc.dto.ViewerDto;
import spring.mvc.mapper.UFnMapperInter;

@Service
public class UFnService {

   @Autowired
   UFnMapperInter mapper;

   public void updateUser(UserDto dto) {
      mapper.updateUser(dto);
   }

   public void updateUserNoAddr(UserDto dto) {
      mapper.updateUserNoAddr(dto);
   }

   public void updatePw(String u_id, String u_pw) {
      // TODO Auto-generated method stub
      Map<String, String> map = new HashMap<>();

      map.put("u_id", u_id);
      map.put("u_pw", u_pw);

      mapper.updatePw(map);
   }
   //주소, 대표 변경
   public void updatePrivate(int r_num) {
      mapper.updatePrivate(r_num);
   }
   public void updatePublic(int r_num) {
      mapper.updatePublic(r_num);
   }
   public void updateMainOn(int r_num) {
      mapper.updateMainOn(r_num);
   }
   public void updateMainOff(int r_num) {
      mapper.updateMainOff(r_num);
   }
   public void updateAllOff(String u_num) {
      mapper.updateAllOff(u_num);
   }

   public void updatePhoto(String u_id, String u_photo) {
      // TODO Auto-generated method stub
      Map<String, String> map = new HashMap<>();

      map.put("u_id", u_id);
      map.put("u_photo", u_photo);

      mapper.updatePhoto(map);
   }
   
   //이력서 등록
   public void insertResume(ResumeDto dto) {
      mapper.insertResume(dto);
   }
   
   //이력서 수정
   public void updateResume(ResumeDto dto) {
	   mapper.updateResume(dto);
   }
   
   //이력서 삭제
   public void deleteResume(String r_num) {
	   mapper.deleteResume(r_num);
   }

   // num으로 이력서 찾기
   public ResumeDto getResume(String u_num) {
      return mapper.getResume(u_num);
   }
   

   // num으로 유저정보 찾기
   public UserDto findUserdataByNum(String u_num) {
      return mapper.findUserByNum(u_num);
   }
   
   //쪽지
   public List<Map<String, Object>> getMessageByUserNum(String u_num){
	   return mapper.getMessageByUserNum(u_num);
   }

   // 회원삭제
   public void deleteUser(String u_num) {
      mapper.deleteUser(u_num);
   }
   
   //관심기업
   //관심 기업 수
   public int countLikeEnterprise(String u_num) {

      return mapper.countLikeEnterprise(u_num);
   }
   
   //기업 데이터 가져오기
   public List<Map<String, Object>> getLikeEnterprise(String e_num) {
	   
	   return mapper.getLikeEnterprise(e_num);
   }
   
   // 좋아요 한 회원과 기업 데이터 추가
   public void insertlikeEnter(HeartDto dto) {

      mapper.insertLikeEnter(dto);
   }

	//좋아요 했는지 확인
	public HeartDto checkLikeEnter (String u_num, String e_num) {//service는 map을 풀어서 써준다음에 다시 put으로 u_num, e_num 정해줌
		Map<String, String> map=new HashMap<>();
		map.put("u_num", u_num);
		map.put("e_num", e_num);
		return mapper.checkLikeEnter(map);
	}
	public List<ResumeDto> getResumeByUserId(String u_id){
		return mapper.getResumeByUserId(u_id);
	}

   // 좋아요 한 회원과 기업 데이터 삭제
   public void deleteLikeEnter(String h_num) {

	mapper.deleteLikeEnter(h_num);
   }
   
   public List<EnterpriseDto> getMypageLikeEnter(String u_num){
	   
	   return mapper.getMypageLikeEnter(u_num);
   }
   
   //관심 공고(스크랩)
   //관심 공고 수
   public int countScrapPosting(String s_num) {
	   
	  return mapper.countScrapPosting(s_num);
   }
   
   public List<Map<String, Object>> getScrapPosting(String u_num){
	   
	   return mapper.getScrapPosting(u_num);
   }
   
   //관심 공고 insert
   public void insertScrapPosting(ScrapDto dto) {
	   
	   mapper.insertScrapPosting(dto);
   }
   
   //스크랩했는지 확인
   public ScrapDto checkScrapPosting(String u_num, String p_num) {
	   Map<String, String>  map=new HashMap<>();
	   map.put("u_num", u_num);
	   map.put("p_num", p_num);
	   return mapper.checkScrapPosting(map);
   }
   
   //관심 공고 delete
   public void deleteScrapPosting(String s_num) {
	   mapper.deleteScrapPosting(s_num);
   }
   
   
   //지원현황
   //지원 취소
   public void deleteApply(String a_nun) {
	   mapper.deleteApply(a_nun);
   }
   
   //지원 현황 리스트
   public List<Map<String, Object>> getMypageScrapPosting(String u_num){
	   
	   return mapper.getMypageScrapPosting(u_num);
   }
   
   
   
   //지원현황 리스트 가져오기
   public List<Map<String, Object>> getApplicantList(String u_num){
	   
	   return mapper.getApplicantList(u_num);
   }
   
   
   //맞춤 일자리
   //맞춤 일자리 검색한 수
   public int countSearchCustomJob(String p_type) {
	   return mapper.countSearchCustomJob(p_type);
   }
   
   //맞춤 일자리 검색 결과
   public List<PostingDto> searchCustomJobList(String p_type) {
	   
	   return mapper.searchCustomJobList(p_type);
   }
   
   
   //열람
   public void insertViewer(ViewerDto dto) {
      mapper.insertViewer(dto);
   }
  
   public int getSearchUnum(String u_num, String p_num) {
      Map<String, String> map=new HashMap<>();
      
      map.put("u_num", u_num);
      map.put("p_num", p_num);
      
      return mapper.getSearchUnum(map);
   }
   public List<ResumeDto> getMyResume(String u_num){
      return mapper.getMyResume(u_num);
   }

   public ResumeDto getResumeOfRNum(String r_num) {
      return mapper.getResumeOfRNum(r_num);
   }
}