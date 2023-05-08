<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge"> 
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">
  .formbold-form-select {
  	float:left;
    width: 100%;
  	padding: 8px 16px;
    border-radius: 5px;
    border: 1px solid #dde3ec;
    background: #ffffff;
    font-size: 14px;
    color: #536387;
    outline: none;
    resize: none;
    cursor: pointer;
  }

</style>
<script type="text/javascript">
$(function(){
	
	$("#sort").change(function(){
		var sort = $(this).val();
		//alert(sort);
		
		location.href="allsearchlist?sort="+sort;
		
	});
});
</script>

</head>
<body>

 <div style="margin: 30px 30px;">


		<div style="width: 12%; float: right; margin-right: 5px;">
			<select class="formbold-form-select" name="sort" id="sort">
				<option value="p_writeday" ${sort=="p_writeday"?"selected":""}>최신순</option>
				<option value="p_pay" ${sort=="p_pay"?"selected":""}>급여높은순</option>
			</select>
		</div>


		<table class="table" id="basic-list">
   		<caption>
   		<c:if test="${totalCount==0 }">
   		<tr>
   		  <td colspan="5" align="center"><b>등록된 게시글이 없습니다.</b></td>
   		</tr>
   		</c:if>
   		<c:if test="${totalCount>0 }">총 ${totalCount }개의 글이 있습니다.</c:if>
   		<c:if test="${sessionScope.loginStatus=='enterprise' }">
   		<span style="float: right;"><button type="button"
   		onclick="location.href='insertForm'">글쓰기</button></span>
   		</c:if>
   		</caption>

   		<tr align="center">
   		  <td width="60">지역</td>
   		  <td width="400">모집내용/기업명</td>
   		  <td width="120">급여</td>
   		  <td width="150">근무시간</td>
   		  <td width="100">등록일</td>
   		</tr>
   		
   		<c:if test="${totalCount>0 }">
   		<c:forEach var="dto" items="${list }">
		
   		<tr>
   		<td width="60">${dto.p_addr }</td>
		<td width="400">
		<span id="posting-title">
		
		<a href="/posting/detailpage?p_num=${dto.p_num}">${dto.p_title }</a>
		</span>
		<br>
		<span id="enterprise-name">[${dto.p_type }] 일단회사번호 ${dto.e_num }</span>
		</td>
		<td width="120">
		<c:if test="${dto.p_employtype=='정규직' }">
		[월급]</c:if>
		<c:if test="${dto.p_employtype=='기간제' }">
		[시급]</c:if>
		${dto.p_pay }
		</td>
		<td width="150">
		${dto.p_starttime } - ${dto.p_endtime }
		</td>
		<td width="100"><fmt:formatDate value="${dto.p_writeday }" pattern="yyyy-MM-dd"/></td>
   		</tr>
   		</c:forEach>
   		</c:if>

     	</table>
     	
     	<!-- 지역별 필터링 후 테이블 나오는 부분 -->
     	<div id="addr-box"></div>
   		
   		<!-- 페이징 처리 -->
   		<c:if test="${totalCount>0 }">
		<div style="width: 800px; text-align: center;" class="container">
		<ul class="pagination">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
			<li>
				<a href="list?currentPage=${startPage-1 }">이전</a>
			</li>
			</c:if>
			
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			  <c:if test="${pp==currentPage }">
				<li class="active">
				 <a href="list?currentPage=${pp}">${pp}</a>
				</li>  
			  </c:if>
			  <c:if test="${pp!=currentPage }">
			    <li>
				 <a href="list?currentPage=${pp}">${pp}</a>
				</li>
			  </c:if>
			</c:forEach>

			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
				<li>
					<a href="list?currentPage=${endPage+1}">다음</a>
				</li>
			</c:if>
		</ul>
		</div>
   		</c:if>

   	
   </div>
   
</body>
</html>