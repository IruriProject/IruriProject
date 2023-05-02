<%@page import="java.util.Date"%>
<%@page import="spring.mvc.dto.UserDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
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
	<style type="text/css">
	div{
	border: 1px solid gray;}
	td{
	font-size: 1.5em;}
	</style>
</head>
<body>
	<div class="formbold-main-wrapper">
		<div class="formbold-form-wrapper">
			<form action="insertResume" method="POST">
				<input type="hidden" name="u_num" value="${dto.u_num }">
				<div align="center">
					<h2
						style="font-weight: 600; color: #416442; background-color: #e3f2c9; width: 300px; height: 50px; font-size: 1.8em; padding: 10px 0px; border-radius: 10px; text-align: center;">이력서
						등록</h2>
				</div>
				<br>
				<div class="formbold-input-wrapp formbold-mb-3" style="height:250px;">
					<label for="p_title" class="formbold-form-label"> 기본정보 </label> <span
						style="font-size: 2.5em">${sessionScope.loginName }</span>
					<div style="float:left; width:150px; height:200px;">
					<img alt="" src="/photo/${dto.u_photo}" style="width: 150px; height: 200px;">
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${dto.u_gender=='남' }">
					남성
					</c:if>
					<c:if test="${dto.u_gender=='여' }">
					여성
					</c:if>
					&nbsp;&nbsp;/&nbsp;&nbsp; ${dto.u_birth }
					(${2023-dto.u_birth.substring(0, 4)+1}세) 
					<br>
					<table style="border:1px solid red;">
						<tr>
							<td width=100>연락처</td>
							<td>${dto.u_hp }</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>${dto.u_email }</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>${dto.u_addr }</td>
						</tr>
					</table>
				</div>

				<div class="formbold-mb-3">
					<label for="r_title" class="formbold-form-label"> 이력서 제목 </label> <input
						type="text" name="r_title" id="r_title" step="50"
						placeholder="25글자 이내로 자신을 표현해보세요." class="formbold-form-input" />
				</div>
				
				<div class="formbold-mb-3">
					<label class="formbold-form-label">희망지역</label>
						<select class="formbold-form-input" name="r_ltype" id="r_ltype">
							<option>w</option>
						</select>
				</div>
				
				<div class="formbold-mb-3">
					<label class="formbold-form-label">희망고용형태</label> <select
						class="formbold-form-input" name="r_ltype" id="r_ltype">
						<option value="정규직">정규직</option>
						<option value="기간제">기간제</option>
					</select>
				</div>

				<div class="formbold-input-flex">
					<div>
						<label for="r_lperiod" class="formbold-form-label"> 희망기간 </label> <input
							type="text" name="r_lperiod" id="r_lperiod" placeholder="ex:6개월"
							class="formbold-form-input" />
					</div>
					<div>
						<label for="r_lday" class="formbold-form-label"> 희망요일 </label> <input
							type="text" name="r_lday" id="r_lday"
							placeholder="ex: 월,화,수,목,금" class="formbold-form-input" />
					</div>
				</div>

				<div class="formbold-mb-3">
					<label for="p_content" class="formbold-form-label"> 상세내용 </label>
					<textarea name="p_content" id="p_content"
						placeholder="상세내용을 입력해주세요." class="pcontent-input"></textarea>
				</div>

				<div class="formbold-mb-3">
					<label for="p_enddate" class="formbold-form-label"> 공고 마감일
					</label> <input type="date" name="p_enddate" id="p_enddate"
						class="formbold-form-input" />
				</div>
				<br>
				<div class="formbold-checkbox-wrapper">
					<label for="supportCheckbox" class="formbold-checkbox-label">
						<div class="formbold-relative">
							<input type="checkbox" id="supportCheckbox"
								class="formbold-input-checkbox" />
							<div class="formbold-checkbox-inner">
								<span class="formbold-opacity-0"> <svg width="11"
										height="8" viewBox="0 0 11 8" class="formbold-stroke-current"
										fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path
											d="M8.81868 0.688604L4.16688 5.4878L2.05598 3.29507C1.70417 2.92271 1.1569 2.96409 0.805082 3.29507C0.453266 3.66742 0.492357 4.24663 0.805082 4.61898L3.30689 7.18407C3.54143 7.43231 3.85416 7.55642 4.16688 7.55642C4.47961 7.55642 4.79233 7.43231 5.02688 7.18407L10.0696 2.05389C10.4214 1.68154 10.4214 1.10233 10.0696 0.729976C9.71776 0.357624 9.17049 0.357625 8.81868 0.688604Z"
											fill="white" />
                </svg>
								</span>
							</div>
						</div>근로 기준에 준수하여 공고 작성하였습니다.
					</label>
				</div>

				<button class="formbold-btn">공고등록</button>
			</form>
		</div>
	</div>
	<style>
