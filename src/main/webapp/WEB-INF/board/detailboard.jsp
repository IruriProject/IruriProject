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
<script src="https://kit.fontawesome.com/7027f21a5f.js" crossorigin="anonymous"></script>
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
	padding: 13px 24px;
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
	font-weight:bold;
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


function confirmDelete(b_num, currentPage) {
	  if (confirm("정말로 삭제하시겠습니까?")) {
	    location.href="delete?b_num=${bdto.b_num}&currentPage=${currentPage }";
	  }
	}


$(function(){
	
	//num값은 전역변수로 선언..
	num=$("#b_num").val();
	loginok="${sessionScope.loginStatus}";
	myid="${sessionScope.loginId}";

	list();
	 
	
	//댓글의 댓글창 show
	$(document).on('click', '#btncomment', function() {

	    
	    var replyForm = $(this).closest('.reply-item').find('.reply-form');
    
    if (replyForm.is(":visible")) {
        replyForm.hide();
    } else {
        replyForm.show();
    }
    
	});
	

	//수정창 띄우기
	$(document).on('click', '.updatecommentbtn', function(e) {
		
		  var bc_num = $(this).attr("bc_num");
		  var bc_loginid=$("#bc_loginid").val();
		  var bc_updatecontent=$("#bc_updatecontent").val(); 
		  var data="bc_num="+bc_num+"&bc_loginid="+bc_loginid+"&bc_updatecontent="+bc_updatecontent;
		  //console.log(data);
		  //alert(data);
		  
				$.ajax({
					type : "get", 
					dataType : "json", // 받을게 없을때는 text, html 아닐때는 dataType받는 파일형식으로 적기
					url : "answerupdateform",
					data : data,
					success:function(res){
						
						$("#bc_loginid").val(res.bc_loginid);
						$("#bc_updatecontent").val(res.bc_content);
						$("#bc_updatenum").val(res.bc_num);
					}

				});
	
		});

	//수정
	$("#btnupdateinfo").click(function(){
		
		var bc_num=$("#bc_updatenum").val();
		var bc_updatecontent=$("#bc_updatecontent").val();
		
		var data="bc_num="+bc_num+"&bc_content="+bc_updatecontent;
		
		//alert(data);
		
		$.ajax({
			  
			  type:"post",
			  dataType:"text",
			  data:data,
			  url:"commentupdate",
			  success:function(){
				  
				  location.reload();
			  }
		  });
		 
	});


	//delete
	$(document).on('click', '#commentdeletebtn', function() {
	    var bc_num = $(this).closest('.reply-item').data('bc_num');
	    //alert(bc_num);
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
				//alert("인서트 성공");
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
		       // alert("인서트 성공");
		        list();
			}
		}); 
	}); 
	
});

