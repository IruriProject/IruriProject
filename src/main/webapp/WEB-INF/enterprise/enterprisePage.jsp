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

.longsentence{
	word-break: break-all;
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.atag {
	padding: 8px;
}

.atag, .atag:hover {
	color: #416442;
	text-decoration: none;
}

.atag:hover {
	background-color: #e3f2c9;
	border-radius: 10px;
}

.counting{
	float:right;
	cursor: pointer;
	color: #416442;
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
					<button type="button" onclick="location.href='/enterprise/update'">회사정보
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
					<div class="h-100 bg-light rounded p-4">관심기업으로 선정한 인재수 : ${heartCount } 명</div>
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
							<h4 class="mb-5"><b>쪽지관리</b></h4>
							<a href="/posting/writemessage">쪽지보내기</a><a class="atag" href="/posting/allMessages">더보기</a>

						</div>
						<c:if test="${messages.size()==0 }">
							<div class="w-100" align="center">
								<br>
								<span style="color: gray">인재에게 발송한 쪽지가 없습니다.</span>
							</div>
						</c:if>
						<c:forEach var="msg" items="${messages }">
						
							<div class="d-flex align-items-center border-bottom py-3 atag mt-3">
							
								<img class="rounded-circle flex-shrink-0" src="/photo/${msg.u_photo }"
									alt="" style="width: 40px; height: 40px;">
									<a class="atag" href="/posting/messagelist">
								<div class="w-100 ms-3">
									<div class="d-flex w-100 justify-content-between">
										<h5><b>${msg.u_name }</b>&nbsp;님</h5>
										<small><fmt:formatDate value="${msg.m_day}" pattern="yy-MM-dd"/></small>
									</div>
									<span class="longsentence">${msg.m_content }</span>
								</div>
								</a>
							</div>
						
						</c:forEach>
					
					</div>
				</div>
				<div class="col-sm-12 col-md-6 col-xl-4">
					<div class="h-100 bg-light rounded p-4">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<h4 class="mb-5"><b>Calendar</b></h4>
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
					<h4 class="mb-5"><b>공고현황</b></h4>
					<a class="atag" href="/posting/postinglist">더보기</a>
				</div>
				<div class="table-responsive">
					<table
						class="table text-start align-middle table-bordered table-hover mb-0">
						<thead>
							<tr class="text-dark">
								<th scope="col" style="text-align: center" width="40%">공고제목</th>
								<th scope="col" style="text-align: center">직종</th>
								<th scope="col" style="text-align: center">공고일</th>
								<th scope="col" style="text-align: center">공고마감일</th>
								<th scope="col" style="text-align: center">공고상태</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${postingCount==0 }">
						<tr><td colspan="5">게시한 공고가 없습니다.</td></tr>
						</c:if>
							<c:forEach var="post" items="${postings }">
								<tr>
									<td style="text-align: left"><a class="atag"
										href="posting/detailpage?p_num=${post.p_num }">&nbsp;&nbsp;<b>${post.p_title }</b></a>&nbsp;&nbsp;
										<span class="counting viewer" p_num=${post.p_num } title="열람한 인재목록 보기" onclick="location.href='/enterprise/viewerlist?p_num=${post.p_num}'"></span>
										<span class="counting">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
										<span class="counting scrap" p_num=${post.p_num } title="스크랩한 인재목록 보기" onclick="location.href='/enterprise/scraplist?p_num=${post.p_num}'"></span>
									</td>
									<td>${post.p_type }</td>
									<td><fmt:formatDate value="${post.p_writeday }"
											pattern="yyyy-MM-dd" /></td>
									<td>${post.p_enddate }</td>
									<td>
										<select class="pStatus" pnum=${post.p_num }>
											<option value="지원가능" ${post.p_status=="지원가능"?'selected':'' }>지원가능</option>
											<option value="지원마감" ${post.p_status=="지원마감"?'selected':'' }>지원마감</option>
										</select>
									</td>
								</tr>
								
								 <script type="text/javascript">
							        $(function(){
							            var p_num = "${post.p_num}";
							            $.ajax({
							                type:"get",
							                data:{"p_num":p_num},
							                dataType:"json",
							                url:"/enterprise/counting",
							                success:function(res){
							                    $(".viewer[p_num='"+p_num+"']").text("열람 : "+res.viewercounting+"명");
							                    $(".scrap[p_num='"+p_num+"']").text("스크랩 : "+res.scrapcounting+"명");
							                }
							            });
							        });
							    </script>
								
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
					<h4 class="mb-5"><b>지원자현황</b></h4>
					<a href="" class="atag">더보기</a>
				</div>
				<div class="table-responsive">
					<table
						class="table text-start align-middle table-bordered table-hover mb-0">
						<thead>
							<tr class="text-dark">
								<th scope="col" style="text-align: center">지원자명</th>
								<th scope="col" style="text-align: center">지원공고</th>
								<th scope="col" style="text-align: center">이력서보기</th>
								<th scope="col" style="text-align: center">지원날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="adto" items="${adto }" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<td><a href="/posting/detailpage?p_num=${adto.p_num }">${adto.posting.p_title}</a></td>
								<td><a href="/resume/detail?r_num=${adto.r_num }" onclick="window.open(this.href, '_blank', 'menubar=no, toolbar=no'); return false;">${adto.r_num }번째 이력서보기</a></td>
								<td><fmt:formatDate value="${adto.a_writeday }" pattern="yyyy.MM.dd"/></td>
								
							</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<!-- Recent Sales End -->
		<br>
		<button type="button" style="width: 100%; height: 50px;" onclick="location.href='/enterprise/applyaccess'">열람권신청</button>
		<br>
		<br>
		<button type="button" style="width: 100%; height: 50px;">기업인증</button>
		<br>
		<br>
		<button type="button" style="width: 100%; height: 50px;"
			onclick="location.href='enterprise/confirmpw?e_num=${dto.e_num}'">기업회원탈퇴</button>

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