@import
	url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: fontAwesome;
}

.formbold-mb-3 {
	margin-bottom: 15px;
}

.formbold-relative {
	position: relative;
}

.formbold-opacity-0 {
	opacity: 0;
}

.formbold-stroke-current {
	stroke: #ffffff;
	z-index: 999;
}

#supportCheckbox:checked ~ div span {
	opacity: 1;
}

#supportCheckbox:checked ~ div {
	background: #4E9F3D;
	border-color: #4E9F3D;
}

.formbold-main-wrapper {
	display: flex;
	align-items: center;
	justify-content: center;
}

.formbold-form-wrapper {
	margin: 0 auto;
	max-width: 570px;
	width: 100%;
	background: white;
}

.formbold-img {
	display: block;
	margin: 0 auto 45px;
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
	width: 100%;
	padding: 13px 22px;
	border-radius: 5px;
	border: 1px solid #dde3ec;
	background: #ffffff;
	font-weight: 500;
	font-size: 16px;
	color: #536387;
	outline: none;
	resize: none;
}

.pcontent-input {
	width: 100%;
	height: 500px;
	padding: 13px 22px;
	border-radius: 5px;
	border: 1px solid #dde3ec;
	background: #ffffff;
	font-weight: 500;
	font-size: 16px;
	color: #536387;
	outline: none;
	resize: none;
}

.formbold-form-input::placeholder, select.formbold-form-input,
	.pcontent-input::placeholder, .formbold-form-input[type='date']::-webkit-datetime-edit-text,
	.formbold-form-input[type='date']::-webkit-datetime-edit-month-field,
	.formbold-form-input[type='date']::-webkit-datetime-edit-day-field,
	.formbold-form-input[type='date']::-webkit-datetime-edit-year-field {
	color: rgba(83, 99, 135, 0.5);
}

.formbold-form-input:focus, .pcontent-input:focus {
	border-color: #4E9F3D;
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-form-label {
	color: #536387;
	font-size: 14px;
	line-height: 24px;
	display: block;
	margin-bottom: 10px;
}

.formbold-checkbox-label {
	display: flex;
	cursor: pointer;
	user-select: none;
	font-size: 16px;
	line-height: 24px;
	color: #536387;
}

.formbold-checkbox-label a {
	margin-left: 5px;
	color: #4E9F3D;
}

.formbold-input-checkbox {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	white-space: nowrap;
	border-width: 0;
}

.formbold-checkbox-inner {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 20px;
	height: 20px;
	margin-right: 16px;
	margin-top: 2px;
	border: 0.7px solid #dde3ec;
	border-radius: 3px;
}

.formbold-form-file {
	padding: 12px;
	font-size: 14px;
	line-height: 24px;
	color: rgba(83, 99, 135, 0.5);
}

.formbold-form-file::-webkit-file-upload-button {
	display: none;
}

.formbold-form-file:before {
	content: 'Upload';
	display: inline-block;
	background: #EEEEEE;
	border: 0.5px solid #E7E7E7;
	border-radius: 3px;
	padding: 3px 12px;
	outline: none;
	white-space: nowrap;
	-webkit-user-select: none;
	cursor: pointer;
	color: #637381;
	font-weight: 500;
	font-size: 12px;
	line-height: 16px;
	margin-right: 10px;
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
	margin-top: 25px;
	float: right;
}

.formbold-btn:hover {
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-w-45 {
	width: 45%;
}
</style>
</body>
</html>