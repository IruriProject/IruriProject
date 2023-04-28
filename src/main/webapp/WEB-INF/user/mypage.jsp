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
</head>
<body>
	<h1>마이페이지</h1>
	세션에서 로그인 받아와서 이름, 성별, 나이 입력 사진등록 버튼

	<!-- 정보수정폼으로 이동 -->
	<div style="border: 1px solid gray">
		<div style="border: 1px solid gray; width: 150px; height: 200px; float: left" >
			사 진<br>
			<!-- 모달창 띄우기, 사진 등록 jsp 생성(input file)한 후 사진을 user에 update하면 된다. -->
			<button type="button">사진등록</button><br>
			<button type="button" onclick="location.href=#" style="width: 150px;">
			내정보 수정</button>
		</div>
		<div style="border: 1px solid gray;">
			<!-- 대표이력서 위치 -->
			대표 이력서입니다
			<!-- ajax를 활용한 이력서 공개/비공개 0/1 update -->
			<button type="button" >이력서 공개하기</button><br>
			<button type="button" >이력서 등록</button>
			<button type="button" >지원현황</button>
			<button type="button" >이력서 열람</button>
			<button type="button" >관심기업</button>
			<button type="button" >관심직종</button>
			<button type="button" >관심근무지</button>
		</div>
	</div>
	
	<br>
	
	<div style="border: 1px solid gray">
		지원 현황 목록<br>
		들어갈<br>
		div입니다.<br>
	</div>
	
	<br>
	
	<div style="border: 1px solid gray">
		관심 기업 목록<br>
		들어갈<br>
		div입니다.<br>
	</div>
</body>
</html>