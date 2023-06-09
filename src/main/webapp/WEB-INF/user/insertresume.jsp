<%@page import="java.util.Date"%>
<%@page import="spring.mvc.dto.UserDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <link href="${root }/css/usercss/style.css" rel="stylesheet">
<style type="text/css">

#OneMinDoc ul, .introduceTab__list ul, #dllocal ul {
   list-style: none;
   margin: 0;
   padding: 0;
}


#OneMinDoc li, .introduceTab__list li, #dllocal li {
   margin-right: 10px;
   border: 0;
   float: left;
}

td {
   font-size: 1.2em;
}

.autoResume td {
   font-size: 1em;
}

#ulAreacd li button{
margin-top:3px;
}
.chkbox{
	width: 15px;
	height: 15px;
	margin-right: 16px;
	margin-top: 2px;
	border: 0.7px solid #4E9F3D;
	border-radius: 3px;
	accent-color: #4E9F3D;
}
#personality td, #career td, #motivation td{
cursor:pointer;
border-bottom: 1px solid #cce891;
padding: 10px 0;
color:#416442;
}

</style>
</head>
<body>
   <div class="formbold-main-wrapper">
      <div class="formbold-form-wrapper">
         <form action="insertResume" method="POST">
            <input type="hidden" name="u_num" value="${dto.u_num }">
            <div align="center">
               <h2
                  style="font-weight: 600; color: #416442; background-color: #e3f2c9; width: 300px; height: 50px; font-size: 1.8em; padding: 10px 0px; border-radius: 10px; text-align: center;">이력서
                  등록</h2>
            </div>
            <br><label for="p_title" class="formbold-form-label"> 기본정보 </label>
            <div class="formbold-input-wrapp formbold-mb-3"
               style="height: 270px; background-color:#f9ffef; border-radius: 10px; padding:20px 0px 20px 25px;">
                <span
                  style="font-size: 2em">${sessionScope.loginName }</span>
               <div style="float: left; width: 150px; height:200px; margin-right:20px;">
               		<c:if test="${dto.u_photo==null }">
						<img src="/image/nophoto.png"
						style="width: 150px; height: 200px; border-radius:10px;">
					</c:if>
					<c:if test="${dto.u_photo!=null }">
							<img alt="" src="/photo/${dto.u_photo}"
							style="width: 150px; height: 200px; border-radius:10px;">
					</c:if>
               </div>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <c:if test="${dto.u_gender=='남' }">
               남성
               </c:if>
               <c:if test="${dto.u_gender=='여' }">
               여성
               </c:if>
               &nbsp;&nbsp;/&nbsp;&nbsp; ${dto.u_birth }
               <c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="year"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
				<c:set var="birth"><fmt:formatDate value="${dto.u_birth }" pattern="yyyy"/></c:set>
				<c:if test="${year-birth+1 !=2024}">
				(${year-birth+1 }세)
				</c:if>
				<c:if test="${year-birth+1 ==2024}">
				( - 세)
				</c:if>
				<br><br>
               <table style="border: 0px solid red;">
                  <tr>
                     <td width="100" height="40">연락처</td>
                     <td>${dto.u_hp }</td>
                  </tr>
                  <tr>
                     <td height="40">이메일</td>
                     <td>${dto.u_email }</td>
                  </tr>
                  <tr>
                     <td height="40">주소</td>
                     <td>${dto.u_addr }</td>
                  </tr>
               </table>
            </div>

            <div class="formbold-mb-3">
               <label for="r_title" class="formbold-form-label"> 이력서 제목 </label> <input
                  type="text" name="r_title" id="r_title" step="50"
                  placeholder="25글자 이내로 자신을 표현해보세요." class="formbold-form-input" required="required"/>
                  <span class="rtitle" style="float:right">0자 / 25자</span>
            </div>
            <script type="text/javascript">
            window.onbeforeunload = function() {
        		return "브라우저를 종료하시겠습니까?";
        	};	
        	
            $(document).on("submit", "form", function(event){
                window.onbeforeunload = null;
        	});
          
            $('#r_title').keyup(function (e) {
				var title = $(this).val();
				var characterCount = title.replace(/\s/g, '').length;
			    
			    // 글자수 세기
			    if (title.length == 0 || title == '') {
			    	$('.rtitle').text('0자 / 25자');
			    } else if(title.length <= 25){
			    	$('.rtitle').text(title.length + '자 / 25자');
			    }else{
			    	$('.rtitle').text('25자 / 25자');
			    }
			    
			    // 글자수 제한
			    if (title.length > 25) {
			    	// 1000자 부터는 타이핑 되지 않도록
			        $(this).val($(this).val().substring(0, 25));
			        // 1000자 넘으면 알림창 뜨도록
			        alert('제목은 25자까지 입력 가능합니다.');
			    };
			});
            </script>
            <div class="formbold-mb-3">
               <label class="formbold-form-label">희망지역</label>
               <div class="searchValue regist__item">
                  <button type="button" style="margin-bottom: 3px;" id="tagarea" class="sm-border-btn" onclick="selectLocation()">지역선택</button>
                  <input id="areainput" name="r_larea" readonly="readonly" required="required" class="formbold-form-input">
               </div>
               <div id="dllocal" class="searchArea"
                  style="display: none; height: 260px;">
                  <ul id="ulAreacd" class="tabForm">
                     <li id="10" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(10);">서울</button>
                     </li>
                     <li id="13" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(13);">부산</button>
                     </li>
                     <li id="14" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(14);">대구</button>
                     </li>
                     <li id="11" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(11);">인천</button>
                     </li>
                     <li id="18" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(18);">광주</button>
                     </li>
                     <li id="15" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(15);">대전</button>
                     </li>
                     <li id="19" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(19);">울산</button>
                     </li>
                     <li id="26" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(26);">세종</button>
                     </li>
                     <li id="12" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(12);">경기</button>
                     </li>
                     <li id="16" class="   ">
                        <button type="button" class="xs-border-btn" onclick="setSido(16);">경남</button>
                     </li>
                     <li id="20" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(20);">경북</button>
                     </li>
                     <li id="17" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(17);">충남</button>
                     </li>
                     <li id="22" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(22);">충북</button>
                     </li>
                     <li id="24" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(24);">전남</button>
                     </li>
                     <li id="21" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(21);">전북</button>
                     </li>
                     <li id="23" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(23);">강원</button>
                     </li>
                     <li id="25" class="  ">
                        <button type="button" class="xs-border-btn" onclick="setSido(25);">제주</button>
                     </li>
                  </ul>
                  <br> <br> <br>
                  <ul id="ulGugun" class="inputWrap">
                     <!-- 서울 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1010" class="chkbox" name="selGugun" value="1010"
                           onchange="localdisplay(this, '10','1010');"><label style="font-weight: 400; margin-left: 5px;" style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1010">강남구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1011" class="chkbox" name="selGugun" value="1011"
                           onchange="localdisplay(this, '10','1011');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1011">강동구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1012" class="chkbox" name="selGugun" value="1012"
                           onchange="localdisplay(this, '10','1012');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1012">강북구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1013" class="chkbox" name="selGugun" value="1013"
                           onchange="localdisplay(this, '10','1013');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1013">강서구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1014" class="chkbox" name="selGugun" value="1014"
                           onchange="localdisplay(this, '10','1014');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1014">관악구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1015" class="chkbox" name="selGugun" value="1015"
                           onchange="localdisplay(this, '10','1015');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1015">광진구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1016" class="chkbox" name="selGugun" value="1016"
                           onchange="localdisplay(this, '10','1016');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1016">구로구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1017" class="chkbox" name="selGugun" value="1017"
                           onchange="localdisplay(this, '10','1017');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1017">금천구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1018" class="chkbox" name="selGugun" value="1018"
                           onchange="localdisplay(this, '10','1018');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1018">노원구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1019" class="chkbox" name="selGugun" value="1019"
                           onchange="localdisplay(this, '10','1019');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1019">도봉구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1020" class="chkbox" name="selGugun" value="1020"
                           onchange="localdisplay(this, '10','1020');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1020">동대문구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1021" class="chkbox" name="selGugun" value="1021"
                           onchange="localdisplay(this, '10','1021');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1021">동작구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1022" class="chkbox" name="selGugun" value="1022"
                           onchange="localdisplay(this, '10','1022');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1022">마포구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1023" class="chkbox" name="selGugun" value="1023"
                           onchange="localdisplay(this, '10','1023');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1023">서대문구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1024" class="chkbox" name="selGugun" value="1024"
                           onchange="localdisplay(this, '10','1024');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1024">서초구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1025" class="chkbox" name="selGugun" value="1025"
                           onchange="localdisplay(this, '10','1025');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1025">성동구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1026" class="chkbox" name="selGugun" value="1026"
                           onchange="localdisplay(this, '10','1026');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1026">성북구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1027" class="chkbox" name="selGugun" value="1027"
                           onchange="localdisplay(this, '10','1027');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1027">송파구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1028" class="chkbox" name="selGugun" value="1028"
                           onchange="localdisplay(this, '10','1028');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1028">양천구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1029" class="chkbox" name="selGugun" value="1029"
                           onchange="localdisplay(this, '10','1029');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1029">영등포구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1030" class="chkbox" name="selGugun" value="1030"
                           onchange="localdisplay(this, '10','1030');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1030">용산구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1031" class="chkbox" name="selGugun" value="1031"
                           onchange="localdisplay(this, '10','1031');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1031">은평구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1032" class="chkbox" name="selGugun" value="1032"
                           onchange="localdisplay(this, '10','1032');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1032">종로구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1033" class="chkbox" name="selGugun" value="1033"
                           onchange="localdisplay(this, '10','1033');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1033">중구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1034" class="chkbox" name="selGugun" value="1034"
                           onchange="localdisplay(this, '10','1034');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1034">중랑구</label></span></li>
                     <!-- 부산 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1310" class="chkbox" name="selGugun" value="1310"
                           onchange="localdisplay(this, '13','1310');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1310">강서구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1311" class="chkbox" name="selGugun" value="1311"
                           onchange="localdisplay(this, '13','1311');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1311">금정구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1312" class="chkbox" name="selGugun" value="1312"
                           onchange="localdisplay(this, '13','1312');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1312">기장군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1313" class="chkbox" name="selGugun" value="1313"
                           onchange="localdisplay(this, '13','1313');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1313">남구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1314" class="chkbox" name="selGugun" value="1314"
                           onchange="localdisplay(this, '13','1314');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1314">동구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1315" class="chkbox" name="selGugun" value="1315"
                           onchange="localdisplay(this, '13','1315');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1315">동래구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1316" class="chkbox" name="selGugun" value="1316"
                           onchange="localdisplay(this, '13','1316');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1316">부산진구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1317" class="chkbox" name="selGugun" value="1317"
                           onchange="localdisplay(this, '13','1317');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1317">북구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1318" class="chkbox" name="selGugun" value="1318"
                           onchange="localdisplay(this, '13','1318');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1318">사상구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1319" class="chkbox" name="selGugun" value="1319"
                           onchange="localdisplay(this, '13','1319');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1319">사하구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1320" class="chkbox" name="selGugun" value="1320"
                           onchange="localdisplay(this, '13','1320');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1320">서구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1321" class="chkbox" name="selGugun" value="1321"
                           onchange="localdisplay(this, '13','1321');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1321">수영구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1322" class="chkbox" name="selGugun" value="1322"
                           onchange="localdisplay(this, '13','1322');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1322">연제구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1323" class="chkbox" name="selGugun" value="1323"
                           onchange="localdisplay(this, '13','1323');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1323">영도구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1324" class="chkbox" name="selGugun" value="1324"
                           onchange="localdisplay(this, '13','1324');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1324">중구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1325" class="chkbox" name="selGugun" value="1325"
                           onchange="localdisplay(this, '13','1325');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1325">해운대구</label></span></li>
                     <!-- 대구 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1410" class="chkbox" name="selGugun" value="1410"
                           onchange="localdisplay(this, '14','1410');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1410">남구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1411" class="chkbox" name="selGugun" value="1411"
                           onchange="localdisplay(this, '14','1411');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1411">달서구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1412" class="chkbox" name="selGugun" value="1412"
                           onchange="localdisplay(this, '14','1412');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1412">달성군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1413" class="chkbox" name="selGugun" value="1413"
                           onchange="localdisplay(this, '14','1413');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1413">동구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1414" class="chkbox" name="selGugun" value="1414"
                           onchange="localdisplay(this, '14','1414');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1414">북구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1415" class="chkbox" name="selGugun" value="1415"
                           onchange="localdisplay(this, '14','1415');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1415">서구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1416" class="chkbox" name="selGugun" value="1416"
                           onchange="localdisplay(this, '14','1416');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1416">수성구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1417" class="chkbox" name="selGugun" value="1417"
                           onchange="localdisplay(this, '14','1417');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1417">중구</label></span></li>
                     <!-- 인천 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1110" class="chkbox" name="selGugun" value="1110"
                           onchange="localdisplay(this, '11','1110');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1110">강화군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1111" class="chkbox" name="selGugun" value="1111"
                           onchange="localdisplay(this, '11','1111');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1111">계양구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1112" class="chkbox" name="selGugun" value="1112"
                           onchange="localdisplay(this, '11','1112');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1112">미추홀구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1113" class="chkbox" name="selGugun" value="1113"
                           onchange="localdisplay(this, '11','1113');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1113">남동구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1114" class="chkbox" name="selGugun" value="1114"
                           onchange="localdisplay(this, '11','1114');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1114">동구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1115" class="chkbox" name="selGugun" value="1115"
                           onchange="localdisplay(this, '11','1115');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1115">부평구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1116" class="chkbox" name="selGugun" value="1116"
                           onchange="localdisplay(this, '11','1116');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1116">서구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1117" class="chkbox" name="selGugun" value="1117"
                           onchange="localdisplay(this, '11','1117');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1117">연수구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1118" class="chkbox" name="selGugun" value="1118"
                           onchange="localdisplay(this, '11','1118');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1118">옹진군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1119" class="chkbox" name="selGugun" value="1119"
                           onchange="localdisplay(this, '11','1119');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1119">중구</label></span></li>
                     <!-- 광주 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1810" class="chkbox" name="selGugun" value="1810"
                           onchange="localdisplay(this, '18','1810');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1810">광산구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1811" class="chkbox" name="selGugun" value="1811"
                           onchange="localdisplay(this, '18','1811');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1811">남구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1812" class="chkbox" name="selGugun" value="1812"
                           onchange="localdisplay(this, '18','1812');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1812">동구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1813" class="chkbox" name="selGugun" value="1813"
                           onchange="localdisplay(this, '18','1813');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1813">북구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1814" class="chkbox" name="selGugun" value="1814"
                           onchange="localdisplay(this, '18','1814');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1814">서구</label></span></li>
                     <!-- 대전 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1510" class="chkbox" name="selGugun" value="1510"
                           onchange="localdisplay(this, '15','1510');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1510">대덕구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1511" class="chkbox" name="selGugun" value="1511"
                           onchange="localdisplay(this, '15','1511');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1511">동구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1512" class="chkbox" name="selGugun" value="1512"
                           onchange="localdisplay(this, '15','1512');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1512">서구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1513" class="chkbox" name="selGugun" value="1513"
                           onchange="localdisplay(this, '15','1513');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1513">유성구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1514" class="chkbox" name="selGugun" value="1514"
                           onchange="localdisplay(this, '15','1514');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1514">중구</label></span></li>
                     <!-- 울산 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1910" class="chkbox" name="selGugun" value="1910"
                           onchange="localdisplay(this, '19','1910');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1910">남구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1911" class="chkbox" name="selGugun" value="1911"
                           onchange="localdisplay(this, '19','1911');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1911">동구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1912" class="chkbox" name="selGugun" value="1912"
                           onchange="localdisplay(this, '19','1912');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1912">북구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1913" class="chkbox" name="selGugun" value="1913"
                           onchange="localdisplay(this, '19','1913');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1913">울주군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1914" class="chkbox" name="selGugun" value="1914"
                           onchange="localdisplay(this, '19','1914');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1914">중구</label></span></li>
                     <!-- 세종 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2699" class="chkbox" name="selGugun" value="2699"
                           onchange="localdisplay(this, '26','2699');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2699">세종</label></span></li>
                     <!-- 경기 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1210" class="chkbox" name="selGugun" value="1210"
                           onchange="localdisplay(this, '12','1210');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1210">가평군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1211" class="chkbox" name="selGugun" value="1211"
                           onchange="localdisplay(this, '12','1211');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1211">고양시 덕양구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1212" class="chkbox" name="selGugun" value="1212"
                           onchange="localdisplay(this, '12','1212');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1212">고양시 일산동구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1213" class="chkbox" name="selGugun" value="1213"
                           onchange="localdisplay(this, '12','1213');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1213">고양시 일산서구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1214" class="chkbox" name="selGugun" value="1214"
                           onchange="localdisplay(this, '12','1214');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1214">과천시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1215" class="chkbox" name="selGugun" value="1215"
                           onchange="localdisplay(this, '12','1215');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1215">광명시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1216" class="chkbox" name="selGugun" value="1216"
                           onchange="localdisplay(this, '12','1216');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1216">광주시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1217" class="chkbox" name="selGugun" value="1217"
                           onchange="localdisplay(this, '12','1217');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1217">구리시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1218" class="chkbox" name="selGugun" value="1218"
                           onchange="localdisplay(this, '12','1218');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1218">군포시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1219" class="chkbox" name="selGugun" value="1219"
                           onchange="localdisplay(this, '12','1219');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1219">김포시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1220" class="chkbox" name="selGugun" value="1220"
                           onchange="localdisplay(this, '12','1220');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1220">남양주시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1221" class="chkbox" name="selGugun" value="1221"
                           onchange="localdisplay(this, '12','1221');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1221">동두천시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1222" class="chkbox" name="selGugun" value="1222"
                           onchange="localdisplay(this, '12','1222');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1222">부천시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1225" class="chkbox" name="selGugun" value="1225"
                           onchange="localdisplay(this, '12','1225');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1225">성남시 분당구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1226" class="chkbox" name="selGugun" value="1226"
                           onchange="localdisplay(this, '12','1226');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1226">성남시 수정구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1227" class="chkbox" name="selGugun" value="1227"
                           onchange="localdisplay(this, '12','1227');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1227">성남시 중원구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1228" class="chkbox" name="selGugun" value="1228"
                           onchange="localdisplay(this, '12','1228');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1228">수원시 권선구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1229" class="chkbox" name="selGugun" value="1229"
                           onchange="localdisplay(this, '12','1229');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1229">수원시 영통구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1230" class="chkbox" name="selGugun" value="1230"
                           onchange="localdisplay(this, '12','1230');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1230">수원시 장안구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1231" class="chkbox" name="selGugun" value="1231"
                           onchange="localdisplay(this, '12','1231');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1231">수원시 팔달구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1232" class="chkbox" name="selGugun" value="1232"
                           onchange="localdisplay(this, '12','1232');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1232">시흥시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1233" class="chkbox" name="selGugun" value="1233"
                           onchange="localdisplay(this, '12','1233');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1233">안산시 단원구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1234" class="chkbox" name="selGugun" value="1234"
                           onchange="localdisplay(this, '12','1234');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1234">안산시 상록구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1235" class="chkbox" name="selGugun" value="1235"
                           onchange="localdisplay(this, '12','1235');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1235">안성시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1236" class="chkbox" name="selGugun" value="1236"
                           onchange="localdisplay(this, '12','1236');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1236">안양시 동안구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1237" class="chkbox" name="selGugun" value="1237"
                           onchange="localdisplay(this, '12','1237');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1237">안양시 만안구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1238" class="chkbox" name="selGugun" value="1238"
                           onchange="localdisplay(this, '12','1238');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1238">양주시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1239" class="chkbox" name="selGugun" value="1239"
                           onchange="localdisplay(this, '12','1239');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1239">양평군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1240" class="chkbox" name="selGugun" value="1240"
                           onchange="localdisplay(this, '12','1240');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1240">여주시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1241" class="chkbox" name="selGugun" value="1241"
                           onchange="localdisplay(this, '12','1241');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1241">연천군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1242" class="chkbox" name="selGugun" value="1242"
                           onchange="localdisplay(this, '12','1242');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1242">오산시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1243" class="chkbox" name="selGugun" value="1243"
                           onchange="localdisplay(this, '12','1243');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1243">용인시 기흥구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1244" class="chkbox" name="selGugun" value="1244"
                           onchange="localdisplay(this, '12','1244');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1244">용인시 수지구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1245" class="chkbox" name="selGugun" value="1245"
                           onchange="localdisplay(this, '12','1245');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1245">용인시 처인구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1246" class="chkbox" name="selGugun" value="1246"
                           onchange="localdisplay(this, '12','1246');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1246">의왕시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1247" class="chkbox" name="selGugun" value="1247"
                           onchange="localdisplay(this, '12','1247');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1247">의정부시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1248" class="chkbox" name="selGugun" value="1248"
                           onchange="localdisplay(this, '12','1248');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1248">이천시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1249" class="chkbox" name="selGugun" value="1249"
                           onchange="localdisplay(this, '12','1249');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1249">파주시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1250" class="chkbox" name="selGugun" value="1250"
                           onchange="localdisplay(this, '12','1250');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1250">평택시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1251" class="chkbox" name="selGugun" value="1251"
                           onchange="localdisplay(this, '12','1251');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1251">포천시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1252" class="chkbox" name="selGugun" value="1252"
                           onchange="localdisplay(this, '12','1252');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1252">하남시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1253" class="chkbox" name="selGugun" value="1253"
                           onchange="localdisplay(this, '12','1253');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1253">화성시</label></span></li>
                     <!-- 경남 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1610" class="chkbox" name="selGugun" value="1610"
                           onchange="localdisplay(this, '16','1610');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1610">거제시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1611" class="chkbox" name="selGugun" value="1611"
                           onchange="localdisplay(this, '16','1611');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1611">거창군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1612" class="chkbox" name="selGugun" value="1612"
                           onchange="localdisplay(this, '16','1612');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1612">고성군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1613" class="chkbox" name="selGugun" value="1613"
                           onchange="localdisplay(this, '16','1613');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1613">김해시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1614" class="chkbox" name="selGugun" value="1614"
                           onchange="localdisplay(this, '16','1614');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1614">남해군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1615" class="chkbox" name="selGugun" value="1615"
                           onchange="localdisplay(this, '16','1615');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1615">밀양시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1616" class="chkbox" name="selGugun" value="1616"
                           onchange="localdisplay(this, '16','1616');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1616">사천시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1617" class="chkbox" name="selGugun" value="1617"
                           onchange="localdisplay(this, '16','1617');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1617">산청군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1618" class="chkbox" name="selGugun" value="1618"
                           onchange="localdisplay(this, '16','1618');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1618">양산시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1619" class="chkbox" name="selGugun" value="1619"
                           onchange="localdisplay(this, '16','1619');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1619">의령군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1620" class="chkbox" name="selGugun" value="1620"
                           onchange="localdisplay(this, '16','1620');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1620">진주시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1621" class="chkbox" name="selGugun" value="1621"
                           onchange="localdisplay(this, '16','1621');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1621">창녕군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1622" class="chkbox" name="selGugun" value="1622"
                           onchange="localdisplay(this, '16','1622');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1622">창원시 마산합포구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1623" class="chkbox" name="selGugun" value="1623"
                           onchange="localdisplay(this, '16','1623');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1623">창원시 마산회원구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1624" class="chkbox" name="selGugun" value="1624"
                           onchange="localdisplay(this, '16','1624');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1624">창원시 성산구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1625" class="chkbox" name="selGugun" value="1625"
                           onchange="localdisplay(this, '16','1625');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1625">창원시 의창구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1626" class="chkbox" name="selGugun" value="1626"
                           onchange="localdisplay(this, '16','1626');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1626">창원시 진해구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1627" class="chkbox" name="selGugun" value="1627"
                           onchange="localdisplay(this, '16','1627');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1627">통영시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1628" class="chkbox" name="selGugun" value="1628"
                           onchange="localdisplay(this, '16','1628');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1628">하동군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1629" class="chkbox" name="selGugun" value="1629"
                           onchange="localdisplay(this, '16','1629');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1629">함안군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1630" class="chkbox" name="selGugun" value="1630"
                           onchange="localdisplay(this, '16','1630');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1630">함양군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1631" class="chkbox" name="selGugun" value="1631"
                           onchange="localdisplay(this, '16','1631');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1631">합천군</label></span></li>
                     <!-- 경북 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2010" class="chkbox" name="selGugun" value="2010"
                           onchange="localdisplay(this, '20','2010');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2010">경산시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2011" class="chkbox" name="selGugun" value="2011"
                           onchange="localdisplay(this, '20','2011');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2011">경주시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2012" class="chkbox" name="selGugun" value="2012"
                           onchange="localdisplay(this, '20','2012');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2012">고령군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2013" class="chkbox" name="selGugun" value="2013"
                           onchange="localdisplay(this, '20','2013');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2013">구미시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2014" class="chkbox" name="selGugun" value="2014"
                           onchange="localdisplay(this, '20','2014');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2014">군위군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2015" class="chkbox" name="selGugun" value="2015"
                           onchange="localdisplay(this, '20','2015');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2015">김천시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2016" class="chkbox" name="selGugun" value="2016"
                           onchange="localdisplay(this, '20','2016');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2016">문경시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2017" class="chkbox" name="selGugun" value="2017"
                           onchange="localdisplay(this, '20','2017');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2017">봉화군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2018" class="chkbox" name="selGugun" value="2018"
                           onchange="localdisplay(this, '20','2018');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2018">상주시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2019" class="chkbox" name="selGugun" value="2019"
                           onchange="localdisplay(this, '20','2019');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2019">성주군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2020" class="chkbox" name="selGugun" value="2020"
                           onchange="localdisplay(this, '20','2020');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2020">안동시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2021" class="chkbox" name="selGugun" value="2021"
                           onchange="localdisplay(this, '20','2021');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2021">영덕군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2022" class="chkbox" name="selGugun" value="2022"
                           onchange="localdisplay(this, '20','2022');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2022">영양군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2023" class="chkbox" name="selGugun" value="2023"
                           onchange="localdisplay(this, '20','2023');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2023">영주시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2024" class="chkbox" name="selGugun" value="2024"
                           onchange="localdisplay(this, '20','2024');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2024">영천시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2025" class="chkbox" name="selGugun" value="2025"
                           onchange="localdisplay(this, '20','2025');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2025">예천군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2026" class="chkbox" name="selGugun" value="2026"
                           onchange="localdisplay(this, '20','2026');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2026">울릉군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2027" class="chkbox" name="selGugun" value="2027"
                           onchange="localdisplay(this, '20','2027');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2027">울진군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2028" class="chkbox" name="selGugun" value="2028"
                           onchange="localdisplay(this, '20','2028');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2028">의성군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2029" class="chkbox" name="selGugun" value="2029"
                           onchange="localdisplay(this, '20','2029');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2029">청도군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2030" class="chkbox" name="selGugun" value="2030"
                           onchange="localdisplay(this, '20','2030');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2030">청송군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2031" class="chkbox" name="selGugun" value="2031"
                           onchange="localdisplay(this, '20','2031');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2031">칠곡군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2032" class="chkbox" name="selGugun" value="2032"
                           onchange="localdisplay(this, '20','2032');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2032">포항시 남구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2033" class="chkbox" name="selGugun" value="2033"
                           onchange="localdisplay(this, '20','2033');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2033">포항시 북구</label></span></li>
                     <!-- 충남 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1710" class="chkbox" name="selGugun" value="1710"
                           onchange="localdisplay(this, '17','1710');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1710">계룡시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1711" class="chkbox" name="selGugun" value="1711"
                           onchange="localdisplay(this, '17','1711');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1711">공주시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1712" class="chkbox" name="selGugun" value="1712"
                           onchange="localdisplay(this, '17','1712');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1712">금산군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1713" class="chkbox" name="selGugun" value="1713"
                           onchange="localdisplay(this, '17','1713');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1713">논산시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1714" class="chkbox" name="selGugun" value="1714"
                           onchange="localdisplay(this, '17','1714');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1714">당진시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1715" class="chkbox" name="selGugun" value="1715"
                           onchange="localdisplay(this, '17','1715');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1715">보령시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1716" class="chkbox" name="selGugun" value="1716"
                           onchange="localdisplay(this, '17','1716');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1716">부여군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1717" class="chkbox" name="selGugun" value="1717"
                           onchange="localdisplay(this, '17','1717');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1717">서산시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1718" class="chkbox" name="selGugun" value="1718"
                           onchange="localdisplay(this, '17','1718');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1718">서천군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1719" class="chkbox" name="selGugun" value="1719"
                           onchange="localdisplay(this, '17','1719');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1719">아산시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1720" class="chkbox" name="selGugun" value="1720"
                           onchange="localdisplay(this, '17','1720');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1720">연기군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1721" class="chkbox" name="selGugun" value="1721"
                           onchange="localdisplay(this, '17','1721');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1721">예산군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1722" class="chkbox" name="selGugun" value="1722"
                           onchange="localdisplay(this, '17','1722');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1722">천안시 동남구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1723" class="chkbox" name="selGugun" value="1723"
                           onchange="localdisplay(this, '17','1723');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1723">천안시 서북구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1724" class="chkbox" name="selGugun" value="1724"
                           onchange="localdisplay(this, '17','1724');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1724">청양군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1725" class="chkbox" name="selGugun" value="1725"
                           onchange="localdisplay(this, '17','1725');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1725">태안군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun1726" class="chkbox" name="selGugun" value="1726"
                           onchange="localdisplay(this, '17','1726');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun1726">홍성군</label></span></li>
                     <!-- 충북 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2210" class="chkbox" name="selGugun" value="2210"
                           onchange="localdisplay(this, '22','2210');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2210">괴산군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2211" class="chkbox" name="selGugun" value="2211"
                           onchange="localdisplay(this, '22','2211');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2211">단양군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2212" class="chkbox" name="selGugun" value="2212"
                           onchange="localdisplay(this, '22','2212');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2212">보은군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2213" class="chkbox" name="selGugun" value="2213"
                           onchange="localdisplay(this, '22','2213');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2213">영동군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2214" class="chkbox" name="selGugun" value="2214"
                           onchange="localdisplay(this, '22','2214');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2214">옥천군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2215" class="chkbox" name="selGugun" value="2215"
                           onchange="localdisplay(this, '22','2215');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2215">음성군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2216" class="chkbox" name="selGugun" value="2216"
                           onchange="localdisplay(this, '22','2216');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2216">제천시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2217" class="chkbox" name="selGugun" value="2217"
                           onchange="localdisplay(this, '22','2217');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2217">증평군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2218" class="chkbox" name="selGugun" value="2218"
                           onchange="localdisplay(this, '22','2218');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2218">진천군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2220" class="chkbox" name="selGugun" value="2220"
                           onchange="localdisplay(this, '22','2220');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2220">청주시 상당구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2221" class="chkbox" name="selGugun" value="2221"
                           onchange="localdisplay(this, '22','2221');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2221">청주시 흥덕구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2223" class="chkbox" name="selGugun" value="2223"
                           onchange="localdisplay(this, '22','2223');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2223">청주시 서원구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2224" class="chkbox" name="selGugun" value="2224"
                           onchange="localdisplay(this, '22','2224');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2224">청주시 청원구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2222" class="chkbox" name="selGugun" value="2222"
                           onchange="localdisplay(this, '22','2222');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2222">충주시</label></span></li>
                     <!-- 전남 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2410" class="chkbox" name="selGugun" value="2410"
                           onchange="localdisplay(this, '24','2410');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2410">강진군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2411" class="chkbox" name="selGugun" value="2411"
                           onchange="localdisplay(this, '24','2411');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2411">고흥군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2412" class="chkbox" name="selGugun" value="2412"
                           onchange="localdisplay(this, '24','2412');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2412">곡성군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2413" class="chkbox" name="selGugun" value="2413"
                           onchange="localdisplay(this, '24','2413');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2413">광양시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2414" class="chkbox" name="selGugun" value="2414"
                           onchange="localdisplay(this, '24','2414');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2414">구례군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2415" class="chkbox" name="selGugun" value="2415"
                           onchange="localdisplay(this, '24','2415');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2415">나주시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2416" class="chkbox" name="selGugun" value="2416"
                           onchange="localdisplay(this, '24','2416');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2416">담양군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2417" class="chkbox" name="selGugun" value="2417"
                           onchange="localdisplay(this, '24','2417');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2417">목포시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2418" class="chkbox" name="selGugun" value="2418"
                           onchange="localdisplay(this, '24','2418');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2418">무안군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2419" class="chkbox" name="selGugun" value="2419"
                           onchange="localdisplay(this, '24','2419');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2419">보성군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2420" class="chkbox" name="selGugun" value="2420"
                           onchange="localdisplay(this, '24','2420');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2420">순천시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2421" class="chkbox" name="selGugun" value="2421"
                           onchange="localdisplay(this, '24','2421');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2421">신안군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2422" class="chkbox" name="selGugun" value="2422"
                           onchange="localdisplay(this, '24','2422');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2422">여수시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2423" class="chkbox" name="selGugun" value="2423"
                           onchange="localdisplay(this, '24','2423');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2423">영광군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2424" class="chkbox" name="selGugun" value="2424"
                           onchange="localdisplay(this, '24','2424');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2424">영암군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2425" class="chkbox" name="selGugun" value="2425"
                           onchange="localdisplay(this, '24','2425');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2425">완도군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2426" class="chkbox" name="selGugun" value="2426"
                           onchange="localdisplay(this, '24','2426');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2426">장성군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2427" class="chkbox" name="selGugun" value="2427"
                           onchange="localdisplay(this, '24','2427');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2427">장흥군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2428" class="chkbox" name="selGugun" value="2428"
                           onchange="localdisplay(this, '24','2428');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2428">진도군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2429" class="chkbox" name="selGugun" value="2429"
                           onchange="localdisplay(this, '24','2429');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2429">함평군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2430" class="chkbox" name="selGugun" value="2430"
                           onchange="localdisplay(this, '24','2430');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2430">해남군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2431" class="chkbox" name="selGugun" value="2431"
                           onchange="localdisplay(this, '24','2431');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2431">화순군</label></span></li>
                     <!-- 전북 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2110" class="chkbox" name="selGugun" value="2110"
                           onchange="localdisplay(this, '21','2110');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2110">고창군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2111" class="chkbox" name="selGugun" value="2111"
                           onchange="localdisplay(this, '21','2111');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2111">군산시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2112" class="chkbox" name="selGugun" value="2112"
                           onchange="localdisplay(this, '21','2112');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2112">김제시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2113" class="chkbox" name="selGugun" value="2113"
                           onchange="localdisplay(this, '21','2113');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2113">남원시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2114" class="chkbox" name="selGugun" value="2114"
                           onchange="localdisplay(this, '21','2114');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2114">무주군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2115" class="chkbox" name="selGugun" value="2115"
                           onchange="localdisplay(this, '21','2115');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2115">부안군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2116" class="chkbox" name="selGugun" value="2116"
                           onchange="localdisplay(this, '21','2116');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2116">순창군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2117" class="chkbox" name="selGugun" value="2117"
                           onchange="localdisplay(this, '21','2117');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2117">완주군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2118" class="chkbox" name="selGugun" value="2118"
                           onchange="localdisplay(this, '21','2118');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2118">익산시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2119" class="chkbox" name="selGugun" value="2119"
                           onchange="localdisplay(this, '21','2119');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2119">임실군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2120" class="chkbox" name="selGugun" value="2120"
                           onchange="localdisplay(this, '21','2120');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2120">장수군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2121" class="chkbox" name="selGugun" value="2121"
                           onchange="localdisplay(this, '21','2121');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2121">전주시 덕진구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2122" class="chkbox" name="selGugun" value="2122"
                           onchange="localdisplay(this, '21','2122');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2122">전주시 완산구</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2123" class="chkbox" name="selGugun" value="2123"
                           onchange="localdisplay(this, '21','2123');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2123">정읍시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2124" class="chkbox" name="selGugun" value="2124"
                           onchange="localdisplay(this, '21','2124');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2124">진안군</label></span></li>
                     <!-- 강원 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2310" class="chkbox" name="selGugun" value="2310"
                           onchange="localdisplay(this, '23','2310');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2310">강릉시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2311" class="chkbox" name="selGugun" value="2311"
                           onchange="localdisplay(this, '23','2311');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2311">고성군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2312" class="chkbox" name="selGugun" value="2312"
                           onchange="localdisplay(this, '23','2312');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2312">동해시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2313" class="chkbox" name="selGugun" value="2313"
                           onchange="localdisplay(this, '23','2313');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2313">삼척시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2314" class="chkbox" name="selGugun" value="2314"
                           onchange="localdisplay(this, '23','2314');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2314">속초시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2315" class="chkbox" name="selGugun" value="2315"
                           onchange="localdisplay(this, '23','2315');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2315">양구군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2316" class="chkbox" name="selGugun" value="2316"
                           onchange="localdisplay(this, '23','2316');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2316">양양군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2317" class="chkbox" name="selGugun" value="2317"
                           onchange="localdisplay(this, '23','2317');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2317">영월군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2318" class="chkbox" name="selGugun" value="2318"
                           onchange="localdisplay(this, '23','2318');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2318">원주시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2319" class="chkbox" name="selGugun" value="2319"
                           onchange="localdisplay(this, '23','2319');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2319">인제군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2320" class="chkbox" name="selGugun" value="2320"
                           onchange="localdisplay(this, '23','2320');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2320">정선군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2321" class="chkbox" name="selGugun" value="2321"
                           onchange="localdisplay(this, '23','2321');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2321">철원군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2322" class="chkbox" name="selGugun" value="2322"
                           onchange="localdisplay(this, '23','2322');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2322">춘천시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2323" class="chkbox" name="selGugun" value="2323"
                           onchange="localdisplay(this, '23','2323');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2323">태백시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2324" class="chkbox" name="selGugun" value="2324"
                           onchange="localdisplay(this, '23','2324');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2324">평창군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2325" class="chkbox" name="selGugun" value="2325"
                           onchange="localdisplay(this, '23','2325');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2325">홍천군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2326" class="chkbox" name="selGugun" value="2326"
                           onchange="localdisplay(this, '23','2326');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2326">화천군</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2327" class="chkbox" name="selGugun" value="2327"
                           onchange="localdisplay(this, '23','2327');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2327">횡성군</label></span></li>
                     <!-- 제주 -->
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2510" class="chkbox" name="selGugun" value="2510"
                           onchange="localdisplay(this, '25','2510');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2510">서귀포시</label></span></li>
                     <li><span class="input "> <input type="checkbox"
                           id="selGugun2511" class="chkbox" name="selGugun" value="2511"
                           onchange="localdisplay(this, '25','2511');"><label style="font-weight: 400; margin-left: 5px;"
                           for="selGugun2511">제주시</label></span></li>
                  </ul>
               </div>
                  <div style="display: flex">
                     <button type="button" id="exitarea" class="xs-border-btn" onclick="deletelocation()"
                     style="display: none; margin-right: 5px;">취소</button>
                     <button type="button" id="savearea" class="xs-color-btn" onclick="exitLocation()" style="display: none">확인</button>
                  </div>
            </div>
            <script type="text/javascript">
            	$("#tagarea").click(function(){
            		$("#exitarea").css("display","block");
            		$("#savearea").css("display","block");
            	})
               //디폴트값 서울
               window.onload = function() {
                  setSido(10);
               };
               //취소누르면 입력값 및 체크박스 삭제
               function deletelocation() {
                  var checkedBoxes = document
                        .querySelectorAll('#ulGugun input[type="checkbox"]:checked');
                  var areaInput = document.getElementById('areainput');
                  for (var i = 0; i < checkedBoxes.length; i++) {
                     checkedBoxes[i].checked = false;
                     areaInput.value = "";
                  }
               }
               //시/도 div 보이게
               function selectLocation() {
                  var dllocal = document.getElementById("dllocal");
                  dllocal.style.display = "block";
               }
               //시/도 div 사라지게
               function exitLocation() {
                  var dllocal = document.getElementById("dllocal");
                  dllocal.style.display = "none";
                $("#exitarea").css("display","none");
          		$("#savearea").css("display","none");
               }
               //체크박스 클릭시 span태그에 입력
               function localdisplay() {
                  var checkedBoxes = document
                        .querySelectorAll('#ulGugun input[type="checkbox"]:checked');
                  var areaInput = document.getElementById('areainput');
                  if (checkedBoxes.length > 3) {
                     alert('최대 3개까지만 선택 가능합니다.');
                     for (var i = 0; i < checkedBoxes.length; i++) {
                        checkedBoxes[i].checked = false;
                        areaInput.value = "";
                     }
                     return;
                  }
                  //입력
					var selectedLocations = [];
					for (var i = 0; i < checkedBoxes.length; i++) {
					  var cb = checkedBoxes[i].value;
					  var cnt = checkedBoxes[i].nextSibling.textContent.trim();
					  var location = '';
					  switch(true) {
					    case (cb < 1100):
					      location = "서울 ";
					      break;
					    case (cb < 1200):
					      location = "인천 ";
					      break;
					    case (cb < 1300):
					      location = "경기 ";
					      break;
					    case (cb < 1400):
					      location = "부산 ";
					      break;
					    case (cb < 1500):
					      location = "대구 ";
					      break;
					    case (cb < 1600):
					      location = "대전 ";
					      break;
					    case (cb < 1700):
					      location = "경남 ";
					      break;
					    case (cb < 1800):
					      location = "충남 ";
					      break;
					    case (cb < 1900):
					      location = "광주 ";
					      break;
					    case (cb < 2000):
					      location = "울산 ";
					      break;
					    case (cb < 2100):
					      location = "경북 ";
					      break;
					    case (cb < 2200):
					      location = "전북 ";
					      break;
					    case (cb < 2300):
					      location = "충북 ";
					      break;
					    case (cb < 2400):
					      location = "강원 ";
					      break;
					    case (cb < 2500):
					      location = "전남 ";
					      break;
					    case (cb < 2600):
					      location = "제주 ";
					      break;
					    default:
					      location = "세종 ";
					      break;
					  	}
					  	selectedLocations.push(location + cnt);
					}
						areaInput.value = selectedLocations.join(', ');
					}
					function setSido(sidoId) {
						// 기존에 선택되어 있던 체크박스들의 값을 보존
					    var selectedCheckboxes = document.querySelectorAll('#ulGugun input[type="checkbox"]:checked');
					    var selectedValues = [];
					    for (var i = 0; i < selectedCheckboxes.length; i++) {
					        selectedValues.push(selectedCheckboxes[i].value);
					    }
						// 모든 구/군 체크박스를 숨김
						var checkboxes = document
								.querySelectorAll('input[name="selGugun"]');
						for (var i = 0; i < checkboxes.length; i++) {
							checkboxes[i].checked = false;
							checkboxes[i].parentNode.style.display = 'none';
						}

                  // 선택한 시/도에 해당하는 구/군 체크박스만 보여줌
                  var guguns = document
                        .querySelectorAll('input[name="selGugun"][value^="'
                              + sidoId + '"]');
                  for (var j = 0; j < guguns.length; j++) {
                     guguns[j].parentNode.style.display = '';
                  }

                  // 기존에 선택되어 있던 체크박스들의 값을 다시 설정
                   for (var k = 0; k < selectedValues.length; k++) {
                       var checkbox = document.querySelector('#ulGugun input[type="checkbox"][value="' + selectedValues[k] + '"]');
                       if (checkbox) {
                           checkbox.checked = true;
                       }
                   }
               }
            </script>
           <div class="formbold-mb-3">
					<label class="formbold-form-label">직무</label>
					<select
						class="formbold-form-input" name="r_ltask" id="r_ltask">
						<option value="건설/건축">건설/건축</option>
						<option value="공공/복지/봉사/교육">공공/복지/봉사/교육</option>
						<option value="금융/보험">금융/보험</option>
						<option value="기술">기술</option>
						<option value="농업/어업">농업/어업</option>
						<option value="법무">법무</option>
						<option value="사무">사무</option>
						<option value="서비스">서비스</option>
						<option value="생산/제조">생산/제조</option>
						<option value="운송">운송</option>
						<option value="의료">의료</option>
						
					</select>
				</div>

            <div class="formbold-mb-3">
               <label for="r_ltype" class="formbold-form-label">희망고용형태</label> <select
                  class="formbold-form-input" name="r_ltype" id="r_ltype">
                  <option value="정규직">정규직</option>
                  <option value="계약직">계약직</option>
               </select>
            </div>

            <div class="formbold-input-flex">
               <div style="width: 35%">
                  <label for="r_lperiod" class="formbold-form-label"> 희망기간 </label>
                  <input type="text" name="r_lperiod" id="r_lperiod"
                     placeholder="ex) 6개월" value="-" readonly="readonly"
                     class="formbold-form-input" required="required"/>
               </div>
               <div style="width: 65%">
						<label for="r_lday" class="formbold-form-label" style="margin-bottom: 12px"> 요일 </label>
						<!-- <input
							type="text" name="p_workday" id="p_workday"
							placeholder="ex) 월/수/금" class="formbold-form-input" required="required" /> -->
							<div style="border: 1px solid #dde3ec; border-radius:5px; padding: 11px;">
							<input type="checkbox" name="r_lday" class="chkbox" value="월"> 월&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="r_lday" class="chkbox" value="화"> 화&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="r_lday" class="chkbox" value="수"> 수&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="r_lday" class="chkbox" value="목"> 목&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="r_lday" class="chkbox" value="금"> 금&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="r_lday" class="chkbox" value="토"> 토&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="r_lday" class="chkbox" value="일"> 일
							</div>
							<script type="text/javascript">
							$(document).ready(function() {
						        $("#submitBtn").click(function() {
						            if ($(".chkbox:checked").length === 0) {
						                alert("희망 요일을 체크해주세요.");
						                return false;
						            } if ($("#areainput").val().trim() === '') {
						                alert("희망 지역을 선택해주세요.");
						                return false;
						            }
						        });
						    });
							</script>
					</div>
            </div>

            <div class="formbold-mb-3">
                  <label for="r_content" class="formbold-form-label"> 자기소개서</label>
               <ul class="introduceTab__list">
                  <li><button style="margin-left:-40px;"  type="button" id="direct" class="sm-color-btn first on">직접입력</button></li>
                  <li><button type="button" id="auto" class="sm-border-btn">1분 자동완성</button></li>
               </ul>
		       <br><br>
               <script type="text/javascript">
               
	               $("#r_ltype").change(function(){
	           		if($("#r_ltype").val()=="계약직"){
	           			$("#r_lperiod").val("");
	           			$("#r_lperiod").removeAttr("readonly");
	           		}else{
	           			$("#r_lperiod").val("-");
	           			$("#r_lperiod").attr("readonly","readonly");
	           		}
	           		
	           		})
               $(document).ready(function() {
                    // 직접입력 버튼 클릭 시
                    $("#direct").click(function() {
                      // OneMinDoc div 숨기기
                      $("#OneMinDoc").css("display", "none");
                      // 직접입력 버튼에 on 클래스 추가
                      $("#directBtn").addClass("on");
                      // 1분 자동완성 버튼에서 on 클래스 제거
                      $("#autoBtn").removeClass("on");
                      $(".textCount").show();
                    });
                     
                    // 1분 자동완성 버튼 클릭 시
                    $("#auto").click(function() {
                      // OneMinDoc div 보여주기
                      $("#OneMinDoc").css("display", "block");
                      // 1분 자동완성 버튼에 on 클래스 추가
                      $("#autoBtn").addClass("on");
                      // 직접입력 버튼에서 on 클래스 제거
                      $("#directBtn").removeClass("on");
                      $("#personality").show();
                      $("#personality").siblings().hide();
                      $(".textCount").hide();
                    });
                  });
               //웹 브라우저 내부에서만 적용되는 변경, 실제로 서버로 전송되는 데이터는 바뀌지않음
               //배열 - split으로 되는지 확인할것
               </script>

               <div id="OneMinDoc" class="introduceWrap" style="display: none;">

                  <div class="resizable-textarea" style="display: flex; flex-direction: row;">
                     <br>
                     <div style="width:90px; height: 180px;">
                        <ul>
                           <li id="defaultLi" role="button" value="성격" style="color:#416442; margin-top:10px;"><b>성 격</b></li>
                           <li role="button" value="경력사항" style="color:#416442; margin-top:10px;"><b>경력사항</b></li>
                           <li role="button" value="지원동기" style="color:#416442; margin-top:10px;"><b>지원동기</b></li>
                        </ul>
                     </div>
                     <div class="autoResume"
                        style="overflow: scroll; width: 500px; height: 200px;">
                        <table id="personality">
                           <tr>
                              <td style="border-top: 1px solid #cce891">주위 사람들의 기분을 좋게 하는 명쾌하고 활발한 성격을 지니고 있습니다.</td>
                           </tr>
                           <tr>
                              <td>주어진 일만 하는 소극적인 모습보다는 스스로 찾아서 하는 적극적인 성격을 지니고 있습니다.</td>
                           </tr>
                           <tr>
                              <td>시작한 일은 끝까지 마무리하며, 사소한 일도 최선을 다해 이루어내는 강한 마인드로 집중해 나가는 편입니다.</td>
                           </tr>
                           <tr>
                              <td>손과 발이 빨라 업무의 효율성이 다른 사람들보다 높으며, 두 사람 이상의 몫을 혼자 해결한다는 평가를 듣곤 합니다.</td>
                           </tr>
                           <tr>
                              <td>환한 미소와 함께 타인을 배려하며 매사에 적극적으로 도전해 나가는 편입니다.</td>
                           </tr>
                           <tr>
                              <td>긍정적인 마인드와 함께 밝은 모습을 지니고 있어 주위 사람들에게 항상 즐거움을 만들어주는 장점을 지니고 있습니다.</td>
                           </tr>
                           <tr>
                              <td>항상 '최선을 다한다.'는 각오로 임하기 때문에 주위 사람들이 저만의 강한 열정과 끈기를 부러워하는 경우가 많습니다.</td>
                           </tr>
                           <tr>
                              <td>적극적이고 활발한 성격 덕분에 새로운 사람들과도 짧은 기간 동안 친밀한 관계를 형성하는 장점을 지니고 있습니다.</td>
                           </tr>
                           <tr>
                              <td>시간 관념과 약속 준수 등을 통하여 주위 사람들에게 강한 신뢰감을 만들어 주기 위해서 끊임없이 노력하고 있습니다.</td>
                           </tr>
                           <tr>
                              <td>적극적인 성격으로 매사에 직접 부딪히면서 반드시 끝맺음 하는 편입니다.</td>
                           </tr>
                           <!-- 1px solid gray css 한번에 주기 -->
                        </table>

                        <hr>
                        <table id="career">
                           <tr>
                              <td style="border-top: 1px solid #cce891">머리로만 지식을 쌓는 것보다 직접 온 몸으로 다양한 노하우를 쌓는 것이 의미 있다는 것을 사회생활을 통해 깨달을 수 있었습니다.</td>
                           </tr>
                           <tr>
                              <td>긍정적인 마인드를 가지고 매 순간 집중하며 최선을 다하여 맡은 일처리를 깔끔하게 수행하였습니다.</td>
                           </tr>
                           <tr>
                              <td>매장에서 일어나는 다양한 상황에 대처하며 직접적으로 관리하고 효율적으로 업무를 추진하였습니다.</td>
                           </tr>
                           <tr>
                              <td>다양한 경험을 쌓기 위해 매장 서빙과 주방 보조 등 매장에서 할 수 있는 업무는 주저하지 않고 모두 수행하였습니다.</td>
                           </tr>
                           <tr>
                              <td>항상 환한 웃음으로 모든 사람을 대하기 위해 밝고 진실된 모습을 유지하였습니다.</td>
                           </tr>
                           <tr>
                              <td>실무 경험을 직접 쌓으며 보다 가치 있는 나만의 노하우로 업그레이드할 수 있었습니다.</td>
                           </tr>
                           <tr>
                              <td>짧은 기간이지만 특성에 따른 공정 수행과 효율적인 생산관리 경험을 통해 저만의 장점으로 승화시킬 수 있었습니다.</td>
                           </tr>
                           <tr>
                              <td>엑셀, 워드, 파워포인트 등의 문서작성 능력과 인터넷 정보검색 능력이 뛰어납니다.</td>
                           </tr>
                           <tr>
                              <td>적극적인 성격을 바탕으로 스케쥴관리나 보고 서류정리 등의 일상적인 비서 업무 이외에 다양한 업무를 직접 담당하였습니다.</td>
                           </tr>
                           <tr>
                              <td>저만의 창의적인 아이디어로 비효율적인 부분을 개선하면서 좋은 평가를 받을 수 있었습니다.</td>
                           </tr>
                        </table>
                        <table id="motivation">
                           <tr>
                              <td style="border-top: 1px solid #cce891">지금까지 다양한 경험을 통하여 끊임없이 노력하며 제 자신을 업그레이드해 왔습니다.</td>
                           </tr>
                           <tr>
                              <td>귀사에서 최고의 역량과 가치만을 보여 드리기 위해서 과감히 도전합니다.</td>
                           </tr>
                           <tr>
                              <td>기회를 스스로 만들고 넓은 세상을 직접 경험하기 위해서 과감히 도전해 보고자 합니다.</td>
                           </tr>
                           <tr>
                              <td>급변하는 환경에 대한 민첩한 대응을 할 수 있다는 강한 자신감으로 지원하게 되었습니다.</td>
                           </tr>
                           <tr>
                              <td>실무 경험을 통하여 저만의 차별적인 노하우를 쌓을 수 있다고 자신합니다.</td>
                           </tr>
                           <tr>
                              <td>제 능력과 잠재력을 귀사에서 가장 크게 발휘할 수 있다는 자신감이 생겨 이렇게 과감히 도전해 봅니다.</td>
                           </tr>
                           <tr>
                              <td>한 단계 더 제 자신을 업그레이드하여 차별적인 경쟁력을 만들 수 있다는 강한 자신감이 생겨 과감히 도전하고자 합니다.</td>
                           </tr>
                           <tr>
                              <td>지치지 않는 열정과 항상 끊임없이 노력하고 배우는 모습을 꾸준히 유지해 나갈 것입니다.</td>
                           </tr>
                           <tr>
                              <td>깊이 있게 배워 다른 경쟁자들보다 빠르게 업무에 적응할 수 있다고 강하게 자신합니다.</td>
                           </tr>
                           <tr>
                              <td>저는 끊임없이 자기계발에 집중하고, 적극적으로 행동하기 때문에 이 업무에 가장 적합한 인물이라고 생각합니다.</td>
                           </tr>
                           <tr>
                              <td>제가 귀사의 밝은 미래와 차별적인 경쟁력을 동시에 만들어갈 수 있는 핵심인재로 거듭 태어난다면 장기적인 비전과 목표를 설정하고 지치지 않는 열정과 끊임없이 노력하고 배우는 모습을 꾸준히 유지해 나갈 것입니다.</td>
                           </tr>
                           <tr>
                              <td>진정한 프로의 모습으로 성장하기 위해서는 이론적인 기본과 동시에 실무 경험을 통하여 자신만의 차별적인 노하우를 쌓아가는 것을 중요하게 생각합니다.</td>
                           </tr>

                        </table>
                     </div>
                     
                     <script type="text/javascript">
                     document.addEventListener("DOMContentLoaded", function() {
                   	  var tds = document.querySelectorAll(".autoResume table td");
                   	  var textarea = document.getElementById("r_content");

                   	  tds.forEach(function(td) {
                   		    td.addEventListener("click", function() {
                   		      textarea.value += td.innerText + "\n";
                   		    });
                   		  });
                   		});
                        $(".resizable-textarea li").click(
                              function() {

                                 const addr = $(this).attr("value"); //li의 value는 숫자만 가능

                                 if (addr == "성격") {
                                    $("#personality").show();
                                    $("#personality").siblings()
                                          .hide();
                                 } else if (addr == "경력사항") {
                                    $("#career").show();
                                    $("#career").siblings().hide();
                                 } else if (addr == "지원동기") {
                                    $("#motivation").show();
                                    $("#motivation").siblings()
                                          .hide();
                                 }

                              })
                     </script>

						</div>
					</div>
				</div>
								<textarea name="r_content" id="r_content" style="height: 100px;"
								placeholder="나의 강점과 특징을 등록해 보세요!"
								class="rcontent-autoInput" required="required"></textarea>
							<!-- 간편입력시 list와 테이블 나타나게 하여 간편입력 생성 -->
					<br> <div class="form-inline"><input type="checkbox" name="r_private" class="checkbox">
					<span>&nbsp;&nbsp;이력서 비공개</span>
					<span class="textCount" style="float: right">총 0자 / 1000자</span><br>			
									
					</div>
					<script type="text/javascript">
					$('#r_content').keyup(function (e) {
						var content = $(this).val();
						var characterCount = content.replace(/\s/g, '').length;
					    
					    // 글자수 세기
					    if (content.length == 0 || content == '') {
					    	$('.textCount').text('총 0자 / 1000자');
					    } else if(content.length<=1000){
					    	$('.textCount').text('총 ' + content.length + '자 / 1000자');
					    }else{
					    	$('.textCount').text('총 1000자 / 1000자');
					    }
					    
					    // 글자수 제한
					    if (content.length > 1000) {
					    	// 1000자 부터는 타이핑 되지 않도록
					        $(this).val($(this).val().substring(0, 1000));
					        // 1000자 넘으면 알림창 뜨도록
					        alert('글자수는 1000자까지 입력 가능합니다.');
					    };
					});
					
					  var r_private_checkbox = document.querySelector('input[name="r_private"]');
					  
					  r_private_checkbox.addEventListener('change', function() {
					    if (this.checked) {
					      this.value = 1;
					    } else {
					      this.value = 0;
					    }
					  });
					</script>
					<!-- 대표이력서 체크되면 1(대표이력서), 비공개 체크되면 0(공개)되게 해야함 -->
					
               <button id="submitBtn" type="submit" class="formbold-btn">이력서 등록</button>
               <script type="text/javascript">
               </script>
               <!-- 수정시 writeday가 now로 update -->
         </form>
      </div>
   </div>
   <style>
