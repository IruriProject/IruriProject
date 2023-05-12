<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<script>
$(function(){
	var registnum='${dto.e_registnum}';
	var replace_num = registnum.replace(/-/g, '');
	
	var data = {
		    "b_no": [replace_num] // 사업자번호 "xxxxxxx" 로 조회 시,
	}; 
		 
	$("#certificate").click(function(){
		if(${dto.e_auth}==1){
			alert("이미 인증이 완료된 기업입니다.");
		}else{
			$.ajax({
				  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=iqsoHANcPd8ocTpL3mUNizivWJBuup0YK%2Bhz3VE%2FuaQsUGL%2FSX4fye%2BNtu4jGJwLdyd5bw%2BJlaeSZKTCcciByQ%3D%3D",  // serviceKey 값을 xxxxxx에 입력
				  type: "POST",
				  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
				  dataType: "JSON",
				  contentType: "application/json",
				  accept: "application/json",
				  success: function(result) {
					  console.log(result);
				      if(result.data[0].tax_type=='국세청에 등록되지 않은 사업자등록번호입니다.'){
				    	  alert("기업인증에 실패했습니다.");
				      }else{
				    	  alert("기업인증이 완료되었습니다.");
				    	  var e_num=${dto.e_num};
				    	  $.ajax({
				    		  url: "/enterprise/certificateAction",
							  type: "post",
							  data: {"e_num":e_num},
							  dataType: "html",
							  success: function(result) {
								  location.reload();
							  }
				    	  })
				      }
				  },
				  error: function(result) {
				      console.log(result.responseText); //responseText의 에러메세지 확인
				      alert("인증오류. 재시도해주세요.");
				  }
				});
		}
		
	})
})
</script>
<body>

<div class="formbold-main-wrapper">
		<div class="formbold-form-wrapper">
			
				<input type="hidden" name="e_num" id="e_num" value=${dto.e_num }
					class="formbold-form-input" />
					
				<div class="formbold-input-wrapp formbold-mb-3">
					<label for="e_name" class="formbold-form-label"> 회사명 </label>

					<div>
						<input type="text" name="e_name" id="e_name" disabled="disabled" readonly="readonly"
							value="${dto.e_name }" class="formbold-form-input" />
					</div>
				</div>
							
				<div class="formbold-input-wrapp formbold-mb-3">
					<label for="e_registnum" class="formbold-form-label"> 사업자등록번호 </label>

					<div>
						<input type="text" name="e_registnum" id=e_registnum disabled="disabled" readonly="readonly"
							value="${dto.e_registnum }" class="formbold-form-input" />
					</div>
				</div>

				<button type="button" class="formbold-btn" id="certificate">사업자 등록번호 확인</button>

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

.formbold-btn:hover {
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-w-45 {
	width: 45%;
}
</style>

</body>
</html>