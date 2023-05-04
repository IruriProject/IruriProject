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
	float: right;
}

.formbold-comment-btn:hover {
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-comment-btn-w-45 {
	width: 45%;
}

.bcontent-comment-input {
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


.answer{
	padding:30px;
}
.name {
	padding:10px;
}
.content{
	padding:10px;
}
.day{
	color:gray;
	margin-left:50px;
	font-size: 0.9em;
}
.amod , .adel{
	float:right;
	cursor:pointer;
	font-size:0.7em;
	padding: 5px;
	color:gray;
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
			
			$.each(res,function(i, dto) {
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
			
			
			$("div.alist").html(s);
		}
	});
}

</script>

</head>
<body>
<table style="width: 700px; margin:0 auto;">
		<tr>
			<td
				style="display: flex; height: 90px; justify-content: space-between; align-items: center;">
				<h2 style="margin: 0; font-weight: bold;">${bdto.b_title}</h2>
				<div class="dropdown">
					<span class="glyphicon glyphicon-option-vertical"
						style="color: gray; font-size: 17px;"></span>
					<div class="dropdown-content">
				<!-- 글쓰기는 로그인 중일때만 -->	
				<c:if test="${sessionScope.loginStatus!=null }">
				<button type="button" style="text-align:center;" onclick="location.href='form'">글쓰기</button>
				</c:if>
				
				<!-- 로그인 중이면서, 본인글만 수정, 삭제 버튼 보이게  -->
				<c:if test="${sessionScope.loginStatus !=null and sessionScope.loginId==bdto.b_loginid}">
				<button type="button" style="text-align:center;" onclick="location.href='updateform?num=${dto.b_num}&currentPage=${currentPage }'">수정</button>
				<button type="button" style="text-align:center;" onclick="location.href='delete?num=${dto.b_num}&currentPage=${currentPage }'">삭제</button>
				</c:if>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
			<span
				style="color: #4E9F3D; float: left; font-size: 14px; padding: 10px;">${bdto.b_loginid }
			</span> <span
				style="color: gray; float: left; font-size: 14px; padding: 10px;">
					<fmt:formatDate value="${bdto.b_writeday }"
						pattern="yyyy-MM-dd HH:mm" />
			</span> <span
				style="color: gray; float: right; font-size: 14px; padding: 10px;">
					<i class="glyphicon glyphicon-comment"></i> 댓글갯수
			</span> <span
				style="color: gray; float: right; font-size: 14px; padding: 10px;">
					<i class="	glyphicon glyphicon-eye-open"></i> ${bdto.b_readcount }
			</span> <br>
				<hr>
				</td>

		</tr>

		<tr>
			<td style="padding:10px;">
				<c:if test="${b_photo==true}">
				<c:forEach var="photoUrl" items="${photoUrls}">
				    <img  alt="이미지" src="/photo/${photoUrl}" style="max-width:100%; margin:10px;"><br>
				</c:forEach>
				 
				</c:if>

				
				<br><br>
				<div style="padding:20px;">
				 ${bdto.b_content }
				</div>
				<br><br>
				
				 <span
				style="color: gray; float: left; font-size: 14px; padding: 10px;">
					<i class="glyphicon glyphicon-comment"></i> <b><span class="acount"></span></b>
			</span> 
			<br><hr>
			</td>
		</tr>
		
		<tr>
			<td>
			
				<!-- 댓글출력 -->
				<div class="alist">
				
				</div>
				
					<input type="hidden" name="b_num" id="b_num" value="${bdto.b_num }"> 
					<c:if test="${sessionScope.loginStatus!=null }">
					
					<div class="aform">
						<div class="form-inline">
						<textarea name="bc_content" id="bc_content" placeholder="댓글을 입력해주세요"
						class="bcontent-comment-input" required="required" ></textarea>
						
							<button type="button" class="formbold-comment-btn" id="btncommentadd">등록</button>
						</div>
					</div>
				</c:if>
			</td>
		</tr>
	
	</table>
	<button type="button" class="btn btn-default" onclick="location.href='boardlist?currentPage=${currentPage}'" style="margin: 0 auto;width:80px;">목록</button>
</body>
</html>