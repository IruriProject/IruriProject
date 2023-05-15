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

.formbold-reply-btn {
	font-size: 16px;
	border-radius: 5px;
	padding: 8px 24px;
	border: none;
	font-weight: 500;
	background-color: #4E9F3D;
	color: white;
	cursor: pointer;
	margin-top: 25px;
	float: right;
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

.bcontent-commentreply-input{
	float:left;
	width: 86%;
	height: 50px;
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
	 
	
	//댓글의 댓글창 show
	$(document).on('click', '#btncomment', function() {

	      $(this).closest('.reply-item').find('.reply-form').show();
	    //alert("댓글 보이기 버튼이 클릭되었습니다.");
	});
	
	//delete
	$(document).on('click', '#commentdeletebtn', function() {
	    var bc_num = $(this).closest('.reply-item').data('bc_num');
	    alert(bc_num);
	    // 서버로 댓글 삭제 요청을 보냄
	    $.ajax({
	        type: "get",
	        dataType: "text",
	        url: "commentdelete",
	        data: {"bc_num": bc_num},
	        success: function(){
	            alert("댓글이 삭제되었습니다.");
	            list();
	        }
	    });
	});
		
	//insert
	$("#btncommentadd").click(function(){
	
	
		var bc_content=$("#bc_content").val();
		 
		if(bc_content.trim().length==0){
			alert("댓글을 입력해주세요.");
			return;
		}
		
		$.ajax({
			type: "post",
			dataType: "text",
			url: "commentinsert",
			data: {"b_num": num, "bc_num":"0", "bc_content": bc_content},
			success: function(){
				alert("인서트 성공");
				$("#bc_content").val("");
				list();
			}
		}); 
	});
	
	  //댓글의 댓글 insert
	 $(document).on('click', '.comment-answerbtn', function() {
	    var bc_answercontent = $(this).siblings('.reply-content').val();
        var bc_num = $(this).closest('.reply-item').data('bc_num');

		if(bc_answercontent.trim().length == 0){
			alert("댓글을 입력해주세요.");
			return;
		}
		
		$.ajax({
			type : "post",
			dataType : "text",
		    url : "commentinsert",
		    data : {"b_num": num, "bc_num": bc_num, "bc_content": bc_answercontent},
		    success : function(){
		        alert("인서트 성공");
		        list();
			}
		}); 
	}); 
	
});

//사용자 함수 list
function list() {
    var num = $("#b_num").val();
    var loginok = "${sessionScope.loginStatus}";

    $.ajax({
        type: "get",
        dataType: "json",
        url: "commentlist",
        data: {
            "b_num": num
        },
        success: function (res) {
            $("span.acount").text(res.length);
            var s = "";

            res.sort(function (a, b) {
                return a.bc_regroup - b.bc_regroup;
            });

            $.each(res, function (i, dto) {
                s += "<div class='reply-item' data-bc_num='" + dto.bc_num + "'>";
                s += "<b class='name'>" + dto.bc_loginid + "</b>";
                s += "<span class='day'>" + dto.bc_writeday + "</span>";

                s += "<div class='reply-form' style='width:70%;'><textarea class='bcontent-commentreply-input reply-content' placeholder='댓글을 입력해주세요'></textarea>";
                s += "<button type='button' class='formbold-reply-btn comment-answerbtn'>등록</button></div>";

                if (loginok != 'null' && myid == dto.bc_loginid) {
                    s += "<div class='dropdown' style='float:right;'>";
                    s += "<span class='glyphicon glyphicon-option-vertical' style='color: gray; font-size: 17px;'></span>";
                    s += "<div class='dropdown-content'>";
                    s += "<button type='button' data-toggle='modal' data-target='#answermodal' style='text-align:center;' onclick='location.href=\"update?num=" + dto.b_num + "\"'>수정</button>";
                    s += "<button type='button' style='text-align:center;' id='commentdeletebtn'>삭제</button>";
                    s += "<button type='button' style='text-align:center;' id='btncomment'>댓글</button>";
                    s += "</div></div>";
                }

                if (dto.bc_relevel != 0) {
                    for (var i = 0; i < dto.bc_relevel; i++) {
                        s += "&nbsp;&nbsp;&nbsp;";
                    }
                    s += "ㄴ";
                    s += "<br><br><span class='content'>" + dto.bc_content + "</span>";
                } else {
                    s += "<br><br><span class='content'>" + dto.bc_content + "</span>";
                }

                s += "</div><hr>";

                // 새로운 댓글 아래에 댓글이 보이도록 처리
                if (i === res.length - 1) {
                    s += "<div class='reply-item' id='new-reply-item'>";
                    s += "<div class='reply-form' style='display: none;'><textarea class='reply-content' placeholder='댓글을 입력해주세요'></textarea>";
                    s += "<button type='button' class='comment-answerbtn'>등록</button></div>";
                    s += "</div>";
                }
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
    <h2 style="margin: 0; font-weight: bold;">${bdto.b_title}</h2>
    <c:if test="${sessionScope.loginStatus!=null}">
        <div class="dropdown">
            <span class="glyphicon glyphicon-option-vertical" style="color: gray; font-size: 17px;"></span>
            <div class="dropdown-content">
                <button type="button" style="text-align:center;" onclick="location.href='form'">글쓰기</button>
                <c:if test="${sessionScope.loginId==bdto.b_loginid}">
                    <button type="button" style="text-align:center;" onclick="location.href='updateform?b_num=${bdto.b_num}&currentPage=${currentPage }'">수정</button>
                    <button type="button" style="text-align:center;" onclick="location.href='delete?b_num=${bdto.b_num}&currentPage=${currentPage }'">삭제</button>
                </c:if>
            </div>
        </div>
    </c:if>
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
					<i class="glyphicon glyphicon-comment"></i> <span class="acount"></span>
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
					<i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;댓글 <b><span class="acount"></span></b>개
			</span> 
			<br><hr>
			</td>
		</tr>
		
		<tr>
			<td>
			
			
					<input type="hidden" name="b_num" id="b_num" value="${bdto.b_num }"> 
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
					onclick="location.href='boardlist?currentPage=${currentPage}'"
					style="margin: 0 auto; width: 30%;">목록</button>
			</td>
		</tr>
		
		<tr>
			<td style="margin: 10%; width:80%; display:flex; justify-content:space-between; text-align:center;">
				<button type="button" class="formbold-before-btn">이전게시물</button>
				<button type="button" class="formbold-next-btn" >다음게시물</button>
			</td>
		</tr>

	
	</table>
				
				
	
</body>
</html>