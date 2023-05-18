<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<style type="text/css">

	.searcharea{
		padding: 10px 20px;
		border: 1px solid gray;
	}
	
	#enterprise-name{
		color: gray;
	}
	
	#posting-title{
		font-size: 1.1em;
	}
	
	.scroll-box{
		margin: 15px 10px;
		overflow:scroll;
		width:100px; height:150px;
	}
	
	li[role="button"]{
		width: 60px;
		border-radius:20px;
		text-align:center;
		cursor: pointer;
	}
	
	/* 스크롤바 설정*/
	.scroll-box::-webkit-scrollbar{
	    width: 15px;
	}
	
	/* 스크롤바 뒷 배경 설정*/
	.scroll-box::-webkit-scrollbar-track{
	    background-color: rgba(0,0,0,0);
	}
	
	/* 스크롤바 설정*/
	.scroll-box::-webkit-scrollbar{
	    width: 15px;
	}
	
	/* 스크롤바 막대 설정*/
	.scroll-box::-webkit-scrollbar-thumb{
	    background: #e3f2c9;
	    cursor: pointer;
	}
	
	#nosearch{
		font-size: 1.1em;
		display: block;
		padding: 20px;
	}

</style>

<title>Insert title here</title>
</head>
<body>
	
<div class="searcharea">

<!-- 지역 필터링 -->
<h4>지역별로 검색하기</h4><br>
<div style="display: flex;">

<div class="scroll-box">
<li role="button" value="서울">서울</li>
<li role="button" value="경기">경기</li>
<li role="button" value="인천">인천</li>
<li role="button" value="강원">강원</li>
<li role="button" value="충북">충북</li>
<li role="button" value="충남">충남</li>
<li role="button" value="세종">세종</li>
<li role="button" value="대전">대전</li>
<li role="button" value="대구">대구</li>
<li role="button" value="경북">경북</li>
<li role="button" value="경남">경남</li>
<li role="button" value="울산">울산</li>
<li role="button" value="부산">부산</li>
<li role="button" value="광주">광주</li>
<li role="button" value="전북">전북</li>
<li role="button" value="전남">전남</li>
<li role="button" value="제주">제주</li>
</div>

<div style="overflow:scroll; width:100px; height:150px;" class="addr-detail scroll-box">

<div id="서울" style="display: none;">
<li role="button" value="서울" class="gu">전체</li>
<li role="button" value="강남구" class="gu">강남구</li>
<li role="button" value="강동구" class="gu">강동구</li>
<li role="button" value="강북구" class="gu">강북구</li>
<li role="button" value="강서구" class="gu">강서구</li>
<li role="button" value="관악구" class="gu">관악구</li>
<li role="button" value="광진구" class="gu">광진구</li>
<li role="button" value="구로구" class="gu">구로구</li>
<li role="button" value="금천구" class="gu">금천구</li>
<li role="button" value="노원구" class="gu">노원구</li>
<li role="button" value="도봉구" class="gu">도봉구</li>
<li role="button" value="동대문구" class="gu">동대문구</li>
<li role="button" value="동작구" class="gu">동작구</li>
<li role="button" value="마포구" class="gu">마포구</li>
<li role="button" value="서대문구" class="gu">서대문구</li>
<li role="button" value="서초구" class="gu">서초구</li>
<li role="button" value="성동구" class="gu">성동구</li>
<li role="button" value="성북구" class="gu">성북구</li>
<li role="button" value="송파구" class="gu">송파구</li>
<li role="button" value="양천구" class="gu">양천구</li>
<li role="button" value="영등포구" class="gu">영등포구</li>
<li role="button" value="용산구" class="gu">용산구</li>
<li role="button" value="은평구" class="gu">은평구</li>
<li role="button" value="종로구" class="gu">종로구</li>
<li role="button" value="중구" class="gu">중구</li>
<li role="button" value="중랑구" class="gu">중랑구</li>
</div>

