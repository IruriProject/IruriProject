<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="${root }/css/usercss/style.css" rel="stylesheet">
</head>
<style>
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
	color: #416442;
	font-size: 0.8em;
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
<body>
<form class="form-inline" action="/posting/postinglistforuser" method="get" style="width: 100%; margin: 0 auto">
		<input type="hidden" value="${e_num }" name="e_num">
		<select class="form-control" name="searchcolumn">
			<option value="p_title">공고제목</option>
			<option value="p_content">공고내용</option>
		</select>
		<input type="text"
			placeholder="검색어 입력" class="form-control" name="searchword">
		<button type="submit" style="width: 70px;" class="sm-border-btn">검색</button>
		<button type="button" style="width: 80px;" class="sm-border-btn" onclick="location.href='/posting/postinglistforuser?e_num=${e_num}'">초기화</button>
	</form>
	<br>
	<table class="table" style="width: 100%; margin: 0 auto;">
		<tr>
			<th style="text-align: center">No.</th>
			<th style="text-align: center; width: 50%">공고제목</th>
			<th style="text-align: center">직종</th>
			<th style="text-align: center">공고일</th>
			<th style="text-align: center">공고마감일</th>
			<th style="text-align: center">공고상태</th>
		</tr>
		
		<c:if test="${totalCount==0 }">
   		<tr><td colspan="6" align="center">
   		<span id="nosearch">게시한 공고가 없습니다.</span>
   		</td></tr>
   		</c:if>
		
		<c:if test="${totalCount!=0 && searchCount==0 }">
   		<tr><td colspan="6" align="center">
   		<span id="nosearch">검색된 게시글이 없습니다.</span>
   		</td></tr>
   		</c:if>
   		
		<c:if test="${searchCount>0 }">
		<c:forEach var="dto" items="${list }" varStatus="i">
		<tr align="center">
			<td>${no }</td>
			<c:set value="${no-1 }" var="no"/>
			<td style="text-align: left">
				<a class="atag" href="/posting/detailpage?p_num=${dto.p_num }&currentPage=${currentPage}">&nbsp;&nbsp;
					<b>${dto.p_title }</b>
				</a>&nbsp;&nbsp;
				
				<span class="counting viewer" p_num=${dto.p_num }></span>
				<span class="counting">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
				<span class="counting scrap" p_num=${dto.p_num }></span>
			</td>
			<td>${dto.p_type }</td>
			<td><fmt:formatDate value="${dto.p_writeday }" pattern="yyyy-MM-dd"/> </td>
			<td>${dto.p_enddate }</td>
			<td>${dto.p_status }</td>
		</tr>
		
		 <script type="text/javascript">
	        $(function(){
	            var p_num = "${dto.p_num}";
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
		</c:if>
		
	</table>
	
	
	<c:if test="${searchCount>0 }">
		<!-- 페이징 -->
		<div class="pagination" style=" display: flex; justify-content: center; width:100%; text-align: center;">
	
				<!-- 이전 -->
				<c:if test="${startPage>1}">
					<c:if test="${keyword!=null }">
						<a href="postinglistforuser?currentPage=${startPage-1 }&searchcolumn=${column}&searchword=${keyword}">&laquo;</a>
					</c:if>
					<c:if test="${keyword==null }">
						<a href="postinglistforuser?currentPage=${startPage-1 }">&laquo;</a>
					</c:if>
				</c:if>
				
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				  <c:if test="${pp==currentPage }">
					 <c:if test="${keyword!=null }">
				    	<a class="active" href="postinglistforuser?currentPage=${pp}&searchcolumn=${column}&searchword=${keyword}">${pp}</a>
					</c:if>
					<c:if test="${keyword==null }">
						<a class="active" href="postinglistforuser?currentPage=${pp}">${pp}</a>
					</c:if> 
				  </c:if>
				  
				  <c:if test="${pp!=currentPage }">
				    <c:if test="${keyword!=null }">
				   		<a href="postinglistforuser?currentPage=${pp}&searchcolumn=${column}&searchword=${keyword}">${pp}</a>
					</c:if>
					<c:if test="${keyword==null }">
						<a href="postinglistforuser?currentPage=${pp}">${pp}</a>
					</c:if>
				  </c:if>
				</c:forEach>
	
				<!-- 다음 -->
				<c:if test="${endPage<totalPage }">
					<c:if test="${keyword!=null }">
						<a href="postinglistforuser?currentPage=${endPage+1}&searchcolumn=${column}&searchword=${keyword}">&raquo;</a>
					</c:if>
					<c:if test="${keyword==null }">
						<a href="postinglistforuser?currentPage=${endPage+1}">&raquo;</a>
					</c:if>
				</c:if>
			</div>
			
		</c:if>

</body>
</html>