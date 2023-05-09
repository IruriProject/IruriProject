<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
	

<!-- Libraries Stylesheet -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="${root }/css/usercss/owl.carousel.min.css" rel="stylesheet">
<link href="${root }/css/usercss/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="${root }/css/usercss/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${root }/css/usercss/style.css" rel="stylesheet">
<style type="text/css">
div {
	border: 1px solid gray;
}
</style>
</head>
<body>
	
	이력서 목록.

		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h6 class="mb-0">나의 이력서 목록</h6>
					<a href="">Show All</a>
				</div>
				<div class="table-responsive">
					<table
						class="table text-start align-middle table-bordered table-hover mb-0"
						style="width: 1000px;" >
						<thead>
							<tr class="text-dark">
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">내용</th>
								<th scope="col">이력서 관리</th>
								<th scope="col">설정관리</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<c:forEach var="dto" items="${list }" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${dto.r_title}</td>
								<td>${dto.r_content}</td>
								<td>수정페이지로 이동버튼</td>
								<td>
								<!-- if문 -->
								<c:if test="${dto.r_presume==0}">
								<button type="button">공개 전환</button>
								</c:if>
								<c:if test="${dto.r_presume==1}">
								<button type="button">비공개 전환</button>
								</c:if>
								</td>
								<td><input type="checkbox"></td>
							</tr>
						</c:forEach>
					</table>
						<button type="button">삭제</button>
				</div>
			</div>
		</div>
	
	
	
</body>
</html>