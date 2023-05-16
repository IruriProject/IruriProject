<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관심 기업</title>
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
	border: 0px solid gray;
}

.btndel{
	cursor: pointer;
}
</style>
</head>
<body>
	
	
	<h3 class="alert alert-info">총 ${countLikeEnter }개의 관심 기업</h3>

	<!-- Recent Sales Start -->
	<!-- <form action="getEnter" method="get" ></form> -->
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h6 class="mb-0">나의 관심 기업</h6>
				</div>
				<div class="table-responsive">
					<table
						class="table text-start align-middle table-bordered table-hover mb-0"
						style="width: 1000px;" >
						<thead>
							<tr class="text-dark">
								<th scope="col" style="text-align: center;"><input class="form-check-input"
									type="checkbox"></th>
								<th scope="col" style="text-align: center;">No.</th>
								<th scope="col" style="text-align: center;">기업명</th>
								<th scope="col" style="text-align: center;">주소</th>
								<th scope="col" style="text-align: center;">전화번호</th>
								<th scope="col" style="text-align: center;">이메일</th>
								<th scope="col" style="text-align: center;">Action</th>
								
							</tr>
						</thead>
						<tbody>
						<c:forEach var="dto" items="${list }" varStatus="i">
							<tr>
								<td style="text-align: center;"><input class="form-check-input" type="checkbox"></td>
								<td style="text-align: center;">${i.count}</td>
								<td style="text-align: center;">${dto.e_name }</td>
								<td style="text-align: center;">${dto.e_addr }</td>
								<td style="text-align: center;">${dto.e_tel }</td>
								<td style="text-align: center;">${dto.e_email }</td>
								<td style="text-align: center;"><a class="btn btn-sm btn-primary glyphicon glyphicon-search" href="">상세페이지</a></td>
							</tr>
							
							</c:forEach>
							
							<tr>
								<td colspan="7" >
								<button id="btndel">관심 기업 해제</button>
								</td>							
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- Recent Sales End -->
		
		<script src="https://kit.fontawesome.com/2663817d27.js"
      crossorigin="anonymous"></script><!-- 아이콘에 필요한거니 삭제말것 -->
	
	
</body>
</html>