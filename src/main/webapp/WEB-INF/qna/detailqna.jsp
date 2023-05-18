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

<script>

function confirmDelete(q_num, currentPage) {
	  if (confirm("정말로 삭제하시겠습니까?")) {
	    location.href = "delete?q_num=${qdto.q_num}&currentPage=${currentPage}";
	    
	  }
	}
	

$(function(){
	
	num=$("#q_num").val();
	loginok="${sessionScope.loginStatus}";
	myid="${sessionScope.loginId}";
	
	var qc_count= ${qnaCount};
	//alert(qc_count);
	
	
	list();


		
	
	//insert
	$("#btncommentadd").click(function(){

		
		var qc_content=$("#qc_content").val();
		var qcount=${qnaCount};
		//alert(qcount);
		if(qc_content.trim().length==0){
			alert("댓글을 입력해주세요.");
			return;
		}
		
		
		//alert(num+qc_content);
		if(qcount<1){
		$.ajax({
			type: "post",
			dataType: "text",
			url: "commentinsert",
			data: {"q_num": num, "qc_num":"0","qc_content": qc_content},
			success: function(){
				$("#qc_content").val("");
				location.reload();
				list();
			}
		});  
		
		}else{
			
			alert("답변한 문의입니다.");
			 
		}
		
	});
	

	//수정창 띄우기
	$(document).on('click', '.qnaupdatecommentbtn', function(e) {
		
		  var qc_num = $(this).attr("qc_num");
		  var qc_updatecontent=$("#qc_updatecontent").val(); 
		  var data="qc_num="+qc_num+"&bc_updatecontent="+qc_updatecontent;
		  //console.log(data);
		  //alert(data);
		  
				$.ajax({
					type : "get", 
					dataType : "json", // 받을게 없을때는 text, html 아닐때는 dataType받는 파일형식으로 적기
					url : "answerupdateform",
					data : data,
					success:function(res){

						$("#qc_updatecontent").val(res.qc_content);
						$("#qc_updatenum").val(res.qc_num);
					}
				});
		});
		

	//수정
	$("#btnupdateqnainfo").click(function(){
		
		var qc_num=$("#qc_updatenum").val();
		var qc_updatecontent=$("#qc_updatecontent").val();
		var data="qc_num="+qc_num+"&qc_content="+qc_updatecontent;
		//alert(data);
		
		$.ajax({
			  type:"post",
			  dataType:"text",
			  data:data,
			  url:"commentupdate",
			  success:function(){  
				  //alert("수정됨");
				  location.reload();
			  }
		  });
	});
	
	
	
	//delete
	$(document).on('click', '#qnacommentdeletebtn', function() {
	    var qc_num = $(this).closest('.reply-item').data('qc_num');
	    //alert(qc_num);
	    
	    // 서버로 댓글 삭제 요청을 보냄
	    $.ajax({
	        type: "get",
	        dataType: "text",
	        url: "deleteqnacomment",
	        data: {"qc_num": qc_num},
	        success: function(){
	            alert("댓글이 삭제되었습니다.");
	            list();
	            location.reload();
	        }
	    });
	});
		 	 
	
});


