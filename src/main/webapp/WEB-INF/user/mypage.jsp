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
</style>
</head>

<body>
	<div>

		<!-- Content Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="row g-4" style="border: 1px solid gray">
				<div class="col-sm-12 col-md-3 col-xl-4 w-25">
					<div style="width: 150px; height: 200px;" id="photoZone">
						<img alt="" src="/photo/${dto.u_photo}"
							style="width: 150px; height: 200px;">
					</div>

					<div>
						<!-- Modal -->
						<div class="modal fade" id="myPhoto" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">사진 등록</h4>
									</div>
									<div class="modal-body">
										<input type="file" id="inputFile">

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" id="uPhoto"
											loginId="${sessionScope.loginId}">등록</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<button type="button" data-toggle="modal" data-target="#myPhoto">사진
						등록 및 변경</button>
					<br>
					<button type="button" onclick="location.href='update'">개인정보
						수정</button>
				</div>
				<div class="col-sm-12 col-md-6 col-xl-7 w-75">
					<div class="h-100 bg-light rounded p-4">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<c:if test="${rdto.r_title==null}">
								<h3>대표이력서가 없습니다.</h3>
								<button onclick="location.href='#'">대표이력서 설정하기</button>
								<!-- 이력서 목록 페이지로 -->
							</c:if>
							<c:if test="${rdto.r_title!=null}">
								<h3>${rdto.r_title}</h3>
								<br>
							최종수정일 : ${rdto.r_writeday }<br>
								<c:if test="${rdto.r_private==0}">
							공개중
							<button type="button">이력서 비공개</button>
							</c:if>
							
								<c:if test="${rdto.r_private==1}">
							비공개중
							<button type="button">이력서 공개</button>
								</c:if>

							</c:if>
						</div>
					</div>
					<br>
					<div class="h-100 bg-light rounded p-4">
						<button type="button" onclick="location.href='insertresume'">이력서
							등록</button>
						<button type="button">지원현황</button>
						<button type="button" onclick="location.href='resumelist'">내 이력서 목록</button>
						<br>
					</div>
					<br>
					<div class="h-100 bg-light rounded p-4">
						<button type="button" onclick="location.href='enterLike'">관심기업</button>
						<button type="button" onclick="location.href=''">관심직종</button>
						<button type="button" onclick="location.href=''">관심채용</button>
						<button type="button" onclick="location.href=''">관심근무지</button>
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
					<h6 class="mb-0">이력서 목록</h6>
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
					<h6 class="mb-0">관심 기업</h6>
					<a href="enterLike">Show All</a>
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
					<a href="occupation">Show All</a>
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
					<h6 class="mb-0">관심 채용</h6>
					<a href="scrap">Show All</a>
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
					<h6 class="mb-0">관심 근무지</h6>
					<a href="place">Show All</a>
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


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="${root }/js/moment.min.js"></script>
	<script src="${root }/js/moment-timezone.min.js"></script>
	<script src="${root }/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="${root }/js/main.js"></script>

	<!-- 사진 등록 Ajax -->
	<script type="text/javascript">
		$(document).on("click", "#uPhoto", function() {
			var u_id = $(this).attr("loginId"); //본인의 num을 호출
			var form = new FormData();
			form.append("u_photo", $("#inputFile")[0].files[0]);//선택한 한 개만 반드시 추가해준다.
			form.append("u_id", u_id);
			$.ajax({
				type : "post",
				dataType : "text",
				url : "/updatePhoto",
				processData : false,
				contentType : false,
				data : form,
				success : function() {
					location.reload();
				}
			})
		})
	</script>
</body>

</html>