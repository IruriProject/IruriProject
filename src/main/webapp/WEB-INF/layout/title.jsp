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

<!-- <!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>이루리</title>
<style type="text/css">
.logo {
	float: left;
	height: 100%;
	padding: 3px 10px 10px 130px;
}

.a {
	color: #000;
	font-weight: bold;
	text-align: center;
}

.a:hover {
	color: #000;
	text-decoration: none;
}

.search {
	float: left;
	width: 480px;
	height: 100%;
	padding: 20px;
	margin: 0 auto;
	position: relative;
	text-align: center;
}

.searchipput {
	width: 100%;
	border-radius: 20px;
	border: 1px solid #4E9F3D;
	margin: 10px 0;
	padding: 10px 40px;
	font-family: fontAwesome;
}

#searchcon {
	position: absolute;
	top: 44px;
	left: 36px;
	margin: 0;
}

#displayList {
	background-color: #fff;
	color: #gray;
	border: solid 1px #4E9F3D;
	width: 98%;
	padding: 30px;
	display: none;
	flex-direction: column;
	align-items: flex-start;
	float: left;
	overflow: auto;
	margin-left: 5px;
	margin-top: -10px;
	border-radius: 10px;
	max-height: 300px;
    text-align: left;
}

#displayList a {
	font-size: 16px;
	color: gray;
	text-align: left;
	line-height: 32px;
}

.searchipput:focus {
	outline: 1.5px solid #4E9F3D;
}

.usernav {
	float: right;
	width: 370px;
	height: 100%;
	padding: 50px 30px 30px 0px;
	margin-top: -10px;
}

.usernav a {
	text-align: center;
	color: gray;
	font-size: 15px;
}

.usernav a:hover {
	text-align: center;
	text-decoration: none;
	color: #000;
}

/* 스위치버튼 */
.toggleSwitch {
	width: 40px;
	margin: 10px;
	height: 20px;
	display: block;
	position: relative;
	border-radius: 30px;
	background-color: #fff;
	border: 1px solid green;
	cursor: pointer;
}

.toggleSwitch .toggleButton {
	width: 12px;
	height: 12px;
	position: absolute;
	top: 50%;
	left: 4px;
	transform: translateY(-50%);
	border-radius: 50%;
	background: #f03d3d;
}

.toggleSwitch.active {
	background: #f03d3d;
}

.toggleSwitch.active .toggleButton {
	left: calc(100% - 14px);
	background: #fff !important;
}

.toggleSwitch, .toggleButton {
	transition: all 0.2s ease-in;
}

.toggleSwitch.active {
	background: green;
}

.toggleSwitch .toggleButton {
	background: green;
}

#menu-button .caret {
	font-size: larger;
}

#menu-list {
	display: none; /* 처음에는 메뉴를 보이지 않게 함 */
}

