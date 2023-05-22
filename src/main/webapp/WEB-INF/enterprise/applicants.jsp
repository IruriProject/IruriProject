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

		<!-- Recent Sales Start -->
		<div class="container-fluid pt-4 px-4" style="width: 100%;">
			<div class="bg-light text-center rounded p-4">
				<div class="table-responsive">
					<table
						class="table text-start align-middle table-bordered mb-0" >
						<thead>
							<tr class="text-dark">
								<th scope="col" style="text-align: center">번호</th>
								<th scope="col" style="text-align: center">지원자명</th>
								<th scope="col" style="text-align: center">지원공고</th>
								<th scope="col" style="text-align: center">이력서보기</th>
								<th scope="col" style="text-align: center">지원날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="adto" items="${adto }" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<td>${adto.u_name}</td>
								<td><a href="/posting/detailpage?p_num=${adto.p_num }">${adto.p_title}</a></td>
								<td><a href="/resume/detail?r_num=${adto.r_num }" onclick="window.open(this.href, '_blank', 'menubar=no, toolbar=no'); return false;">${adto.r_title }</a></td>
								<td><fmt:formatDate value="${adto.a_writeday }" pattern="yyyy.MM.dd"/></td>
								
							</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
</body>
</html>