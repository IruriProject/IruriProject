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
.countst {
	font-weight: 500;
	color: gray;
	font-size: 16px;
	letter-spacing: -.005em;
	line-height: 24px;
	padding: 10px 0px;
	line-height:50px; 
}

.formbold-b_search-input {
	float:right;
	width: 100%;
	padding: 8px 16px;
	border-radius: 5px;
	border: 1px solid #dde3ec;
	background: #ffffff;
	font-weight: 500;
	font-size: 14px;
	color: #536387;
	outline: none;
	resize: none;
}

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
		
		location.href="boardlist?sort="+sort;
		
	});
});
</script>

</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div style="width: 100%; height: 80px; padding: 0 6% 3% 6%; display: inline-block;">
		<div style="float: left; width: 40%;">
			<h2
				style="float: left; width: 40%; font-weight: 600; color: #416442; font-size: 1.8em;">일자리이야기</h2>
		</div>
		<c:if test="${sessionScope.loginStatus!=null }">
			<div style="float: right; width: 40%; padding-top: 20px;">
				<button type="button" class="btn btn-default"
					style="float: right; width: 100px;" onclick="location.href='form'">글쓰기</button>
			</div>
		</c:if>
	</div>

	<div style="width: 100%; height: 50px; padding: 0 6%;">
		<b class="countst">총<b style="color: #4E9F3D;">&nbsp;${totalCount }</b> 건</b>

		<div style="width: 25%; float: right;">
			<form action="boardlist" method ="get" class="form-inline">
				<input type="text" name="keyword" id="keyword" placeholder="제목+본문검색"
					class="formbold-b_search-input" />
			</form>
		</div>

		<div style="width: 12%; float: right; margin-right:5px;">
			<select class="formbold-form-select" name="sort" id="sort">
				<option value="b_writeday" ${sort=="b_writeday"?"selected":""}>최신순</option>
				<option value="b_num" ${sort=="b_num"?"selected":""}>오래된순</option>
				<option value="b_readcount" ${sort=="b_readcount"?"selected":""}>조회순</option>
			</select>
		</div>
	</div>

	<table class="table table-info"  style="width:1000px;  margin: 0 auto;">
<!-- 	<tr>
		<th style="text-align:center;  height:40px; line-height:40px; font-size:15px;" width="60">번호</th>
		<th style="text-align:center; height:40px; line-height:40px; font-size:15px;" width="160">작성자</th>
		<th style="text-align:center; height:40px; line-height:40px; font-size:15px;" width="460">제목</th>
		<th style="text-align:center; height:40px; line-height:40px; font-size:15px;" width="80">조회</th>
		<th style="text-align:center; height:40px; line-height:40px; font-size:15px;" width="160">등록일</th>
	</tr> -->
	
	<c:if test="${totalCount==0 }">
		<tr>
			<td colspan="5" align="center">
				<h3><b>등록된 게시물이 없습니다.</b></h3>
			</td>
		</tr>
	</c:if>
	
	<c:if test="${totalCount>0 }">
				<c:forEach var="dto" items="${list }">
				<tr style=" vertical-align:middle;  height:70px; line-height:70px; font-size:14px;">
					<%-- <td align="center" style="  height:70px; line-height:70px; ">${no }</td> --%>
					
					<c:set var="no" value="${no-1 }"/>
					
				<%-- 	<td align="center" style="height:70px; line-height:70px; ">${dto.b_loginid }</td> --%>
					
					<td style="height:70px; line-height:70px; "> 
					
					<a href="detailboard?b_num=${dto.b_num }&currentPage=${currentPage}" style="color:#000;">
					<b style="font-size:16px; font-weight:500;">${dto.b_title }</b>
					<c:if test="${dto.b_photo!='no' }">
					<span class="glyphicon glyphicon-picture" style="color:gray; font-size:15px;"></span>
					</c:if>
					
				  	<c:if test="${dto.newFlag}">
                        <img src="${root }/image/newicon.png" alt="newpng" style="width:21px; margin-bottom:4px; padding:1px;" />
                    </c:if>
                    <c:if test="${dto.b_acount>0 }">
					<span><a href="content?b_num=${dto.b_num }&currentPage=${currentPage}"  style="color:red;">[${dto.b_acount}]</a></span>
					</c:if>
					
                    <br>
					<div style="width:100%; height:30px; float:left; line-height:30px; color:gray; overflow: hidden;">${dto.b_content } </div>
					</a>	
					
					<br>
					<div style="width:20%; height:30px; float:left; line-height:30px; color:gray;">
					${dto.b_loginid }  <span style="color:#bebebe;"> <span style=" padding:1px;font-size:0.8em;">|</span> ${dto.b_time }</span>
					</div>
					</td>
					
					<td style=" height:70px; line-height:70px; "align="center">
					<span style="color:#bebebe; float: right; font-size: 13px; padding: 10px;">
					<i class="	glyphicon glyphicon-eye-open"></i>&nbsp;${dto.b_readcount }</span>
				
					
					<c:if test="${dto.b_acount>0 }">
					<span style="color:#bebebe; float: right; font-size: 13px; padding: 10px;">
					<i class="glyphicon glyphicon-comment"></i>&nbsp;${dto.b_acount}</span>
					</c:if>
					</td>
					<%-- <td  style=" height:70px; line-height:70px;"align="center">${dto.b_writeday }</td> --%>
				</tr>

				<tr>
				</tr>
			</c:forEach>
			</c:if>
			
</table>

		<!-- 페이징 -->
		<c:if test="${totalCount>0}">
			<div style="width: 800px; text-align: center;">
				<ul class="pagination">
					<!-- 이전 -->
					<c:if test="${startPage>1 }">
						<li>
						<a href="boardlist?currentPage=${startPage-1}">이전</a>
						</li>
					</c:if>

					<c:forEach var="pp" begin="${startPage }" end="${endPage }">
						<c:if test="${currentPage==pp }">
							<li class="active"><a href="boardlist?currentPage=${pp}">${pp}</a>
							</li>
						</c:if>

						<c:if test="${currentPage!=pp }">
							<li><a href="boardlist?currentPage=${pp}">${pp}</a></li>
						</c:if>
					</c:forEach>
					
					<!--다음 -->
					<c:if test="${endPage<totalPage }">
						<li>
						<a href="boardlist?currentPage=${endPage+1}">다음</a>
						</li>
					</c:if>
				</ul>
			</div>
		</c:if>
</body>
</html>