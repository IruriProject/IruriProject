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
</head>
<body>
<form class="form-inline" style="width: 100%; margin: 0 auto">
		<select class="form-control">
			<option>공고제목</option>
			<option>공고내용</option>
		</select>
		<input type="text"
			placeholder="검색어 입력" class="form-control">
		<button type="button" class="btn btn-info">검색</button>
	</form>
	<br>
	<table class="table" style="width: 100%; margin: 0 auto;">
		<tr>
			<th style="text-align: center">No.</th>
			<th style="text-align: center; width: 40%">공고제목</th>
			<th style="text-align: center">직종</th>
			<th style="text-align: center">공고일</th>
			<th style="text-align: center">공고마감일</th>
			<th style="text-align: center">공고상태</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
		<tr align="center">
			<td>${i.count }</td>
			<td><a href="/posting/detailpage?p_num=${dto.p_num }">${dto.p_title }</a></td>
			<td>${dto.p_type }</td>
			<td><fmt:formatDate value="${dto.p_writeday }" pattern="yyyy-MM-dd"/> </td>
			<td>${dto.p_enddate }</td>
			<td><select class="pStatus" pnum=${dto.p_num }><option value="지원가능" ${dto.p_status=="지원가능"?'selected':'' }>지원가능</option>
											<option value="지원마감" ${dto.p_status=="지원마감"?'selected':'' }>지원마감</option></select></td>
		</tr>
		</c:forEach>
	</table>
	
	<script>
		
		$(".pStatus").change(function(){
			var pStatus=$(this).val();
			var pNum=$(this).attr("pnum");
			//alert(pNum+","+pStatus);
			$.ajax({
				type:"get",
				data:{"p_num":pNum,"p_status":pStatus},
				dataType:"html",
				url:"/posting/updateStatus",
				success:function(){
					alert("모집상태 변경 완료");
				}
			})
		})
		
		</script>
</body>
</html>