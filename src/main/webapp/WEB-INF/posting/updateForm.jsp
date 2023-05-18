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
<script>
$(function(){
	$("#p_employtype").change(function(){
		if($("#p_employtype").val()=="계약직"){
			$("#p_pay").attr("placeholder","월급을 입력해주세요 (ex: 3000000)");
			$("#p_period").val("");
			$("#p_period").removeAttr("readonly");
			$("#p_period").attr("placeholder","ex) 6개월");
		}else{
			$("#p_pay").attr("placeholder","연봉을 입력해주세요 (ex: 28000000)");
			$("#p_period").val("-");
			$("#p_period").attr("readonly","readonly");
		}
	})
})

function check(){
	var chkcount= $("input:checkbox[name='p_workday']:checked").length;
	if(chkcount==0){
		  alert('근무 요일을 선택해주세요.');
		return false;
	}
}
</script>
<body>
	<div class="formbold-main-wrapper">
		<div class="formbold-form-wrapper">
			<form action="updateposting" method="POST" onsubmit="return check();">
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
							value="${dto.p_title }" class="formbold-form-input" required="required"/>
					</div>
				</div>

				<div class="formbold-mb-3">
					<label class="formbold-form-label">직무</label>
					<select
						class="formbold-form-input" name="p_type" id="p_type">
						<option value="건설/건축" ${dto.p_type=="건설/건축"?"selected":"" }>건설/건축</option>
						<option value="공공/복지/봉사/교육" ${dto.p_type=="공공/복지/봉사/교육"?"selected":"" }>공공/복지/봉사/교육</option>
						<option value="금융/보험" ${dto.p_type=="금융/보험"?"selected":"" }>금융/보험</option>
						<option value="기술" ${dto.p_type=="기술"?"selected":"" }>기술</option>
						<option value="농업/어업" ${dto.p_type=="농업/어업"?"selected":"" }>농업/어업</option>
						<option value="법무" ${dto.p_type=="법무"?"selected":"" }>법무</option>
						<option value="사무" ${dto.p_type=="사무"?"selected":"" }>사무</option>
						<option value="서비스" ${dto.p_type=="서비스"?"selected":"" }>서비스</option>
						<option value="생산/제조" ${dto.p_type=="생산/제조"?"selected":"" }>생산/제조</option>
						<option value="운송" ${dto.p_type=="운송"?"selected":"" }>운송</option>
						<option value="의료" ${dto.p_type=="의료"?"selected":"" }>의료</option>
						
					</select>
				</div>
				
				<div class="formbold-mb-3">
					<label class="formbold-form-label">고용형태</label> <select
						class="formbold-form-input" name="p_employtype" id="p_employtype">
						<option value="정규직" ${dto.p_employtype=="정규직"?"selected":"" }>정규직</option>
						<option value="계약직" ${dto.p_employtype=="계약직"?"selected":"" }>계약직</option>
					</select>
				</div>

				<div class="formbold-mb-3">
					<label for="p_pay" class="formbold-form-label"> 급여 </label> <input
						type="number" name="p_pay" id="p_pay" step="50"
						value="${dto.p_pay }" class="formbold-form-input" required="required"/>
				</div>

				<div class="formbold-mb-3">
					<label for="p_hirenum" class="formbold-form-label"> 채용인원 </label>
					<input type="number" name="p_hirenum" id="p_hirenum" value="${dto.p_hirenum }"
						placeholder="ex) 0" class="formbold-form-input" required="required" />
				</div>

				<div class="formbold-input-flex">
					<div style="width: 35%">
						<label for="p_period" class="formbold-form-label"> 기간 </label>
						<input
							type="text" name="p_period" id="p_period" value="${dto.p_period }" readonly="readonly"
							class="formbold-form-input" required="required" />
					</div>
					
					<div style="width: 65%">
						<label for="p_workday" class="formbold-form-label" style="margin-bottom: 12px"> 요일 </label>
							<div style="border: 1px solid #dde3ec; border-radius:5px; padding: 11px;">
							<input type="checkbox" name="p_workday" class="chkbox" value="월"> 월&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_workday" class="chkbox" value="화"> 화&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_workday" class="chkbox" value="수"> 수&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_workday" class="chkbox" value="목"> 목&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_workday" class="chkbox" value="금"> 금&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_workday" class="chkbox" value="토"> 토&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_workday" class="chkbox" value="일"> 일
							</div>
					</div>
				</div>
				
				<script>
					$(function(){
						var workdayString = '${dto.p_workday}';
						var workdays = workdayString.split("/");
						
						for (var i = 0; i < workdays.length; i++) {
					        var day = workdays[i];
					        $(".chkbox[value='" + day + "']").prop("checked", true);
					    }
					})
				</script>

				<div class="formbold-input-flex">
					<div>
						<label for="p_starttime" class="formbold-form-label"> 시작시간
						</label> <input type="time" name="p_starttime" id="p_starttime"
							value="${dto.p_starttime }" class="formbold-form-input" required="required"/>
					</div>
					<div>
						<label for="p_endtime" class="formbold-form-label"> 끝시간 </label> <input
							type="time" name="p_endtime" id="p_endtime" value="${dto.p_endtime }"
							class="formbold-form-input" required="required"/>
					</div>
				</div>

				<div class="formbold-mb-3">
					<label for="p_content" class="formbold-form-label"> 상세내용 </label>
					<textarea name="p_content" id="p_content" required="required"
						class="pcontent-input">${dto.p_content }</textarea>
						
						<span class="textCount" style="float: right"></span>
				</div>
				
				<script>
					$('#p_content').keyup(function (e) {
						var content = $(this).val();
					    
					    // 글자수 세기
					    if (content.length == 0 || content == '') {
					    	$('.textCount').text('0자 / 1000자');
					    } else {
					    	$('.textCount').text(content.length + '자 / 1000자');
					    }
					    
					    // 글자수 제한
					    if (content.length > 1000) {
					    	// 1000자 부터는 타이핑 되지 않도록
					        $(this).val($(this).val().substring(0, 1000));
					        // 1000자 넘으면 알림창 뜨도록
					        alert('글자수는 1000자까지 입력 가능합니다.');
					    };
					});
				</script>

				<div class="formbold-mb-3">
					<label for="p_enddate" class="formbold-form-label"> 공고 마감일
					</label> <input type="date" name="p_enddate" id="p_enddate" value="${dto.p_enddate }"
						class="formbold-form-input" required="required" />
				</div>
				<br>
				<div class="formbold-checkbox-wrapper">
					<label for="supportCheckbox" class="formbold-checkbox-label">
						<div class="formbold-relative">
							<input type="checkbox" id="supportCheckbox"
								class="formbold-input-checkbox" required="required" />
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
	height: 300px;
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

.small-btn{
	width: 150px;
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

.chkbox{
	width: 15px;
	height: 15px;
	margin-right: 16px;
	margin-top: 2px;
	border: 0.7px solid #4E9F3D;
	border-radius: 3px;
	accent-color: #4E9F3D;
}


</style>
</body>
</html>