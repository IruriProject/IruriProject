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
.formbold-btn {
	font-size: 16px;
	border-radius: 5px;
	border: none;
	background-color: #cce891;
	color: white;
	cursor: pointer;
}
.btn-s {
	font-weight: 400;
	width: 100px;
	height: 50px;
}

.btn-m {
	padding: 14px 25px;
	font-weight: 500;
	margin-top: 25px;
}

.formbold-btn:hover {
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}
div a{
color: black;
}
div a:hover{
color:black;
text-decoration: none;
}
div{
border: 0px solid gray;
}
</style>
</head>
<body>
<div style="display:flex; flex-direction:row;">
	<form action="delete" method="post">
		<input type="hidden" name="u_num" value="${dto.u_num }">
		<div style="float:left; width: 150px; font-size: 1.5em;">
			<a href="updateuser">내 정보 수정</a><br> <br>
			<a href="updatepw">비밀번호변경</a><br> <br>
			<b>회원탈퇴</b>
		</div>
		<div style="width:600px; margin-left: 120px; float:right;">
		<b style="font-size:2em;">탈퇴 전 주의사항</b>
		<h4>1. 탈퇴 즉시 회원정보 삭제</h4>
		탈퇴 즉시 이력서 및 구직활동 정보가 모두 삭제되며, 삭제된 정보는 복구되지 않습니다.<br><br>
		<h4>2. 이용 정보 일정기간 보관</h4>
		'전자상거래 등에서 소비자보호에 관한 법률'에 따라 유료 결제에 관한 계약 기록은 5년간 보관합니다.<br>
		이용제한 및 징계에 관한 기록은 일정기간 보관합니다.<br>
		<br>
		<button type="submit" class="formbold-btn"
		style="width: 100px; height: 45px; line-height: 0px;">탈퇴</button>
		</div>
	</form>
</div>
</body>
</html>