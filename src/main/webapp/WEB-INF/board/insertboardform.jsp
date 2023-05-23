<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge"> 
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap')
	;


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

.bcontent-input {
	width: 100%;
	height:250px;
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

.formbold-form-input::placeholder, select.formbold-form-input, .bcontent-input::placeholder, 
	.formbold-form-input[type='date']::-webkit-datetime-edit-text,
	.formbold-form-input[type='date']::-webkit-datetime-edit-month-field,
	.formbold-form-input[type='date']::-webkit-datetime-edit-day-field,
	.formbold-form-input[type='date']::-webkit-datetime-edit-year-field {
	color: rgba(83, 99, 135, 0.5);
}

.formbold-form-input:focus, .bcontent-input:focus {
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

.formbold-cancel-btn{
	font-size: 16px;
	border-radius: 5px;
	padding: 14px 25px;
	border: none;
	font-weight: 500;
	background-color: #fff;
	border:1px solid #4E9F3D;
	color: #4E9F3D;
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









/*미리보기 */
.preview-image-container {
  position: relative;
  display: inline-block;
  margin-right: 10px;
}

.close-button {
  position: absolute;
  top: 0;
  right: 0;
  padding: 2px 5px;
  background-color: red;
  color: white;
  font-weight: bold;
  cursor: pointer;
}

.preview-image {
  width: 100px;
}
</style>
<script>
    function checkFileCount(event) {
    	
    	//5개제한
        var files = event.target.files;
        if (files.length > 5) {
            event.target.value = ""; // 선택한 파일 초기화
            alert("이미지는 최대 5개까지 업로드할 수 있습니다.");
        }
	
        //미리보기
        var files = event.target.files;
        var previewContainer = document.getElementById("image-preview");
        previewContainer.innerHTML = ""; // 기존 미리보기 초기화

        for (var i = 0; i < files.length; i++) {
          var file = files[i];
          var reader = new FileReader();

          reader.onload = function (e) {
            var image = document.createElement("img");
            image.src = e.target.result;
            image.classList.add("preview-image");
            image.style.width = "100px"; // 이미지 크기 설정
            image.style.padding = "15px";

            previewContainer.appendChild(image);
          };

          reader.readAsDataURL(file);
        }
        
    }
</script>
</head>
<body>
<div class="formbold-main-wrapper">
		<div class="formbold-form-wrapper">
			<form action="insertBoard" method="post" enctype="multipart/form-data">
			<div align="center">
				<h2 style="font-weight: 600; color: #416442; background-color: #e3f2c9; width: 300px; height: 50px; font-size:1.8em; padding:10px 0px; border-radius: 10px; text-align: center;">일자리이야기 작성</h2>
				</div>
				<br>
				<div class="formbold-input-wrapp formbold-mb-3">
					<label for="b_title" class="formbold-form-label">제목</label>

					<div>
						<input type="text" name="b_title" id="b_title"
							placeholder="제목을 입력해주세요.(50자 이하)" class="formbold-form-input"  required="required" maxlength="50"/>
					</div>
				</div>

				<div class="formbold-mb-3">
					<label for="p_content" class="formbold-form-label"> 내용 </label>
						<textarea name="b_content" id="b_content" placeholder="내용을 입력해주세요.(500자 이하)"
						class="bcontent-input" required="required"  maxlength="500" ></textarea>
				</div>

				<div class="formbold-mb-3">
					<label for="p_enddate" class="formbold-form-label" > 이미지 </label>
					 <input type="file" name="upload" id="b_photo" multiple="multiple" onchange="checkFileCount(event)"
						class="formbold-form-input" />
					<div id="image-preview" style="text-align:center;"></div>
				</div>
				
				<button type="button" class="formbold-cancel-btn" onclick="location.href='boardlist?currentPage=${currentPage}'" style="margin-left:10px;">취소</button>
				<button type="submit" class="formbold-btn" >등록</button>
			</form>
		</div>
	</div>
</body>
</html>