<div id="부산" style="display: none;">
<li role="button" value="부산" class="gu">전체</li>
<li role="button" value="강서구" class="gu">강서구</li>
<li role="button" value="금정구" class="gu">금정구</li>
<li role="button" value="기장군" class="gu">기장군</li>
<li role="button" value="남구" class="gu">남구</li>
<li role="button" value="동구" class="gu">동구</li>
<li role="button" value="동래구" class="gu">동래구</li>
<li role="button" value="부산진구" class="gu">부산진구</li>
<li role="button" value="북구" class="gu">북구</li>
<li role="button" value="사상구" class="gu">사상구</li>
<li role="button" value="사하구" class="gu">사하구</li>
<li role="button" value="서구" class="gu">서구</li>
<li role="button" value="수영구" class="gu">수영구</li>
<li role="button" value="연제구" class="gu">연제구</li>
<li role="button" value="영도구" class="gu">영도구</li>
<li role="button" value="중구" class="gu">중구</li>
<li role="button" value="해운대구" class="gu">해운대구</li>
</div> 

<div id="대구" style="display: none;">
<li role="button" value="대구" class="gu">전체</li>
<li role="button" value="남구" class="gu">남구</li>
<li role="button" value="달서구" class="gu">달서구</li>
<li role="button" value="달성군" class="gu">달성군</li>
<li role="button" value="동구" class="gu">동구</li>
<li role="button" value="북구" class="gu">북구</li>
<li role="button" value="서구" class="gu">서구</li>
<li role="button" value="수성구" class="gu">수성구</li>
<li role="button" value="중구" class="gu">중구</li>
</div>

<div id="인천" style="display: none;">
<li role="button" value="인천" class="gu">전체</li>
<li role="button" value="강화군" class="gu">강화군</li>
<li role="button" value="계양구" class="gu">계양구</li>
<li role="button" value="미추홀구" class="gu">미추홀구</li>
<li role="button" value="남동구" class="gu">남동구</li>
<li role="button" value="동구" class="gu">동구</li>
<li role="button" value="부평구" class="gu">부평구</li>
<li role="button" value="서구" class="gu">서구</li>
<li role="button" value="연수구" class="gu">연수구</li>
<li role="button" value="옹진군" class="gu">옹진군</li>
<li role="button" value="중구" class="gu">중구</li>
</div>

<div id="광주" style="display: none;">
<li role="button" value="광주" class="gu">전체</li>
<li role="button" value="광산구" class="gu">광산구</li>
<li role="button" value="남구" class="gu">남구</li>
<li role="button" value="동구" class="gu">동구</li>
<li role="button" value="북구" class="gu">북구</li>
<li role="button" value="서구" class="gu">서구</li>
</div>

<div id="대전" style="display: none;">
<li role="button" value="대전" class="gu">전체</li>
<li role="button" value="대덕구" class="gu">대덕구</li>
<li role="button" value="동구" class="gu">동구</li>
<li role="button" value="서구" class="gu">서구</li>
<li role="button" value="유성구" class="gu">유성구</li>
<li role="button" value="중구" class="gu">중구</li>
</div>

<div id="울산" style="display: none;">
<li role="button" value="울산" class="gu">전체</li>
<li role="button" value="남구" class="gu">남구</li>
<li role="button" value="동구" class="gu">동구</li>
<li role="button" value="북구" class="gu">북구</li>
<li role="button" value="울주군" class="gu">울주군</li>
<li role="button" value="중구" class="gu">중구</li>
</div>

<div id="제주" style="display: none;">
<li role="button" value="제주" class="gu">전체</li>
<li role="button" value="제주시" class="gu">제주시</li>
<li role="button" value="서귀포시" class="gu">서귀포시</li>
</div>

<div id="세종" style="display: none;">
<li role="button" value="세종" class="gu">전체</li>
</div>

<div id="경기" style="display: none;">
<li role="button" value="경기" class="gu">전체</li>
<li role="button" value="가평군" class="gu">가평군</li>
<li role="button" value="고양시" class="gu">고양시</li>
<li role="button" value="과천시" class="gu">과천시</li>
<li role="button" value="광명시" class="gu">광명시</li>
<li role="button" value="광주시" class="gu">광주시</li>
<li role="button" value="구리시" class="gu">구리시</li>
<li role="button" value="군포시" class="gu">군포시</li>
<li role="button" value="김포시" class="gu">김포시</li>
<li role="button" value="남양주시" class="gu">남양주시</li>
<li role="button" value="동두천시" class="gu">동두천시</li>
<li role="button" value="부천시" class="gu">부천시</li>
<li role="button" value="성남시" class="gu">성남시</li>
<li role="button" value="수원시" class="gu">수원시</li>
<li role="button" value="시흥시" class="gu">시흥시</li>
<li role="button" value="안산시" class="gu">안산시</li>
<li role="button" value="안성시" class="gu">안성시</li>
<li role="button" value="안양시" class="gu">안양시</li>
<li role="button" value="양주시" class="gu">양주시</li>
<li role="button" value="양평군" class="gu">양평군</li>
<li role="button" value="여주시" class="gu">여주시</li>
<li role="button" value="연천군" class="gu">연천군</li>
<li role="button" value="오산시" class="gu">오산시</li>
<li role="button" value="용인시" class="gu">용인시</li>
<li role="button" value="의왕시" class="gu">의왕시</li>
<li role="button" value="의정부시" class="gu">의정부시</li>
<li role="button" value="이천시" class="gu">이천시</li>
<li role="button" value="파주시" class="gu">파주시</li>
<li role="button" value="평택시" class="gu">평택시</li>
<li role="button" value="포천시" class="gu">포천시</li>
<li role="button" value="하남시" class="gu">하남시</li>
</div>

