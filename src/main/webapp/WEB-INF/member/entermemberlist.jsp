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
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<c:if test="${sessionScope.loginStatus!=null and sessionScope.loginId=='admin'}">
<b>총 ${totalCount}명</b>
<br>
<table class="table table-info" style="width: 100%;">
	<caption>전체 회원명단</caption>
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 90px;">이름</th>
			<th style="width: 100px;">아이디</th>
			<th style="width: 150px;">핸드폰</th>
			<th style="width: 350px;">주소</th>
			<th style="width: 200px;">이메일</th>
			<th style="width: 30px;">
			<input type="checkbox" id="allcheck"></th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr >
				<td>${i.count }</td>
				<td>${dto.e_name}</td>
				<td>${dto.e_id }</td>
				<td>${dto.e_tel }</td>
				<td>${dto.e_addr }</td>
				<td>${dto.e_email }</td>
				
				<td><input type="checkbox" class="del" name="chk"  num="${dto.e_num }"></td>
				
			</tr>
		</c:forEach>
	</table>
	<button type="button" class="btn btn-danger" style="margin-left: 920px;" id="btnmemberdel" onclick="deleteMembers()">DELETE</button>
	
					
				<!-- 페이징 -->
		<c:if test="${totalCount>0}">
			<div style="width: 800px; text-align: center;">
				<ul class="pagination">
					<!-- 이전 -->
					<c:if test="${startPage>1 }">
						<li>
						<a href="entermemberlist?currentPage=${startPage-1}">이전</a>
						</li>
					</c:if>

					<c:forEach var="pp" begin="${startPage }" end="${endPage }">
						<c:if test="${currentPage==pp }">
							<li class="active"><a href="entermemberlist?currentPage=${pp}">${pp}</a>
							</li>
						</c:if>

						<c:if test="${currentPage!=pp }">
							<li><a href="entermemberlist?currentPage=${pp}">${pp}</a></li>
						</c:if>
					</c:forEach>
					
					<!--다음 -->
					<c:if test="${endPage<totalPage }">
						<li>
						<a href="entermemberlist?currentPage=${endPage+1}">다음</a>
						</li>
					</c:if>
				</ul>
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