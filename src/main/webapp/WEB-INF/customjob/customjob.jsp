<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관심 기업</title>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
	

<!-- Libraries Stylesheet -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="${root }/css/usercss/owl.carousel.min.css" rel="stylesheet">
<link href="${root }/css/usercss/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="${root }/css/usercss/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${root }/css/usercss/style.css" rel="stylesheet">
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
</head>
<body>

	<script type="text/javascript">

      $(function(){
          $("input:checkbox[name='p_type']").click(function() {
             var p_types = [];
               $("input:checkbox[name='p_type']:checked").each(function() {
                 p_types.push($(this).val());
                 
                 $.ajax({
                	 
                	 type:"post",
                	 dataType:"json",
                	 url:"customjob",
                	 data:{
                		 "p_types": p_types
                	 },
                	 success: function(res){
                		 $('#advertisement-list').html(response);
                		 
                	 },
                	 error: function() {
                	      // 에러 처리
                	      alert('오류가 발생했습니다.');
                	    }
                 })
                 
                 
               });
              
               //alert(p_types);
               
              /*  $.ajax({
                    
                    type:"post",
                    dataType:"json",
                    url:"customjob",
                    data:{
                       "p_types":p_type
                    },
                    success: function(res){
                       
                    }
                 }) */
          });
      })

   </script>
	
	<div class="formbold-main-wrapper">
		<div class="">
			<form method="POST" flag="new" id="frm" onsubmit="return submit();">
				<input type="hidden" name="u_num" id="u_num" value=${p_num }
					class="formbold-form-input" />
			<div class="formbold-mb-3">
               <label class="formbold-form-label">직무</label>
               <div style="border: 1px solid #dde3ec; border-radius:5px; padding: 11px; width: 1000px;">
							<input type="checkbox" name="p_type" p_type="p_type" class="chkbox serach" value="건설/건축"> 건설/건축&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_type" class="chkbox serach" value="공공/복지/봉사/교육"> 공공/복지/봉사/교육&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_type" class="chkbox serach" value="금융/보험"> 금융/보험&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_type" class="chkbox serach" value="기술"> 기술&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_type" class="chkbox serach" value="농업/어업"> 농업/어업&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_type" class="chkbox serach" value="법무"> 법무&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_type" class="chkbox serach" value="사무"> 사무&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_type" class="chkbox serach" value="서비스"> 서비스&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_type" class="chkbox serach" value="생산/제조"> 생산/제조&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_type" class="chkbox serach" value="운송"> 운송&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="p_type" class="chkbox serach" value="의료"> 의료
				</div>
            </div>

			</form>
		</div>
	</div>
	
	<div style="margin: 30px 30px;">
 

  	<!-- 지역별 필터링 후 테이블 나오는 부분 -->
  	<div id="addr-box"></div>
   	
   	<table class="table" id="basic-list">
   		<caption>
   		<c:if test="${countSearchCustomJob>0}">
   		총 ${countSearchCustomJob }개의 글이 있습니다.
   		</c:if>
   		</caption>

   		<tr align="center">
   		  <td width="60">지역</td>
   		  <td width="400">모집내용/기업명</td>
   		  <td width="120">급여</td>
   		  <td width="120">직무</td>
   		  <td width="150">근무시간</td>
   		  <td width="100">등록일</td>
   		</tr>
   		
   		<c:if test="${countLikeEnter==0 }">
   		<tr><td colspan="5" align="center">
   		<span id="nosearch">조건을 설정해주세요.</span>
   		</td></tr>
   		</c:if>
   		
   		<c:if test="${countLikeEnter>0}">
   		<c:forEach var="dto" items="${list }">
   		<tr>
   		<td width="60">${dto.p_addr }</td>
		<td width="400">
		<span id="posting-title">
		<a href="detailpage?p_num=${dto.p_num}&currentPage=${currentPage}">${dto.p_title }</a>
		</span>
		<br>
		<span id="enterprise-name">[${dto.p_type }] | ${dto.e_name }</span>
		</td>
		<td width="120">
		<c:if test="${dto.p_employtype=='정규직' }">
		[월급]</c:if>
		<c:if test="${dto.p_employtype=='기간제' }">
		[시급]</c:if>
		${dto.p_pay }
		</td>
		<td width="120">${dto.p_type }</td>
		<td width="150">
		${dto.p_starttime } - ${dto.p_endtime }
		</td>
		<td width="100"><fmt:formatDate value="${dto.p_writeday }" pattern="yyyy-MM-dd"/></td>
   		</tr>
   		</c:forEach>
		</c:if>
		





   		<%-- <c:if test="${countSearchCustomJo==0}">
   		맞춤 일자리가 없습니다.
   		</c:if>
		 --%>
		
   		<%-- <!-- 페이징 처리 -->
   		
		<div style="width: 800px; text-align: center;" class="container">
		<ul class="pagination">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
			<li>
				<c:if test="${keyword!=null }">
					<a href="search?currentPage=${startPage-1 }&searchcolumn=${column}&searchword=${keyword}">이전</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="search?currentPage=${startPage-1 }">이전</a>
				</c:if>
			</li>
			</c:if>
			
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			  <c:if test="${pp==currentPage }">
				<li class="active">
				 <c:if test="${keyword!=null }">
			    <a href="search?currentPage=${pp}&searchcolumn=${column}&searchword=${keyword}">${pp}</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="search?currentPage=${pp}">${pp}</a>
				</c:if>
				</li>  
			  </c:if>
			  <c:if test="${pp!=currentPage }">
			    <li>
			    <c:if test="${keyword!=null }">
			    <a href="search?currentPage=${pp}&searchcolumn=${column}&searchword=${keyword}">${pp}</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="search?currentPage=${pp}">${pp}</a>
				</c:if>
				 
				</li>
			  </c:if>
			</c:forEach>

			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
				<li>
				<c:if test="${keyword!=null }">
					<a href="search?currentPage=${endPage+1}&searchcolumn=${column}&searchword=${keyword}">다음</a>
				</c:if>
				<c:if test="${keyword==null }">
					<a href="search?currentPage=${endPage+1}">다음</a>
				</c:if>
				</li>
			</c:if>
		</ul>
		</div> --%>
		
		
		
		
   	</table>
   </div>
	
	
   		
   		

     	
   		
	
	

	
	
</body>
</html>