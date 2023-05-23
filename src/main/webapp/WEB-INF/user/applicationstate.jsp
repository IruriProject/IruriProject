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

.no{

	color: gray; 
	background-color: #f9ffef; 
	padding: 20px; 
	margin-top: 50px;
	border-radius: 20px;
}

.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: #4E9F3D;
  color: white;
  text-decoration: none;
}

.pagination a:hover:not(.active) {
	text-decoration: none; 
	color:#416442; 
	background-color:#e3f2c9;
} 

</style>
</head>
<body>
			
					
					<div id="addr-box"></div>
						<table class="table" id="basic-list">
						<caption>
							<c:if test="${totalCount>0}">
					   		총 ${totalCount }개의 글이 있습니다.
					   	</caption>
							<thead>
								<tr class="text-dark">
									<th scope="col" style="text-align: center;"><input class="form-check-input"
										type="checkbox" id="allcheck"></th>
									<th scope="col" style="text-align: center;">No.</th>
									<th scope="col" style="text-align: center;">지원일</th>
									<th scope="col" style="text-align: center;">공고 제목</th>
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
									<input type="hidden" class="a_num" value="${adto.a_num }">
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
								<td colspan="11" style="text-align: center;">
								<button id="btnAppDel">지원 취소</button>
								</td>							
							</tr>
							
							</tbody>
						</table>
			
			
				<!-- 페이징 -->
				<div class="pagination" style="display: flex; justify-content: center; width: 100%; text-align: center;">
			
					<!-- 이전 -->
					<c:if test="${startPage > 1 }">
						<a href="/applicationstate?p_num=${p_num }&currentPage=${startPage - 1 }">&laquo;</a>
					</c:if>
			
					<c:forEach var="pp" begin="${startPage }" end="${endPage }">
						<c:if test="${pp == currentPage }">
							<a class="active" href="/applicationstate?p_num=${p_num }&currentPage=${pp }">${pp }</a>
						</c:if>
						<c:if test="${pp != currentPage }">
							<a href="/applicationstate?p_num=${p_num }&currentPage=${pp }">${pp }</a>
						</c:if>
					</c:forEach>
			
					<!-- 다음 -->
					<c:if test="${endPage < totalPage }">
						<a href="/applicationstate?p_num=${p_num }&currentPage=${endPage + 1 }">&raquo;</a>
					</c:if>
			
				</div>
			  
			   </c:if>
			
			
			<script type="text/javascript">
			
				$("#allcheck").click(function(){
					
					var chk=$(this).is(":checked")
					console.log(chk);//true, false로 나옴
					
					//전체 체크값을 아래의 체크에 일괄 전달
					$(".del").prop("checked",chk);
					
				});
			
				$("#btnAppDel").click(function(){
					//alert("지원 취소 하고 싶다");
					
					//체크 한 기업 개수 구하기
					var cnt =$(".del:checked").length;
					//alert(cnt);
					
					if(cnt==0){
						alert("삭제 할 지원을 선택해주세요 :)");
						return;
					}
					
					$(".del:checked").each(function(){
						
						var num=$(this).closest("tr").find(".a_num").val();
						console.log(num);//선택한 num만 나오는지 확인
						
						//삭제 할 ajax(진짜a 삭제 되는 것)
						$.ajax({
							
							type:"get",
							url:"adelete",
							dataType:"html",
							data:{"a_num":num},
							success:function(){
								
								location.reload();
							}
							
						})
						
					});
					
					alert("삭제되었습니다 :)")
					
				});
			</script>
			
	
</body>
</html>