<div id="경남" style="display: none;">
<li role="button" value="경남" class="gu">전체</li>
<li role="button" value="거제시" class="gu">거제시</li>
<li role="button" value="거창군" class="gu">거창군</li>
<li role="button" value="고성군" class="gu">고성군</li>
<li role="button" value="김해시" class="gu">김해시</li>
<li role="button" value="남해군" class="gu">남해군</li>
<li role="button" value="밀양시" class="gu">밀양시</li>
<li role="button" value="사천시" class="gu">사천시</li>
<li role="button" value="산청군" class="gu">산청군</li>
<li role="button" value="양산시" class="gu">양산시</li>
<li role="button" value="의령군" class="gu">의령군</li>
<li role="button" value="진주시" class="gu">진주시</li>
<li role="button" value="창녕군" class="gu">창녕군</li>
<li role="button" value="창원시" class="gu">창원시</li>
<li role="button" value="통영시" class="gu">통영시</li>
<li role="button" value="하동군" class="gu">하동군</li>
<li role="button" value="함안군" class="gu">함안군</li>
<li role="button" value="함양군" class="gu">함양군</li>
<li role="button" value="합천군" class="gu">합천군</li>
</div>

<div id="경북" style="display: none;">
<li role="button" value="경북" class="gu">전체</li>
<li role="button" value="경산시" class="gu">경산시</li>
<li role="button" value="경주시" class="gu">경주시</li>
<li role="button" value="고령군" class="gu">고령군</li>
<li role="button" value="구미시" class="gu">구미시</li>
<li role="button" value="군위군" class="gu">군위군</li>
<li role="button" value="김천시" class="gu">김천시</li>
<li role="button" value="문경시" class="gu">문경시</li>
<li role="button" value="봉화군" class="gu">봉화군</li>
<li role="button" value="상주시" class="gu">상주시</li>
<li role="button" value="성주군" class="gu">성주군</li>
<li role="button" value="안동시" class="gu">안동시</li>
<li role="button" value="영덕군" class="gu">영덕군</li>
<li role="button" value="영양군" class="gu">영양군</li>
<li role="button" value="영주시" class="gu">영주시</li>
<li role="button" value="영천시" class="gu">영천시</li>
<li role="button" value="예천군" class="gu">예천군</li>
<li role="button" value="울릉군" class="gu">울릉군</li>
<li role="button" value="울진군" class="gu">울진군</li>
<li role="button" value="의성군" class="gu">의성군</li>
<li role="button" value="청도군" class="gu">청도군</li>
<li role="button" value="청송군" class="gu">청송군</li>
<li role="button" value="칠곡군" class="gu">칠곡군</li>
<li role="button" value="포항시" class="gu">포항시</li>
</div>

<div id="충남" style="display: none;">
<li role="button" value="충남" class="gu">전체</li>
<li role="button" value="계룡시" class="gu">계룡시</li>
<li role="button" value="공주시" class="gu">공주시</li>
<li role="button" value="금산군" class="gu">금산군</li>
<li role="button" value="논산시" class="gu">논산시</li>
<li role="button" value="당진시" class="gu">당진시</li>
<li role="button" value="보령시" class="gu">보령시</li>
<li role="button" value="부여군" class="gu">부여군</li>
<li role="button" value="서산시" class="gu">서산시</li>
<li role="button" value="서천군" class="gu">서천군</li>
<li role="button" value="아산시" class="gu">아산시</li>
<li role="button" value="연기군" class="gu">연기군</li>
<li role="button" value="예산군" class="gu">예산군</li>
<li role="button" value="천안시" class="gu">천안시</li>
<li role="button" value="청양군" class="gu">청양군</li>
<li role="button" value="태안군" class="gu">태안군</li>
<li role="button" value="홍성군" class="gu">홍성군</li>
</div>

