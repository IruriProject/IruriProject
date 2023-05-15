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
</head>
<body>
	<table class="table" style="width: 100%; margin: 0 auto;">
		<c:forEach var="dto" items="${list }" varStatus="i" end="0">
			<caption>
				<h2 style="display: inline">
					<b>공고명 : ${dto.p_title }</b>
				</h2>
				<h4 style="display: inline">&nbsp;(${dto.p_type})</h4>
			</caption>
		</c:forEach>
		<tr>
			<th style="text-align: center">No.</th>
			<th style="text-align: center">스크랩한인재명</th>
			<th style="text-align: center">인재성별</th>
			<th style="text-align: center">인재나이</th>
			<th style="text-align: center">인재연락처</th>
			<th style="text-align: center">인재주소</th>
			<th style="text-align: center">쪽지보내기</th>
		</tr>
		<c:if test="${list.size()==0 }">
			<tr align="center">
				<td colspan="7">해당 공고를 스크랩한 인재가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr align="center">
				<td>${i.count }</td>
				<td>${dto.u_name }</td>
				<td>${dto.u_gender }</td>
				<td>${dto.u_birth }</td>
				<td>${dto.u_hp }</td>
				<td>${dto.u_addr }</td>
				<td><button type="button" class="btn btn-info"
						onclick="location.href='../posting/writemessage?u_id=${dto.u_id}'">쪽지보내기</button></td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
		<div style="width: 800px; text-align: center;">
			<ul class="pagination">

				<!-- 이전 -->
				<c:if test="${startPage > 1 }">
					<li><a href="/enterprise/scraplist?p_num=${p_num }&currentPage=${startPage - 1 }">이전</a></li>
				</c:if>
				<c:forEach var="pp" begin="${startPage }" end="${endPage }">

					<c:if test="${pp == currentPage }">
						<li class="active"><a href="/enterprise/scraplist?p_num=${p_num }&currentPage=${pp }">${pp }</a></li>
					</c:if>
					<c:if test="${pp != currentPage }">
						<li><a href="/enterprise/scraplist?p_num=${p_num }&currentPage=${pp }">${pp }</a></li>
					</c:if>

				</c:forEach>

				<!-- 다음 -->
				<c:if test="${endPage < totalPage }">
					<li><a href="/enterprise/scraplist?p_num=${p_num }&currentPage=${endPage + 1 }">다음</a></li>
				</c:if>

			</ul>
		</div>
</body>
</html>