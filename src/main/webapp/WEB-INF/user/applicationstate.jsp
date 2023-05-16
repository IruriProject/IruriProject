<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채용 현황</title>
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

	<h3 class="alert alert-info">지원 현황</h3>
	
		<!-- Recent Sales Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-light text-center rounded p-4">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<h6 class="mb-0">나의 채용 현황</h6>
					</div>
					<div class="table-responsive">
						<table
							class="table text-start align-middle table-bordered table-hover mb-0">
							<thead>
								<tr class="text-dark">
									<th scope="col" style="text-align: center;"><input class="form-check-input"
										type="checkbox" id="allcheck"></th>
									<th scope="col" style="text-align: center;">No.</th>
									<th scope="col" style="text-align: center;">지원일</th>
									<th scope="col" style="text-align: center;">공고 제목</th>
									<!-- <th scope="col" style="text-align: center;">직무</th> -->
									<th scope="col" style="text-align: center;">이력서 제목</th>
									<th scope="col" style="text-align: center;">모집 마감 일</th>
									<th scope="col" style="text-align: center;">급여</th>
									<th scope="col" style="text-align: center;">고용형태</th>
									<th scope="col" style="text-align: center;">근무요일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="adto" items="${list }" varStatus="i">
							<tr>
									<input type="hidden" class="s_num" value="${adto.a_num }">
									<td style="text-align: center;"><input class="form-check-input del" type="checkbox"></td>
									<td style="text-align: center;">${i.count }</td>
									<td style="text-align: center;"><fmt:formatDate value="${adto.a_writeday}" pattern="yyyy-MM-dd"/></td>
									<td style="text-align: center;"><a href="posting/detailpage?p_num=${adto.p_num}">${adto.p_title }</a></td>
									<td style="text-align: center;"><a href="resume/detail?r_num=${adto.r_num}">${adto.r_title }</a></td>
									<td style="text-align: center;">${adto.p_enddate}</td>
									<td style="text-align: center;">${adto.p_pay}</td>
									<td style="text-align: center;">${adto.p_employtype}</td>									
									<td style="text-align: center;">
									<c:if test="${adto.p_workday=='월/화/수/목/금'}">
										평일
									</c:if>
									<c:if test="${adto.p_workday=='토/일'}">
										주말
									</c:if>
									<c:if test="${adto.p_workday!='토/일' && adto.p_workday!='월/화/수/목/금'}">
										${adto.p_workday }
									</c:if>
									</td>
								</tr>
							</c:forEach>
							
							<tr>
								<td colspan="11" >
								<button id="btnAppDel">지원 취소</button>
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