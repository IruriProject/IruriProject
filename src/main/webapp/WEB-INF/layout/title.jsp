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
<title>이루리</title>
<style type="text/css">
.logo {
	float: left;
	height: 100%;
	padding: 3px 10px 10px 130px;
}

.a {
	color: #000;
	font-weight: bold;
	text-align: center;
}
.a:hover {
	color: #000;
	text-decoration: none;
}
.search {
	float: left;
	width: 480px;
	height: 100%;
	padding: 20px;
	margin: 0 auto;
	position: relative;
	text-align: center;
}
.searchipput {
	width: 100%;
	border-radius: 20px;
	border: 1px solid #4E9F3D;
	margin: 10px 0;
	padding: 10px 15px 10px 40px;
	font-family: fontAwesome;
}
#searchcon {
	position: absolute;
	top: 44px;
	left: 36px;
	margin: 0;
}
.searchipput:focus {outline: 1.5px solid #4E9F3D;}
.usernav {
	float: right;
	width: 270px;
	height: 100%;
	padding: 50px 30px 30px 0px;
	margin-top:-10px;
}
.usernav a{
	text-align:center;
	color:gray;
	font-size:15px;
}
.usernav a:hover{
	text-align:center;
	text-decoration:none;
	color:#000;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<div class="logo">
<!-- <a href="main"><h1 style="color:#4E9F3D; font-size:36px;">이루리</h1></a> -->
<a href="${root }"><img src="${root }/image/logo.jpg" style="width:170px;"></a>
</div>
<div class="search">
      <i class="glyphicon glyphicon-search" id="searchcon" style="color:#41644a;"></i>
      <input class="searchipput"type="text">
</div>

<div class="usernav">

	<!-- 로그아웃 상태 -->
	<c:if test="${sessionScope.loginStatus==null }">
	<a href="login">로그인</a> | <a href="join">회원가입</a>
	</c:if>
	
	<!-- 로그인 상태 / 개인 -->
	<c:if test="${sessionScope.loginStatus=='user' }">
	${sessionScope.loginName }님 안녕하세요
	<span class="glyphicon glyphicon-envelope" style="padding:0 10px;"></span> <br>
	<a href="logout" style="padding-left: 100px;">로그아웃</a>
	</c:if>
	
	<!-- 로그인 상태 / 기업 -->
	<c:if test="${sessionScope.loginStatus=='enterprise' }">
	${sessionScope.loginName }님 안녕하세요 <br>
	[기업회원]
	<a href="logout">로그아웃</a>
	</c:if>
</div>
</body>
</html>