<div id="충북" style="display: none;">
<li role="button" value="충북" class="gu">전체</li>
<li role="button" value="괴산군" class="gu">괴산군</li>
<li role="button" value="단양군" class="gu">단양군</li>
<li role="button" value="보은군" class="gu">보은군</li>
<li role="button" value="영동군" class="gu">영동군</li>
<li role="button" value="옥천군" class="gu">옥천군</li>
<li role="button" value="음성군" class="gu">음성군</li>
<li role="button" value="제천시" class="gu">제천시</li>
<li role="button" value="증평군" class="gu">증평군</li>
<li role="button" value="진천군" class="gu">진천군</li>
<li role="button" value="청주시" class="gu">청주시</li>
<li role="button" value="충주시" class="gu">충주시</li>
</div>

<div id="전남" style="display: none;">
<li role="button" value="전남" class="gu">전체</li>
<li role="button" value="강진군" class="gu">강진군</li>
<li role="button" value="고흥군" class="gu">고흥군</li>
<li role="button" value="곡성군" class="gu">곡성군</li>
<li role="button" value="광양시" class="gu">광양시</li>
<li role="button" value="구례군" class="gu">구례군</li>
<li role="button" value="나주시" class="gu">나주시</li>
<li role="button" value="담양군" class="gu">담양군</li>
<li role="button" value="목포시" class="gu">목포시</li>
<li role="button" value="무안군" class="gu">무안군</li>
<li role="button" value="보성군" class="gu">보성군</li>
<li role="button" value="순천시" class="gu">순천시</li>
<li role="button" value="신안군" class="gu">신안군</li>
<li role="button" value="여수시" class="gu">여수시</li>
<li role="button" value="영광군" class="gu">영광군</li>
<li role="button" value="영암군" class="gu">영암군</li>
<li role="button" value="완도군" class="gu">완도군</li>
<li role="button" value="장성군" class="gu">장성군</li>
<li role="button" value="장흥군" class="gu">장흥군</li>
<li role="button" value="진도군" class="gu">진도군</li>
<li role="button" value="함평군" class="gu">함평군</li>
<li role="button" value="해남군" class="gu">해남군</li>
<li role="button" value="화순군" class="gu">화순군</li>
</div>

<div id="전북" style="display: none;">
<li role="button" value="전북" class="gu">전체</li>
<li role="button" value="고창군" class="gu">고창군</li>
<li role="button" value="군산시" class="gu">군산시</li>
<li role="button" value="김제시" class="gu">김제시</li>
<li role="button" value="남원군" class="gu">남원군</li>
<li role="button" value="무주군" class="gu">무주군</li>
<li role="button" value="부안군" class="gu">부안군</li>
<li role="button" value="완주군" class="gu">완주군</li>
<li role="button" value="익산시" class="gu">익산시</li>
<li role="button" value="임실군" class="gu">임실군</li>
<li role="button" value="장수군" class="gu">장수군</li>
<li role="button" value="전주시" class="gu">전주시</li>
<li role="button" value="정읍시" class="gu">정읍시</li>
<li role="button" value="진안군" class="gu">진안군</li>
</div>

<div id="강원" style="display: none;">
<li role="button" value="강원" class="gu">전체</li>
<li role="button" value="강릉시" class="gu">강릉시</li>
<li role="button" value="고성군" class="gu">고성군</li>
<li role="button" value="동해시" class="gu">동해시</li>
<li role="button" value="삼척시" class="gu">삼척시</li>
<li role="button" value="속초시" class="gu">속초시</li>
<li role="button" value="양구군" class="gu">양구군</li>
<li role="button" value="양양군" class="gu">양양군</li>
<li role="button" value="영월군" class="gu">영월군</li>
<li role="button" value="원주시" class="gu">원주시</li>
<li role="button" value="인제군" class="gu">인제군</li>
<li role="button" value="정선군" class="gu">정선군</li>
<li role="button" value="철원군" class="gu">철원군</li>
<li role="button" value="순천시" class="gu">순천시</li>
<li role="button" value="태백시" class="gu">태백시</li>
<li role="button" value="평창군" class="gu">평창군</li>
<li role="button" value="홍천군" class="gu">홍천군</li>
<li role="button" value="화천군" class="gu">화천군</li>
<li role="button" value="횡성군" class="gu">횡성군</li>
</div>

