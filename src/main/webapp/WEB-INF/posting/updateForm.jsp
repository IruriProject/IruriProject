<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>IRURI_공고등록</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="formbold-main-wrapper">
		<div class="formbold-form-wrapper">
			<form action="updateposting" method="POST">
				<input type="hidden" name="e_num" id="e_num" value=${enterNum }
					class="formbold-form-input" />
					<input type="hidden" name="p_num" id="p_num" value=${dto.p_num }
					class="formbold-form-input" />
				<div align="center">
					<h2
						style="font-weight: 600; color: #416442; background-color: #e3f2c9; width: 300px; height: 50px; font-size: 1.8em; padding: 10px 0px; border-radius: 10px; text-align: center;">공고수정</h2>
				</div>
				<br>
				<div class="formbold-input-wrapp formbold-mb-3">
					<label for="p_title" class="formbold-form-label"> 공고제목 </label>

					<div>
						<input type="text" name="p_title" id="p_title"
							value="${dto.p_title }" class="formbold-form-input" />
					</div>
				</div>

				<div class="formbold-mb-3">
					<label for="p_type" class="formbold-form-label"> 직종 </label> <input
						type="text" name="p_type" id="p_type"
						value="${dto.p_type }" class="formbold-form-input" />
				</div>

				<div class="formbold-mb-3">
					<label for="p_pay" class="formbold-form-label"> 급여 </label> <input
						type="number" name="p_pay" id="p_pay" step="50"
						value="${dto.p_pay }" class="formbold-form-input" />
				</div>

				<div class="formbold-input-flex">
					<div>
						<label for="p_period" class="formbold-form-label"> 기간 </label> <input
							type="text" name="p_period" id="p_period" value="${dto.p_period }"
							class="formbold-form-input" />
					</div>
					<div>
						<label for="p_workday" class="formbold-form-label"> 요일 </label> <input
							type="text" name="p_workday" id="p_workday" value="${dto.p_workday }"
							placeholder="ex: 월/수/금" class="formbold-form-input" />
					</div>
					<div>
						<label for="p_hirenum" class="formbold-form-label"> 채용인원 </label>
						<input type="number" name="p_hirenum" id="p_hirenum" value="${dto.p_hirenum }"
							placeholder="ex:0" class="formbold-form-input" />
					</div>
				</div>

				<div class="formbold-input-flex">
					<div>
						<label for="p_starttime" class="formbold-form-label"> 시작시간
						</label> <input type="time" name="p_starttime" id="p_starttime"
							value="${dto.p_starttime }" class="formbold-form-input" />
					</div>
					<div>
						<label for="p_endtime" class="formbold-form-label"> 끝시간 </label> <input
							type="time" name="p_endtime" id="p_endtime" value="${dto.p_endtime }"
							class="formbold-form-input" />
					</div>
				</div>

				<div class="formbold-mb-3">
					<label class="formbold-form-label">고용형태</label> <select
						class="formbold-form-input" name="p_employtype" id="p_employtype">
						<option value="정규직">정규직</option>
						<option value="기간제">기간제</option>
					</select>
				</div>

				<div class="formbold-mb-3">
					<label for="p_content" class="formbold-form-label"> 상세내용 </label>
					<textarea name="p_content" id="p_content"
						class="pcontent-input">${dto.p_content }</textarea>
				</div>

				<div class="formbold-mb-3">
					<label for="p_enddate" class="formbold-form-label"> 공고 마감일
					</label> <input type="date" name="p_enddate" id="p_enddate" value="${dto.p_enddate }"
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

				<button class="formbold-btn">공고수정</button>
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