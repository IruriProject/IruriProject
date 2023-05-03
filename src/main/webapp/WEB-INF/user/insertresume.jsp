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
div {
	border: 1px solid gray;
}

ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

li {
	margin-right: 10px;
	border: 0;
	float: left;
}

td {
	font-size: 1.5em;
}
.autoResume td{
	font-size:1em;
}
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
				<div class="formbold-input-wrapp formbold-mb-3"
					style="height: 250px;">
					<label for="p_title" class="formbold-form-label"> 기본정보 </label> <span
						style="font-size: 2.5em">${sessionScope.loginName }</span>
					<div style="float: left; width: 150px; height: 200px;">
						<img alt="" src="/photo/${dto.u_photo}"
							style="width: 150px; height: 200px;">
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${dto.u_gender=='남' }">
					남성
					</c:if>
					<c:if test="${dto.u_gender=='여' }">
					여성
					</c:if>
					&nbsp;&nbsp;/&nbsp;&nbsp; ${dto.u_birth }
					(${2023-dto.u_birth.substring(0, 4)+1}세) <br>
					<table style="border: 1px solid red;">
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
					<label class="formbold-form-label">희망지역</label> <select
						class="formbold-form-input" name="r_larea" id="r_larea">
						<option>w</option>
					</select>
				</div>

				<div class="formbold-mb-3">
					<label for="p_type" class="formbold-form-label"> 희망직종 </label> <input
						type="text" name="r_ltask" id="r_ltask"
						placeholder="직종을 입력해주세요 (ex: 광고/홍보)" class="formbold-form-input" />
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
						<label for="r_lperiod" class="formbold-form-label"> 희망기간 </label>
						<input type="text" name="r_lperiod" id="r_lperiod"
							placeholder="ex:6개월" class="formbold-form-input" />
					</div>
					<div>
						<label for="r_lday" class="formbold-form-label"> 희망요일 </label> <input
							type="text" name="r_lday" id="r_lday" placeholder="ex: 월,화,수,목,금"
							class="formbold-form-input" />
					</div>
				</div>

				<div class="formbold-mb-3">
					<label for="r_content" class="formbold-form-label"> 자기소개서</label>


					<ul class="introduceTab__list">
						<li><a href="#FreeDoc" class="first on">직접입력</a></li>
						<li><a href="#OneMinDoc" class="">1분 자동완성</a></li>
					</ul>

					<script type="text/javascript">
						$(document).ready(function() {
							// 직접입력 버튼 클릭 시
							$("a[href='#FreeDoc']").click(function() {
								// Freedoc div 보여주기
								$("#FreeDoc").css("display", "block");
								// OneMinDoc div 숨기기
								$("#OneMinDoc").css("display", "none");
								// 직접입력 버튼에 on 클래스 추가
								$("a[href='#FreeDoc']").addClass("on");
								// 1분 자동완성 버튼에서 on 클래스 제거
								$("a[href='#OneMinDoc']").removeClass("on");
							});

							// 1분 자동완성 버튼 클릭 시
							$("a[href='#OneMinDoc']").click(function() {
								// OneMinDoc div 보여주기
								$("#OneMinDoc").css("display", "block");
								// FreeDoc div 숨기기
								$("#FreeDoc").css("display", "none");
								// 1분 자동완성 버튼에 on 클래스 추가
								$("a[href='#OneMinDoc']").addClass("on");
								// 직접입력 버튼에서 on 클래스 제거
								$("a[href='#FreeDoc']").removeClass("on");
								$("#personality").show();
								$("#defaultLi").css("background-color",
								"#cce891");
								$("#personality").siblings()
										.hide();
							});
						});
					</script>

					<div id="FreeDoc" class="introduceWrap" style="display: block;">

						<div class="resizable-textarea">
							<textarea name="r_content" id="r_content" style="height: 100px;"
								placeholder="나의 강점과 특징에 대해 소개하고 어떤 사람인지 설명해 보세요.
직접 작성이 어려울 땐 간편입력을 활용하세요!"
								class="rcontent-input">직접 입력이다.</textarea>
						</div>
					</div>

					<div id="OneMinDoc" class="introduceWrap" style="display: none;">

						<div class="resizable-textarea">
							<br>
							<div
								style="width: 100px; height: 200px; display: inline-block">
								<ul>
									<li id="defaultLi" role="button" value="성격">성 격</li>
									<li role="button" value="경력사항">경력사항</li>
									<li role="button" value="지원동기">지원동기</li>
								</ul>
							</div>
							<div class="autoResume" style="display: inline-block; overflow: scroll; width:450px; height:200px;">
								<table id="personality">
									<tr>
										<td style="border-bottom:1px solid gray;">주위 사람들의 기분을 좋게 하는 명쾌하고 활발한 성격을 지니고 있습니다.</td>
									</tr>
									<tr>
										<td style="border-bottom:1px solid gray;">주어진 일만 하는 소극적인 모습보다는 스스로 찾아서 하는 적극적인 성격을 지니고 있습니다.</td>
									</tr>
									<tr>
										<td style="border-bottom:1px solid gray;">환한 미소와 함께 타인을 배려하며 매사에 적극적으로 도전해 나가는 편입니다.</td>
									</tr>
									<!-- 1px solid gray css 한번에 주기 -->
								</table>
								
								<hr>
								<table id="career">
									<tr>
										<td>4</td>
									</tr>
									<tr>
										<td>5</td>
									</tr>
									<tr>
										<td>6</td>
									</tr>
								</table>
								<table id="motivation">
									<tr>
										<td>7</td>
									</tr>
									<tr>
										<td>8</td>
									</tr>
									<tr>
										<td>9</td>
									</tr>
								</table>
							</div>
							<textarea name="r_content" id="r_content" style="height: 100px;"
								placeholder="나의 강점과 특징에 대해 소개하고 어떤 사람인지 설명해 보세요.
직접 작성이 어려울 땐 간편입력을 활용하세요!"
								class="rcontent-input" readonly="readonly">간편 입력이다.</textarea>
							<!-- 간편입력시 list와 테이블 나타나게 하여 간편입력 생성 -->



							<script type="text/javascript">
								$(".resizable-textarea li").click(
										function() {
											$(this).css("background-color",
													"#cce891");
											$(this).siblings()
													.css("background-color",
															"white");

											const addr = $(this).attr("value"); //li의 value는 숫자만 가능

											if (addr == "성격") {
												$("#personality").show();
												$("#personality").siblings()
														.hide();
											} else if (addr == "경력사항") {
												$("#career").show();
												$("#career").siblings().hide();
											} else if (addr == "지원동기") {
												$("#motivation").show();
												$("#motivation").siblings()
														.hide();
											}

										})
							</script>

						</div>
					</div>

					<br> <input type="checkbox" name="r_presume">대표이력서 설정
					<br> <input type="checkbox" name="r_private">이력서 비공개
					<!-- 대표이력서 체크되면 1(대표이력서), 비공개 체크되면 1(비공개)되게 해야함 -->




					<button class="formbold-btn">공고등록</button>
					<!-- 수정시 writeday가 now로 update -->
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

.rcontent-input {
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