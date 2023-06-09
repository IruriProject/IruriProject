<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.longsentence{
	word-break: break-all;
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
}
td a{
color:black;
}
td a:hover{
color:black;
text-decoration: none;
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
<h2 style="width: 80%; margin: 0 auto;">쪽지함</h2><br>
	<table class="table" style="width: 80%; margin: 0 auto;">
		<tr>
			<th style="text-align: center">No.</th>
			<th style="text-align: center">보낸회사</th>
			<th style="text-align: center; width: 40%">쪽지 내용</th>
			<th style="text-align: center">보낸일시</th>
		</tr>
		<c:if test="${list.size()==0 }">
			<tr align="center">
				<td colspan="4">쪽지내역이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list }" varStatus="i">
		<tr align="center">
			<td>${i.count }</td>
			<td><a href="/enterprise/enterprisepage?e_num=${dto.e_num }">${dto.e_name }</a></td>
			<td><span class="longsentence mcontent" flag="0" style="cursor: pointer;" title="자세히보기">${dto.m_content }</span></td>
			<td><fmt:formatDate value="${dto.m_day }" pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>