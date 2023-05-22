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
.alink {
	color: black;
}

.alink:hover {
	color: #416442;
	text-decoration: none;
}

#enterprise-name {
	color: gray;
	margin-top: 5px;
	margin-left: 10px;
	display: block;
}

#posting-title {
	font-size: 1.1em;
}

.sub {
	margin-right: 5px;
	padding: 3px 10px;
	background-color: #e3f2c9;
	border-radius: 16px;
}

.formbold-form-select {
	float: left;
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

.countst {
	font-weight: 500;
	color: gray;
	font-size: 16px;
	letter-spacing: -.005em;
	line-height: 24px;
	padding: 10px 0px;
	line-height: 50px;
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
	color: #416442;
	background-color: #e3f2c9;
}
</style>
<script>
function updateUrl() {
  var sort = document.getElementById("sort").value;
 // var allkeyword = document.getElementById("allkeyword").value.trim();
  var url = "allsearchlist?";
  
  if (allkeyword != "") {
    url += "allkeyword=" + encodeURIComponent(allkeyword) + "&";
  }
   
  if (sort != "") {
    url += "sort=" + encodeURIComponent(sort);
  }
  
  location.href = url;
}
</script>

</head>
<body>

 <div style="margin: 30px 30px;">




		<div style="width: 100%; height: 50px; padding: 0 6%;">

			<c:if test="${totalCount>0 }">
				<b class="countst">총<b style="color: #4E9F3D;">&nbsp;${totalCount }</b>건
				</b>
			</c:if>

			<div style="width: 12%; line-height:50px; float: right;">
				<form action="allsearchlist" method="get" class="form-inline">
					<select class="formbold-form-select" name="sort" id="sort"
						onchange="updateUrl()">
						<option value="p_writeday" ${sort=="p_writeday"?"selected":""}>최신순</option>
						<option value="p_pay" ${sort=="p_pay"?"selected":""}>급여높은순</option>
					</select>
				</form>
			</div>
			
			<div style="width:10%; float:right; line-height:35px; text-align:center;">
			<button type="button" class="btn btn-default"  style="padding:7px;"onclick="location.href='/search/allsearchlist'">초기화</button>
			</div>
		</div>

		<table class="table table-info"  style="width:1000px;  margin: 0 auto;">

			<tr align="center">
				<td width="60">지역</td>
				<td width="400">모집내용/기업명</td>
				<td width="120">급여</td>
				<td width="150">근무시간</td>
				<td width="100">등록일</td>
			</tr>


			<c:if test="${totalCount==0 }">
				<tr>
					<td colspan="5" align="center">
						<h3>
							<b>등록된 게시물이 없습니다.</b>
						</h3>
					</td>
				</tr>
			</c:if>
			<c:if test="${totalCount>0 }">
				<c:forEach var="dto" items="${list }">

					<tr>
						<td width="100">${dto.p_addr }</td>
					<td width="400">
					<span id="posting-title">
						<a href="/posting/detailpage?p_num=${dto.p_num}"  class="alink">${dto.p_title }</a>
						</span> <br> 
						<span id="enterprise-name"><span class="sub">${dto.p_type }</span>${dto.e_name }</span>
						</td>
						
					<td width="200">
					<c:if test="${dto.p_employtype=='정규직' }">
					<span class="sub">월급</span>
					</c:if>
					<c:if test="${dto.p_employtype=='계약직' }">
					<span class="sub">시급</span>
					</c:if>
					<fmt:formatNumber value="${dto.p_pay }" type="number"/>
					</td>
					
					
							<td width="150">
					<fmt:parseDate value="${dto.p_starttime }" var="p_starttime" pattern="HH:mm"/>
					<fmt:formatDate value="${p_starttime}" pattern="HH:mm"/>  -
					<fmt:parseDate value="${dto.p_endtime }" var="p_endtime" pattern="HH:mm"/>
					<fmt:formatDate value="${p_endtime }" pattern="HH:mm"/>

					</td>
						<td width="100">
						<fmt:formatDate value="${dto.p_writeday }" pattern="yyyy-MM-dd" />
						</td>
					</tr>
				</c:forEach>
			</c:if>

		</table>
   		
		<!-- 페이징 -->
		<c:if test="${totalCount>0}">
			<div class="pagination" style=" display: flex; justify-content: center; width:100%; text-align: center;">
				
					<!-- 이전 -->
					<c:if test="${startPage>1 }">
						
						<a href="allsearchlist?currentPage=${startPage-1}&amp;allkeyword=${param.allkeyword}&amp;sort=${param.sort}">&laquo;</a>
						
					</c:if>

					<c:forEach var="pp" begin="${startPage }" end="${endPage }">
						<c:if test="${currentPage==pp }">
						<a class="active" href="allsearchlist?currentPage=${pp}&amp;allkeyword=${param.allkeyword}&amp;sort=${param.sort}">${pp}</a>
							
						</c:if>

						<c:if test="${currentPage!=pp }">
							<a href="allsearchlist?currentPage=${pp}&amp;allkeyword=${param.allkeyword}&amp;sort=${param.sort}">${pp}</a>
						</c:if>
					</c:forEach>
					
					<!--다음 -->
					<c:if test="${endPage<totalPage }">
						
						<a href="allsearchlist?currentPage=${endPage+1}&amp;allkeyword=${param.allkeyword}&amp;sort=${param.sort}">&raquo;</a>
					
					</c:if>
				</ul>
			</div>
		</c:if>
   	
   </div>
   
</body>
</html>