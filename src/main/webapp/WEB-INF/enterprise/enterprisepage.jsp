<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="${root }/css/usercss/owl.carousel.min.css" rel="stylesheet">
<link href="${root }/css/usercss/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="${root }/css/usercss/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${root }/css/usercss/style.css" rel="stylesheet">
<style type="text/css">
.hi div {
	border: 1px solid gray;
}
</style>
</head>

<body>
	<div>

		<!-- Content Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="row g-4 hi">
				<div class="col-sm-12 col-md-6 col-xl-7 w-25">
					<div style="width: 150px; height: 100%">
						<img src="${dto.e_logo }" width="100%">
					</div>
					<br>
					<br>
					<button type="button" onclick="location.href='update'">회사정보
						수정</button>
				</div>
				<div class="col-sm-12 col-md-6 col-xl-7 w-75">
					<div class="h-100 bg-light rounded p-4">
						기업명 : ${dto.e_name } <br>
					</div>
					<br>
					<div class="h-100 bg-light rounded p-4">
						전화번호 : ${dto.e_tel } <br>
					</div>
					<br>
					<div class="h-100 bg-light rounded p-4">위치 : ${dto.e_addr }</div>
					<br>
					<div class="h-100 bg-light rounded p-4">관심기업수</div>
				</div>
			</div>
		</div>
		<!-- Profile End -->

		<!-- Widgets Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="row g-4">
				<div class="col-sm-12 col-md-6 col-xl-4">
					<div class="h-100 bg-light rounded p-4">
						<div
							class="d-flex align-items-center justify-content-between mb-2">
							<h6 class="mb-0">쪽지함</h6>
							<a href="">Show All</a>
						</div>
						<div class="d-flex align-items-center border-bottom py-3">
							<img class="rounded-circle flex-shrink-0" src="img/user.jpg"
								alt="" style="width: 40px; height: 40px;">
							<div class="w-100 ms-3">
								<div class="d-flex w-100 justify-content-between">
									<h6 class="mb-0">Jhon Doe</h6>
									<small>15 minutes ago</small>
								</div>
								<span>Short message goes here...</span>
							</div>
						</div>
						<div class="d-flex align-items-center border-bottom py-3">
							<img class="rounded-circle flex-shrink-0" src="img/user.jpg"
								alt="" style="width: 40px; height: 40px;">
							<div class="w-100 ms-3">
								<div class="d-flex w-100 justify-content-between">
									<h6 class="mb-0">Jhon Doe</h6>
									<small>15 minutes ago</small>
								</div>
								<span>Short message goes here...</span>
							</div>
						</div>
						<div class="d-flex align-items-center border-bottom py-3">
							<img class="rounded-circle flex-shrink-0" src="img/user.jpg"
								alt="" style="width: 40px; height: 40px;">
							<div class="w-100 ms-3">
								<div class="d-flex w-100 justify-content-between">
									<h6 class="mb-0">Jhon Doe</h6>
									<small>15 minutes ago</small>
								</div>
								<span>Short message goes here...</span>
							</div>
						</div>
						<div class="d-flex align-items-center pt-3">
							<img class="rounded-circle flex-shrink-0" src="img/user.jpg"
								alt="" style="width: 40px; height: 40px;">
							<div class="w-100 ms-3">
								<div class="d-flex w-100 justify-content-between">
									<h6 class="mb-0">Jhon Doe</h6>
									<small>15 minutes ago</small>
								</div>
								<span>Short message goes here...</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-6 col-xl-4">
					<div class="h-100 bg-light rounded p-4">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<h6 class="mb-0">Calender</h6>
							<a href="">Show All</a>
						</div>
						<div id="calender"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- Widgets End -->


		<!-- Recent Sales Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h6 class="mb-0">공고현황</h6>
					<a href="">Show All</a>
				</div>
				<div class="table-responsive">
					<table
						class="table text-start align-middle table-bordered table-hover mb-0">
						<thead>
							<tr class="text-dark">
								<th scope="col" style="text-align: center">공고제목</th>
								<th scope="col" style="text-align: center">공고일</th>
								<th scope="col" style="text-align: center">직종</th>
								<th scope="col" style="text-align: center">공고마감일</th>
								<th scope="col" style="text-align: center">공고상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="post" items="${postings }">
								<tr>
									<td style="text-align: left"><a
										href="posting/detailpage?p_num=${post.p_num }">&nbsp;&nbsp;${post.p_title }</a></td>
									<td><fmt:formatDate value="${post.p_writeday }"
											pattern="yyyy-MM-dd" /></td>
									<td>${post.p_type }</td>
									<td>${post.p_enddate }</td>
									<td><select class="pStatus" pnum=${post.p_num }><option value="지원가능" ${post.p_status=="지원가능"?'selected':'' }>지원가능</option>
											<option value="지원마감" ${post.p_status=="지원마감"?'selected':'' }>지원마감</option></select></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- Recent Sales End -->
		
		<script>
		
		$(".pStatus").change(function(){
			var pStatus=$(this).val();
			var pNum=$(this).attr("pnum");
			//alert(pNum+","+pStatus);
			$.ajax({
				type:"get",
				data:{"p_num":pNum,"p_status":pStatus},
				dataType:"html",
				url:"/posting/updateStatus",
				success:function(){
					alert("모집상태 변경 완료");
				}
			})
		})
		
		</script>

		<!-- Recent Sales Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h6 class="mb-0">지원자현황</h6>
					<a href="">Show All</a>
				</div>
				<div class="table-responsive">
					<table
						class="table text-start align-middle table-bordered table-hover mb-0">
						<thead>
							<tr class="text-dark">
								<th scope="col"><input class="form-check-input"
									type="checkbox"></th>
								<th scope="col">Date</th>
								<th scope="col">Invoice</th>
								<th scope="col">Customer</th>
								<th scope="col">Amount</th>
								<th scope="col">Status</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input class="form-check-input" type="checkbox"></td>
								<td>01 Jan 2045</td>
								<td>INV-0123</td>
								<td>Jhon Doe</td>
								<td>$123</td>
								<td>Paid</td>
								<td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
							</tr>
							<tr>
								<td><input class="form-check-input" type="checkbox"></td>
								<td>01 Jan 2045</td>
								<td>INV-0123</td>
								<td>Jhon Doe</td>
								<td>$123</td>
								<td>Paid</td>
								<td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
							</tr>
							<tr>
								<td><input class="form-check-input" type="checkbox"></td>
								<td>01 Jan 2045</td>
								<td>INV-0123</td>
								<td>Jhon Doe</td>
								<td>$123</td>
								<td>Paid</td>
								<td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- Recent Sales End -->
		<br>
		<button type="button" style="width: 100%; height: 50px;">열람권신청</button>
		<br>
		<br>
		<button type="button" style="width: 100%; height: 50px;">기업인증</button>
		<br>
		<br>
		<button type="button" style="width: 100%; height: 50px;"
			onclick="location.href='enterprise/confirmpass?e_num=${dto.e_num}'">기업회원탈퇴</button>

	</div>
	<!-- Content End -->
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="${root }/js/moment.min.js"></script>
	<script src="${root }/js/moment-timezone.min.js"></script>
	<script src="${root }/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="${root }/js/main.js"></script>
</body>

</html>