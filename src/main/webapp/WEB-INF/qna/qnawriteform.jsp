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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
  var hash = window.location.hash;
  
  // URL에서 가져온 해시값이 "#menu1"인 경우 해당 탭 활성화
  if (hash === "#menu1") {
    $("#home").removeClass("active");
    $("#menu1").removeClass("fade");
    $("#menu1").addClass("active in");
    $("#menu1").removeClass("active");
    $("#menu1").closest("li").addClass("active");
    $(".tab-content").removeClass("active");
    $("#menu1").addClass("active");
    $(".nav-pills li").removeClass("active"); // 모든 li에서 active 클래스 제거
    $(".tabmenu[href='#menu1']").closest("li").addClass("active"); // #menu1에 해당하는 tabmenu의 li에 active 클래스 추가
    $(".tabmenu[href='#menu1']").tab("show"); // #menu1 탭 활성화
  }
});
</script>

  <style>
@import
	url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap')
	;

.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover
	{
	color: #fff !important;
	background-color: green !important;
}

.nav-pills>li>a{
	color: #4E9F3D !important;
	text-decoration: none !important;
}

.nav-pills>.nav-item>.active {
	color: #fff !important;
	background-color: #4E9F3D !important;
}

.nav-pills>li.active>a:hover{
	color: #4E9F3D !important;
	background-color: #cce891 !important;
}