#menu-list.show {
	display: block; /* 메뉴를 보이게 함 */
}
</style>   
<script>
$(document).ready(function(){
    // 버튼 클릭 시 메뉴 보이기/숨기기
    
    document.getElementById('menu-button').addEventListener('click', function() {
      var menuList = document.getElementById('menu-list');
      if (menuList.classList.contains('show')) {
        menuList.classList.remove('show');
      } else {
        menuList.classList.add('show');
      }
    });
    
    // 스위치 버튼 초기 상태 설정
    
    var toggleSwitch = document.querySelector('.toggleSwitch');
    var toggleButton = document.querySelector('.toggleButton');
    toggleSwitch.classList.add('active'); // 토글 스위치를 활성화 상태로 설정
    toggleButton.classList.add('active'); // 토글 버튼을 활성화 상태로 설정
 
    // 자동완성 기능 활성화 함수
    function activateAutocomplete() {
        $("#allkeyword").on("input", function() {
            var allkeyword = $("#allkeyword").val();

            if (allkeyword !== "") {
                $.ajax({
                    type: "get",
                    dataType: "json",
                    url: "../search/wordSearchShow",
                    data: {"allkeyword": allkeyword},
                    success: function(res) {
                        var s = "";

                        $.each(res, function(i, ele) {
                            var regex = new RegExp(allkeyword, "ig"); // 대소문자 구분 없이 일치하는 문자열 찾기 위해 "ig" 플래그 사용
                            var matches = ele.p_title.match(regex); // 일치하는 문자열 찾기
                            var title = ele.p_title;
                            if (matches) {
                                // 일치하는 문자열이 있을 경우 해당 부분에 스타일 적용
                                for (var j = 0; j < matches.length; j++) {
                                    title = title.replace(matches[j], '<span style="font-weight:bold; color:green;">' + matches[j] + '</span>');
                                }
                            }
                            s += "<a href='../search/allsearchlist?allkeyword=" + ele.p_title + "'>" + title + "</a><br>";
                        });

                        if (s !== "") {
                            $("#displayList").show();
                        } else {
                            $("#displayList").hide();
                        }

                        $("#displayList").html(s);
                    }

                });
            } else {
                $("#displayList").hide();
            }
        });
    }
		    // 페이지가 로드될 때 자동완성 기능 활성화
		    activateAutocomplete();

			 // 스위치 버튼 클릭 이벤트 처리
	   		toggleSwitch.onclick = function() {
	        toggleSwitch.classList.toggle('active');
	        toggleButton.classList.toggle('active');
	
	        // 스위치 버튼이 클릭될 때마다 자동완성 기능 활성화/비활성화
	        if (toggleSwitch.classList.contains('active')) {
	            activateAutocomplete();
	
	            // 스위치 버튼이 on일 때
	            toggleSwitch.nextSibling.textContent = "ON";
	        } else {
	            $("#allkeyword").off("input");
	            $("#displayList").hide();
	
	            // 스위치 버튼이 off일 때
	            toggleSwitch.nextSibling.textContent = "OFF";
	        }
	    };


    // 페이지가 로드될 때 displayList를 숨깁니다.
    $("#displayList").hide();
});
</script>

<script>
var allkeyword = "<%= request.getParameter("allkeyword") %>";
if (allkeyword === "null") {
	  allkeyword = ""; // "null" 문자열이면 공백으로 설정
	}
</script>


</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<div class="logo">
<a href="${root }/"><img alt="logo" src="${root }/image/logo.jpg" style="width:170px;"></a>
</div>
	<div class="search" style="z-index: 999;">
		<form action="/search/allsearchlist" method="get" class="form-inline">
	
			<i class="glyphicon glyphicon-search" id="searchcon"
				style="color: #41644a;"></i> <input type="text" name="allkeyword"
				id="allkeyword" class="searchipput" placeholder="공고 검색해주세요.">
		</form>
	
		<button type="button" id="menu-button" style="float:right; position: relative; margin-right:3%; margin-top:-44px; border:none;  background-color:#fff; color:green;">
		<span class="caret"></span>
		</button>
		<div id="displayList"></div>
		<ul id="menu-list">
			<li>
			<div style="float:left;  margin-top:-6px; margin-left: -100px; width:100%; height: 30px; padding:4px; border-radius: 10px; position: absolute;">
			<span style="float:left; margin-left:-42px; width:80%;">자동검색 끄기/켜기</span>
			<label for="toggle" class="toggleSwitch active" style=" width:10%; float: right;  margin: 0 auto;"> 
				<span class="toggleButton" style="font-size:larger;"></span>
			</label>
			</div>
			</li>
		</ul>
	
	</div>


	<div class="usernav">

	<!-- 로그아웃 상태 -->
	<c:if test="${sessionScope.loginStatus==null }">
	<a href="/login">로그인</a> | <a href="/join">회원가입</a>
	</c:if>
	
	<!-- 로그인 상태 / 개인 -->
	<c:if test="${sessionScope.loginStatus=='user' }">
	<b style="color: #416442">${sessionScope.loginName }</b>님 안녕하세요
	<span class="glyphicon glyphicon-envelope" style="padding:0 10px; cursor: pointer;"
	onclick="location.href='/mymessage'"></span> <br>
	<a href="/logout" style="padding-left: 100px; color: #E74646;">로그아웃</a>
	</c:if>
	
	<!-- 로그인 상태 / 기업 -->
	<c:if test="${sessionScope.loginStatus=='enterprise' }">
	<b style="color: #416442">${sessionScope.loginName }</b>님 안녕하세요 <br>
	[기업회원]
	<a href="/logout" style="color: #E74646;">로그아웃</a>
	</c:if>
</div>
</body>
</html>