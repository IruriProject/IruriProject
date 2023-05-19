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
	padding: 13px 22px;
	border-radius: 5px;
	border: 1px solid #dde3ec;
	font-weight: 500;
	font-size: 16px;
	color: #536387;
	outline: none;
	resize: none;
}
#i{	
	cursor: pointer;
	width: 3%;
	padding: 15px;
	border-radius: 5px;
	border: 0px solid #dde3ec;
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
		<h3 style="text-align: center">
			회원님의 개인정보 보호를 위해<br> 비밀번호를 다시 한 번 입력해주세요.
		</h3>
		<br>
	</div>
	<div class="formbold-mb-3" style="text-align: center">
		<input type="password" id="inputPw" class="formbold-form-input"	onkeydown="if(event.keyCode===13){checkPw();}"
			placeholder="비밀번호 입력" style="width:345px; height:45px; margin-bottom: 20px;">
		<i class="glyphicon glyphicon-eye-open" id="i"></i><br>
	<button onclick="checkPw()" class="formbold-btn" style="width:380px; height:45px; line-height: 0px;" >비밀번호 확인</button>
	</div>

	<!-- 버튼 눌렀을 때 현재 로그인된 아이디의 비밀번호와 input에 친 비밀번호가 같을 시 edituser로 넘어가게 됨. -->
		<script>
			function checkPw() {
				var loginPw = "${dto.u_pw}";
				var inputPw = document.getElementById("inputPw").value;
				if (loginPw === inputPw) {
					location.href = "updateuser";
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			}
		</script>
	<script type="text/javascript">
	$(document).ready(function(){
	    $('#i').on('click',function(){
	        $('input').toggleClass('active');
	        if($('input').hasClass('active')){
	            $(this).attr('class',"glyphicon glyphicon-eye-close")
	            .prev('input').attr('type',"text");
	        }else{
	            $(this).attr('class',"glyphicon glyphicon-eye-open")
	            .prev('input').attr('type','password');
	        }
	    });
	});

	</script>

</body>
</html>