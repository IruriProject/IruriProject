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
<link href="${root }/css/usercss/style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<br><br>
<table class="table" style="width: 100%; margin: 0 auto;">
	<caption><b>총 ${adto.size() }명의 지원자가 있습니다.</b></caption>
		<tr>
			<th scope="col" style="text-align: center">번호</th>
			<th scope="col" style="text-align: center">지원자명</th>
			<th scope="col" style="text-align: center">지원공고</th>
			<th scope="col" style="text-align: center">이력서보기</th>
			<th scope="col" style="text-align: center">지원날짜</th>
			<th style="text-align: center">쪽지보내기</th>
		</tr>
		<c:if test="${adto.size()==0 }">
			<tr align="center">
				<td colspan="6">지원한 인재가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="adto" items="${adto }" varStatus="i">
			<tr align="center">
				<td>${i.count }</td>
				<td>${adto.u_name}</td>
				<td><a style="color: #416442; href="/posting/detailpage?p_num=${adto.p_num }">${adto.p_title}</a></td>
				<td><a style="color: #416442; font-weight: 600" href="/resume/detail?r_num=${adto.r_num }" onclick="window.open(this.href, '_blank', 'menubar=no, toolbar=no'); return false;">${adto.r_title }</a></td>
				<td><fmt:formatDate value="${adto.a_writeday }" pattern="yyyy.MM.dd"/></td>
				<td><button type="button" class="sm-color-btn setMainOff"
						onclick="location.href='../posting/writemessage?u_id=${dto.u_id}'">쪽지보내기</button></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>