//사용자 함수  list
function list() {
	
	  	var num=$("#q_num").val();
	  	loginok="${sessionScope.loginStatus}";
		myid="${sessionScope.loginId}";

		//alert(loginok+myid);
		
		$.ajax({
		        type: "get",
		        dataType: "json",
		        url: "qnacommentlist",
		        data: {
		            "q_num": num
		        },
		        success: function (res) {
		        	
		            var s = "";
               
	                $.each(res, function (i, dto) {
				        s += "<div class='reply-item' data-qc_num='" + dto.qc_num + "'>";
		                s +="<b class='fa-solid fa-reply fa-rotate-180' style='padding-top:3px; padding-left:8px; font-size:12px;'></b>";
		                s += "<b class='name' style='font-weight:bold;'>관리자</b>";
		                s += "<span class='day' style='font-weight:500;'>" +dto.qc_writeday + "</span>"; 
		                
		                if (loginok !='' && myid == 'admin'){
		        		s += "<div class='dropdown' style='float:right;'>";
		                s += "<span class='glyphicon glyphicon-option-vertical' style='color: gray; font-size: 17px;'></span>";
		                s += "<div class='dropdown-content'>";
		                s += "<button type='button' data-toggle='modal' class='qnaupdatecommentbtn' data-target='#qnaanswermodal' style='text-align:center;' qc_num='"+dto.qc_num+"'>수정</button>";
		                s += "<button type='button' style='text-align:center;' id='qnacommentdeletebtn'>삭제</button>";
		                s += "</div></div>";
		                }
						s +="<br><span class='content'><p style='padding:0 24px;'>"+ dto.qc_content + "</p></span><br><hr>";     
						});
 
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
    <c:if test="${sessionScope.loginId==qdto.q_loginid and sessionScope.loginId!='admin'}">
        <div class="dropdown">
            <span class="glyphicon glyphicon-option-vertical" style="color: gray; font-size: 17px;"></span>
            <div class="dropdown-content">
             	
                <button type="button" style="text-align:center;" onclick="location.href='qnawriteform#menu1'">추가문의</button>
               
                <c:if test="${sessionScope.loginId==qdto.q_loginid and sessionScope.loginId!='admin'}">
                <button type="button" style="text-align:center;" onclick="confirmDelete('${qdto.q_num}', '${currentPage}')">삭제</button>
                </c:if>
            </div>
        </div>
         </c:if>
    </c:if>
</td>

		</tr>
		<tr>
			<td>
			<span style="color: #4E9F3D; float: left; font-size: 14px; padding: 10px;">${qdto.q_loginid } </span> 
			<span style="color: gray; float: left; font-size: 14px; padding: 10px;">
					<fmt:formatDate value="${qdto.q_writeday }" pattern="yyyy-MM-dd HH:mm" />
			</span>
			
			<span style="color: gray; float: right; font-size: 14px; padding: 10px;">
			<c:if test="${qnaCount==0}">
				<b style="font-weight:500; color:red;">대기중</b>
			</c:if>
			<c:if test="${qnaCount!=0}">
				<b style="font-weight:500; color:green;">답변완료</b>
			</c:if>
			</span> 
			
			<br>
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
				
				
			<br><hr>
			</td>
		</tr>
		
		<tr>
			<td>
			
					<input type="hidden" name="q_num" id="q_num" value="${qdto.q_num }"> 
					
					<c:if test="${sessionScope.loginStatus!=null and sessionScope.loginId=='admin'}">
					<c:if test="${qnaCount<1}">
					<div class="aform" style="margin-bottom:130px;">
						<div class="form-inline">
						<textarea name="qc_content" id="qc_content" placeholder="관리자님 답변내용을 입력해주세요"
						class="bcontent-comment-input" required="required" ></textarea>
						
							<button type="button" class="formbold-comment-btn" id="btncommentadd">등록</button>
						</div>
					</div>
					<hr>
					</c:if>
					</c:if>
					

				<!-- 댓글출력 -->
				<div class="alist">
				
				</div>
				
			</td>
		</tr>
		
		<tr>
			<td style="margin: 10%; width:80%; display:flex; justify-content:space-between; text-align:center;">
				
				
				<c:if test="${sessionScope.loginStatus!=null and sessionScope.loginId=='admin'}">
				<button type="button" class="btn btn-default"
					onclick="location.href='adminqnalist?currentPage=${currentPage}'"
					style="margin: 0 auto; width: 30%;">목록</button>
				</c:if>
				
				
				<c:if test="${sessionScope.loginStatus!=null and sessionScope.loginId!='admin'}">
				<button type="button" class="btn btn-default"
					onclick="location.href='qnawriteform?currentPage=${currentPage}'"
					style="margin: 0 auto; width: 30%;">목록</button>
				</c:if>
				
			</td>
		</tr>
	
	</table>

	
	<div class="container" style="margin: 0 auto;">
	
		  <!-- Modal -->
		  <div class="modal fade" id="qnaanswermodal" role="dialog" >
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content" style="width:80%;">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title" style="text-align:center; padding:20px; font-size:20px; font-weight:bold;">답변수정</h4>
		        </div>
		        <div class="modal-body">
		            <form name ="answerupdateform" method="post">
					<input type="hidden" name="qc_num" id="qc_updatenum">
					<div style="width: 300px; margin: 0 auto; padding: 20px 0;">

									<textarea type="text" class="form-control" 
									placeholder="댓글을 입력하세요" 
									id="qc_updatecontent" style="width: 100%; height:200px;"></textarea>
								</div>
				   </form>
		        </div>
		        <div class="modal-footer">
		         <button type="button" class="btn btn-info" 
					data-dismiss="modal" id="btnupdateqnainfo" style="background-color: #4E9F3D; margin-left: 100px;">수정하기</button>
		          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
		</div>
	
				
</body>
</html>