@import
   url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap')
   ;

body {
   font-family: fontAwesome;
}

.formbold-mb-3 {
   margin-bottom: 15px;
}

.formbold-relative {
   position: relative;
}

.formbold-opacity-0 {
   opacity: 0;
}

.formbold-stroke-current {
   stroke: #ffffff;
   z-index: 999;
}

#supportCheckbox:checked ~ div span {
   opacity: 1;
}

#supportCheckbox:checked ~ div {
   background: #4E9F3D;
   border-color: #4E9F3D;
}

.formbold-main-wrapper {
   display: flex;
   align-items: center;
   justify-content: center;
}

.formbold-form-wrapper {
   margin: 0 auto;
   max-width: 570px;
   width: 100%;
   background: white;
}

.formbold-img {
   display: block;
   margin: 0 auto 45px;
}

.formbold-input-wrapp>div {
   display: flex;
   gap: 20px;
}

.formbold-input-flex {
   display: flex;
   gap: 20px;
   margin-bottom: 15px;
}

.formbold-input-flex>div {
   width: 50%;
}

.formbold-form-input {
   width: 100%;
   padding: 13px 22px;
   border-radius: 5px;
   border: 1px solid #dde3ec;
   background: #ffffff;
   font-weight: 500;
   font-size: 16px;
   color: #536387;
   outline: none;
   resize: none;
}
.rcontent-directInput {
   width: 100%;
   height: 500px;
   padding: 13px 22px;
   border-radius: 5px;
   border: 1px solid #dde3ec;
   background: #ffffff;
   font-weight: 500;
   font-size: 16px;
   color: #536387;
   outline: none;
   resize: none;
}
.rcontent-autoInput {
   width: 100%;
   height: 500px;
   padding: 13px 22px;
   border-radius: 5px;
   border: 1px solid #dde3ec;
   background: #ffffff;
   font-weight: 500;
   font-size: 16px;
   color: #536387;
   outline: none;
   resize: none;
}

