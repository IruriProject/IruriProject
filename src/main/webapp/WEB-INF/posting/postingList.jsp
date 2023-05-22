<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="${root }/css/usercss/style.css" rel="stylesheet">
</head>
<style>
.atag {
	padding: 8px;
}

.atag, .atag:hover {
	color: #416442;
	text-decoration: none;
}

.atag:hover {
	background-color: #e3f2c9;
	border-radius: 10px;
}

.counting{
	float:right;
	cursor: pointer;
	color: #416442;
	font-size: 0.8em;
}

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

.pagination a:hover:not(.active) {
	text-decoration: none;
	color:#416442;
	background-color:#e3f2c9;
}
</style>
<body>
<form class="form-inline" action="/posting/postinglist" method="get" style="width: 100%; margin: 0 auto">
		<select class="form-control" name="searchcolumn">
			<option value="p_title">공고제목</option>
			<option value="p_content">공고내용</option>
		</select>
		<input type="text"
			placeholder="검색어 입력" class="form-control" name="searchword">
		<button type="submit" style="width: 70px;" class="sm-border-btn setMainOff">검색</button>
		<button type="button" style="width: 80px;" class="sm-border-btn setMainOff" onclick="location.href='/posting/postinglist'">초기화</button>
		<button style="float: right; width: 130px;" type="button" class="sm-color-btn setMainOff" onclick="location.href='/phrases/list'">자주쓰는문구 목록</button>
	</form>
	<br>
	<table class="table" style="width: 100%; margin: 0 auto;">
		<tr>
			<th style="text-align: center">No.</th>
			<th style="text-align: center; width: 40%">공고제목</th>
			<th style="text-align: center">직종</th>
			<th style="text-align: center">공고일</th>
			<th style="text-align: center">공고마감일</th>
			<th style="text-align: center">공고상태</th>
		</tr>
		
		<c:if test="${totalCount==0 }">
   		<tr><td colspan="6" align="center">
   		<span id="nosearch">게시한 공고가 없습니다.</span>
   		</td></tr>
   		</c:if>
		
		<c:if test="${totalCount!=0 && searchCount==0 }">
   		<tr><td colspan="6" align="center">
   		<span id="nosearch">검색된 게시글이 없습니다.</span>
   		</td></tr>
   		</c:if>
   		
		<c:if test="${searchCount>0 }">
		<c:forEach var="dto" items="${list }" varStatus="i">
		<tr align="center">
			<td>${no }</td>
			<c:set value="${no-1 }" var="no"/>
			<td style="text-align: left">
				<a class="atag" href="/posting/detailpage?p_num=${dto.p_num }&currentPage=${currentPage}">&nbsp;&nbsp;
					<c:if test="${dto.p_status=='지원가능' }">
						<b>${dto.p_title }</b>
					</c:if>
					<c:if test="${dto.p_status=='지원마감' }">
						<b style="color: gray; text-decoration: line-through red;">${dto.p_title }</b><span style="color: red; margin-left: 10px; font-size: 0.8em;">마감</span>
					</c:if>
				</a>&nbsp;&nbsp;
				
				<span class="counting viewer" p_num=${dto.p_num } title="열람한 인재목록 보기" onclick="location.href='/enterprise/viewerlist?p_num=${dto.p_num}'"></span>
				<span class="counting">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
				<span class="counting scrap" p_num=${dto.p_num } title="스크랩한 인재목록 보기" onclick="location.href='/enterprise/scraplist?p_num=${dto.p_num}'"></span>
			</td>
			<td>${dto.p_type }</td>
			<td><fmt:formatDate value="${dto.p_writeday }" pattern="yyyy-MM-dd"/> </td>
			<td class="enddate">${dto.p_enddate }</td>
			<td><select class="pStatus" pnum=${dto.p_num }><option value="지원가능" ${dto.p_status=="지원가능"?'selected':'' }>지원가능</option>
											<option value="지원마감" ${dto.p_status=="지원마감"?'selected':'' }>지원마감</option></select></td>
		</tr>
		
		 <script type="text/javascript">
	        $(function(){
	            var p_num = "${dto.p_num}";
	            $.ajax({
	                type:"get",
	                data:{"p_num":p_num},
	                dataType:"json",
	                url:"/enterprise/counting",
	                success:function(res){
	                    $(".viewer[p_num='"+p_num+"']").text("열람 : "+res.viewercounting+"명");
	                    $(".scrap[p_num='"+p_num+"']").text("스크랩 : "+res.scrapcounting+"명");
	                }
	            });
	        });
	    </script>
							    
		</c:forEach>
		</c:if>
		
	</table>
	
	
	<c:if test="${searchCount>0 }">
	<!-- 페이징 -->
		<div class="pagination" style=" display: flex; justify-content: center; width:100%; text-align: center;">
	
				<!-- 이전 -->
				<c:if test="${startPage>1}">
					<c:if test="${keyword!=null }">
						<a href="postinglist?currentPage=${startPage-1 }&searchcolumn=${column}&searchword=${keyword}">&laquo;</a>
					</c:if>
					<c:if test="${keyword==null }">
						<a href="postinglist?currentPage=${startPage-1 }">&laquo;</a>
					</c:if>
				</c:if>
				
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				  <c:if test="${pp==currentPage }">
					 <c:if test="${keyword!=null }">
				    	<a class="active" href="postingist?currentPage=${pp}&searchcolumn=${column}&searchword=${keyword}">${pp}</a>
					</c:if>
					<c:if test="${keyword==null }">
						<a class="active" href="postinglist?currentPage=${pp}">${pp}</a>
					</c:if> 
				  </c:if>
				  
				  <c:if test="${pp!=currentPage }">
				    <c:if test="${keyword!=null }">
				   		<a href="postinglist?currentPage=${pp}&searchcolumn=${column}&searchword=${keyword}">${pp}</a>
					</c:if>
					<c:if test="${keyword==null }">
						<a href="postinglist?currentPage=${pp}">${pp}</a>
					</c:if>
				  </c:if>
				</c:forEach>
	
				<!-- 다음 -->
				<c:if test="${endPage<totalPage }">
					<c:if test="${keyword!=null }">
						<a href="postinglist?currentPage=${endPage+1}&searchcolumn=${column}&searchword=${keyword}">&raquo;</a>
					</c:if>
					<c:if test="${keyword==null }">
						<a href="postinglist?currentPage=${endPage+1}">&raquo;</a>
					</c:if>
				</c:if>
			</div>
		
		</c:if>
	<script>
		
		$(".pStatus").change(function(){
			var pStatus=$(this).val();
			var pNum=$(this).attr("pnum");
			
			var enddate= $(this).closest("tr").find(".enddate").text();
			
			var now = new Date();
	        var year = now.getFullYear();
	        var month = ('0' + (now.getMonth() + 1)).slice(-2);
	        var day = ('0' + now.getDate()).slice(-2);
	        var today = year + '-' + month + '-' + day;
	            
	        if(enddate < today){
	        	alert("공고마감일이 지나 모집상태를 변경할 수 없습니다.\n공고마감일을 먼저 수정해주세요.");
	            location.reload();
	            
	        } else {
				$.ajax({
					type:"get",
					data:{"p_num":pNum,"p_status":pStatus},
					dataType:"html",
					url:"/posting/updateStatus",
					success:function(){
						alert("모집상태 변경 완료");
						location.reload();
					}
				})
	        }
		})
		
		</script>
</body>
</html>