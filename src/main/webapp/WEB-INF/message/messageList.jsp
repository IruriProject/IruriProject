<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">
.longsentence{
	word-break: break-all;
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
}
</style>
<script>
$(function(){
	$(".mcontent").click(function(){
		if($(this).attr("flag")==0){
			$(this).removeClass('longsentence');
			$(this).attr("flag","1");
			$(this).attr("title","접기");
		}else {
			$(this).addClass('longsentence');
			$(this).attr("flag","0");
			$(this).attr("title","자세히보기");
		}
		
	})
})
</script>
</head>
<body>
	<form class="form-inline" action="/posting/messagelist" method="get" style="width: 80%; margin: 0 auto">
		<select class="form-control" name="searchcolumn">
			<option value="u_name">인재이름</option>
		</select>
		<input type="text"
			placeholder="검색어 입력" class="form-control" name="searchword">
		<button type="submit" class="btn btn-info">검색</button>
		<button type="button" class="btn btn-info" onclick="location.href='/posting/messagelist'">초기화</button>
	</form>
	<br>
	<table class="table" style="width: 80%; margin: 0 auto;">
		<tr>
			<th style="text-align: center">No.</th>
			<th style="text-align: center">받은인재</th>
			<th style="text-align: center; width: 40%">쪽지 내용</th>
			<th style="text-align: center">보낸일시</th>
		</tr>
<%-- 		<c:if test="${list.size()==0 }">
			<tr align="center">
				<td colspan="4">쪽지내역이 존재하지 않습니다.</td>
			</tr>
		</c:if> --%>
		
		
		<c:if test="${totalCount==0 }">
   		<tr><td colspan="4" align="center">
   		<span id="nosearch">쪽지 내역이 존재하지 않습니다.</span>
   		</td></tr>
   		</c:if>
		
		<c:if test="${totalCount!=0 && searchCount==0 }">
   		<tr><td colspan="4" align="center">
   		<span id="nosearch">검색된 쪽지가 없습니다.</span>
   		</td></tr>
   		</c:if>
		
		<c:if test="${searchCount>0 }">
		<c:forEach var="dto" items="${list }" varStatus="i">
		<tr align="center">
			<td>${no }</td>
			<c:set value="${no-1 }" var="no"/>
			<td><a href="#">${dto.u_name }</a></td>
			<td><span class="longsentence mcontent" flag="0" style="cursor: pointer;" title="자세히보기">${dto.m_content }</span></td>
			<td><fmt:formatDate value="${dto.m_day }" pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
	
	<c:if test="${searchCount>0 }">
	<!-- 페이징 -->
	<div style="width: 800px; text-align: center;" class="container">
		<ul class="pagination">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
			<li>
				<c:if test="${keyword!=null }">
					<a href="messagelist?currentPage=${startPage-1 }&searchcolumn=${column}&searchword=${keyword}">이전</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="messagelist?currentPage=${startPage-1 }">이전</a>
				</c:if>
			</li>
			</c:if>
			
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			  <c:if test="${pp==currentPage }">
				<li class="active">
				 <c:if test="${keyword!=null }">
			    <a href="messagelistt?currentPage=${pp}&searchcolumn=${column}&searchword=${keyword}">${pp}</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="messagelist?currentPage=${pp}">${pp}</a>
				</c:if>
				</li>  
			  </c:if>
			  <c:if test="${pp!=currentPage }">
			    <li>
			    <c:if test="${keyword!=null }">
			    <a href="messagelist?currentPage=${pp}&searchcolumn=${column}&searchword=${keyword}">${pp}</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="messagelist?currentPage=${pp}">${pp}</a>
				</c:if>
				 
				</li>
			  </c:if>
			</c:forEach>

			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
				<li>
				<c:if test="${keyword!=null }">
					<a href="messagelistt?currentPage=${endPage+1}&searchcolumn=${column}&searchword=${keyword}">다음</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="messagelist?currentPage=${endPage+1}">다음</a>
				</c:if>
				</li>
			</c:if>
		</ul>
		</div>
		
		</c:if>
	
</body>
</html>