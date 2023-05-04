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

<title>Insert title here</title>
</head>
<body>
	
	<div class="formbold-main-wrapper" style="text-align: center">
		<h3>열람권</h3>
		
		<c:if test="${dto.e_res_access==1 }">
		이미 열람권을 가지고 있습니다. 취소하시겠습니까?
		</c:if>
		
		<c:if test="${dto.e_res_access==0 }">
		열람권을 신청하시려면 하단의 버튼을 눌러주세요
		</c:if>
		
		<br><br>
		<button type="button" class="formbold-btn" onclick="location.href='accessProcess?e_name=${sessionScope.loginName}&e_res_access=${dto.e_res_access}'" style="width:380px; height:45px; line-height: 0px;">버튼을 클릭해주세요</button>
		
	</div>

</body>
</html>