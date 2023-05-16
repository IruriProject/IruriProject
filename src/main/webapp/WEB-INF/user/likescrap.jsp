<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관심 기업</title>
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

	<h3 class="alert alert-info">총 ${countScrapPosting }개의 관심 공고</h3>
	
		<!-- Recent Sales Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-light text-center rounded p-4">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<h6 class="mb-0">나의 관심 공고</h6>
					</div>
					<div class="table-responsive">
						<table
							class="table text-start align-middle table-bordered table-hover mb-0">
							<thead>
								<tr class="text-dark">
									<th scope="col" style="text-align: center;"><input class="form-check-input"
										type="checkbox" id="allcheck"></th>
									<th scope="col" style="text-align: center;">No.</th>
									<th scope="col" style="text-align: center;">회사명</th>
									<th scope="col" style="text-align: center;">공고 제목</th>
									<th scope="col" style="text-align: center;">모집 마감 일</th>
									<th scope="col" style="text-align: center;">직무</th>
									<th scope="col" style="text-align: center;">급여</th>
									<th scope="col" style="text-align: center;">고용형태</th>
									<th scope="col" style="text-align: center;">계약기간</th>
									<th scope="col" style="text-align: center;">근무요일</th>
									<th scope="col" style="text-align: center;">근무시간</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="pdto" items="${list }" varStatus="i">
							<tr>
									<input type="hidden" class="s_num" value="${pdto.s_num }">
									<td style="text-align: center;"><input class="form-check-input del" type="checkbox"></td>
									<td style="text-align: center;">${i.count }</td>
									<td style="text-align: center;">${pdto.e_name }</td>
									<td style="text-align: center;"><a href="posting/detailpage?p_num=${pdto.p_num}">${pdto.p_title}</a></td>
									<td style="text-align: center;">${pdto.p_enddate}</td>
									<td style="text-align: center;">${pdto.p_type }</td>
									<td style="text-align: center;">${pdto.p_pay }</td>
									<td style="text-align: center;">${pdto.p_employtype}</td>
									<td style="text-align: center;">${pdto.p_period }</td>
									<td style="text-align: center;">
									<c:if test="${pdto.p_workday=='월/화/수/목/금'}">
										평일
									</c:if>
									<c:if test="${pdto.p_workday=='토/일'}">
										주말
									</c:if>
									<c:if test="${pdto.p_workday!='토/일' && pdto.p_workday!='월/화/수/목/금'}">
										${adto.p_workday }
									</c:if>
									</td>
									<td style="text-align: center;">${pdto.p_starttime } ~ ${pdto.p_endtime }</td>
								</tr>
							</c:forEach>
							
							<tr>
								<td colspan="11" >
								<button id="btnScrapDel">스크랩 해제</button>
								</td>							
							</tr>
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Recent Sales End -->
			
			<script type="text/javascript">
				$("#allcheck").click(function(){
					
					//체크 값 없음
					var chk=$(this).is(":checked");
					console.log(chk);//true, false로 나옴
					
					//전체 체크값을 아래의 체크에 일괄전달
					$(".del").prop("checked",chk);
					
				});
				
				$("#btnScrapDel").click(function(){
					//alert("삭제 하고 싶다");
					
					//체크한 기업 개수 구하기
					var cnt=$(".del:checked").length;
					//alert(cnt);
					
					if (cnt==0) {
						alert("삭제할 공고를 선택해주세요 :)");
						return;//종료
					}
					
					$(".del:checked").each(function(i,elt){
						
						var num = $(this).closest("tr").find(".s_num").val();
						console.log(num);//선택한 num만 나오는지 확인
						
						//삭제 할 ajax(진짜S 삭제 되는 것)
						$.ajax({
							
							type:"get",
							url:"sdelete",
							dataType:"html",
							data:{"s_num":num},
							success:function(){
								
								location.reload();
							}
							
						})
						
					})	
					
				});
			
			
			
			
			</script>
			
	
</body>
</html>