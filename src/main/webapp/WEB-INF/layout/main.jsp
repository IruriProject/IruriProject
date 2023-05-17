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

<div id="recent" style="width: 100%; height: 300px;">
    <h2 style="text-align: center; color: green; font-weight: bold;">최근공고</h2>
    <div class="recent" style="height: 80%; padding: 20px; display: flex;">
      <c:forEach var="rposting" items="${recentPostings}">
            <div style="width: 25%; height: 100%; border: 1px solid gray; padding: 10px;">
                ${rposting.p_title}<br>
                <b>급여</b> ${rposting.p_pay}<br>
                <span style="color:gray;">${rposting.p_addr}</span><br>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>