</div> 
<!-- 스크롤부분 닫음 -->

</div> 
<!-- 지역필터링 닫음 -->

<!--  -->
</div>
<script type="text/javascript">

//지역별 검색
$("li").click(function(){
	$(this).css("background-color","#cce891");
	$(this).css("color","white");
	$(this).siblings().css("background-color","white");
	$(this).siblings().css("color","black");
	
	const addr=$(this).attr("value"); //li의 value는 숫자만 가능

	if(addr=="서울"){
		$("#서울").show();
		$("#서울").siblings().hide();
	}else if(addr=="경기"){
		$("#경기").show();
		$("#경기").siblings().hide();
	}else if(addr=="인천"){
		$("#인천").show();
		$("#인천").siblings().hide();
	}else if(addr=="강원"){
		$("#강원").show();
		$("#강원").siblings().hide();
	}else if(addr=="충북"){
		$("#충북").show();
		$("#충북").siblings().hide();
	}else if(addr=="충남"){
		$("#충남").show();
		$("#충남").siblings().hide();
	}else if(addr=="세종"){
		$("#세종").show();
		$("#세종").siblings().hide();
	}else if(addr=="대전"){
		$("#대전").show();
		$("#대전").siblings().hide();
	}else if(addr=="대구"){
		$("#대구").show();
		$("#대구").siblings().hide();
	}else if(addr=="경북"){
		$("#경북").show();
		$("#경북").siblings().hide();
	}else if(addr=="경남"){
		$("#경남").show();
		$("#경남").siblings().hide();
	}else if(addr=="울산"){
		$("#울산").show();
		$("#울산").siblings().hide();
	}else if(addr=="부산"){
		$("#부산").show();
		$("#부산").siblings().hide();
	}else if(addr=="광주"){
		$("#광주").show();
		$("#광주").siblings().hide();
	}else if(addr=="전북"){
		$("#전북").show();
		$("#전북").siblings().hide();
	}else if(addr=="전남"){
		$("#전남").show();
		$("#전남").siblings().hide();
	}else if(addr=="제주"){
		$("#제주").show();
		$("#제주").siblings().hide();
	}
	
})

$(".gu").click(function(){
	
	const gu_name=$(this).attr("value");
	$("#basic-list").empty();
	$(".pagination").empty();
	
	$.ajax({
		type:"get",
		url:"addrsearch",
		dataType:"json",
		data:{"p_addr":gu_name},
		success:function(res){
			let s="";
			s+="<table class='table'>";
			s+="<caption>"+gu_name+"에 해당하는 "+res.length+"개의 검색 결과가 있습니다.</caption>";
			s+="<tr align='center'><td width='60'>지역</td><td width='400'>모집내용/기업명</td><td width='120'>급여</td>";
	   		s+="<td width='50'>근무시간</td><td width='100'>등록일</td></tr>";
	   		$.each(res,function(i,ele){
	   			//주소
	   			s+="<tr><td width='60'>"+ele.p_addr+"</td>";
	   			//제목
	   			s+="<td width='400'><span id='posting-title'>";
	   			s+="<a href='detailpage?p_num="+ele.p_num+"'>"+ele.p_title+"</a></span><br>";
	   			s+="<span id='enterprise-name'>["+ele.p_type+"]"+ele.e_name+"</span></td>";
	   			//급여
	   			if (ele.p_employtype === '정규직') {
	   			  s += "<td width='120'>[월급] " + ele.p_pay + "</td>";
	   			} else if (ele.p_employtype === '기간제') {
	   			  s += "<td width='120'>[시급] " + ele.p_pay + "</td>";
	   			} 
	   			//업무시간
	   			s+="<td width='160'>"+moment('2000-01-01 '+ele.p_starttime).format('HH:mm')+"-"+moment('2000-01-01 '+ele.p_endtime).format('HH:mm')+"</td>";
				//공고등록일	   			
	   			s+="<td width='100'>"+moment(ele.p_writeday).format('YYYY-MM-DD')+"</td></tr>";
	   			
			})
			
			s+="</table>";
			
			$("#addr-box").html(s);
			$("#nosearch").hide();
		}
	}) // ajax끝
	
})


