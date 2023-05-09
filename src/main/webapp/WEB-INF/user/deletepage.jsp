<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
div{
border: 1px solid gray;
}
</style>
</head>
<body>
	<form action="delete" method="post">
		<input type="hidden" name="u_num" value="${dto.u_num }"> 탈퇴페이지
		<div>
			<a href="updateuser">내 정보 수정</a><br> <br>
			<a href="updatepw">비밀번호변경</a><br> <br>
			<b>회원탈퇴</b>
		</div>
		<div>
		탈퇴 주의사항 쓸예정
		탈퇴? ${dto.u_num }<br>
		<button type="submit">탈퇴</button>
		</div>
	</form>

</body>
</html>