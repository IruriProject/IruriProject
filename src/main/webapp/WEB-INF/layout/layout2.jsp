<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<style type="text/css">
* {
	font-family: Noto Sans KR;
}
.layout>div{
	/* border: 1px solid black; */
	width: 1200px;
}
div.layout2 {
	width:100%;
	height: 100px;
	padding-top: 20px; 
}
div.layout2 {
	top: 100px;
	left: 150px;
	width:100%;
	height: 80px;
}
div.layout2 div.main {
	display: flex;
	flex-direction: column;
	min-height: 400px;
  	width: 80%;
  	padding-left:20px;
}
div.layout2 {
	height: 130px;
  	width: 100%;
  	display: flex;
  	
}
</style>

<title>Insert title here</title>
</head>
<body>
<div class="layout2">
		<div class="main">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
</body>
</html>