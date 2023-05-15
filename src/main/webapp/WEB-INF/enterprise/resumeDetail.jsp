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

.box{
	border: 1px solid lightgray;
	padding: 30px 50px;
	padding-right: 150px;
	margin: 0px auto;
	width: 100%;
	font-size: 17px;
	border-radius: 20px;
}

#title-left{
	float: left;
}

#title-right{
	display: flex;
	justify-content: space-between;
}

.title{
	font-weight: 700;
}

img{
	height: 100px; width: 100px; border-radius: 100px;
	margin-right: 20px;
}

#name{
	font-weight: 500;
}

#desc{
	color: gray;
	font-size: 15px;
	margin-left: 10px;
}

.title-content{
	font-size: 15px;
	margin: 10px;
}

#hp{
	padding-bottom: 10px;
}

.box-column{
	font-size: 0.9em;
	font-weight: 500;
	color: gray;
	width: 100px;
	display: inline-block;
	margin-left: 20px;
	margin-bottom: 10px;
}
@media print {
  @page { margin: 0mm 25mm 0mm 0mm; }
}
</style>

<title>Insert title here</title>
</head>
<body>

<!-- set -->
<c:set var="birthYear"><fmt:formatDate value="${user.u_birth }" pattern="yyyy"/></c:set>
<c:set var="age" value="${2023-birthYear }"/>
<button type="button" id="printResume">인쇄</button>
<script type="text/javascript">
	$("#printResume").click(function(){
		window.print();
	})
</script>
 <div id="pdfDiv" style="width:800px;"><!-- 출력div -->
<h2 class="resTitle">기본정보</h2>
<div class="box">
<h3>${resume.r_title }</h3>
<hr>
	<div id="title-left">
	<c:if test="${user.u_photo!=null }">
	<img src="../경로/${user.u_photo }">
	</c:if>
	<c:if test="${user.u_photo==null }">
	<img src="../경로/${user.u_photo }">
	</c:if>
	</div>
		<div id="title-right">
		<div>
		<span id="name">${user.u_name }</span><span id="desc">${user.u_gender } ${age}세 / ${birthYear }년생</span>
		<br>
		</div>
		<div class="title-content">
		<div id="hp">연락처 ${user.u_hp }</div> <br>
		<div>이메일 ${user.u_email }</div>
		</div>
		</div>
</div>
<br>
<h2 class="title">희망근무조건</h2>
<div class="box">
<span class="box-column">근무지</span><span class="box-content">${resume.r_larea }</span><br>
<span class="box-column">업무형태</span><span class="box-content">${resume.r_ltask }</span><br>
<span class="box-column">근무형태</span><span class="box-content">${resume.r_ltype }</span><br>
<span class="box-column">근무기간</span><span class="box-content">${resume.r_lperiod }</span><br>
<span class="box-column">근무일</span><span class="box-content">${resume.r_lday }</span><br>
</div>

<br>
<h2 class="title">자기소개서</h2>
<div class="box">
${resume.r_content }
</div>

<!-- 본인 이력서일때 -->
<c:if test="${sessionScope.loginStatus!=null && sessionScope.loginStatus==user.u_id }">
 수정 삭제 인쇄 공개여부변경 대표여부변경 버튼 / 현재 공개, 대표 여부 표시
</c:if>

<!-- 기업 입장에서  -->
<c:if test="${sessionScope.loginStatus!=null && sessionScope.loginId=='d' }">
<div id="footer">
<button type="button">쪽지보내기</button>
<button type="button">지원자 정보보기</button>
</div>
</c:if>
</div>
</body>
<script>
window.onbeforeprint = function () { 
    // 프린트 할 영역 필터링 
    $(".footer").css("display", "none"); 
    $(".nav").css("display", "none"); 
    $(".title").css("display", "none"); 
    $("#printResume").css("display", "none");
}; 
window.onafterprint = function () { 
    $(".footer").css("display", "block"); 
    $(".nav").css("display", "block"); 
    $(".title").css("display", "block"); 
    $("#printResume").css("display", "block");
}; 
$(document).ready(function() {
	$('#savePdf').click(function() { // pdf저장 button id
		
	    html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id
		
	    // 캔버스를 이미지로 변환
	    var imgData = canvas.toDataURL('image/png');
		     
	    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
	    var pageHeight = imgWidth * 2.414;  // 출력 페이지 세로 길이 계산 A4 기준
	    var imgHeight = canvas.height * imgWidth / canvas.width;
	    var heightLeft = imgHeight;
	    var margin = 10; // 출력 페이지 여백설정
	    var doc = new jsPDF('p', 'mm');
	    var position = 0;
	       
	    // 첫 페이지 출력
	    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
	    heightLeft -= pageHeight;
	         
	    // 한 페이지 이상일 경우 루프 돌면서 출력
	    while (heightLeft >= 20) {
	        position = heightLeft - imgHeight;
	        doc.addPage();
	        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	        heightLeft -= pageHeight;
	    }
	 
	    // 파일 저장
	    doc.save('file-name.pdf');

		  
	});

	});
	
	
})



</script>
</html>