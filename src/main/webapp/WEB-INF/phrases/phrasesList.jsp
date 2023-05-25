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
<script src="https://kit.fontawesome.com/f071d37f7a.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="${root }/css/usercss/style.css" rel="stylesheet">
<style>
.func {
	font-size: 1.5em;
	margin-left: 10px;
	cursor: pointer;
}

.edit, .editSuccess {
	color: green;
}

.del {
	color: red;
}
</style>
<script type="text/javascript">
$(function(){
	$(".editSuccess").hide();
	
	$(".edit").click(function(){
		var f_num=$(this).attr("f_num");
		
		var value = $(this).siblings(".editform").val();
		
		$(this).siblings(".editform").removeAttr("readonly");
		$(this).siblings(".editform").focus();
		$(this).siblings(".editform").val('');
		$(this).siblings(".editform").val(value);
		
		$(".edit").hide();
		$(".del").hide();
		$(this).siblings(".editSuccess").show();
		
		$(this).siblings(".editform").change(function(){
			newvalue=$(this).val();
		})
		
		
		$(this).siblings(".editSuccess").click(function(){
			$.ajax({
				type:"post",
				data:{"f_num":f_num,"f_phrase":newvalue},
				dataType:"html",
				url:"/phrases/updatephrase",
				success:function(){
					alert("문구 수정 성공");
					location.reload();
				}
			})
		})
		
	})
	
	$(".del").click(function(){
		var f_num=$(this).attr("f_num");
		
		$.ajax({
			type:"post",
			data:{"f_num":f_num},
			dataType:"html",
			url:"/phrases/deletephrase",
			success:function(){
				alert("문구 삭제 성공");
				location.reload();
			}
		})		
	})
	
	$("#insertbtn").click(function(){
		if(${list.size()==5}){
			alert("문구는 5개까지만 등록 가능합니다.");
		}else{
			location.href='/phrases/write';
		}
		
	})
})

</script>
</head>
<body>
	<div>
		<button style="float: right; margin-bottom: 10px; width: 100px; height: 40px;" type="button"
			class="sm-color-btn" id="insertbtn">문구등록</button>
	</div>
	<table class="table" style="width: 80%; margin: 0 auto;">
		<tr>
			<th style="text-align: center; width: 20%">No.</th>
			<th style="text-align: center">문구</th>
		</tr>
		<c:if test="${list.size()==0 }">
			<tr align="center">
				<td colspan="4">등록한 문구가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr align="center">
				<td>${i.count }</td>
				<td class="form-inline">
					<input type="text" class="form-control editform" value="${dto.f_phrase }" style="text-align: center; width: 500px;" readonly="readonly">
					<span class="func edit" f_num="${dto.f_num }"><i title="문구 수정" class="far fa-edit"></i></span>
					<span class="func del" f_num="${dto.f_num }"><i title="문구 삭제" class="far fa-trash-alt"></i></span>
					<span class="func editSuccess" f_num="${dto.f_num }"><i class="fas fa-check"></i></span>
				</td>
		</c:forEach>
	</table>
</body>
</html>