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
	<form class="form-inline" style="width: 100%; margin: 0 auto">
		<select class="form-control">
			<option>인재이름</option>
		</select> <input type="text" placeholder="검색어 입력" class="form-control">
		<button type="button" class="btn btn-info">검색</button>
	</form>
	<br>
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
</body>
</html>