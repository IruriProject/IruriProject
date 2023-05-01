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
@import
	url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Inter', sans-serif;
	flex-direction: row;
	display: flex;
}

.formbold-mb-3 {
	margin-bottom: 15px;
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
	font-weight: 500;
	font-size: 16px;
	color: #536387;
	outline: none;
	resize: none;
}

.formbold-form-input:focus {
	border-color: #4E9F3D;
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-btn {
	font-size: 16px;
	border-radius: 5px;
	padding: 14px 25px;
	border: none;
	font-weight: 500;
	background-color: #4E9F3D;
	color: white;
	cursor: pointer;
}

.formbold-btn:hover {
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-w-45 {
	width: 45%;
}
</style>
</head>
<body>

	<div class="formbold-main-wrapper">
		<h1>
			회원님의 개인정보 보호를 위해<br> 비밀번호를 다시 한 번 입력해주세요.
		</h1>
		<br>
	</div>
	<div class="formbold-mb-3">
		<input type="password" id="inputPw" class="formbold-form-input"
			placeholder="비밀번호 입력">
	</div>
	<button onclick="checkPw()" class="formbold-btn">버튼</button>

	<!-- 버튼 눌렀을 때 현재 로그인된 아이디의 비밀번호와 input에 친 비밀번호가 같을 시 edituser로 넘어가게 됨. -->
	<c:if test="${sessionScope.loginPw!=null }">
		<script>
			function checkPw() {
				var loginPw = "${sessionScope.loginPw}";
				var inputPw = document.getElementById("inputPw").value;
				if (loginPw === inputPw) {
					location.href = "updateuser";
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			}
		</script>
	</c:if>

</body>
</html>