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
								<th scope="col" style="width:110px;">이력서 관리</th>
							</tr>
						</thead>
						<c:if test="${list.size()==0 }">
							<tr align="center">
								<td colspan="5">이력서가 존재하지 않습니다.<br>
								대표 이력서를 등록해보세요!</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${list }" varStatus="i">
							<tr data-rnum="${dto.r_num}", data-rpresume="${dto.r_presume }", data-rprivate="${dto.r_private }">
								<td>${i.count}</td>
								
								
								<td style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								
								<c:if test="${dto.r_presume==1 && dto.r_private==0}">
								[대표] [공개]
								</c:if>
								
								<c:if test="${dto.r_presume==1 && dto.r_private==1}">
								[대표] [비공개]
								</c:if>
								
								<c:if test="${dto.r_presume==0 && dto.r_private==1}">
								[비공개]
								</c:if>
								
								<c:if test="${dto.r_presume==0 && dto.r_private==0}">
								[공개]
								</c:if>
								
								<a href="resume/detail?r_num=${dto.r_num }">${dto.r_title}</a></td>
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
								
								<td><button type="button" onclick="location.href='updateresume?r_num=${dto.r_num}'">수정</button>
									<button type="button" class="deleteRes">삭제</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	<script type="text/javascript">
	$(".deleteRes").click(function(){
		var r_num = $(this).closest("tr").data("rnum");
		var result = confirm("정말 삭제하시겠습니까?");
		if(result==true){
			$.ajax({
				data:{"r_num":r_num},
				dataType:"html",
				url:"deleteResume",
				success:function(){
					alert("삭제되었습니다.");
					location.reload();
				},error: function() {
			        alert("에러!");
			    }
			})
		}
	})
	
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
		var r_private = $(this).closest("tr").data("rprivate");
		if(r_private==1){
			var result = confirm("비공개된 이력서를 대표설정 시 공개상태로 전환됩니다.\n대표이력서로 변경하시겠습니까?");
			if(result==true){
				$.ajax({
					type:"post",
					dataType:"html",
					data:{"r_num":r_num},
					url:"/updateMainOn",
					success:function(){
						location.reload();
					}
				})
			}else{
				return false;
			}
		}
		
	})
	
	$(".setPrivate").click(function(){
		 var r_num = $(this).closest("tr").data("rnum");
		 var r_presume = $(this).closest("tr").data("rpresume");
		 if(r_presume==1){
			 alert("대표이력서는 비공개 설정이 불가능합니다.");
			 return false;
		 }
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
		 var result = confirm("이력서를 공개로 전환하시겠습니까?");
		 if(result==true){
			$.ajax({
				type:"post",
				dataType:"html",
				data:{"r_num":r_num},
				url:"/updatePublic",
				success:function(){
					location.reload();
				}
			}) 
		 }else{
			 return false;
		 }
	})
	</script>
</body>
</html>