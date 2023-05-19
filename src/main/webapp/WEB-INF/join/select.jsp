<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="preload" href="https://font.alba.co.kr/HGSoftGGothicssi60g.woff2" as="font" type="font/woff2" crossorigin="">
<link rel="preload" href="https://font.alba.co.kr/HGSoftGGothicssi80g.woff2" as="font" type="font/woff2" crossorigin="">
<link rel="preload" href="https://font.alba.co.kr/HGSoftGGothicssi99g.woff2" as="font" type="font/woff2" crossorigin="">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>

<style type="text/css">

.atag::before {  
  transform: scaleX(0);
  transform-origin: bottom right;
  background-color: #e3f2c9;
}

.atag:hover::before {
  transform: scaleX(1);
  transform-origin: bottom left;
  background-color: #e3f2c9;
}

.atag::before {
  content: " ";
  display: block;
  position: absolute;
  top: 0; right: 0; bottom: 0; left: 0;
  inset: 0 0 0 0;
  background: hsl(200 100% 80%);
  z-index: -1;
  transition: transform .3s ease;
  background-color: #e3f2c9;	
}

.atag {
  position: relative;
  font-size: 2rem;
  color: black;
}

.atag:hover{
	color: black;
	text-decoration: none;
}

@media (orientation: landscape) {
  body {
    grid-auto-flow: column;
  }
}

.select-box{
    width: 90%;
    margin: 10px auto;
    margin-top: 50px;
}

.box{
	border: 1px solid #4E9F3D;
    font-size: 1.5em;
    font-weight:700;
	height : 200px;
	line-height: 200px;
	border-radius: 40px;
	text-align : center;
}

.user {
    float: left;
    margin-left: 5%;
    width:40%;
    box-sizing: border-box;
}

.enter{
    float: right;
    margin-right: 5%;
    width:40%;
    box-sizing: border-box;
}

</style>

</head>
<body>
	
    <div class="select-box">
        <div class="box user"><a href="/join/user" class="atag">유저회원가입</a></div>
        <div class="box enter"><a href="/join/enterprise" class="atag">기업회원가입</a></div>
    </div>

</body>
</html>