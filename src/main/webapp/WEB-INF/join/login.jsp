<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<title>Insert title here</title>
</head>
<body>dd
로그인하는곳
	<table class="table table-bordered" style="width: 300px;">
		<tr>
			<td><input type="text" id="loginid" class="form-control"
				placeholder="아이디입력" required autofocus
				value="${sessionScope.saveok==null?"":sessionScope.myid }"></td>
		</tr>
		<tr>
			<td><input type="password" id="loginpass" class="form-control"
				placeholder="비밀번호입력" required autofocus></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" id="btnlogin">회원로그인</button>
			</td> &nbsp;
		</tr>
	</table>
	
	<button type="button" id="b" style="width: 50px;">닫기</button>
</body>

<script type="text/javascript">
$("#b").click(function(){
	window.close();
})

$("#btnlogin").click(function(){
	//id, pw 읽기
	var id= $("#loginid").val();
	var pass= $("#loginpass").val();
	
	$.ajax({
		type:"get",
		dataType:"json",
		url:"login/user",
		data:{"id":id,"pass":pass},
		success:function(res){
			if(res.result=='fail'){
				alert("아이디나 비번이 맞지 않습니다.");
			}else{
				window.close();
			}
		}
		
		})
})
</script>
</html>