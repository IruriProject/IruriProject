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
<script src="https://kit.fontawesome.com/f071d37f7a.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style>
.func {
	font-size: 1.5em;
	margin-left: 10px;
	cursor: pointer;
}

.edit {
	color: green;
}

.del {
	color: red;
}
</style>
</head>
<body>
	<div>
		<button style="float: right; margin-bottom: 10px;" type="button"
			class="btn btn-info" onclick="location.href='/phrases/write'">문구등록</button>
	</div>
	<table class="table" style="width: 80%; margin: 0 auto;">
		<tr>
			<th style="text-align: center; width: 20%">No.</th>
			<th style="text-align: center">문구</th>
		</tr>
		<c:if test="${list.size()==0 }">
			<tr align="center">
				<td colspan="4">등록한 문구가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr align="center">
				<td>${i.count }</td>
				<td class="form-inline"><input type="text" class="form-control"
					value="${dto.f_phrase }" style="text-align: center; width: 500px;"
					readonly="readonly"><span class="func edit"><i title="문구 수정"
						class="far fa-edit"></i></span><span class="func del"><i title="문구 삭제"
						class="far fa-trash-alt"></i></span></td>
		</c:forEach>
	</table>
</body>
</html>