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
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.formbold-mb-3 {
	margin-bottom: 15px;
}

.formbold-relative {
	position: relative;
}

.formbold-opacity-0 {
	opacity: 0;
}

.formbold-stroke-current {
	stroke: #ffffff;
	z-index: 999;
}

#supportCheckbox:checked ~ div span {
	opacity: 1;
}

#supportCheckbox:checked ~ div {
	background: #6a64f1;
	border-color: #6a64f1;
}

.formbold-main-wrapper {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 48px;
}

.formbold-form-wrapper {
	margin: 0 auto;
	max-width: 570px;
	width: 100%;
	background: white;
	padding: 40px;
}

.formbold-img {
	display: block;
	margin: 0 auto 45px;
}

.formbold-input-wrapp>div {
	display: flex;
	gap: 20px;
}

.formbold-input-flex {
	display: flex;
	gap: 20px;
	margin-bottom: 15px;
}

.formbold-input-flex>div {
	width: 50%;
}

.formbold-form-input {
	width: 100%;
	padding: 13px 22px;
	border-radius: 5px;
	border: 1px solid #dde3ec;
	background: #ffffff;
	font-weight: 500;
	font-size: 16px;
	color: #536387;
	outline: none;
	resize: none;
}

.formbold-form-input::placeholder, select.formbold-form-input,
	.formbold-form-input[type='date']::-webkit-datetime-edit-text,
	.formbold-form-input[type='date']::-webkit-datetime-edit-month-field,
	.formbold-form-input[type='date']::-webkit-datetime-edit-day-field,
	.formbold-form-input[type='date']::-webkit-datetime-edit-year-field {
	color: rgba(83, 99, 135, 0.5);
}

.formbold-form-input:focus {
	border-color: #4E9F3D;
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-form-label {
	color: #536387;
	font-size: 14px;
	line-height: 24px;
	display: block;
	margin-bottom: 10px;
}

.formbold-checkbox-label {
	display: flex;
	cursor: pointer;
	user-select: none;
	font-size: 16px;
	line-height: 24px;
	color: #536387;
}

.formbold-checkbox-label a {
	margin-left: 5px;
	color: #6a64f1;
}

.formbold-input-checkbox {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	white-space: nowrap;
	border-width: 0;
}

.formbold-checkbox-inner {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 20px;
	height: 20px;
	margin-right: 16px;
	margin-top: 2px;
	border: 0.7px solid #dde3ec;
	border-radius: 3px;
}

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

.formbold-w-45 {
	width: 45%;
}

div {
	border: 0px solid gray;
}

.pwcheck span {
	color: red;
}
div a{
color: black;
}
div a:hover{
color:black;
text-decoration: none;
}
</style>
</head>
<body>
<div style="display:flex; flex-direction:row;">
	<form action="updatePw" method="post">
		<input type="hidden" name="u_id" value="${sessionScope.loginId}">
		<div style="float:left; width: 150px; font-size: 1.5em;">
			<a href="updateuser">내 정보 수정</a><br> <br>
			<b>비밀번호변경</b><br> <br>
			<a href="deleteform">회원탈퇴</a>
		</div>

			<div class="pwcheck" style="width:600px; margin-left: 120px; float:right;">

				<input id="presentPw" type="password" placeholder="기존 비밀번호"
					style="margin-bottom: 10px; width: 380px; height: 45px; margin-bottom: 20px;"
					class="formbold-form-input"> <span id="pwError1"></span><br>

				<input id="newPw" type="password" placeholder="새 비밀번호"
					style="margin-bottom: 10px; width: 380px; height: 45px; margin-bottom: 20px;"
					class="formbold-form-input"> <span id="pwError2"></span><br>

				<input id="pwCheck" type="password" placeholder="비밀번호 확인"
					style="margin-bottom: 10px; width: 380px; height: 45px; margin-bottom: 20px;"
					class="formbold-form-input" name="u_pw"> <span
					id="pwError3"></span><br>

				<button id="updatePw" type="submit" class="formbold-btn"
					style="width: 380px; height: 45px; line-height: 0px;">변경</button>
			</div>
	</form>
	</div>
</body>
<script type="text/javascript">
	$("#updatePw").click(
			function() {
				//기존 비밀번호 입력 오류 시
				if ($("#presentPw").val() == "") {
					$("#pwError1").text("비밀번호를 입력해주세요");
				} else if ($("#presentPw").val() != "${dto.u_pw}") {
					$("#pwError1").text("비밀번호가 올바르지 않습니다.");
				} else {
					$("#pwError1").text("");
				}
				//새 비밀번호가 현재 로그인된 세션의 비밀번호와 같을때
				if ($("#newPw").val() == "${dto.u_pw}") {
					$("#pwError2").text("새 비밀번호는 기존 비밀번호와 일치할 수 없습니다.");
				} else {
					$("#pwError2").text("");
				}

				//새 비밀번호와 비밀번호 확인 불일치 시
				if ($("#newPw").val() == "" || $("#pwCheck").val() == "") {
					$("#pwError3").text("비밀번호를 입력해주세요.");
				} else if ($("#newPw").val() != $("#pwCheck").val()) {
					$("#pwError3").text("비밀번호가 일치하지 않습니다.");
				} else {
					$("#pwError3").text("");
				}

				//오류 메세지가 출력되었을 시 이동 불가
				if ($("#pwError1").text() != "" || $("#pwError2").text() != ""
						|| $("#pwError3").text() != "") {
					return false;
				} else if ($("#pwError1").text() == ""
						&& $("#pwError2").text() == ""
						&& $("#pwError3").text() == "") {
					$('form').submit(); // submit() 메서드 호출
				}
			})
</script>
</html>