.formbold-form-input::placeholder, select.formbold-form-input,
   .pcontent-input::placeholder, .formbold-form-input[type='date']::-webkit-datetime-edit-text,
   .formbold-form-input[type='date']::-webkit-datetime-edit-month-field,
   .formbold-form-input[type='date']::-webkit-datetime-edit-day-field,
   .formbold-form-input[type='date']::-webkit-datetime-edit-year-field {
   color: rgba(83, 99, 135, 0.5);
}

.formbold-form-input:focus, .pcontent-input:focus {
   border-color: #4E9F3D;
   box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-form-label {
   color: #536387;
   font-size: 14px;
   line-height: 24px;
   display: block;
   margin-bottom: 10px;
}

.formbold-checkbox-label {
   display: flex;
   cursor: pointer;
   user-select: none;
   font-size: 16px;
   line-height: 24px;
   color: #536387;
}

.formbold-checkbox-label a {
   margin-left: 5px;
   color: #4E9F3D;
}

.formbold-input-checkbox {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   white-space: nowrap;
   border-width: 0;
}

.formbold-checkbox-inner {
   display: flex;
   align-items: center;
   justify-content: center;
   width: 20px;
   height: 20px;
   margin-right: 16px;
   margin-top: 2px;
   border: 0.7px solid #dde3ec;
   border-radius: 3px;
}

.formbold-form-file {
   padding: 12px;
   font-size: 14px;
   line-height: 24px;
   color: rgba(83, 99, 135, 0.5);
}

.formbold-form-file::-webkit-file-upload-button {
   display: none;
}

.formbold-form-file:before {
   content: 'Upload';
   display: inline-block;
   background: #EEEEEE;
   border: 0.5px solid #E7E7E7;
   border-radius: 3px;
   padding: 3px 12px;
   outline: none;
   white-space: nowrap;
   -webkit-user-select: none;
   cursor: pointer;
   color: #637381;
   font-weight: 500;
   font-size: 12px;
   line-height: 16px;
   margin-right: 10px;
}

.formbold-btn {
   font-size: 16px;
   border-radius: 5px;
   padding: 14px 25px;
   border: none;
   font-weight: 500;
   background-color: #4E9F3D;
   color: white;
   cursor: pointer;
   margin-top: 25px;
   float: right;
}

.formbold-btn:hover {
   box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-w-45 {
   width: 45%;
}
</style>
</body>
</html>