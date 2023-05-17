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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet"/>
<script>
$(function(){
	if(${draftCount}!=0){
		var a=confirm("임시저장된 글이 있습니다. 임시 저장된 글을 불러올까요?");
	
		if(a){
			$("#draftbtn").trigger('click');
		}
	
	}
	
	$("#recentPosting").click(function(){
		$.ajax({
			type:"get",
			data:{"e_num":${enterNum}},
			dataType:"json",
			url:"/posting/loadingRecentPosting",
			success:function(res){
				$("#p_title").val(res.p_title);
				$("#p_type").val(res.p_type);
				$("#p_pay").val(res.p_pay);
				$("#p_period").val(res.p_period);
				$("#p_workday").val(res.p_workday);
				$("#p_hirenum").val(res.p_hirenum);
				$("#p_starttime").val(res.p_starttime);
				$("#p_endtime").val(res.p_endtime);
				$("#p_employtype").val(res.p_employtype);
				$("#p_content").val(res.p_content);
				$("#p_enddate").val(res.p_enddate);
			}, error:function(){
				alert("최근 등록된 공고가 없습니다.");
				
			}
		})
	})
	
	$("#draftListbtn").click(function(){
		var draftchk = $('input[name=draft]:checked').val();
		$.ajax({
			type:"get",
			data:{"p_num":draftchk},
			dataType:"json",
			url:"/posting/loadingDraftPosting",
			success:function(res){
				$("#frm").attr("flag","old");
				$("#pNum").html("<input type='hidden' value='"+res.p_num+"' name='p_num'>");
				$("#p_title").val(res.p_title);
				$("#p_type").val(res.p_type);
				$("#p_pay").val(res.p_pay);
				$("#p_period").val(res.p_period);
				$("#p_workday").val(res.p_workday);
				$("#p_hirenum").val(res.p_hirenum);
				$("#p_starttime").val(res.p_starttime);
				$("#p_endtime").val(res.p_endtime);
				$("#p_employtype").val(res.p_employtype);
				$("#p_content").val(res.p_content);
				$("#p_enddate").val(res.p_enddate);
				
			}
			
		})
		
	})
	
	$(".draftdel").click(function(){
		var p_num=$(this).attr("p_num");
		$.ajax({
			type:"post",
			data:{"p_num":p_num},
			dataType:"html",
			url:"/posting/draftdelete",
			success:function(res){
				alert("임시저장 공고가 삭제되었습니다.");
				location.reload();
			}
			
		})
	})
	
	$("#phraseListbtn").click(function(){
		var phrasechk = $('input[name=phrase]:checked').val();
		var origintext= $("#p_content").val();
		
		$.ajax({
			type:"get",
			data:{"f_num":phrasechk},
			dataType:"json",
			url:"/phrases/getphrase",
			success:function(res){
				///$("#p_content").append(res.f_phrase);
				$("#p_content").val(origintext + res.f_phrase);
			}
			
		})
	})
	
	
	$("#p_employtype").change(function(){
		if($("#p_employtype").val()=="기간제"){
			$("#p_pay").attr("placeholder","월급을 입력해주세요 (ex: 3000000)");
		}else{
			$("#p_pay").attr("placeholder","연봉을 입력해주세요 (ex: 28000000)");
		}
	})
	
	
	
})

