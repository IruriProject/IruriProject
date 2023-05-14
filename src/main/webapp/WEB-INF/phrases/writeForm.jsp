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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet" />
</head>
<script>
	$(function() {
		$("#auto").change(function() {

			var phrase = $(this).val();
			var index = $(".insertPhrases > div").length;

			var s = "";
			s += "<div class='formbold-mb-3 form-inline' style='height: 100px; position: relative;'>";
			s += "<label for='f_phrase_" + index + "' class='formbold-form-label'>등록할 문구_ "
					+ (index + 1) + "</label>";
			s += "<input type='text' style='width:90%' name='fPhraseList' id='f_phrase_"+index+"' class='formbold-form-input'/>";
			s += "<button class='small-btn cancelbtn' type='button' style='position: absolute; top: 40%; vertical-align: middle; text-align: center;'>-</button>";
			s += "</div>";

			$(".insertPhrases").append(s);

			$("#f_phrase_" + index).val(phrase);

		})

		$("#directbtn").click(function() {

			var phrase = $("#direct").val();
			var index = $(".insertPhrases > div").length;

			var s = "";
			s += "<div class='formbold-mb-3 form-inline' style='height: 100px; position: relative;'>";
			s += "<label for='f_phrase_" + index + "' class='formbold-form-label'>등록할 문구_ "
					+ (index + 1) + "</label>";
			s += "<input type='text' style='width:90%' name='fPhraseList' id='f_phrase_"+index+"' class='formbold-form-input'/>";
			s += "<button class='small-btn cancelbtn' type='button' style='position: absolute; top: 40%; vertical-align: middle; text-align: center;'>-</button>";
			s += "</div>";

			$(".insertPhrases").append(s);

			$("#f_phrase_" + index).val(phrase);
			$("#direct").val("");

		})

		$(document).on('click', ".cancelbtn", function(){
			$(this).siblings().remove();
			$(this).parent().remove();
			$(this).remove();
			
		})
		
	})
	
	
	function check(){	
		if(${listCount}+$('input[name=fPhraseList]').length>5){
			alert("자주 쓰는 문구는 기업당 최대 5개까지 입력할 수 있습니다.\n현재 문구 개수는 "+${listCount}+"개 입니다.");
			return false;
		}
		
		if($('input[name=fPhraseList]').length==0){
			alert("문구를 입력해주세요.");
			return false;
		}
	}


</script>
<body>

	<div class="formbold-main-wrapper">
		<div class="formbold-form-wrapper">
			<form action="writephrases" method="POST" onsubmit="return check();">
				<input type="hidden" name="e_num" id="e_num" value=${e_num }
					class="formbold-form-input" />
				<div align="center">
					<h2
						style="font-weight: 600; color: #416442; background-color: #e3f2c9; width: 300px; height: 50px; font-size: 1.8em; padding: 10px 0px; border-radius: 10px; text-align: center;">자주쓰는문구
						등록</h2>
				</div>
				<br>

				<div class="formbold-mb-3">
					<label class="formbold-form-label">추천문구</label> <select
						class="formbold-form-input" id="auto" style="width: 90%">
						<option value="선택">-- 선택 --</option>
						<option value="안녕하세요">안녕하세요</option>
						<option value="설립 20년차 이상의 안정된 회사입니다.">설립 20년차 이상의 안정된
							회사입니다.</option>
						<option value="복지가 보장되어있는 기업입니다.">복지가 보장되어있는 기업입니다.</option>
						<option value="많은 지원 바랍니다.">많은 지원 바랍니다.</option>
					</select>
				</div>

				<div class="formbold-mb-3">
					<label for="f_phrase" class="formbold-form-label">직접입력</label>
					<div class="form-inline" style="height: 100px; position: relative;">
						<textarea id="direct" style="width: 90%"
							placeholder="직접 문구를 입력해주세요." class="pcontent-input"></textarea>
						<button class="small-btn" id="directbtn" type="button"
							style="position: absolute; top: 40%; vertical-align: middle; text-align: center;">+</button>
					
					</div>
				</div>

				<br> <br>

				<div class="insertPhrases"></div>
				<br>

				<button class="formbold-btn" type="submit">문구등록</button>

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
	height: 100px;
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

.formbold-btn2 {
	font-size: 16px;
	border-radius: 5px;
	padding: 14px 25px;
	border: 1px solid #4E9F3D;
	font-weight: 500;
	background-color: white;
	color: #4E9F3D;
	cursor: pointer;
	margin-top: 25px;
	float: right;
	margin-right: 10px;
}

.small-btn {
	margin-left: 10px;
	width: 50px;
	padding: 5px 15px;
	border-radius: 5px;
	border: 1px solid #4E9F3D;
	background-color: white;
	color: #4E9F3D;
	cursor: pointer;
}

.formbold-btn:hover, .formbold-btn2:hover, .small-btn:hover {
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-w-45 {
	width: 45%;
}
</style>
</body>
</html>