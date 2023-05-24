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

body {
  overflow-x: hidden;
}
* {
	list-style: none;
}

a{
   text-decoration: none;
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
	height: 40px;
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
	padding-right: 10px;
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
<!-- 일반,기업회원 nav  -->
<c:if test="${sessionScope.loginStatus!='enterprise'&&sessionScope.loginId!='admin'}">
	<nav class="nav_header">
		<ul>
			<li><a href="/posting/search" class="mainMenu">채용정보</a></li>
			<li>
				<c:if test="${sessionScope.loginStatus=='enterprise' }">
					<a href="/enterprise" class="mainMenu">기업서비스</a>
				</c:if>
				<c:if test="${sessionScope.loginStatus!='enterprise'}">
					<a style="cursor: pointer" class="mainMenu" onclick="checkLogin()">회원서비스</a>
					
					<script type="text/javascript">
					function checkLogin() {
						  // 세션에서 로그인 상태 가져오기
						  var loginStatus = '<%= session.getAttribute("loginStatus") %>';
						  // 로그인 상태 확인
						  if (loginStatus === "user") {
						    // 로그인된 상태이므로 원하는 작업 수행
						    // 마이페이지
						    window.location.href = "/mypage";
						  } else {
						    // 로그인되지 않은 상태이므로 알림창 표시 후 로그인 페이지로 이동
						    alert("로그인이 필요합니다.");
						    window.location.href = "/login";
						  }
						}
					
					function checkLogin2() {
						  // 세션에서 로그인 상태 가져오기
						  var loginStatus = '<%= session.getAttribute("loginStatus") %>';
						  // 로그인 상태 확인
						  if (loginStatus === "user") {
						    // 로그인된 상태이므로 원하는 작업 수행
						    // 개인정보수정
						    window.location.href = "/update";
						  } else {
						    // 로그인되지 않은 상태이므로 알림창 표시 후 로그인 페이지로 이동
						    alert("로그인이 필요합니다.");
						    window.location.href = "/login";
						  }
						}
					
					function checkLogin3() {
						  // 세션에서 로그인 상태 가져오기
						  var loginStatus = '<%= session.getAttribute("loginStatus") %>';
						  // 로그인 상태 확인
						  if (loginStatus === "user") {
						    // 로그인된 상태이므로 원하는 작업 수행
						    // 이력서목록
						    window.location.href = "/resumelist";
						  } else {
						    // 로그인되지 않은 상태이므로 알림창 표시 후 로그인 페이지로 이동
						    alert("로그인이 필요합니다.");
						    window.location.href = "/login";
						  }
						}
					
					function checkLogin4() {
						  // 세션에서 로그인 상태 가져오기
						  var loginStatus = '<%= session.getAttribute("loginStatus") %>';
						  // 로그인 상태 확인
						  if (loginStatus === "user") {
						    // 로그인된 상태이므로 원하는 작업 수행
						    // 관심기업
						    window.location.href = "/enterLike";
						  } else {
						    // 로그인되지 않은 상태이므로 알림창 표시 후 로그인 페이지로 이동
						    alert("로그인이 필요합니다.");
						    window.location.href = "/login";
						  }
						}
					
					function checkLogin5() {
						  // 세션에서 로그인 상태 가져오기
						  var loginStatus = '<%= session.getAttribute("loginStatus") %>';
						  // 로그인 상태 확인
						  if (loginStatus === "user") {
						    // 로그인된 상태이므로 원하는 작업 수행
						    // 지원현황
						    window.location.href = "/applicationstate";
						  } else {
						    // 로그인되지 않은 상태이므로 알림창 표시 후 로그인 페이지로 이동
						    alert("로그인이 필요합니다.");
						    window.location.href = "/login";
						  }
						}
					</script>
				</c:if>
			</li>
				
			<c:if test="${sessionScope.loginStatus!='enterprise'}">
				<li>
					<a href="/customjob" class="mainMenu">맞춤 일자리</a>
					
				</li>
			</c:if>
			<c:if test="${sessionScope.loginStatus=='enterprise'}">
				<li>
					<a href="/posting/postinglist" class="mainMenu">공고관리</a>
					
				</li>
				<li>
					<a href="/enterprise/applicant" class="mainMenu">지원자관리</a>
				
				</li>
			</c:if>
			<li><a href="/board/boardlist" class="mainMenu">일자리이야기</a>
			
			</li>
				
				
			<c:if test="${sessionScope.loginStatus!=null}">
			<li>
			
			<c:if test="${sessionScope.loginStatus!=null and sessionScope.loginId!='admin'}">
			<a href="/qna/qnawriteform" class="mainMenu">1:1 문의</a>
			</c:if>
				</li>
			</c:if>
			
		</ul>
	</nav>
  </c:if>
  
  <!-- 기업회원 nav  -->
<c:if test="${sessionScope.loginStatus=='enterprise'}">
	<nav class="nav_header" style="width: 70%">
		<ul>
			<li>
				<a href="/posting/search" class="mainMenu">채용정보</a>
			</li>
			
			<li>
				<a href="/enterprise" class="mainMenu">기업서비스</a>
			</li>
				
			<li>
				<a href="/posting/postinglist" class="mainMenu">공고관리</a>
			</li>
			
			<li>
				<a href="/enterprise/applicant" class="mainMenu">지원자관리</a>
			</li>
			
			<li>
				<a href="/board/boardlist" class="mainMenu">일자리이야기</a>
			</li>

			<li>
				<a href="/qna/qnawriteform" class="mainMenu">1:1 문의</a>
			</li>
			
		</ul>
	</nav>
  </c:if>  
   
    <!-- 관리자 nav  -->
   <c:if test="${sessionScope.loginId=='admin'}">
	<nav class="nav_header">
		<ul>
			<li><a href="/posting/search" class="mainMenu">채용정보</a></li>
				
			<li><a href="/customjob" class="mainMenu">맞춤 일자리</a></li>
			
			<li><a href="/board/boardlist" class="mainMenu">일자리이야기</a></li>
				
			<li><a href="/qna/adminqnalist"  class="mainMenu">1:1 문의</a></li>
			
			<li><a href="/member/usermemberlist" class="mainMenu">일반회원관리</a></li>
			
			<li><a  href="/member/entermemberlist" class="mainMenu">기업회원관리</a></li>
		</ul>
	</nav>
  </c:if>  
     
    
    
	<nav class="othermenu">
		<ul class="o_menu">
		<c:if test="${sessionScope.loginStatus!='enterprise' }">
			<li id="insertResume" style="width: 130px">
				<a href="${root }/insertresume">이력서등록</a>
			</li>
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
			<li><a onclick="checkLoginEnt()">공고등록</a></li>
		</c:if>
		</ul>
	</nav>
	<script type="text/javascript">
	function checkLoginEnt() {
		  // 세션에서 로그인 상태 가져오기
		  var loginStatus = '<%= session.getAttribute("loginStatus") %>';
		  // 로그인 상태 확인
		  if (loginStatus === "enterprise") {
		    // 로그인된 상태이므로 원하는 작업 수행
		    // 지원현황
		    window.location.href = "/posting/write";
		  } else {
		    // 로그인되지 않은 상태이므로 알림창 표시 후 로그인 페이지로 이동
		    alert("로그인이 필요합니다.");
		    window.location.href = "/login";
		  }
		}
	</script>
</body>
</html>