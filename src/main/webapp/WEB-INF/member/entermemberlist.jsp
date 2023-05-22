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

.sm-delete-btn{
   border: 1px solid #E74646;
   color: #E74646;
   width:90px;
   background-color:#fff;
   height:32px;
   line-height:29px;
   border-radius: 3px;
}
</style>

</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<c:if test="${sessionScope.loginStatus!=null and sessionScope.loginId=='admin'}">

<h4>기업회원명단(총<b style="color: #4E9F3D; text-align:center;">&nbsp;${totalCount }</b> 명)</h4>
<table class="table table-info" style="width: 100%;">
		<tr >
			<th style="text-align:center;width: 50px;">번호</th>
			<th style="text-align:center;width: 130px;">이름</th>
			<th style="text-align:center;width: 100px;">아이디</th>
			<th style="text-align:center;width: 150px;">핸드폰</th>
			<th style="text-align:center;width: 350px;">주소</th>
			<th style="text-align:center;width: 200px;">이메일</th>
			<th style="text-align:center;width: 30px;">
			<input type="checkbox" id="allcheck"></th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr >
				<td style="text-align:center;">${i.count }</td>
				<td style="text-align:center;">${dto.e_name}</td>
				<td style="text-align:center;">${dto.e_id }</td>
				<td style="text-align:center;">${dto.e_tel }</td>
				<td>${dto.e_addr }</td>
				<td>${dto.e_email }</td>
				
				<td><input type="checkbox" class="del" name="chk"  num="${dto.e_num }"></td>
				
			</tr>
		</c:forEach>
	</table>
	
	<div style="text-align: right; margin-top:30px;">
		<button type="button" class="sm-delete-btn" id="btnmemberdel" onclick="deleteMembers()">DELETE</button>
	</div>
					
				<!-- 페이징 -->
		<c:if test="${totalCount>0}">
			<div class="pagination" style=" display: flex; justify-content: center; width:100%; text-align: center;">
				
					<!-- 이전 -->
					<c:if test="${startPage>1 }">
						
						<a href="entermemberlist?currentPage=${startPage-1}">&laquo;</a>
						
					</c:if>

					<c:forEach var="pp" begin="${startPage }" end="${endPage }">
						<c:if test="${currentPage==pp }">
							<a class="active" href="entermemberlist?currentPage=${pp}">${pp}</a>
							
						</c:if>

						<c:if test="${currentPage!=pp }">
							<a href="entermemberlist?currentPage=${pp}">${pp}</a>
						</c:if>
					</c:forEach>
					
					<!--다음 -->
					<c:if test="${endPage<totalPage }">
						
						<a href="entermemberlist?currentPage=${endPage+1}">&raquo;</a>
						
					</c:if>
			
			</div>
		</c:if>
	
</c:if>

<script type="text/javascript">
    function deleteMembers() {
        var checkedMembers = [];
        $(".del:checked").each(function (i, ele) {
            checkedMembers.push($(ele).attr("num"));
        });

        if (checkedMembers.length === 0) {
            alert("삭제할 회원을 선택해주세요.");
            return;
        }

        $.ajax({
            type: "POST", // 삭제 요청은 POST 메서드를 사용합니다.
            dataType: "html",
            url: "/member/enterdelete", // 삭제 요청을 처리하는 URL을 지정합니다.
            data: {"e_num": checkedMembers.join(",")},
            success: function () {
            	alert("삭제되었습니다.");
                location.reload();
            }
        });
    }
</script>


	 <script type="text/javascript">
	 
		$("#btnmemberdel").click(function(){
			
			$(".del:checked").each(function(i,ele){
				
				var num=$(ele).attr("e_num");
				//console.log(num);
				/* var root='${root}'; */
				// 경로가 같아서 지울 수 있다.
				
				$.ajax({
					type:"get",
					dataType:"html",
					url:"/member/btnmemberdel", //root+"/member/dtnmemberdel"
					data:{"e_num":num},
					success:function(){
						location.reload();
					}
				});
			});
			
		});
		
	</script> 
	
 	<script type="text/javascript">
		$(document).ready(function() {
			$("#allcheck").click(function() {
				if($("#allcheck").is(":checked")) $("input[name=chk]").prop("checked", true);
				else $("input[name=chk]").prop("checked", false);
			});
			
			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;
				
				if(total != checked) $("#allcheck").prop("checked", false);
				else $("#allcheck").prop("checked", true); 
			});
		});
	</script>  
</body>
</html>