//사용자 함수 list
function list() {
    var num = $("#b_num").val();
    loginok="${sessionScope.loginStatus}";
	myid="${sessionScope.loginId}";

	//alert(loginok+myid);
	
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

            // 미로그인시 표시
            if (loginok=='') {
           	s += "<div class='answer' style='text-align:center;'>";
	            s += "<span style='color:#4E9F3D; font-size:18px;text-align:center;'>로그인 후<br>댓글을 남겨보세요!</span>";
	            s += "</div><br><hr>";
           } 	
            
            $.each(res, function (i, dto) {
            	
            	var indent = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".repeat(dto.bc_relevel);
            	 
            	
            	if(dto.bc_relevel != 0){
	                s += "<div class='reply-item' data-bc_num='" + dto.bc_num + "'>";
	                s += indent+indent;
	                s +="<b class='fa-solid fa-reply fa-rotate-180' style='padding-top:3px; padding-left:8px; font-size:12px;'></b>";
	                s += "<b class='name' style='font-weight:bold;'>"+ dto.bc_loginid + "</b>";
	                s += "<span class='day' style='font-weight:500;'>" + dto.bc_writeday + "</span>";
            	}else{
            		 s += "<div class='reply-item' data-bc_num='" + dto.bc_num + "'>";
            		 s += indent+indent;
            		 s += "<b class='name' style='font-weight:bold;'>"+ dto.bc_loginid + "</b>";
                     s += "<span class='day' style='font-weight:500;'>" + dto.bc_writeday + "</span>";
            	}
                 
              
                if (loginok !='' && myid == dto.bc_loginid) {
                    s += "<div class='dropdown' style='float:right;'>";
                    s += "<span class='glyphicon glyphicon-option-vertical' style='color: gray; font-size: 17px;'></span>";
                    s += "<div class='dropdown-content'>";
                    s += "<button type='button' data-toggle='modal' class='updatecommentbtn' data-target='#answermodal' style='text-align:center;' bc_num='"+dto.bc_num+"'>수정</button>";
                    s += "<button type='button' style='text-align:center;' id='commentdeletebtn'>삭제</button>";
                    s += "<button type='button' style='text-align:center;' id='btncomment'>댓글</button>";
                    s += "</div></div>";
                }
                
                else if (loginok !='' && myid == 'admin') {
                    s += "<div class='dropdown' style='float:right;'>";
                    s += "<span class='glyphicon glyphicon-option-vertical' style='color: gray; font-size: 17px;'></span>";
                    s += "<div class='dropdown-content'>";
                    s += "<button type='button' style='text-align:center;' id='commentdeletebtn'>삭제</button>";
                    s += "<button type='button' style='text-align:center;' id='btncomment'>댓글</button>";
                    s += "</div></div>";
                }
                
                
                else if (loginok !='' && myid != dto.bc_loginid) {
                    s += "<div class='dropdown' style='float:right;'>";
                    s += "<span class='glyphicon glyphicon-option-vertical' style='color: gray; font-size: 17px;'></span>";
                    s += "<div class='dropdown-content'>";
                    s += "<button type='button' style='text-align:center;' id='btncomment'>댓글</button>";
                    s += "</div></div>";
                }
               else{
                	s+="";
                }
                
                if (dto.bc_relevel != 0) {
                	var indent = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".repeat(dto.bc_relevel);
                	
                    s += "<pre style='border:none; background-color:#fff; margin-bottom:-10px;'><p style='padding:0 16px;'>"+indent+indent+ dto.bc_content + "</p></pre>";
                } else {
                    s += "<pre style='border:none; background-color:#fff; padding:10px 4px; margin-bottom:-18px;'><p>"+indent+indent+ dto.bc_content + "</p></pre>";
                }
              
                
                s += "<div class='reply-form' style='width:100%; display:none; margin-top:20px; margin-bottom:80px;'><textarea class='bcontent-commentreply-input reply-content' placeholder='댓글을 입력해주세요'></textarea>";
                s += "<button type='button' class='formbold-reply-btn comment-answerbtn'>등록</button></div>";
                s += "</div><hr>";

                // 새로운 댓글 아래에 댓글이 보이도록 처리
                if (i === res.length - 1) {
                    s += "<br><div class='reply-item' id='new-reply-item'>";
                    s += "<div class='reply-form' style='display: none;'><textarea class='reply-content' placeholder='댓글을 입력해주세요'></textarea>";
                    s += "<button type='button' class='comment-answerbtn'>등록</button></div>";
                    s += "</div><br>";
                }
            });
			    // 등록된 댓글이 없는 경우에 대한 처리
	            if (res.length === 0 && loginok!='') {
	                s += "<div class='answer' style='text-align:center;'>";
	                s += "<span style=' color:#4E9F3D; font-size:18px;text-align:center;'>등록된 댓글이 없습니다.<br>댓글을 남겨보세요!</span>";
	                s += "</div><br>";
	            }
			  
	            console.log(s);	
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
    <h2 style="margin: 0;  padding:10px; font-weight: bold;">${bdto.b_title}</h2>
   <c:if test="${sessionScope.loginStatus!=null and sessionScope.loginId!='admin'}">
        <c:if test="${sessionScope.loginId==bdto.b_loginid}">
        <div class="dropdown">
            <span class="glyphicon glyphicon-option-vertical" style="color: gray; font-size: 17px;"></span>
            <div class="dropdown-content">
                    <button type="button" style="text-align:center;" onclick="location.href='updateform?b_num=${bdto.b_num}&currentPage=${currentPage }'">수정</button>
                    <button type="button" style="text-align:center;" onclick="confirmDelete('${bdto.b_num}', '${currentPage}')">삭제</button>
                </c:if>
            </div>
        </div>
    </c:if>
    
      <c:if test="${sessionScope.loginStatus!=null and sessionScope.loginId=='admin'}">
        <div class="dropdown">
            <span class="glyphicon glyphicon-option-vertical" style="color: gray; font-size: 17px;"></span>
            <div class="dropdown-content">
                    <button type="button" style="text-align:center;" onclick="confirmDelete('${bdto.b_num}', '${currentPage}')">삭제</button> 
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
					<i class="glyphicon glyphicon-comment"></i> <span class="acount" style="color:gray;"></span>
			</span> <span
				style="color: gray; float: right; font-size: 14px; padding: 10px;">
					<i class="glyphicon glyphicon-eye-open"></i> ${bdto.b_readcount }
			</span> <br>
				<hr>
				</td>

		</tr>

		<tr>
			<td style="padding:10px;">
				<div style="padding:20px;">
				 ${bdto.b_content }
				</div>
				<br><br>
				<c:if test="${b_photo==true}">
				<c:forEach var="photoUrl" items="${photoUrls}">
				    <img  alt="이미지" src="/photo/${photoUrl}" style="max-width:100%; margin:10px;"><br>
				</c:forEach>
				 
				</c:if>
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
		
	</table>
				
			<c:if test="${'admin'!=bdto.b_loginid}">
			
			<div style="width:80%; height:50px; margin:0 auto; text-align:center; line-height:50px;  border-top:1px solid lightgray;  border-bottom:1px solid lightgray;">
				<c:if test="${prevNum == 0 }">
				이전게시물이 없습니다.
				</c:if>
				
				<c:if test="${prevNum != 0 }">
				<a href="detailboard?b_num=${prevNum }&currentPage=${currentPage}" style="float:left; padding-left:20px; color:#4E9F3D; text-decoration:none;">이전글
				&nbsp;&nbsp;<i class="glyphicon glyphicon-menu-up" style="font-size:8px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b style="color:#416442;">${prevTitle}</b></a>
				</c:if>
				
				</div>
				<div style="width:80%; height:50px; margin:0 auto; text-align:center; line-height:50px;  border-bottom:1px solid lightgray;">
				<c:if test="${nextNum != 0 }">
				<a href="detailboard?b_num=${nextNum }&currentPage=${currentPage}" style="float:left; padding-left:20px; color:#4E9F3D; text-decoration:none;">다음글
				&nbsp;&nbsp;<i class="glyphicon glyphicon-menu-down" style="font-size:8px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b style="color:#416442;">${nextTitle}</b></a>
				</c:if>
				
				<c:if test="${nextNum == 0 }">
				다음게시물이 없습니다.
				</c:if>
			</div>
			</c:if>
			
			
			<br><br><br><br>
			<div style="margin:0 auto;">
			<button type="button" class="btn btn-default" onclick="location.href='boardlist?currentPage=${currentPage}'" style="margin: 0 auto; border:1px solid #416442; color:#416442;">목록</button>
			</div>
			
			

	<div class="container" style="margin: 0 auto;">
	
		  <!-- Modal -->
		  <div class="modal fade" id="answermodal" role="dialog" >
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content" style="width:80%;">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title" style="text-align:center; padding:20px; font-size:20px; font-weight:bold;">댓글 수정</h4>
		        </div>
		        <div class="modal-body">
		            <form name ="answerupdateform" method="post">
					<input type="hidden" name="bc_num" id="bc_updatenum">
					<div style="width: 300px; margin: 0 auto; padding: 20px 0;">
									<input type="text"  id="bc_loginid" class="form-control" style="width: 300px;"
										readonly="readonly" value="${bc_loginid}"><br>
								
									<textarea type="text" class="form-control" 
									placeholder="댓글을 입력하세요" 
									id="bc_updatecontent" style="width: 100%; height:200px;"></textarea>
								</div>
				   </form>
		        </div>
		        <div class="modal-footer">
		         <button type="button" class="btn btn-info" 
					data-dismiss="modal" id="btnupdateinfo" style="background-color: #4E9F3D; margin-left: 100px;">수정하기</button>
		          <button type="button" class="btn btn-default" data-dismiss="modal" style="border:1px solid #4E9F3D; color:#4E9F3D;">닫기</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
		</div>

			
				
	
</body>
</html>