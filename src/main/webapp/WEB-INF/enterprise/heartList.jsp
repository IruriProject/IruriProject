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
<link href="${root }/css/usercss/style.css" rel="stylesheet">
</head>
<style>
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
	text-decoration: none;
	color:#416442;
	background-color:#e3f2c9;
}
</style>
<body>
	<table class="table" style="width: 100%; margin: 0 auto;">
		<tr>
			<th style="text-align: center">No.</th>
			<th style="text-align: center">찜한 인재명</th>
			<th style="text-align: center">인재성별</th>
			<th style="text-align: center">인재연락처</th>
			<th style="text-align: center">인재주소</th>
			<th style="text-align: center">쪽지보내기</th>
		</tr>
		<c:if test="${list.size()==0 }">
			<tr align="center">
				<td colspan="7">해당 기업을 찜한 인재가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr align="center">
				<td>${no }</td>
				<c:set value="${no-1 }" var="no"/>
				<td>
					<c:if test="${dto.r_num!=null }">
						<a style="color: #416442; font-weight: 600" onclick="window.open(this.href, '_blank', 'menubar=no, toolbar=no, width=500, height=300'); return false;" href="/resume/detail?r_num=${dto.r_num }" title="해당 인재 대표이력서 확인">${dto.u_name }</a>
					</c:if>
				
					<c:if test="${dto.r_num==null }">
						<a style="color: #416442; font-weight: 600" href="#" title="해당 인재 대표이력서 없음" onclick="alert('해당 인재는 대표이력서가 없습니다.')">${dto.u_name }</a>
					</c:if>
				</td>
				<td>${dto.u_gender }</td>
				<td>${dto.u_hp }</td>
				<td>${dto.u_addr }</td>
				<td><button type="button" class="sm-color-btn setMainOff"
						onclick="location.href='../posting/writemessage?u_id=${dto.u_id}'">쪽지보내기</button></td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
		<div class="pagination" style=" display: flex; justify-content: center; width:100%; text-align: center;">

			<!-- 이전 -->
			<c:if test="${startPage > 1 }">
				<a href="/enterprise/heartlist?e_num=${e_num }&currentPage=${startPage - 1 }">&laquo;</a>
			</c:if>
			
			<c:forEach var="pp" begin="${startPage }" end="${endPage }">
				<c:if test="${pp == currentPage }">
					<a class="active" href="/enterprise/heartlist?e_num=${e_num }&currentPage=${pp }">${pp }</a>
				</c:if>
				<c:if test="${pp != currentPage }">
					<a href="/enterprise/heartlist?e_num=${e_num }&currentPage=${pp }">${pp }</a>
				</c:if>
			</c:forEach>

			<!-- 다음 -->
			<c:if test="${endPage < totalPage }">
				<a href="/enterprise/heartlist?e_num=${e_num }&currentPage=${endPage + 1 }">&raquo;</a>
			</c:if>

	  </div>
</body>
</html>