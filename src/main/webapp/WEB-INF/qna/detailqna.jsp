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
<style type="text/css">

.formbold-comment-btn {
	margin: 0 auto;
	font-size: 16px;
	border-radius: 5px;
	padding: 38px 25px;
	border: none;
	font-weight: 500;
	background-color: #4E9F3D;
	color: white;
	cursor: pointer;
	float: left;
	margin-left:3%;
}

.formbold-comment-btn:hover {
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-comment-btn-w-45 {
	width: 45%;
}

.bcontent-comment-input {
	float:left;
	width: 86%;
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

.bcontent-comment-input::placeholder {
	color: rgba(83, 99, 135, 0.5);
}

.bcontent-comment-input:focus {
	border-color: #4E9F3D;
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.dropdown {
	position: relative;
	display: inline-block;
	cursor: pointer;
}

.dropdown-content {
	position: absolute;
	top: 100%;
	right: 0;
	z-index: 1;
	display: none;
	background-color: #fff;
	min-width: 100px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 8px;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown button {
	display: block;
	width: 100%;
	text-align: left;
	padding: 8px 0;
	border: none;
	background-color: transparent;
	cursor: pointer;
}

.dropdown button:hover {
	font-weight: 900;
	background-color: #e3f2c9;
}

.acount{
	color: #4E9F3D;
}
.answer{
	width:100%;
	padding:10px;
}
.name {
	padding:5px;
}
.content{
	padding:10px;
}
.day{
	color:gray;
	margin-left:16px;
	font-size: 0.9em;
}
.amod , .adel{
	float:right;
	cursor:pointer;
	font-size:0.7em;
	padding: 5px;
	color:gray;
}


.formbold-before-btn {
	display:inline-block;
	width:45%;
	font-size: 16px;
	border-radius: 5px;
	padding: 14px 25px;
	border: none;
	font-weight: 500;
	background-color: #4E9F3D;
	color: white;
	cursor: pointer;
	float: right;
}

.formbold-next-btn{
	display:inline-block;
	width:45%;
	font-size: 16px;
	border-radius: 5px;
	padding: 14px 25px;
	border: none;
	font-weight: 500;
	background-color: #fff;
	border:1px solid #4E9F3D;
	color: #4E9F3D;
	cursor: pointer;
	float: right;
	
}
.formbold-btn:hover {
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-w-45 {
	width: 45%;
}

</style>

<script type="text/javascript">

$(function(){
	
	//num값은 전역변수로 선언..
	 num=$("#b_num").val();
	 loginok="${sessionScope.loginStatus }";
	 myid="${sessionScope.loginId}";
	
	list();
	
	//insert
	$("#btncommentadd").click(function(){
		
		var bc_content=$("#bc_content").val();
		 
		if(bc_content.trim().length==0){
			alert("댓글을 입력해주세요.");
			return;
		}
		
		$.ajax({
			type : "post",
			dataType : "text",
		    url : "commentinsert",
		    data :{"b_num":num,"bc_content":bc_content},
		    success : function(){
		        alert("인서트성공");
		        $("#bc_content").val("");
		        list();
			}
		}); 
	}); 
	
});


//사용자 함수  list
function list() {
	var num=$("#b_num").val();
	 loginok="${sessionScope.loginStatus }";
	 
	$.ajax({
		type : "get",
		dataType : "json",
		url : "commentlist",
		data : {
			"b_num" : num
		},
		success : function(res) {
			$("span.acount").text(res.length);
			var s = "";
			
			/* $.each(res,function(i, dto) {
			     s += "<div class='answer'>";
				 s += "<b class='name'>" + dto.bc_loginid + "</b><br><br><span class='content'>" + dto.bc_content + "</span>"; 
				 s += "<span class='day'>" + dto.bc_writeday + "</span>";
				if (loginok != 'null' && myid == dto.bc_loginid) {
					s += "<span data-toggle='modal' data-target='#answermodal' class='glyphicon glyphicon-edit amod' b_num='" + dto.b_bum + "'></span>";
					s += "&nbsp;&nbsp;";
					s += "<span class='glyphicon glyphicon-remove adel' b_num='" + dto.b_num + "'></span>";
				} 
				s += "</div><hr>";
			});
			 */
			 
			 $.each(res,function(i, dto) {
				 
				 if (dto.bc_relevel != 0) {
					    for (var i = 0; i < dto.bc_relevel; i++) {
					        s += "&nbsp;&nbsp;&nbsp;";
					    }
					    s += "ㄴ";
					}
				   
			     s += "<div class='answer'>";
				 s += "<b class='name'>" + dto.bc_loginid + "</b>"; 
				 s += "<span class='day'>" + dto.bc_writeday + "</span>";


					if (loginok != 'null' && myid == dto.bc_loginid) {
						s+="<div class='dropdown' style='float:right;'>";
						s+="<span class='glyphicon glyphicon-option-vertical' style='color: gray; font-size: 17px;'></span>";
						s+="<div class='dropdown-content'>";
						s+="<button type='button' data-toggle='modal' data-target='#answermodal'  style='text-align:center;' onclick='location.href='update?num="+ dto.b_num +"'>수정</button>";
						s+="<button type='button' style='text-align:center;' onclick='location.href='delete?num="+ dto.b_num +"'>삭제</button>";
						s+="<button type='button' style='text-align:center;'id ='btncomment' onclick='location.href='form?b_num="+dto.b_num+"&currentPage=${currentPage}&bc_regroup="+dto.bc_regroup+"&bc_restep="+dto.bc_restep+"&relevel="+dto.bc_relevel+"''>댓글</button>";
						s+="</div></div>";
					} 
					
				 s +="<br><br><span class='content'>" + dto.bc_content + "</span>";
				 s += "</div><hr>";
			});

			 
			 // 등록된 댓글이 없는 경우에 대한 처리
	            if (res.length === 0) {
	                s += "<div class='answer' style='text-align:center;'>";
	                s += "<span style='font-size:18px;text-align:center;'>등록된 댓글이 없습니다.<br>댓글을 남겨보세요!</span>";
	                s += "</div>";
	            }
			 
	            // 등록된 댓글 있는 경우에 대한 처리
	            /* if (res.length > 0) {
	                s += "<div class='answer' style='text-align:center;'>";
	                s += "<span style='text-align:center;'>등록된 댓글이 있습니다.<br>댓글을 남겨보세요!</span>";
	                s += "</div>";
	            } */
			 
			$("div.alist").html(s);
		}
	});
}

</script>

</head>
<body>
<table style="width: 80%; margin:0 auto;">
		<tr>
		<td style="display: flex; height: 90px; justify-content: space-between; align-items: center;">
    <h2 style="margin: 0; font-weight: bold;">${qdto.q_title}</h2>
    <c:if test="${sessionScope.loginStatus!=null}">
        <div class="dropdown">
            <span class="glyphicon glyphicon-option-vertical" style="color: gray; font-size: 17px;"></span>
            <div class="dropdown-content">
                <button type="button" style="text-align:center;" onclick="location.href='form'">글쓰기</button>
                <c:if test="${sessionScope.loginId==qdto.q_loginid}">
                    <button type="button" style="text-align:center;" onclick="location.href='updateform?q_num=${qdto.q_num}&currentPage=${currentPage }'">수정</button>
                    <button type="button" style="text-align:center;" onclick="location.href='delete?q_num=${qdto.q_num}&currentPage=${currentPage }'">삭제</button>
                </c:if>
            </div>
        </div>
    </c:if>
</td>

		</tr>
		<tr>
			<td>
			<span
				style="color: #4E9F3D; float: left; font-size: 14px; padding: 10px;">${qdto.q_loginid }
			</span> <span
				style="color: gray; float: left; font-size: 14px; padding: 10px;">
					<fmt:formatDate value="${qdto.q_writeday }"
						pattern="yyyy-MM-dd HH:mm" />
			</span><br>
				<hr>
				</td>

		</tr>

		<tr>
			<td style="padding:10px;">
				<c:if test="${q_file==true}">
				<c:forEach var="fileUrl" items="${fileUrls}">
				    <img  alt="이미지" src="/photo/${fileUrl}" style="max-width:100%; margin:10px;"><br>
				</c:forEach>
				 
				</c:if>

				
				<br><br>
				<div style="padding:20px;">
				 ${qdto.q_content }
				</div>
				<br><br>
				
				 <span
				style="color: gray; float: left; font-size: 14px; padding: 10px;">
					<i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;댓글 <b><span class="acount"></span></b>개
			</span> 
			<br><hr>
			</td>
		</tr>
		
		<tr>
			<td>
			
			
					<input type="hidden" name="b_num" id="b_num" value="${qdto.q_num }"> 
					<c:if test="${sessionScope.loginStatus!=null }">
					
					<div class="aform" style="margin-bottom:130px;">
						<div class="form-inline">
						<textarea name="bc_content" id="bc_content" placeholder="댓글을 입력해주세요"
						class="bcontent-comment-input" required="required" ></textarea>
						
							<button type="button" class="formbold-comment-btn" id="btncommentadd">등록</button>
						</div>
					</div>
				<hr>
				</c:if>
				
			
				<!-- 댓글출력 -->
				<div class="alist">
				
				</div>
				
			</td>
		</tr>
		
		<tr>
			<td style="margin: 10%; width:80%; display:flex; justify-content:space-between; text-align:center;">
				<button type="button" class="btn btn-default"
					onclick="location.href='qnawriteform?currentPage=${currentPage}'"
					style="margin: 0 auto; width: 30%;">목록</button>
			</td>
		</tr>
	
	</table>
				
</body>
</html>