<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="${root }/css/usercss/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">

	.pagination {
	  display: inline-block;
	}
	
	.pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	  transition: background-color .3s;
	}
	
	.pagination a.active {
	  background-color: #4E9F3D;
	  color: white;
	  text-decoration: none;
	}
	
	.pagination a:hover:not(.active) {
		text-decoration: none; color:#416442; background-color:#e3f2c9;
		}	

	.wrapper{
		border: 1px solid gray;
		padding: 20px 40px;
		width: 600px; height: 100%;
		margin: 0 auto;
		margin-bottom: 50px;
	}
	
	.result-wrapper{
		width: 80%;
		margin: 0px auto;
	}
	
	#r_larea{
		border: 1px solid gray;
		width: 150px; height: 30px;
	}
	
	#r_larea:focus{
		border: 1px solid #cce891;
	}

	li[role="button"]{
		float: left;
		margin: 7px 3px;
		border: 1px solid #cce891;
		border-radius:20px;
		padding: 0px 7px;
		text-align:center;
		cursor: pointer;
	}
	
	.xs-border-btn{
		color:  black;
		width: 60px; 
	}
	
	#notice{
		color: gray;
		font-size: .9em;
	}
	
</style>

<title>Insert title here</title>
</head>
<body>

<div class="wrapper">
<form action="/enterprise/findworker" method="get">

	<h4>희망근무지역</h4>
	<input type="text" name="r_larea" id="r_larea" class="form-control"
	placeholder="시, 구 이름을 입력해주세요" style="width: 200px;">
	<span id="notice">ex. 서울, 경기 양평군</span>
	
	<br><hr>
	
	<h4>희망업무</h4>
	<input type="hidden" id="r_ltask" name="r_ltask" readonly>
	<li role="button" value="건설/건축">건설/건축</li>
	<li role="button" value="공공/복지/봉사/교육">공공/복지/봉사/교육</li>
	<li role="button" value="금융/보험">금융/보험</li>
	<li role="button" value="기술">기술</li>
	<li role="button" value="농업/어업">농업/어업</li>
	<li role="button" value="법무">법무</li>
	<li role="button" value="사무">사무</li>
	<li role="button" value="서비스">서비스</li>
	<li role="button" value="생산/제조">생산/제조</li>
	<li role="button" value="운송">운송</li>
	<li role="button" value="의료">의료</li>
	
	<br><br><br><br><hr>
	
	<script type="text/javascript">
	$("li").click(function(){
		$("#r_ltask").val($(this).attr("value"));

		$(this).css("background-color","#cce891");
		$(this).css("color","white");
		$(this).siblings().css("background-color","white");
		$(this).siblings().css("color","black");
	})
	
	</script>
    
    <h4>희망근무형태</h4>
	<input type="radio" name="r_ltype" value="정규직"> 정규직
	<input type="radio" name="r_ltype" value="기간제"> 기간제

	<br><br>
	
	<div align="center">
	<button type="submit" class="sm-border-btn">검색</button>
	<button type="button" class="sm-border-btn" onclick="location.href='/enterprise/findworker'">초기화</button>
	</div>
</form>
</div>
	
	<div class="result-wrapper">
	<c:if test="${empty list }">
	<h4>해당 키워드의 검색결과가 없습니다.</h4>
	</c:if>
	
	<c:if test="${not empty list }">
	<table class="table table-borderless">
	
	<tr align="center">
	  <td width="80">이름</td>
	  <td width="120">희망지역</td>
	  <td width="80">희망근무형태</td>
	  <td width="120">희망업무</td>
	  <td width="100">이력서보기</td>
	</tr>
   		
	<c:forEach var="dto" items="${list }">
		<tr>
   		<td width="80">${dto.u_name }</td>
		<td width="120">
		${dto.r_larea }
		</td>
		<td width="80">
		${dto.r_ltype }
		</td>
		<td width="120">
		${dto.r_ltask }
		</td>
		<td width="100">
			<button type="button" class="sm-border-btn" onclick="location.href='/resume/detail?r_num=${dto.r_num}'">
			이력서보기</button>
		</td>
   		</tr>
	</c:forEach>
	</table>
	</c:if>
	</div>
	
	<!-- 페이징 처리 -->
   		
		<div style="width: 800px; text-align: center;" class="container">
		<div class="pagination">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
				<c:if test="${keyword!=null }">
					<a href="search?currentPage=${startPage-1 }&searchcolumn=${column}&searchword=${keyword}">이전</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="search?currentPage=${startPage-1 }">이전</a>
				</c:if>
			</c:if>
			
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			  <c:if test="${pp==currentPage }">
				 <c:if test="${keyword!=null }">
			    <a href="search?currentPage=${pp}&searchcolumn=${column}&searchword=${keyword}">${pp}</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="search?currentPage=${pp}">${pp}</a>
				</c:if>
			  </c:if>
			  <c:if test="${pp!=currentPage }">
			    <c:if test="${keyword!=null }">
			    <a href="search?currentPage=${pp}&searchcolumn=${column}&searchword=${keyword}">${pp}</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="search?currentPage=${pp}">${pp}</a>
				</c:if>
				 
			  </c:if>
			</c:forEach>

			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
				<c:if test="${keyword!=null }">
					<a href="search?currentPage=${endPage+1}&searchcolumn=${column}&searchword=${keyword}">다음</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="search?currentPage=${endPage+1}">다음</a>
				</c:if>
			</c:if>
		</div>
		</div>
   	
</body>
</html>