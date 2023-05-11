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
.text-dark th{
text-align: center;
   border: 1px solid gray;
}
</style>
</head>
<body>
	
	<h3>내 이력서 목록</h3>

		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="table-responsive">
					<table 
						class="table text-start align-middle table-bordered table-hover mb-0"
						style="width: 800px; table-layout: fixed" >
						<thead>
							<tr class="text-dark">
								<th scope="col" style="width:50px;">번호</th>
								<th scope="col" style="width:200px;">제목</th>
								<th scope="col" style="width:110px;">설정관리</th>
								<th scope="col" style="width:90px;">대표 설정</th>
								<th scope="col" style="width:50px;">인쇄</th>
								<th scope="col" style="width:110px;">이메일 전송</th>
								<th scope="col" style="width:110px;">이력서 관리</th>
							</tr>
						</thead>
						<c:forEach var="dto" items="${list }" varStatus="i">
							<tr data-rnum="${dto.r_num}">
								<td>${i.count}</td>
								<td style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">${dto.r_title}</td>
								
								<td>
								<!-- if문 -->
								<c:if test="${dto.r_private==1}">
									<button type="button" class="setPublic">공개 전환</button>
								</c:if>
								<c:if test="${dto.r_private==0}">
									<button type="button" class="setPrivate">비공개 전환</button>
								</c:if>
								</td>
								
								<td>
								<c:if test="${dto.r_presume==0}">
								<button type="button" class="setMainOn">대표 설정</button>							
								</c:if>
								<c:if test="${dto.r_presume==1}">
								<button type="button" class="setMainOff">대표 해제</button>	
								</c:if>								
								</td>	
								
								<td>인쇄</td>
								<td>이메일</td>
								
								<td><button type="button" onclick="location.href='#'">수정</button>
									<button type="button" onclick="location.href='#'">삭제</button></td>
									
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	<script type="text/javascript">
	$(".setMainOff").click(function(){
		 var r_num = $(this).closest("tr").data("rnum");
		 $.ajax({
			type:"post",
			dataType:"html",
			data:{"r_num":r_num},
			url:"/updateMainOff",
			success:function(){
			location.reload();
			}
		 })
	})
	$(".setMainOn").click(function(){
		var r_num = $(this).closest("tr").data("rnum");
		$.ajax({
			type:"post",
			dataType:"html",
			data:{"r_num":r_num},
			url:"/updateMainOn",
			success:function(){
				location.reload();
			}
		})
	})
	
	$(".setPrivate").click(function(){
		 var r_num = $(this).closest("tr").data("rnum");
		$.ajax({
			type:"post",
			dataType:"html",
			data:{"r_num":r_num},
			url:"/updatePrivate",
			success:function(){
				location.reload();
			}
		})
	})
	
	$(".setPublic").click(function(){
		 var r_num = $(this).closest("tr").data("rnum");
		$.ajax({
			type:"post",
			dataType:"html",
			data:{"r_num":r_num},
			url:"/updatePublic",
			success:function(){
				location.reload();
			}
		})
	})
	</script>
</body>
</html>