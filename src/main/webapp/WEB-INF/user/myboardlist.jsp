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

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<style type="text/css">
div {
	border: 0px solid gray;
}
.text-dark th{
text-align: center;
   border: 0px solid gray;
}
div a{
	color:#416442;
}
div a:hover{
	color:#416442;
	text-decoration: none;
}

.no{

	color: gray; 
	background-color: #f9ffef; 
	padding: 20px; 
	margin-top: 70px;
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

div td{
	border: 0px solid gray;
}

</style>


</head>
<body>
	  <!-- 내가 쓴 게시글  -->
	  <!-- Recent Sales Start -->
      <div class="container-fluid pt-4 px-4">
         <div class="bg-light text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
            </div>
            <div class="table-responsive">
               <table
                  class="table"
                  style="table-layout: fixed">
                  <thead>
      				<caption style=" margin-bottom : 10px;">
								<h4 class="mb-5" style="color: black; display: inline;"><b>총 <b style="color: #4E9F3D; font-weight: 600">${totalCount}개</b>의 내가 쓴 게시글</b></h4>
					 </caption>
                        <tr class="text-dark tb" >
                           <th scope="col" style="text-align: center; width: 150px;">번호</th>
                           <th scope="col" style=" text-align: center;  width: 600px;">제목</th>
                           <th scope="col" style="text-align: center; width: 150px;">작성일</th>
                     </tr>
                  </thead>
                  
                    <c:if test="${totalCount==0 }">
                     <tr align="center">
                        <td colspan="3" style="color: #416442; font-weight: 600">등록된 게시글이 없습니다. <br>
                        게시글을 등록해보세요!</td>
                     </tr>
                    
                    </c:if>
                    
                     <c:forEach var="dto" items="${list }" varStatus="i">
                     
                    <c:if test="${totalCount>0 }"> 
                  
                     <tr>
                        <td style="width: 150px;">${i.count}</td>
                        <td style="width: 600px">
                        <a href="board/detailboard?b_num=${dto.b_num }" style="float:left; text-align:left;  color: #416442; font-weight: 600">${dto.b_title}</a></td>
                        <td style="text-align: center; width: 150px;">
					        <span class="formattedDate-${i.index}"></span>
					    </td>
					      <script>
					        dateString = "${dto.b_writeday}";
					        formattedDate = dateString.substring(0, 10); // 날짜 부분만 추출
					        $(".formattedDate-${i.index}").text(formattedDate);
					      </script>
                     </tr>
                   </c:if> 
              
                     </c:forEach>
               </table>
            </div>
         </div>
      </div>
				
				<!-- 페이징 -->
					<div class="pagination" style="display: flex; justify-content: center; width: 100%; text-align: center;">

						<!-- 이전 -->
						<c:if test="${startPage > 1 }">
							<a href="/myboardlist?b_num=${b_num }&currentPage=${startPage - 1 }">&laquo;</a>
						</c:if>

						<c:forEach var="pp" begin="${startPage }" end="${endPage }">
							<c:if test="${pp == currentPage }">
								<a class="active" href="/myboardlist?b_num=${b_num }&currentPage=${pp }">${pp }</a>
							</c:if>
							<c:if test="${pp != currentPage }">
								<a href="/myboardlist?b_num=${b_num }&currentPage=${pp }">${pp }</a>
							</c:if>
						</c:forEach>

						<!-- 다음 -->
						<c:if test="${endPage < totalPage }">
							<a href="/myboardlist?b_num=${b_num }&currentPage=${endPage + 1 }">&raquo;</a>
						</c:if>

					</div>			

</body>
</html>