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
	border: 0px solid gray;
}
.text-dark th{
text-align: center;
   border: 0px solid gray;
}
div a{
	color:black;
}
div a:hover{
	color:black;
	text-decoration: none;
}

</style>
</head>
<body>
	
	<h3>내 이력서 목록 (${list.size() }/5)</h3>
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light rounded p-4">
				<div class="table-responsive">
					<table 
						class="table"
						style="width: 800px; table-layout: fixed" >
						<thead>
							<tr class="text-dark">
								<th scope="col" style=" width:30px; text-align: center;">
								<input class="form-check-input" type="checkbox" id="allcheck"></th>
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
								<td style="text-align: center; height:32px; line-height:32px;"><input class="form-check-input del" type="checkbox"></td>
								<td style="text-align: center; height:32px;
								line-height:32px;">${i.count}</td>
								
								
								<td style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden; height:32px;
								line-height:32px;">
								
								<c:if test="${dto.r_private==1}">
								<a href="resume/detail?r_num=${dto.r_num }">[비공개]${dto.r_title}</a>
								</c:if>
								
								<c:if test="${dto.r_presume==1 && dto.r_private==0}">
								<a href="resume/detail?r_num=${dto.r_num }"><b>[대표][공개]${dto.r_title}</b></a>
								</c:if>
								
								<c:if test="${dto.r_presume==0 && dto.r_private==0}">
								<a href="resume/detail?r_num=${dto.r_num }">[공개]${dto.r_title}</a>
								</c:if>
								</td>
								<td style="text-align:center;">
								
								<!-- if문 -->
								<c:if test="${dto.r_private==1}">
									<button type="button" class="sm-color-btn setPublic">공개 전환</button>
								</c:if>
								<c:if test="${dto.r_private==0}">
									<button type="button" class="sm-border-btn setPrivate">비공개 전환</button>
								</c:if>
								</td>
								
								<td  style="text-align:center;">
								<c:if test="${dto.r_presume==0}">
								<button type="button" class="sm-border-btn setMainOn">대표 설정</button>							
								</c:if>
								<c:if test="${dto.r_presume==1}">
								<button type="button" class="sm-color-btn setMainOff">대표 해제</button>	
								</c:if>								
								</td>	
								
								<td style="text-align:center;">
								<button type="button" class="sm-border-btn" onclick="location.href='updateresume?r_num=${dto.r_num}'">수정</button>
								</td>
							</tr>
						</c:forEach>
							<tr>
								<td colspan="6">
									<button style="float:right; margin-top:10px; margin-right:22px;" class="sm-delete-btn" id="btnEnterDel">삭제</button>
								</td>
							</tr>
					</table>
				</div>
			</div>
		</div>
	<script type="text/javascript">
	$("#allcheck").click(function(){
		
		//체크 값 없음
		var chk=$(this).is(":checked");
		console.log(chk);//true, false로 나옴
		
		//전체 체크값을 아래의 체크에 일괄전달
		$(".del").prop("checked",chk);
		
	});
	$("#btnEnterDel").click(function(){
		//체크한 기업 개수 구하기
		var cnt=$(".del:checked").length;
		//alert(cnt);
		if (cnt==0) {
			alert("삭제할 이력서를 선택해주세요 :)");
			return;//종료
		}
		var result = confirm("총 "+cnt+"개의 이력서를 삭제합니다.");
		if(result==true){
		
		$(".del:checked").each(function(i,elt){
			var r_num = $(this).closest("tr").data("rnum");
			//삭제 할 ajax(진짜 삭제 되는 것)
			$.ajax({
				
				type:"get",
				url:"deleteResume",
				dataType:"html",
				data:{"r_num":r_num},
				success:function(){
					
					location.reload();
				}
			})
		})
		}
	});
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
		}else{
			$.ajax({
				type:"post",
				dataType:"html",
				data:{"r_num":r_num},
				url:"/updateMainOn",
				success:function(){
					location.reload();
				}
			})
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