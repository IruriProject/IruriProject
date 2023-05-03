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
	
	li{
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
<li role="button" value="강원">강원</li>
<li role="button" value="충북">충북</li>
<li role="button" value="충남">충남</li>
<li role="button" value="세종">세종</li>
<li role="button" value="대전">대전</li>
<li role="button" value="대구">대구</li>
<li role="button" value="경북">경북</li>
<li role="button" value="경남">경남</li>
<li role="button" value="부산">부산</li>
<li role="button" value="전북">전북</li>
<li role="button" value="전남">전남</li>
<li role="button" value="제주">제주</li>
</div>

<div style="overflow:scroll; width:100px; height:150px;" class="addr-detail scroll-box">

<div id="서울" style="display: none;">
<li role="button" value="전체" class="gu">전체</li>
<li role="button" value="강남구" class="gu">강남구</li>
<li role="button" value="성북구" class="gu">성북구</li>
<li role="button" value="서초구" class="gu">서초구</li>
<li role="button" value="동대문구">동대문구</li>
<li role="button" value="송파구">송파구</li>
<li role="button" value="서대문구">서대문구</li>
<li role="button" value="종로구">종로구</li>
<li role="button" value="관악구">관악구</li>
<li role="button" value="중구">중구</li>
<li role="button" value="마포구">마포구</li>
<li role="button" value="노원구">노원구</li>
<li role="button" value="영등포구">영등포구</li>
</div>

<div id="경기" style="display: none;">
<li role="button" value="지역1" class="gu">지역1</li>
<li role="button" value="지역2" class="gu">지역2</li>
<li role="button" value="지역3" class="gu">지역3</li>
<li role="button" value="지역4" class="gu">지역4</li>
<li role="button" value="남양주시">남양주시</li>
<li role="button" value="용인시">용인시</li>
<li role="button" value="시흥시">시흥시</li>
<li role="button" value="부천시">부천시</li>
<li role="button" value="구리시">구리시</li>
<li role="button" value="의정부시">의정부시</li>
</div>

</div> <!-- 스크롤부분 닫음 -->

</div> <!-- 지역필터링 닫음 -->

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
			s+="<caption>"+res.length+"개의 검색 결과가 있습니다.</caption>";
			s+="<tr align='center'><td width='60'>지역</td><td width='400'>모집내용/기업명</td><td width='120'>급여</td>";
	   		s+="<td width='50'>근무시간</td><td width='100'>등록일</td></tr>";

	   		$.each(res,function(i,ele){
	   			//주소
	   			s+="<tr><td width='60'>"+ele.p_addr+"</td>";
	   			//제목
	   			s+="<td width='400'><span id='posting-title'>";
	   			s+="<a href='detailpage?p_num="+ele.p_num+"'>"+ele.p_title+"</a></span><br>";
	   			s+="<span id='enterprise-name'>["+ele.p_type+"] 일단회사번호"+ele.p_num+"</span></td>";
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
		}
	} // ajax끝
	
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

</div>

 <div style="margin: 30px 30px;">
   	
   	<table class="table" id="basic-list">
   		<caption>
   		<c:if test="${totalCount==0 }">
   		<tr>
   		  <td colspan="5" align="center"><b>등록된 게시글이 없습니다.</b></td>
   		</tr>
   		</c:if>
   		<c:if test="${totalCount>0 }">총 ${totalCount }개의 글이 있습니다.</c:if>
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
   		
   		<c:if test="${totalCount>0 }">
   		<c:forEach var="dto" items="${list }">
		
   		<tr>
   		<td width="60">${dto.p_addr }</td>
		<td width="400">
		<span id="posting-title">
		<a href="detailpage?p_num=${dto.p_num}">${dto.p_title }</a>
		</span>
		<br>
		<span id="enterprise-name">[${dto.p_type }] 일단회사번호 ${dto.e_num }</span>
		</td>
		<td width="120">
		<c:if test="${dto.p_employtype=='정규직' }">
		[월급]</c:if>
		<c:if test="${dto.p_employtype=='기간제' }">
		[시급]</c:if>
		${dto.p_pay }
		</td>
		<td width="150">
		<fmt:formatDate value="${dto.p_starttime}" type="time" pattern="HH:mm"/> - 
		<fmt:formatDate value="${dto.p_endtime}" type="time" pattern="HH:mm"/>
		</td>
		<td width="100"><fmt:formatDate value="${dto.p_writeday }" pattern="yyyy-MM-dd"/></td>
   		</tr>
   		</c:forEach>
   		</c:if>

     	</table>
     	
     	<!-- 지역별 필터링 후 테이블 나오는 부분 -->
     	<div id="addr-box"></div>
   		
   		<!-- 페이징 처리 -->
   		<c:if test="${totalCount>0 }">
		<div style="width: 800px; text-align: center;" class="container">
		<ul class="pagination">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
			<li>
				<a href="list?currentPage=${startPage-1 }">이전</a>
			</li>
			</c:if>
			
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			  <c:if test="${pp==currentPage }">
				<li class="active">
				 <a href="list?currentPage=${pp}">${pp}</a>
				</li>  
			  </c:if>
			  <c:if test="${pp!=currentPage }">
			    <li>
				 <a href="list?currentPage=${pp}">${pp}</a>
				</li>
			  </c:if>
			</c:forEach>

			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
				<li>
					<a href="list?currentPage=${endPage+1}">다음</a>
				</li>
			</c:if>
		</ul>
		</div>
   		</c:if>

   	
   </div>
</body>
</html>