.nav-pills>li>a:hover{
	color: #4E9F3D !important;
	background-color: #e3f2c9 !important;
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

.qcontent-input {
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
	.qcontent-input::placeholder, .formbold-form-input[type='date']::-webkit-datetime-edit-text,
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

.formbold-cancel-btn {
	font-size: 16px;
	border-radius: 5px;
	padding: 14px 25px;
	border: none;
	font-weight: 500;
	background-color: #fff;
	border: 1px solid #4E9F3D;
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

.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: #4E9F3D;
  color: white;
  text-decoration: none;
}

.pagination a:hover:not(.active) {text-decoration: none; color:#416442; background-color:#e3f2c9;}


</style>
<script>
    function checkFileSize(event) {
        var files = event.target.files;
        var maxSize = 5 * 1024 * 1024; // 5MB 제한 크기

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            if (file.size > maxSize) {
                event.target.value = ""; // 선택한 파일 초기화
                alert("파일 크기는 최대 5MB까지 업로드할 수 있습니다.");
                return;
            }
        }
        
        
        var files = event.target.files;
        var fileSizeLabel = document.getElementById("file-size-label");

        var totalSize = 0;
        for (var i = 0; i < files.length; i++) {
            totalSize += files[i].size;
        }

        // 파일 크기 표시
        var fileSizeInMB = (totalSize / (1024 * 1024)).toFixed(2);
        fileSizeLabel.textContent = "총 파일 크기: " + fileSizeInMB + "MB";
    }
</script>


</head>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div class="container">
  <ul class="nav nav-pills" style="text-align:center; display: flex; justify-content: center; position:relative;">
    <li class="active" style="width:160px;"><a data-toggle="pill" href="#home" class="tabmenu" style="font-size:18px; font-weight:bold; width:160px; height:50px; position:absolute;">나의문의내역</a></li>
    <li style="width:160px;"><a data-toggle="pill" href="#menu1" class="tabmenu" style="font-size:18px; font-weight:bold; width:160px; height:50px; position:absolute;">문의하기</a></li>
  </ul>
  
  <div class="tab-content" style="padding: 50px 0;">
  
    <div id="home" class="tab-pane fade in active" style="padding:30px 0;">
				

<div style="width: 100%; padding: 0 6%;">
	<h4>총<b style="color: #4E9F3D; text-align:center;">&nbsp;${usertotalCount }</b> 건</h4>
				<table class="table table-info"
					style="width: 100%; margin: 0 auto;">
					<tr>
					    <td width="5%" align="center" >번호</td>
						<td width="15%" align="center" >제목</td>
						<td  width="50%"  align="center">내용</td>
						<td  width="10%"  align="center">답변상태</td>
						<td  width="10%" align="center">날짜</td>
					</tr>
				

					<c:if test="${usertotalCount==0 }">
						<tr>
							<td colspan="5" align="center">
								<h3>
									<b>최근 작성한 문의 내역이 없습니다.</b>
								</h3>
							</td>
						</tr>
					</c:if>

					<c:if test="${usertotalCount>0 }">
						<c:forEach var="a" items="${list }">
						 <c:if test="${sessionScope.loginStatus!=null and sessionScope.loginId==a.q_loginid }">
							<tr>
								<c:set var="no" value="${no-1 }" />
								<td align="center">${no+1 }</td>
								<td align="center">${a.q_title }</td>

								<td style="width:100%; height:30px; overflow:hidden; float:left;color:gray;" >
								<a href="detailqna?q_num=${a.q_num }&currentPage=${currentPage}" style="color:#416442; font-weight:600; text-decoration:none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">
								${a.q_content }
								</a>
							   <c:if test="${a.q_file!='no'}">
					           <span class="glyphicon glyphicon-download-alt" style="margin-left:1px; font-size:12px;"></span>
					          	</c:if>
					          
								</td>
								<td align="center">
								            <c:if test="${a.qnaCount == 0}">
								                <b style="font-weight:500; color:red;">대기중</b>
								            </c:if>
								            <c:if test="${a.qnaCount != 0}">
								                <b style="font-weight:500; color:green;">답변완료</b>
								            </c:if>
								        </td>
										<td align="center">
							<fmt:formatDate value="${a.q_writeday }" pattern="yyyy-MM-dd" />
								
								</td>
							</tr>
							</c:if>
						</c:forEach>
					</c:if>

				</table>
				
				<!-- 페이징 -->
		<c:if test="${usertotalCount>0}">
			<div class="pagination" style=" display: flex; justify-content: center; width:100%; text-align: center;">
				
					<!-- 이전 -->
					<c:if test="${startPage>1 }">
						
						<a href="qnawriteform?currentPage=${startPage-1}">&laquo;</a>
						
					</c:if>

					<c:forEach var="pp" begin="${startPage }" end="${endPage }">
						<c:if test="${currentPage==pp }">
							<a class="active" href="qnawriteform?currentPage=${pp}">${pp}</a>
							
						</c:if>

						<c:if test="${currentPage!=pp }">
							<a href="qnawriteform?currentPage=${pp}">${pp}</a>
						</c:if>
					</c:forEach>
					
					<!--다음 -->
					<c:if test="${endPage<totalPage }">
						
						<a href="qnawriteform?currentPage=${endPage+1}">&raquo;</a>
						
					</c:if>
				
			</div>
		</c:if>
			</div>
</div>
			
			
    <div id="menu1" class="tab-pane fade" style="padding:30px 0;">
 		 <div class="formbold-main-wrapper">
		<div class="formbold-form-wrapper">
			<form action="insertQna" method="post" enctype="multipart/form-data">
			<div align="center">
				
				</div>
				<br>
				<div class="formbold-input-wrapp formbold-mb-3">
					<label for="q_title" class="formbold-form-label">제목</label>

					<div>
						<input type="text" name="q_title" id="q_title"
							placeholder="제목을 입력해주세요.(20자 이하) " class="formbold-form-input"  required="required" maxlength="19"/>
					</div>
				</div>

				<div class="formbold-mb-3">
					<label for="q_content" class="formbold-form-label"> 문의내용 </label>
						<textarea name="q_content" id="q_content" placeholder="문의내용을 입력해주세요.(500자 이하)"
						class="qcontent-input" required="required" maxlength="500"></textarea>
				</div>

				<div class="formbold-input-wrapp formbold-mb-3">
					<label for="q_email" class="formbold-form-label">이메일</label>

					<div>
						<input type="text" name="q_email" id="q_email"
							placeholder="이메일을 입력해주세요." class="formbold-form-input"  required="required"/>
					</div>
				</div>


				<div class="formbold-mb-3">
					<label for="q_file" class="formbold-form-label" > 첨부파일 (최대 5MB 가능)
					<div id="file-size-label"></div>
					</label> 
					
					 <input type="file" name="upload" id="q_file" multiple="multiple" onchange="checkFileSize(event)"
						class="formbold-form-input" />
				</div>

							<br>
						<div class="formbold-checkbox-wrapper">
								<div style="padding:25px; margin:10px 0; font-size:12px; line-height:20px; background: #f2f2f2; border-radius: 10px;">
								<h5 style="font-weight:600;">개인정보 수집 및 이용안내</h5>
								<b>문의에 대한 처리 및 답변</b>을 위해 <b>이메일, 계정정보, 첨부파일(선택), IP주소, 
								브라우저 및 OS 정보</b>가 수집되며, 수집된 정보는 <b>3년간 보관</b>합니다. 
								이에 동의하지 않을 경우 문의/제안/신고 등록이 불가하며, 선택항목은 입력하지 않더라도 서비스이용에 제한을 두지 않습니다.
								</div>
								<label for="supportCheckbox" class="formbold-checkbox-label">
									<div class="formbold-relative">
										<input type="checkbox" id="supportCheckbox"
											class="formbold-input-checkbox"  required="required"/>
										<div class="formbold-checkbox-inner">
											<span class="formbold-opacity-0"> 
											<svg width="11" height="8" viewBox="0 0 11 8"
													class="formbold-stroke-current" fill="none"
													xmlns="http://www.w3.org/2000/svg">
                  							<path d="M8.81868 0.688604L4.16688 5.4878L2.05598 3.29507C1.70417 2.92271 1.1569 2.96409 0.805082 3.29507C0.453266 3.66742 0.492357 4.24663 0.805082 4.61898L3.30689 7.18407C3.54143 7.43231 3.85416 7.55642 4.16688 7.55642C4.47961 7.55642 4.79233 7.43231 5.02688 7.18407L10.0696 2.05389C10.4214 1.68154 10.4214 1.10233 10.0696 0.729976C9.71776 0.357624 9.17049 0.357625 8.81868 0.688604Z" fill="white" />
             						   </svg>
             						   
											</span>
										</div>
									</div>개인정보 동의합니다.
								</label>
							</div>


							<button type="button" class="formbold-cancel-btn"
								onclick="location.href='qnawriteform?currentPage=${currentPage}'"
								style="margin-left: 10px;">취소</button>
							<button type="submit" class="formbold-btn">등록</button>
						</form>
		</div>
	</div>
    </div>
  </div>
</div>

</body>
</html>