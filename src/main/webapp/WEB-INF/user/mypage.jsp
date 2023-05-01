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
	<div>

		<!-- Content Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="row g-4">
				<div class="col-sm-12 col-md-3 col-xl-4 w-25">
					<div style="width: 150px; height: 200px;">사진</div>
					<!-- 모달창 띄우기, 사진 등록 jsp 생성(input file)한 후 / 또는 ajax, 사진을 user에 update하면 된다. -->
					<button type="button" onclick="location.href='updatephoto'">사진 등록</button>
					<br>
					<button type="button" onclick="location.href='update'">개인정보 수정</button>
				</div>
				<div class="col-sm-12 col-md-6 col-xl-7 w-75">
					<div class="h-100 bg-light rounded p-4">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							대표이력서가 들어갈 자리입니다.
							<!-- ajax를 활용한 이력서 공개/비공개 0/1 update -->
						<button type="button">이력서 공개하기</button>
						</div>
					</div>
					<br>
					<div class="h-100 bg-light rounded p-4">
						<button type="button">이력서 등록</button>
						<button type="button">지원현황</button>
						<button type="button">이력서 열람</button>
						<br>
					</div>
					<br>
					<div class="h-100 bg-light rounded p-4">
						<button type="button">관심기업</button>
						<button type="button">관심직종</button>
						<button type="button">관심근무지</button>
						<br>
					</div>
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
					<h6 class="mb-0">관심기업</h6>
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


		<!-- Recent Sales Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h6 class="mb-0">관심채용</h6>
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


		<!-- Recent Sales Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h6 class="mb-0">관심 직종</h6>
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