</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<br>
<h4>검색어로 검색하기</h4><br>
<form action="/posting/search" method="get">
	<div class="form-inline">
		<select class="form-control" style="width: 150px;" name="searchcolumn">
		  <option value="p_title">제목</option>
		  <option value="e_num">일단회사번호</option>
		  <option value="e_addr">일단주소</option>
		  <option value="p_content">내용</option>
		</select>
		&nbsp;&nbsp;&nbsp;
		<input type="text" name="searchword" class="form-control" style="width: 200px;" placeholder="검색어를 입력하세요">
		<button type="submit">검색</button>
		<button type="button" onclick="location.href='/posting/search'">초기화</button>
	</div>
</form>


 <div style="margin: 30px 30px;">
 
 
     	<!-- 지역별 필터링 후 테이블 나오는 부분 -->
     	<div id="addr-box"></div>
   	
   	<table class="table" id="basic-list">
   		<caption>
   		<c:if test="${searchCount>0}">총 ${searchCount }개의 글이 있습니다.</c:if>
   		<c:if test="${sessionScope.loginStatus=='enterprise' }">
   		<span style="float: right;"><button type="button"
   		onclick="location.href='insertForm'">글쓰기</button></span>
   		</c:if>
   		</caption>

   		<tr align="center">
   		  <td width="60">지역</td>
   		  <td width="400">모집내용/기업명</td>
   		  <td width="120">급여</td>
   		  <td width="150">근무시간</td>
   		  <td width="100">등록일</td>
   		</tr>
   		
   		<c:if test="${searchCount==0 }">
   		<tr><td colspan="5" align="center">
   		<span id="nosearch">검색된 게시글이 없습니다.</span>
   		</td></tr>
   		</c:if>
   		
   		<c:if test="${searchCount>0}">
   		<c:forEach var="dto" items="${list }">
   		<tr>
   		<td width="60">${dto.p_addr }</td>
		<td width="400">
		<span id="posting-title">
		<a href="detailpage?p_num=${dto.p_num}&currentPage=${currentPage}">${dto.p_title }</a>
		</span>
		<br>
		<span id="enterprise-name">[${dto.p_type }] | ${dto.e_name }</span>
		</td>
		<td width="120">
		<c:if test="${dto.p_employtype=='정규직' }">
		[월급]</c:if>
		<c:if test="${dto.p_employtype=='기간제' }">
		[시급]</c:if>
		${dto.p_pay }
		</td>
		<td width="150">
		${dto.p_starttime } - ${dto.p_endtime }
		</td>
		<td width="100"><fmt:formatDate value="${dto.p_writeday }" pattern="yyyy-MM-dd"/></td>
   		</tr>
   		</c:forEach>
   		

     	</table>
   		
   		<!-- 페이징 처리 -->
   		
		<div style="width: 800px; text-align: center;" class="container">
		<ul class="pagination">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
			<li>
				<c:if test="${keyword!=null }">
					<a href="search?currentPage=${startPage-1 }&searchcolumn=${column}&searchword=${keyword}">이전</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="search?currentPage=${startPage-1 }">이전</a>
				</c:if>
			</li>
			</c:if>
			
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			  <c:if test="${pp==currentPage }">
				<li class="active">
				 <c:if test="${keyword!=null }">
			    <a href="search?currentPage=${pp}&searchcolumn=${column}&searchword=${keyword}">${pp}</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="search?currentPage=${pp}">${pp}</a>
				</c:if>
				</li>  
			  </c:if>
			  <c:if test="${pp!=currentPage }">
			    <li>
			    <c:if test="${keyword!=null }">
			    <a href="search?currentPage=${pp}&searchcolumn=${column}&searchword=${keyword}">${pp}</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="search?currentPage=${pp}">${pp}</a>
				</c:if>
				 
				</li>
			  </c:if>
			</c:forEach>

			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
				<li>
				<c:if test="${keyword!=null }">
					<a href="search?currentPage=${endPage+1}&searchcolumn=${column}&searchword=${keyword}">다음</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="search?currentPage=${endPage+1}">다음</a>
				</c:if>
				</li>
			</c:if>
		</ul>
		</div>
		</c:if>
   	
   </div>
</body>
</html>