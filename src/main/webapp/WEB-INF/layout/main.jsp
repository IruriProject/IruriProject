<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>

</head>
<body>

<div style="width: 100%; height: 100%; text-align:center;">
  <img alt="banner" src="${root }/image/banner.png" style="width:100%; border-radius:10px; cursor: pointer;" onclick="window.open('https://www.kosmes.or.kr/intro/intro.html')">
</div>
<br>
<div id="bestwrap" style="width: 100%; height: 400px; margin:20px 0;">
    <h2 style="text-align: center; color:#4E9F3D; font-weight: bold;">인기공고</h2>
    <br>
    <div class="best" style="height: 90%; padding: 20px; display: flex; cursor: pointer;">
        <c:forEach var="bposting" items="${bestPostings}">
             <div style="width: 23%; display:block; margin:auto; height: 100%; background-color: #F6FBEA; border-radius: 10px; padding: 20px;" onclick="location.href='posting/detailpage?p_num=${bposting.p_num }&currentPage=${currentPage}'">
              <img alt="logo" src="/photo/${bposting.e_logo}" style="margin-left:5%; margin-bottom:6%; width:90%; height: 200px; border-radius: 10px;">
              <h4 style="font-weight:700; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"> ${bposting.p_title}</h4>
                <span style="color: gray;">${bposting.p_addr}</span>
                <c:if test="${bposting.p_employtype=='정규직'}">
                <b style="color:#4E9F3D; font-weight: 400;">연봉</b>          
                </c:if>
                
                    <c:if test="${bposting.p_employtype!='정규직'}">
                <b style="color:#4E9F3D; font-weight: 400;">월급</b>          
                </c:if>
                <b style="font-weight: 700;">
              <fmt:formatNumber value="${bposting.p_pay}" pattern="#,###" /></b>원           
            </div>
        </c:forEach>
    </div>  
</div>
<br>
<div id="recentwrap" style="width: 100%; height: 400px; margin:20px 0;">
    <h2 style="text-align: center; color:#416442; font-weight: bold;">최근공고</h2>
    <br> 
    <div class="recent" style="height: 40%; padding: 20px; display: flex; flex-wrap: wrap;  cursor: pointer;">
        <c:forEach var="posting" items="${recentPostings}">
            <div style="width: 23%; margin:10px; height: 100%; background-color:#fbfbfb; border-radius: 10px; padding: 20px;" onclick="location.href='posting/detailpage?p_num=${posting.p_num}&currentPage=${currentPage}'">
                <h4 style="font-weight:700; margin-bottom:20px;  white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">${posting.p_title}</h4>
                <span style="color: gray;">${posting.p_addr}</span>
                <c:if test="${posting.p_employtype=='정규직'}">
                <b style="color:#4E9F3D; font-weight: 400;">연봉</b>          
                </c:if>
                
                    <c:if test="${posting.p_employtype!='정규직'}">
                <b style="color:#4E9F3D; font-weight: 400;">월급</b>          
                </c:if>
                <b style="font-weight: 700;">
                 <fmt:formatNumber value="${posting.p_pay}" pattern="#,###" />      
                </b>원
            </div>
        </c:forEach>
    </div>
</div>


<div id="recentboardwrap" style="width: 100%; height: 200px;">
     <div style="height:10%;">
    <h2 style="text-align:center;color:#416442; font-weight: bold;">일자리이야기</h2>
    <a href="/board/boardlist" style="float:right; margin-right:30px; color:#4E9F3D; text-decoration:none;">더보기</a>
    </div>
    <br><br>
    
    <div class="recentboard" style="height: 70%; padding: 10px;display: flex; cursor: pointer;">
      <c:forEach var="board" items="${recentboards}">
            <div style="width: 23%; margin:10px; height: 100%; border:1px solid #e3f2c9; background-color:#fff; border-radius: 10px; padding: 20px;" onclick="location.href='board/detailboard?b_num=${board.b_num }&currentPage=${currentPage}'">
                 <h4 style="font-weight:700; margin-bottom:20px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">${board.b_title}</h4>
                 <span style="color:gray;"> <fmt:formatDate value="${board.b_writeday}" pattern="yyyy-MM-dd" /></span>
                 <span>조회 ${board.b_readcount}</span>&nbsp;<span>댓글 ${board.b_acount}</span><br>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>