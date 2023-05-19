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

.link{
	cursor: pointer;
}

</style>
</head>

<body>
	<div>
		<!-- Content Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="row g-4" style="border: 1px solid green; border-radius: 10px; padding:20px 0px 20px 10px;">
				<div class="col-sm-12 col-md-3 col-xl-4 w-25" style="text-align: center">
					<c:if test="${dto.e_logo==null }">
						<img src="/image/nophoto.png"
						style="width: 170px; height: 170px; border-radius: 500px;">
					</c:if>
					<c:if test="${dto.e_logo!=null }">
							<img alt="" src="/photo/${dto.e_logo}"
							style="width: 170px; height: 170px; border-radius: 500px;">
					</c:if><br>
					
					<button type="button" class="btn btn-default" data-toggle="modal" data-target="#entPhoto">사진
						변경</button>
					<button type="button" class="btn btn-default" onclick="location.href='/enterprise/update'">기업정보
						수정</button>
				</div>
					
					
				<!-- Modal -->
						<div class="modal fade" id="entPhoto" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">사진 변경</h4>
									</div>
									<div class="modal-body">
										<input type="file" id="inputFile">

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" id="ePhoto"
											loginId="${sessionScope.loginId}">등록</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 사진 등록 Ajax -->
						<script type="text/javascript">
							$(document).on("click", "#ePhoto", function() {
								var e_id = $(this).attr("loginId"); //본인의 num을 호출
								var form = new FormData();
								form.append("e_logo", $("#inputFile")[0].files[0]);//선택한 한 개만 반드시 추가해준다.
								form.append("e_id", e_id);
								$.ajax({
									type : "post",
									dataType : "text",
									url : "/enterprise/updatelogo",
									processData : false,
									contentType : false,
									data : form,
									success : function() {
										location.reload();
									}
								})
							})
						</script>
				<div class="col-sm-12 col-md-6 col-xl-7 w-75">
					<div class="h-100 bg-light rounded p-4">
						<span style="font-size: 2em; font-weight: 600">${dto.e_name }</span>&nbsp;&nbsp;&nbsp;
						<c:if test="${dto.e_auth==0 }">
							<span style="color: red; font-weight: 600; font-size: 1em;">기업미인증</span>
						</c:if>
						<c:if test="${dto.e_auth==1 }">
							<span style="color: green; font-weight: 600; font-size: 1em;">기업인증완료</span>
						</c:if>
						
						<br>
					</div>
					<div class="bg-light rounded p-4">
						<span style="font-size: 1.2em; font-weight: 600">Tel.&nbsp;&nbsp;${dto.e_tel }</span>
					</div>
					<div class="bg-light rounded p-4">
						<span style="font-size: 1.2em; font-weight: 600">Addr.&nbsp;&nbsp;${dto.e_addr }</span>
					</div>
					<div class="bg-light rounded p-4">
						<span style="font-size: 1.2em; font-weight: 600">E-mail.&nbsp;&nbsp;${dto.e_email }</span>
					</div>
					<div class="bg-light rounded p-4">
						<span style="font-size: 1.2em; font-weight: 600">관심기업으로 선정한 인재 : <span id="heartList" style="cursor: pointer; color: #416442;" onclick="location.href='/enterprise/heartlist'">&nbsp;${heartCount } 명</span></span>
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
							<h4 class="mb-5"><b>쪽지관리</b></h4>
							<a class="atag" href="/posting/messagelist">더보기</a>

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
									<td style="text-align: left" class="title">
										<a class="atag" href="posting/detailpage?p_num=${post.p_num }">&nbsp;&nbsp;
											<c:if test="${post.p_status=='지원가능' }">
												<b class="titlestatus">${post.p_title }</b>
												<span class="titlestatusSpan" style="color: red; margin-left: 10px; font-size: 0.8em; display: none;">마감</span>
											</c:if>
											<c:if test="${post.p_status=='지원마감' }">
												<b class="titlestatus" style="text-decoration: line-through red">${post.p_title }</b>
												<span class="titlestatusSpan" style="color: red; margin-left: 10px; font-size: 0.8em;">마감</span>
											</c:if>
										</a>&nbsp;&nbsp;
											<span class="counting viewer" p_num=${post.p_num } title="열람한 인재목록 보기" onclick="location.href='/enterprise/viewerlist?p_num=${post.p_num}'"></span>
											<span class="counting">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
											<span class="counting scrap" p_num=${post.p_num } title="스크랩한 인재목록 보기" onclick="location.href='/enterprise/scraplist?p_num=${post.p_num}'"></span>
									</td>
									<td>${post.p_type }</td>
									<td><fmt:formatDate value="${post.p_writeday }"
											pattern="yyyy-MM-dd" /></td>
									<td class="enddate">${post.p_enddate }</td>
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
							            
							            $(".pStatus").change(function(){ 
							            	if($(this).val()=="지원마감"){
							            		 $(this).closest("tr").find(".titlestatus").css("text-decoration", "line-through red");
												 $(this).closest("tr").find(".titlestatusSpan").css("display", "inline");
							            	} else{
							            		 $(this).closest("tr").find(".titlestatus").css("text-decoration", "");
												 $(this).closest("tr").find(".titlestatusSpan").css("display", "none");
							            	}
											 
							            })

							        });
							    </script>
							    
								
							</c:forEach>
						</tbody>
					</table>
				</div>
	
		<!-- Recent Sales End -->
		
		<script>
		
			$(".pStatus").change(function(){
				var pStatus=$(this).val();
				var pNum=$(this).attr("pnum");
				
				var enddate= $(this).closest("tr").find(".enddate").text();
				
				var now = new Date();
		        var year = now.getFullYear();
		        var month = ('0' + (now.getMonth() + 1)).slice(-2);
		        var day = ('0' + now.getDate()).slice(-2);
		        var today = year + '-' + month + '-' + day;
		            
		        if(enddate < today){
		        	alert("공고마감일이 지나 모집상태를 변경할 수 없습니다.\n공고마감일을 먼저 수정해주세요.");
		            location.reload();
		            
		        } else {
		            $.ajax({
						type:"get",
						data:{"p_num":pNum,"p_status":pStatus},
						dataType:"html",
						url:"/posting/updateStatus",
						success:function(){
							alert("모집상태 변경 완료");
							
						}
					})
	            }

			})
		
		</script>

		<!-- Recent Sales Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4 class="mb-5 link" onclick="location.href='/enterprise/applicant'"><b>${applicant_size }명의 지원자 보러가기</b></h4>
				</div>
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4 class="mb-5 link" onclick="findWorkers(${dto.e_res_access})"><b>더 많은 지원자 찾기</b></h4>
				</div>
				
			</div>
		</div>
		
		<!-- Recent Sales End -->
		<br>
		<button type="button" style="width: 100%; height: 50px;" onclick="location.href='enterprise/certificate'">기업인증</button>
		<br>
		<br>
		<button type="button" style="width: 100%; height: 50px;" onclick="applyAccess(${dto.e_auth})">열람권신청</button>
		<br>
		<br>
		<button type="button" style="width: 100%; height: 50px;"
			onclick="location.href='enterprise/confirmpw?e_num=${dto.e_num}'">기업회원탈퇴</button>

	</div>
	<!-- Content End -->
	</div>
	
	<script type="text/javascript">
	
		function applyAccess(auth){
			if (auth==0){
				const a=confirm("기업인증을 하셔야 열람권을 신청하실 수 있습니다.\n인증신청 페이지로 이동하시겠습니까?");
				
				if(a){
					location.href='enterprise/certificate';
				}else{
					return;
				}
			} else {
				location.href='/enterprise/applyaccess';
			}
		}
		
		function findWorkers(access){
			
			if(access==0){
				alert("하단의 열람권을 신청해주세요.")
				return;
			}else{
				location.href='/enterprise/findworker';
			}
		}
	
	
	</script>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="${root }/js/moment.min.js"></script>
	<script src="${root }/js/moment-timezone.min.js"></script>
	<script src="${root }/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="${root }/js/main.js"></script>
</body>

</html>