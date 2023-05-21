<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<title>Insert title here</title>
<style type="text/css">
* {
	list-style: none;
}

.nav_header {
	float: left;
	width: 60%;
	padding: 10px;
	margin-left: 50px;
}

.nav_header>ul>li {
	float: left;
	position: relative;
	width: 150px;
	height: 40px;
	text-align: center;
	line-height: 40px;
}

.nav_header>ul>li:hover .mainMenu {
	color: #172601;
	background-color: #D0EDA1;
	text-decoration: none;
}

.mainMenu {
	display: block;
	width: 100%;
	height: 40px;
	font-size: 18px;
	font-weight: bold;
	color: black;
	margin-top: 10px;
}

.subMenu {
	position: absolute;
	top: 50px;
	z-index: 5000;
	width: 150px;
	height: 160px;
	background-color: #fff;
}

.nav_header>ul>li {
	float: left;
	position: relative;
	width: 130px;
	height: 50px;
	text-align: center;
	line-height: 40px;
}

.subMenu>li {
	float: left;
	width: 130px;
	height: 40px;
	text-align: center;
	line-height: 40px;
}

.subMenu>li>a {
	display: block;
	width: 100%;
	height: 100%;
	font-size: 16px;
	color: #172601;
	margin-left: -40px;
}

.subMenu>li>a:hover {
	color: #172601;
	background-color: #D0EDA1;
	text-decoration: none;
}

.o_menu {
	list-style: none;
}

.o_menu li {
	width: 160px;
	float: left;
	border: none;
	height: 50px;
	line-height: 50px;
	text-align: right;
	font-size: 20px;
	font-weight: 700;
	cursor: pointer;
	margin-top: 5px;
}

.o_menu li:hover {
	border: none;
	text-align: right;
	font-weight: bold;
	color: #fff;
	cursor: pointer;
}

.o_menu li a {
	color: green;
	text-decoration: none;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		// 메뉴
		$('.subMenu').slideUp(0);
		$('.nav_header').hover(function() {
			$('.subMenu').stop().slideDown('fast');
		}, function() {
			$('.subMenu').stop().slideUp('fast');
		});
	});
</script>

</head>
<body>

	<nav class="nav_header">
		<ul>
			<li><a href="/posting/search" class="mainMenu">채용정보</a>
				<ul class="subMenu">
					<li><a href="/posting/search">공고검색</a></li>
					<li><a href="hi">sub메뉴</a></li>
					<li><a href="hi">sub메뉴</a></li>
					<li><a href="hi">sub메뉴</a></li>
				</ul></li>
			<li>
				<c:if test="${sessionScope.loginStatus=='enterprise' }">
					<a href="/enterprise" class="mainMenu">기업서비스</a>
					<ul class="subMenu">
						<li><a href="/posting/postinglist">공고관리</a></li>
						<li><a href="/enterprise/applicant">지원자관리</a></li>
						<li><a href="/posting/messagelist/">쪽지관리</a></li>
						<li><a href="/phrases/list">자주쓰는문구관리</a></li>
					</ul>
				</c:if>
				<c:if test="${sessionScope.loginStatus!='enterprise' }">
					<a style="cursor: pointer" class="mainMenu" onclick="checkLogin()">회원서비스</a>
					<ul class="subMenu">
						<li><a href="/update">개인정보 관리</a></li>
						<li><a href="/resumelist">이력서 관리</a></li>
						<li><a href="/enterLike">관심 기업</a></li>
						<li><a href="/applicationstate">지원현황</a></li>
					</ul>
					
					<script type="text/javascript">
					function checkLogin() {
					  <c:if test="${empty sessionScope.loginStatus}">
					    alert("로그인 후 이용 가능합니다.");
					    location.href = "/login";
					    return false;
					  </c:if>
					  location.href = "/mypage";
					}
					</script>
				</c:if>
			</li>
				
			<li><a href="/customjob" class="mainMenu">맞춤 일자리</a>
				<ul class="subMenu">
					<li><a href="hi">sub메뉴</a></li>
					<li><a href="hi">sub메뉴</a></li>
					<li><a href="hi">sub메뉴</a></li>
					<li><a href="hi">sub메뉴</a></li>
				</ul></li>
			<li><a href="/board/boardlist" class="mainMenu">일자리이야기</a>
				<ul class="subMenu">
					<li><a href="/board/form">입력폼</a></li>
					<li><a href="hi">sub메뉴</a></li>
					<li><a href="hi">sub메뉴</a></li>
					<li><a href="hi">sub메뉴</a></li>
				</ul></li>
				
				
			<c:if test="${sessionScope.loginStatus!=null}">
			<li>
			
			<c:if test="${sessionScope.loginStatus!=null and sessionScope.loginId!='admin'}">
			<a href="/qna/qnawriteform" class="mainMenu">일대일문의</a>
			</c:if>
			<c:if test="${sessionScope.loginStatus!=null and sessionScope.loginId=='admin'}">
			<a href="/qna/adminqnalist"  class="mainMenu">관리자일대일</a>
			</c:if>
				<ul class="subMenu">
						<c:if test="${sessionScope.loginStatus!=null and sessionScope.loginId=='admin'}">
						<li><a href="/member/usermemberlist">일반회원관리</a></li>
						<li><a href="/member/entermemberlist">기업회원관리</a></li>
						</c:if>
					<li><a href="hi">sub메뉴</a></li>
					<li><a href="hi">sub메뉴</a></li>
					<li><a href="hi">sub메뉴</a></li>
				</ul>
				</li>
				</c:if>
		</ul>
	</nav>
    
	<nav class="othermenu">
		<ul class="o_menu">
		<c:if test="${sessionScope.loginStatus!='enterprise' }">
			<li id="insertResume"><a href="${root }/insertresume">이력서등록</a></li>
			<c:if test="${not empty message}">
				<script type="text/javascript">
					alert("${message}");
					location.href = "resumelist";
				</script>
			</c:if>
			<c:if test="${not empty loginmessage}">
				<script type="text/javascript">
					alert("${loginmessage}");
					location.href = "login";
				</script>
			</c:if>
		</c:if>
		
		<c:if test="${sessionScope.loginStatus!='user' }">
			<li><a href="${root }/posting/write">공고등록</a></li>
		</c:if>
		</ul>
	</nav>
</body>
</html>