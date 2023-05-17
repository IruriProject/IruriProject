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

<div style="width: 100%; height: 300px; border:1px solid gray; text-align:center;">
배너자리
</div>
<div id="bestwrap" style="width: 100%; height: 300px;">
    <h2 style="text-align: center; color: green; font-weight: bold;">인기공고</h2>
    <div class="best" style="height: 80%; padding: 20px;display: flex;">
        <c:forEach var="bposting" items="${bestPostings}">
            <div style="width: 25%; height: 100%; border: 1px solid gray; padding: 10px;" onclick="location.href='posting/detailpage?p_num=${bposting.p_num }&currentPage=${currentPage}'">
               ${bposting.p_title}<br>
                <b>급여</b> ${bposting.p_pay}<br>
                <span>${bposting.p_addr}</span><br>
            </div>
        </c:forEach>
    </div>
</div>

<div id="recentwrap" style="width: 100%; height: 300px;">
    <h2 style="text-align: center; color: green; font-weight: bold;">최근공고</h2>
    <div class="recent" style="height: 80%; padding: 20px;display: flex;">
      <c:forEach var="posting" items="${recentPostings}">
            <div style="width: 25%; height: 100%; border: 1px solid gray; padding: 10px;" onclick="location.href='posting/detailpage?p_num=${posting.p_num }&currentPage=${currentPage}'">
                ${posting.p_title}<br>
                <b>급여</b> ${posting.p_pay}<br>
                <span>${posting.p_addr}</span><br>
            </div>
        </c:forEach>
    </div>
</div>

<div id="recentboardwrap" style="width: 100%; height: 300px;">
    <h2 style="text-align: center; color: green; font-weight: bold;">일자리이야기</h2>
    <a href="/board/boardlist" style="float:right; color:green;">더보기</a>
    <div class="recentboard" style="height: 80%; padding: 20px;display: flex;">
      <c:forEach var="board" items="${recentboards}">
            <div style="width: 30%; height: 100%; border: 1px solid gray; padding: 10px;" onclick="location.href='board/detailboard?b_num=${board.b_num }&currentPage=${currentPage}'">
                ${board.b_title}<br>
                <span>${board.b_writeday}</span><br>
                 <span>${board.b_readcount}</span><br>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>