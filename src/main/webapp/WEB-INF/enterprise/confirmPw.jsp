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
	<form action="confirmpwAction" method="post">
	<input type="hidden" name="e_num" value="${e_num }">
		<div>비밀번호 입력</div>
		<br>
		<input type="text" placeholder="비밀번호 입력" name="inputpw">
		<button type="submit" class="btn btn-info">탈퇴하기</button>
	</form>
</body>
</html>