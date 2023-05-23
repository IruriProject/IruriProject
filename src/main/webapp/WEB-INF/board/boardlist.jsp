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
a{
   text-decoration: none;
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

.pagination a:hover:not(.active) {text-decoration: none; color:#416442; background-color:#e3f2c9;}

.countst {
	font-weight: 500;
	color: gray;
	font-size: 16px;
	letter-spacing: -.005em;
	line-height: 24px;
	padding: 10px 0px;
	line-height:50px; 
}

.formbold-b_search-input {
	float:right;
	width: 100%;
	padding: 8px 16px;
	border-radius: 5px;
	border: 1px solid #dde3ec;
	background: #ffffff;
	font-weight: 500;
	font-size: 14px;
	color: #536387;
	outline: none;
	resize: none;
}

  .formbold-form-select {
  	float:left;
    width: 100%;
  	padding: 8px 16px;
    border-radius: 5px;
    border: 1px solid #dde3ec;
    background: #ffffff;
    font-size: 14px;
    color: #536387;
    outline: none;
    resize: none;
    cursor: pointer;
  }
  

</style>
<script>
function updateUrl() {
  var sort = document.getElementById("sort").value;
  var keyword = document.getElementById("keyword").value.trim();
  var url = "boardlist?";
  
  if (keyword != "") {
    url += "keyword=" + encodeURIComponent(keyword) + "&";
  }
   
  if (sort != "") {
    url += "sort=" + encodeURIComponent(sort);
  }
  
  location.href = url;
}
</script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div style="width: 100%; height: 80px; padding: 0 6% 3% 6%; display: inline-block;">
		<div style="float: left; width: 40%;">
			<h2
				style="float: left; width: 60%; font-weight: 600; color: #416442; font-size: 1.8em;">일자리이야기</h2>
		</div>
		<c:if test="${sessionScope.loginStatus!=null }">
			<div style="float: right; width: 40%; padding-top: 20px;">
				<button type="button" class="btn btn-default"
					style="float: right; width: 100px; background-color:#4E9F3D; border:none; color:white;" onclick="location.href='form'">글쓰기</button>
			</div>
		</c:if>
	</div>
	
	<div style="width: 100%; height: 50px; padding: 0 6%;">
		<b class="countst">총<b style="color: #4E9F3D;">&nbsp;${totalCount}</b> 건</b>
		
		<div style="float:right; line-height:35px; text-align:center;">
			<button type="button" class="btn btn-default" style="padding:8px;" onclick="location.href='/board/boardlist'">초기화</button>
		</div>
		
		<div style="width: 30%; float: right; margin-right:8px;">
		<form action="boardlist" method="get" class="form-inline">
		  <input type="text" name="keyword" id="keyword" placeholder="제목+본문검색" class="formbold-b_search-input" style="width:58%;" value="${param.keyword}" />
		  <select class="formbold-form-select" name="sort" id="sort" style="width:39%;" onchange="updateUrl()">
		    <option value="b_writeday" ${param.sort == "b_writeday" ? "selected" : ""}>최신순</option>
		    <option value="b_num" ${param.sort == "b_num" ? "selected" : ""}>오래된순</option>
		    <option value="b_readcount" ${param.sort == "b_readcount" ? "selected" : ""}>조회순</option>
		  </select>
		</form>
		</div>
		
		
	</div>

	<table class="table table-info"  style="width:1000px;  margin: 0 auto;">
	
			<c:if test="${totalCount==0 }">
				<tr>
					<td colspan="5" align="center">
						<h3><b>등록된 게시물이 없습니다.</b></h3>
					</td>
				</tr>
			</c:if>

			<c:if test="${totalCount>0 }">
			 <!-- 공지사항 -->
			 <c:if test="${currentPage==1 }">
			  <c:forEach var="dto" items="${noticeList}">
			    <tr style="vertical-align: middle; height: 60px; line-height: 60px; font-size: 14px; background-color:#e3f2c9;">
			      <!-- 내용 출력 -->
			      <td style="height: 60px; line-height: 60px;">
			        <!-- 게시물 제목과 내용 출력 -->
			        <a href="detailboard?b_num=${dto.b_num}&currentPage=${currentPage}" style="color:#000; text-decoration:none;">
			        <b style="margin-left:20px; padding:10px 20px; background-color:#fff; border-radius:16px;">공지</b>
			          <b style="font-size:16px; font-weight:500; padding:10px;">${dto.b_title}</b>
			          <!-- 첨부 사진 아이콘 -->
			          <c:if test="${dto.b_photo!='no'}">
			            <span class="glyphicon glyphicon-picture" style="color:#416442; font-size:15px;"></span>
			          </c:if>
			        </a>
			      </td>
			      <td style=" height:60px; line-height:60px; padding:10px;" align="right">
			      <span style="color:gray; padding-right:14px;"><fmt:formatDate value="${dto.b_writeday }" pattern="yyyy-MM-dd" /></span>
			      </td>
			    </tr>
			  </c:forEach>
			  </c:if>

				<c:forEach var="dto" items="${list }">
				<tr style=" vertical-align:middle;  height:60px; line-height:60px; font-size:14px;">
					
					<c:set var="no" value="${no-1 }"/>
					
					<td style="height:60px; line-height:60px; padding:0 30px; "> 
					
					<a href="detailboard?b_num=${dto.b_num }&currentPage=${currentPage}" style="color:#000; text-decoration: none;">
					<b style="font-size:18px; font-weight:500; color:#416442;">${dto.b_title }</b>
					<c:if test="${dto.b_photo!='no' }">
					<span class="glyphicon glyphicon-picture" style="color:#416442; font-size:15px;"></span>
					</c:if>
					
				  	<c:if test="${dto.newFlag}">
                        <img src="${root }/image/newicon.png" alt="newpng" style="width:21px; margin-bottom:5px; padding:1px;" />
                    </c:if>
                    <c:if test="${dto.b_acount>0 }">
					<span style="color:red;">[${dto.b_acount}]</a></span>
					</c:if>
					
					<div style="width:100%; height:20px; float:left; line-height:20px; color:gray; overflow: hidden;">${dto.b_content } </div>
					</a>	

					<div style="width:100%; height:60px; float:left; line-height:60px; color:gray;">
					${dto.b_loginid }  
					<span style="color:#bebebe;">
					 <span style=" padding:1px;font-size:0.8em;">|</span> ${dto.b_time }</span>
					</div>
					</td>
					
					<td style="width: 30%; height:60px; line-height:60px;" align="center">
					<span style="color:#bebebe; float: right; font-size: 13px; padding: 10px;">
					<i class="	glyphicon glyphicon-eye-open"></i>&nbsp;${dto.b_readcount }</span>
				
					
					<c:if test="${dto.b_acount>0 }">
					<span style="color:#bebebe; float: right; font-size: 13px; padding: 10px;">
					<i class="glyphicon glyphicon-comment"></i>&nbsp;${dto.b_acount}</span>
					</c:if>
					</td>
				</tr>

				<tr>
				</tr>
			</c:forEach>
			</c:if>
			
	</table>
	
  <c:if test="${totalCount>0}">
  <div class="pagination" style=" display: flex; justify-content: center; width:100%; text-align: center;">
      <!-- 이전 -->
      <c:if test="${startPage>1 }">
          <a href="boardlist?currentPage=${startPage-1}&amp;keyword=${param.keyword}&amp;sort=${param.sort}">&laquo;</a>
      </c:if>

      <c:forEach var="pp" begin="${startPage }" end="${endPage }">
        <c:if test="${currentPage==pp }">
            <a class="active" href="boardlist?currentPage=${pp}&amp;keyword=${param.keyword}&amp;sort=${param.sort}">${pp}</a>
        </c:if>

        <c:if test="${currentPage!=pp }">
            <a href="boardlist?currentPage=${pp}&amp;keyword=${param.keyword}&amp;sort=${param.sort}">${pp}</a>
        </c:if>
      </c:forEach>

      <!--다음 -->
      <c:if test="${endPage<totalPage }">
          <a href="boardlist?currentPage=${endPage+1}&amp;keyword=${param.keyword}&amp;sort=${param.sort}">&raquo;</a>  
      </c:if>
  </div>
</c:if>	
</body>
</html>