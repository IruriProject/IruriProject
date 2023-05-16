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
</style>
</head>
<body>

	<h3 class="alert alert-info">총 ${countScrapPosting }개의 관심 공고</h3>
	
		<!-- Recent Sales Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-light text-center rounded p-4">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<h6 class="mb-0">나의 관심 채용</h6>
					</div>
					<div class="table-responsive">
						<table
							class="table text-start align-middle table-bordered table-hover mb-0"
							style="width: 1000px;">
							<thead>
								<tr class="text-dark">
									<th scope="col"><input class="form-check-input" id="allcheck"
										type="checkbox"></th>
									<th scope="col" style="text-align: center;">No.</th>
									<th scope="col" style="text-align: center;">회사명</th>
									<th scope="col" style="text-align: center;">공고 제목</th>
									<th scope="col" style="text-align: center;">직무</th>
									<th scope="col" style="text-align: center;">급여</th>
									<th scope="col" style="text-align: center;">계약기간</th>
									<th scope="col" style="text-align: center;">근무요일</th>
									<th scope="col" style="text-align: center;">근무시간</th>
									<th scope="col" style="text-align: center;">고용형태</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="pdto" items="${list }" varStatus="i">
							<tr>
									<td><input class="form-check-input" type="checkbox"></td>
									<td>${i.count }</td>
									<%-- <td><input type="hidden" id="p_num">${pdto.p_num }</td> --%>
									<td>${pdto.e_name }</td>
									<td>${pdto.p_title}</td>
									<td>${pdto.p_type }</td>
									<td>${pdto.p_pay }</td>
									<td>${pdto.p_period }</td>
									<td>${pdto.p_workday}</td>
									<td>${pdto.p_starttime } ~ ${pdto.p_endtime }</td>
									<td>${pdto.p_employtype}</td>
									<td><a class="btn btn-sm btn-primary" href="posting/detailpage?p_num=${pdto.p_num}">상세페이지</a></td>
								</tr>
							</c:forEach>
							
							<tr>
								<td colspan="11" >
								<button id="btndel">스크랩 해제</button>
								</td>							
							</tr>
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Recent Sales End -->
			
			<script type="text/javascript">
			
				$("#btndel").click(function(){
					alert("삭제 하고 싶다");
					
					
				});
			
			
			
			
			</script>
			
	
</body>
</html>