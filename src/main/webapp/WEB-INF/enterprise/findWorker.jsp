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

	
</style>

<title>Insert title here</title>
</head>
<body>

<form action="/enterprise/findworker" method="get">

	<input type="text" name="r_larea">
	<!-- <div class="formbold-mb-3">
       <label class="formbold-form-label">직종</label>
       <select
          class="formbold-form-input">
          <option value="">선택</option>
          <option value="건설/건축">건설/건축</option>
          <option value="공공/복지/봉사/교육">공공/복지/봉사/교육</option>
          <option value="금융/보험">금융/보험</option>
          <option value="기술">기술</option>
          <option value="농업/어업">농업/어업</option>
          <option value="법무">법무</option>
          <option value="사무">사무</option>
          <option value="서비스">서비스</option>
          <option value="생산/제조">생산/제조</option>
          <option value="운송">운송</option>
          <option value="의료">의료</option>
       </select>
    </div> -->
	
	<input type="input" id="r_ltask" name="r_ltask" readonly>
	<li role="button" value="의료">의료</li>
	<li role="button" value="개발">개발</li>
	<li role="button" value="코딩">코딩</li>
	<li role="button" value="광고/홍보">광고/홍보</li>
	
	<script type="text/javascript">
	$("li").click(function(){
		$("#r_ltask").val($(this).attr("value"));
	})
	
	
	</script>
    
	<input type="radio" name="r_ltype" value="정규직"> 정규직
	<input type="radio" name="r_ltype" value="기간제"> 기간제

	<button type="submit">검색</button>
	<button type="button" onclick="location.href='/enterprise/findworker'">초기화</button>
</form>
	
	<c:forEach var="dto" items="${list }">
		${dto.r_title }
	</c:forEach>
	
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
   	
</body>
</html>