</script>
</head>
<body>
	
	  <!-- Modal -->
	  <div class="modal fade" id="draftPostModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">임시저장 공고 목록 (${draftList.size() }개)</h4>
	        </div>
	        <div class="modal-body">
	         	<table class="table table-hover">
	         	<c:forEach var="draftDto" items="${draftList }">
	         		<tr>
	                	<td>
	                    	<input type="radio" name="draft" value="${draftDto.p_num }"> ${draftDto.p_title } (${draftDto.p_type })&nbsp;&nbsp;<span style="font-size: 0.8em; color: gray"><fmt:formatDate value="${draftDto.p_writeday }" pattern="yy-MM-dd"/></span><button style="float: right" type="button" p_num="${draftDto.p_num }" class="btn btn-info btn-xs draftdel">임시저장 삭제</button>
	                    </td>
	                </tr>
	         	</c:forEach>
	            </table>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal" id="draftListbtn">선택</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	  
	   <!-- Modal -->
	  <div class="modal fade" id="phrasesModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">자주쓰는 문구 목록</h4>
	        </div>
	        <div class="modal-body">
	         	<table class="table table-hover">
	         	<c:forEach var="flist" items="${phraseList }">
	         		<tr>
	                	<td>
	                    	<input type="radio" name="phrase" value="${flist.f_num }"> ${flist.f_phrase }
	                    </td>
	                </tr>
	         	</c:forEach>
	            </table>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal" id="phraseListbtn">선택</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	  

	<div class="formbold-main-wrapper">
		<div class="formbold-form-wrapper">
			<form method="POST" flag="new" id="frm" onsubmit="return submit();">
				<input type="hidden" name="e_num" id="e_num" value=${enterNum }
					class="formbold-form-input" />
				<div id="pNum"></div>
				<div align="center">
					<h2
						style="font-weight: 600; color: #416442; background-color: #e3f2c9; width: 300px; height: 50px; font-size: 1.8em; padding: 10px 0px; border-radius: 10px; text-align: center;">공고등록</h2>
				</div>
				<br>
				<div align="right">
					<c:if test="${draftCount!=0 }">
						<button type="button" id="draftbtn" class="small-btn" data-toggle="modal" style="margin-right: 10px;" data-target="#draftPostModal">임시저장 불러오기</button>
					</c:if>
				<button type="button" class="small-btn" id="recentPosting">이전공고 불러오기</button></div>

				<div class="formbold-input-wrapp formbold-mb-3">
					<label for="p_title" class="formbold-form-label"> 공고제목 </label>
					<div>
						<input type="text" name="p_title" id="p_title"
							placeholder="공고 제목을 입력해주세요." class="formbold-form-input" required="required" />
					</div>
				</div>
				
				<div class="formbold-mb-3">
					<label class="formbold-form-label">직무</label>
					<select
						class="formbold-form-input" name="p_type" id="p_type">
						<option value="건설/건축">건설/건축</option>
						<option value="공공/복지/봉사/교육">공공/복지/봉사/교육</option>
						<option value="금융/보험">금융/보험</option>
						<option value="기술">기술</option>
						<option value="농업/어업">농업/어업</option>
						<option value="법무">법무</option>
						<option value="사무">사무</option>
						<option value="서비스">서비스</option>
						<option value="생산/제조">생산/제조</option>
						<option value="운송">운송</option>
						<option value="의료">의료</option>
						
					</select>
				</div>
				
				<div class="formbold-mb-3">
					<label class="formbold-form-label">고용형태</label>
					<select
						class="formbold-form-input" name="p_employtype" id="p_employtype">
						<option value="정규직">정규직</option>
						<option value="기간제">기간제</option>
					</select>
				</div>
				
				<div class="formbold-mb-3">
					<label for="p_pay" class="formbold-form-label"> 급여 </label>
					<input
						type="number" name="p_pay" id="p_pay" step="50"
						placeholder="연봉을 입력해주세요 (ex: 28000000)" class="formbold-form-input" required="required" />
				</div>
				
				<div class="formbold-mb-3">
					<label for="p_hirenum" class="formbold-form-label"> 채용인원 </label>
					<input type="number" name="p_hirenum" id="p_hirenum"
						placeholder="ex) 0" class="formbold-form-input" required="required" />
				</div>

				<div class="formbold-input-flex">
					<div style="width: 35%">
						<label for="p_period" class="formbold-form-label"> 기간 </label>
						<input
							type="text" name="p_period" id="p_period" placeholder="ex) 6개월"
							class="formbold-form-input" required="required" />
					</div>
					
					<div style="width: 65%">
						<label for="p_workday" class="formbold-form-label" style="margin-bottom: 12px"> 요일 </label>
						<!-- <input
							type="text" name="p_workday" id="p_workday"
							placeholder="ex) 월/수/금" class="formbold-form-input" required="required" /> -->
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

				<div class="formbold-input-flex">
					<div>
						<label for="p_starttime" class="formbold-form-label"> 시작시간 </label>
						<input type="time" name="p_starttime" id="p_starttime" value="09:00"
							placeholder="ex:6개월" class="formbold-form-input" required="required" />
					</div>
					<div>
						<label for="p_endtime" class="formbold-form-label"> 끝시간 </label>
						<input
							type="time" name="p_endtime" id="p_endtime" placeholder="ex:6개월" value="18:00"
							class="formbold-form-input" required="required" />
					</div>
				</div>

				<div class="formbold-mb-3">
					<label for="p_content" class="formbold-form-label"> 상세내용
						<button type="button" id="phrases" class="btn-sm small-btn" style="width: 100px; margin-left: 410px;" data-toggle="modal" data-target="#phrasesModal">자주쓰는 문구</button>
					</label>
					<textarea name="p_content" id="p_content"
						placeholder="상세내용을 입력해주세요." class="pcontent-input" required="required"></textarea>
				
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
					<label for="p_enddate" class="formbold-form-label"> 공고 마감일 </label>
					<input type="date" name="p_enddate" id="p_enddate"
						class="formbold-form-input" required="required" />
				</div>
				<br>
				<div class="formbold-checkbox-wrapper">
					<label for="supportCheckbox" class="formbold-checkbox-label">
						<div class="formbold-relative">
							<input type="checkbox" id="supportCheckbox" required="required"
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
				
				<button class="formbold-btn" type="submit" onclick="javascript: form.action='/posting/writeposting';">공고등록</button>
				<button class="formbold-btn2" type="submit" onclick="javascript: form.action='/posting/draftposting';">임시저장</button>
			
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