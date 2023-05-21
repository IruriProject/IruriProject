<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
h1{
	color: #416442;
	font-weight: 600;
}

#txt {
	font-size: 2em;
}
</style>
</head>
<body>
	<h1>${content.p_title }</h1>
	<br>
	<p id="txt">${content.p_content }</p>

	<script>
		$(function() {
			var text = $("#txt").text();
			text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
			$("#txt").html(text);
		})
	</script>
</body>
</html>