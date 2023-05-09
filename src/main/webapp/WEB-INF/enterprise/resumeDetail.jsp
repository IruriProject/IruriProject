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

<style type="text/css">

.box{
	border: 1px solid lightgray;
	padding: 30px 50px;
	padding-right: 150px;
	margin: 0px auto;
	width: 100%;
	font-size: 17px;
	border-radius: 20px;
}

#title-left{
	float: left;
}

#title-right{
	display: flex;
	justify-content: space-between;
}

.title{
	font-weight: 700;
}

img{
	height: 100px; width: 100px; border-radius: 100px;
	margin-right: 20px;
}

#name{
	font-weight: 500;
}

#desc{
	color: gray;
	font-size: 15px;
	margin-left: 10px;
}

.title-content{
	font-size: 15px;
	margin: 10px;
}

#hp{
	padding-bottom: 10px;
}

.box-column{
	font-size: 0.9em;
	font-weight: 500;
	color: gray;
	width: 100px;
	display: inline-block;
	margin-left: 20px;
	margin-bottom: 10px;
}

</style>

<title>Insert title here</title>
</head>
<body>

<!-- set -->
<c:set var="birthYear"><fmt:formatDate value="${user.u_birth }" pattern="yyyy"/></c:set>
<c:set var="age" value="${2023-birthYear }"/>
 
<h2 class="title">기본정보</h2>
<div class="box">
<h3>${resume.r_title }</h3>
<hr>
	<div id="title-left">
	<c:if test="${user.u_photo!=null }">
	<img src="../경로/${user.u_photo }">
	</c:if>
	<c:if test="${user.u_photo==null }">
	<img src="../경로/${user.u_photo }">
	</c:if>
	</div>
		<div id="title-right">
		<div>
		<span id="name">${user.u_name }</span><span id="desc">${user.u_gender } ${age}세 / ${birthYear }년생</span>
		<br>
		</div>
		<div class="title-content">
		<div id="hp">연락처 ${user.u_hp }</div> <br>
		<div>이메일 ${user.u_email }</div>
		</div>
		</div>
</div>
<br>
<h2 class="title">희망근무조건</h2>
<div class="box">
<span class="box-column">근무지</span><span class="box-content">${resume.r_larea }</span><br>
<span class="box-column">업무형태</span><span class="box-content">${resume.r_ltask }</span><br>
<span class="box-column">근무형태</span><span class="box-content">${resume.r_ltype }</span><br>
<span class="box-column">근무기간</span><span class="box-content">${resume.r_lperiod }</span><br>
<span class="box-column">근무일</span><span class="box-content">${resume.r_lday }</span><br>
</div>

<br>
<h2 class="title">자기소개서</h2>
<div class="box">
${resume.r_content }
</div>

<!-- 본인 이력서일때 -->
<c:if test="${sessionScope.loginStatus!=null && sessionScope.loginStatus==user.u_id }">
 수정 삭제 인쇄 공개여부변경 대표여부변경 버튼 / 현재 공개, 대표 여부 표시
</c:if>

<!-- 기업 입장에서  -->
<c:if test="${sessionScope.loginStatus!=null && sessionScope.loginId=='d' }">
<div id="footer">
<button type="button">쪽지보내기</button>
<button type="button">지원자 정보보기</button>
</div>
</c:if>
</html>