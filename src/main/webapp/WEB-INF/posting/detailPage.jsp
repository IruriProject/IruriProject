<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>이루리_ 공고상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet" />
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<c:set var="root" value="<%=request.getContextPath()%>" />
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="${root }/css/postingDetailStyles.css" rel="stylesheet" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e307bbbc3f0eb499cc6f855a21cc9478&libraries=services"></script>
<style>
body {
   position: relative;
}

.nav-color {
   background-color: #e3f2c9;
   color: #4e9f3d;
   border-radius: 5px;
}

.nav-color:hover {
   background-color: white;
   color: #4e9f3d;
   text-decoration: none;
}

.navbar-nav .nav-link.active, .navbar-nav .show>.nav-link, .nav-item.active
   {
   background-color: #4e9f3d;
   color: white;
   border-radius: 5px;
}

.nav-item {
   width: 180px;
   text-align: center;
   font-size: 1.5em;
   font-weight: 600;
   padding-right: 20px;
}

.postingContents {
   display: flex;
   flex-direction: row;
   justify-content: space-between;
}

.postingContent {
   width: 200px;
   height: 80px;
   border: 2px solid #e3f2c9;
   border-radius: 10px;
   margin: 20px;
   text-align: center;
   line-height: 80px;
   font-size: 1.5em;
   margin: 20px;
}

.scpy {
   padding: 0 20px 20px 20px;
   border: 1px solid #e3f2c9;
   margin-bottom: 20px;
}

.cInfos {
   display: flex;
   flex-direction: row;
   justify-content: space-between;
}

.cInfo {
   width: 47%;
   height: 480px;
   border: 1px solid #e3f2c9;
   margin: 10px;
}

.graphs {
   text-align: center;
   line-height: 400px;
}

.withbtn {
   margin: 15px 0;
   display: flex;
   flex-direction: row;
   justify-content: space-between;
}

.withbtnTitle {
   font-size: 2.2em;
}

.modal-header {
   justify-content: flex-end;
}

#e_name{
	color: gray;
	font-size: 12px;
}

.highlight{
	margin-right:5px; 
	padding:3px 10px; 
	background-color:#e3f2c9; 
	border-radius:16px;
}

.heart {
   cursor: pointer;
   font-weight: 500px;
}

.fa-heart {
   color: red;
}

.star{
   cursor: pointer;
}

.fa-star{
   color: yellow;
}
.support{
 	cursor: pointer;
}
.link{
 	cursor: pointer;
}

tr,td{
	text-align: center;
}

</style>
<script type="text/javascript">
   /* 성별 분포도 */
   google.charts.load('current', {   
     packages:['corechart']
   }).then(function () {
            
     $.ajax({
       url: "/posting/gendergraph",
       data:{"p_num":${dto.p_num}},
       dataType: "JSON",
       success: function(result){
          if(result[0].count==0&&result[1].count==0){
             $("#genderChart").html("<span style='font-size:1.5em;'>해당 공고의 지원자가 없습니다.</span>");
          } else
             drawGenderChart(result);
       }
     });

     function drawGenderChart(result) {
       var data = new google.visualization.DataTable();
       data.addColumn('string', 'gender');
       data.addColumn('number', 'count');

       var dataArray = [];

       $.each(result, function(i, obj) {
         dataArray.push([obj.gender, parseInt(obj.count)]);
       });

       data.addRows(dataArray);

       var piechart_options = {
         colors: ['#4E9F3D', '#cce891']
       };
       var piechart = new google.visualization.PieChart(document.getElementById('genderChart'));
       piechart.draw(data, piechart_options);
     }
   });
   
   
   /* 나이 분포도 */
   google.charts.load('current', {   
        packages:['line']
      }).then(function () {
               
        $.ajax({
          url: "/posting/agegraph",
          data:{"p_num":${dto.p_num}},
          dataType: "JSON",
          success: function(result){
             if(result[0].count==0&&result[1].count==0){
                $("#ageChart").html("<span style='font-size:1.5em;'>해당 공고의 지원자가 없습니다.</span>");
             } else
                drawGenderChart(result);
          }
        });

        function drawGenderChart(result) {
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'age');
          data.addColumn('number', 'count');

          var dataArray = [];

          $.each(result, function(i, obj) {
            dataArray.push([obj.age, parseInt(obj.count)]);
          });

          data.addRows(dataArray);

          var linechart_options = {
            series: {
                  0: {color: '#4E9F3D'}
            },
            legend: 'none',
            vAxis:{
               format:'0 명'
            }
          };
          var linechart = new google.visualization.LineChart(document.getElementById('ageChart'));
          linechart.draw(data, linechart_options);
        }
      });
      
   
   
   /* 지도 */
   $(function(){
      var mapContainer = document.getElementById('enterMap'), // 지도를 표시할 div 
       mapOption = {
           center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
           level: 5 // 지도의 확대 레벨
       };  
   
      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
   
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();
   
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${dto.e_addr}', function(result, status) {
   
          // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {
   
              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
   
              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
              });
   
              // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                  content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.e_name}</div>'
              });
              infowindow.open(map, marker);
   
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
          } 
      });    
   });
</script>
</head>
<body>
   <!-- Page content-->
   <div class="mt-5">
      <div class="row">
         <div>
            <!-- Post content-->

            <!-- Post header-->
            <header class="mb-4">
               <!-- Post title-->
               <div class="withbtn">
                     <div class="withbtnTitle fw-bolder mb-1"
                        style="color: #41644a; font-size: 2em">[${dto.p_status}]&nbsp;${dto.p_title }</div>
                        <input type="hidden" id="p_num" value="${dto.p_num }">
                     <div>
                        <c:if
                           test="${sessionScope.loginStatus!=null&&sessionScope.loginStatus=='user' }">
						   
						   <!-- 지원하기 -->
						   <c:if test="${rsize==0 }">
						   <span class="support" onclick="noResume()">지원하기 <i class="fa-solid fa-envelope-open-text"></i></span>&nbsp;&nbsp;
						   
						   <script type="text/javascript">
						   function noResume(){
							   
							   const a=confirm("등록된 이력서가 없습니다.\n 이력서 등록 페이지로 이동하시겠습니까?");
							   
							   if(a){
								   location.href="/insertresume";
							   }else{
								   return;
							   }
						   }
						   </script>
						   
			               </c:if>
			               
			               <c:if test="${rsize>0 }">
                           <span class="support" data-toggle="modal" data-target="#myModal">지원하기 <i class="fa-solid fa-envelope-open-text"></i></span>&nbsp;&nbsp;
			               </c:if>

                           <!-- 기스크랩 시 스크랩 해제 -->
                           <c:if test="${s_num!=null }">
                           <input type="hidden" id="s_num" value="${s_num }">
                              <span class="star" id="btnUnScrap">공고 스크랩 해제 <i class="fa-solid fa-star"></i></span>&nbsp;&nbsp;
                           </c:if>
                           
                           <!-- 비스크랩 시 스크랩 가능 -->
                           <c:if test="${s_num==null }">
                              <span class="star" id="btnScrap">공고 스크랩 <i class="fa-regular fa-star"></i></span>&nbsp;&nbsp;
                           </c:if>
                           
                        </c:if>

                        <c:if
                           test="${sessionScope.loginStatus=='enterprise'&&sessionScope.loginId==dto.e_id }">
                           <button type="button" class="btn btn-info mt-2" onclick="location.href='/posting/update?p_num=${dto.p_num}'">수정</button>
                           <button type="button" class="btn btn-info mt-2" onclick="location.href='confirmpw?p_num=${dto.p_num}'">삭제</button>
                           <button type="button" class="btn btn-info mt-2" onclick="reloadAlert()">끌어올리기</button>
                        </c:if>
                        <span class="link" onclick="copyUrl()">링크 복사 <i class="fa-solid fa-link"></i></span>&nbsp;&nbsp;
                     </div>
                  </div>
                  
                  <script type="text/javascript">
            
                     //스크랩
                     $("#btnScrap").click(function(){
                        
                        const p_num=$("#p_num").val();   
                        const u_num=$("#u_num").val();   
                        
                        $.ajax({
                           type:"post",
                           dataType:"html",
                           url:"/sinsert",
                           data:{
                              "p_num":p_num,
                              "u_num":u_num
                           },
                           success:function(res){
                              alert("스크랩 성공");
                              location.reload();
                           }
                        })
                        
                        
                     });
                     
                     $("#btnUnScrap").click(function(){
                        
                        var s_num=$("#s_num").val();
                        
                        $.ajax({
                           type:"get",
                           dataType:"html",
                           url:"/sdelete",
                           data:{
                              "s_num":s_num
                           },
                           success:function(res){
                              alert("스크랩 해제");
                              location.reload();
                           }
                        })
                        
                        
                     });
                  
                  </script>
                  

               <!-- 지원하기 모달 -->

               <!-- Modal -->
               <div class="modal fade" id="myModal" role="dialog">
               <div class="modal-dialog modal-lg">
               
               <div class="modal-content">
                  <div class="modal-header">
                  
                     <h4 class="modal-title">${dto.p_title } <span id="e_name">${dto.e_name } </span>&nbsp;</h4>
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>
                        <div class="modal-body">
                           <form action="/apply" method="post">
                              <table class="table table-borderless" style="width: 700px; margin: 0 auto;">
                                 <tr>
                                    <td>선택</td>
                                    <td>제목</td>
                                    <td>공개여부</td>
                                    <td>작성일</td>
                                 </tr>
                                 <input type="hidden" name="p_num" value="${dto.p_num }">
                                 <input type="hidden" name="currentPage" value="${currentPage }">
                                 
                                 <c:forEach var="udto" items="${rlist }">
                                    <tr>
                                       <td width="50"><input type="radio" name="r_num"
                                          value="${udto.r_num }" required></td>
                                       <td><c:if test="${udto.r_presume==1 }">
                                       <b class="highlight">대표</b></c:if>
                                          ${udto.r_title } <br></td>
                                       <td><c:if test="${udto.r_private==0 }"><b class="highlight">X</b></c:if> <c:if
                                             test="${udto.r_private==1 }"><b class="highlight">O</b></c:if></td>
                                       <td><fmt:formatDate value="${udto.r_writeday}"
                                             pattern="yyyy.MM.dd" /></td>
                                    </tr>
                                 </c:forEach>
                                 <tr>
                                    <td colspan="4" align="center">
                                    <button type="submit" class="btn btn-default btn-sm"
                                     onclick="checkApply(${checkApply})">지원</button>
                                    </td>
                                 </tr>
                              </table>
                           </form>
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-default btn-sm"
                              data-dismiss="modal">닫기</button>
                        </div>
                     </div>
                  </div>
               </div>
         </div>
      </div>

      <script type="text/javascript">
                  
         function reloadAlert(){
            const p_num=$("#p_num").val();   
            const a=confirm("게시글을 끌어올리시겠습니까? \n 공고 마감일이 일주일 뒤로 연장됩니다.");
            
            if(a){
               location.href="/posting/reposting?p_num="+p_num;
            }else{
               return false;
            }
         }
         
         //현재 url 변수로 가져오기
         let nowUrl = window.location.href;

         function copyUrl(){ 
           //nowUrl 변수에 담긴 주소를 복사
              navigator.clipboard.writeText(nowUrl).then(res=>{
              alert("주소가 복사되었습니다");
            })
         }
         
         function checkApply(check){
        	 if(check>0){
        		 const a=confirm("이미 지원한 공고입니다. 재지원하시겠습니까?");
        		 
        		 if(a){
        			 alert("지원이 완료되었습니다.");
        		 }else{
        			 //location.href="/posting/detailpage?p_num="+pnum+"&currentPage="+currentPage;
        			 event.preventDefault();
        		 }
        	 }else{
        		 alert("지원이 완료되었습니다.");
        	 }
        	 
     	 }
                  
      </script>

      <!-- Post meta content-->
      <div class="text-muted fst-italic mb-2">
         <b>${dto.e_name }</b> / 공고일 :
         <fmt:formatDate value="${dto.p_writeday }" pattern="yyyy-MM-dd" />
         <span style="float: right">&nbsp;&nbsp;/&nbsp;&nbsp;스크랩 :
            ${scrapCount}명</span> <span style="float: right">열람 : ${viewerCount }명</span>
      </div>

      </header>

      <!-- Post content-->
      <section class="mb-4">
         <div class="postingContents">
            <div class="postingContent">
            	<span style="font-size: 0.8em; color: #416442;"><c:if test="${dto.p_employtype=='정규직' }">연&nbsp;</c:if></span>
            	<span style="font-size: 0.8em; color: #416442;"><c:if test="${dto.p_employtype=='계약직' }">월&nbsp;</c:if></span>
               <fmt:formatNumber value="${dto.p_pay }" type="currency" />
            </div>
            <div class="postingContent">${dto.p_period }</div>
            <div class="postingContent">
            	<c:if test="${dto.p_workday == '월/화/수/목/금' }">
            		평일
            	</c:if>
            	<c:if test="${dto.p_workday == '토/일' }">
            		주말
            	</c:if>
            	<c:if test="${dto.p_workday != '월/화/수/목/금' && dto.p_workday != '토/일'}">
            		${dto.p_workday }
            	</c:if>
            </div>
            <div class="postingContent">
               <fmt:formatDate value="${dto.p_starttime }" pattern="HH:mm" />
               &nbsp;~&nbsp;
               <fmt:formatDate value="${dto.p_endtime }" pattern="HH:mm" />
            </div>
         </div>
      </section>
      <br>

      <!-- 스크롤스파이 -->
      <div class="scroll mb-4" data-bs-spy="scroll" data-bs-target=".navbar"
         data-bs-offset="50">
         <nav class="navbar navbar-expand-sm nav-bg">
            <div class="container-fluid justify-content-center">
               <ul class="navbar-nav">
                  <li class="nav-item"><a class="nav-link nav-color"
                     href="#section1">모집조건</a></li>
                  <li class="nav-item"><a class="nav-link nav-color"
                     href="#section2">상세내용</a></li>
                  <li class="nav-item"><a class="nav-link nav-color"
                     href="#section3">기업정보</a></li>
               </ul>
            </div>
         </nav>
         <div id="section1" class="container-fluid scpy">
            <h2>모집조건</h2>
            <p>직종: ${dto.p_type }</p>
            <p>고용형태: ${dto.p_employtype }</p>
            <p>
               모집기간:
               <fmt:formatDate value="${dto.p_startdate }" pattern="yyyy-MM-dd" />
               ~
               <fmt:formatDate value="${dto.p_enddate }" pattern="yyyy-MM-dd" />
            </p>
            <p>채용인원: ${dto.p_hirenum }명</p>
         </div>

         <div id="section2" class="container-fluid scpy">
            <div class="withbtn">
               <div class="withbtnTitle">상세내용</div>
               <div>
                  <button type="button" class="btn btn-info">확대하기 +</button>
               </div>
            </div>

			<p id="txt">${dto.p_content }</p>
			
			<script>
				$(function(){
					var text = $("#txt").text();
					text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
					$("#txt").html(text);
				})
			</script>
			
         </div>

         <div id="section3" class="container-fluid scpy">
            <div class="withbtn">
               <div class="withbtnTitle">기업정보</div>
               <div class="likeEnter">
                  <input type="hidden" id="u_num" value="${u_num }"> <input
                     type="hidden" id="e_num" value="${dto.e_num }">
                  <c:if
                     test="${sessionScope.loginStatus!=null&&sessionScope.loginStatus=='user' }">

                     <!-- 기좋아요 시 좋아요 해제 -->
                     <c:if test="${hdto.h_num!=null }">
                        <input type="hidden" id="h_num" value="${h_num }">
                        <span class="heart" id="btnUnLikeEnter">좋아요 <i
                           class="fa-solid fa-heart"></i></span>
                     </c:if>


                     <!-- 비좋아요 시 좋아요 가능 -->
                     <c:if test="${hdto.h_num==null }">
                        <span class="heart" id="btnLikeEnter">좋아요 <i
                           class="fa-regular fa-heart"></i></span>
                     </c:if>

                  </c:if>
               </div>
            </div>

            <script type="text/javascript">
         
         $("#btnLikeEnter").click(function(){
         
         var e_num=$("#e_num").val();
         var u_num=$("#u_num").val();

         $.ajax({
            
            type:"post",
            dataType:"html",
            data:{
               "e_num":e_num,
               "u_num":u_num
            },
            url:"/hinsert",
            success:function(res){
               alert("좋아요성공");
               location.reload();
               //$(this).addClass("fa-solid");
               //$(this).removeClass("fa-regular");
            }
         })
         
         });
         
         
         $("#btnUnLikeEnter").click(function(){
            
            var h_num=$("#h_num").val();
            
            $.ajax({
               
               type:"get",
               dataType:"html",
               data:{
                  "h_num":h_num
               },
               url:"/hdelete",
               success:function(res){
                  alert("좋아요 해제");
                  location.reload();
               }
               
            })
         });
         
   </script>

            <p>기업명: ${dto.e_name }</p>
            <p>사업자등록번호: ${dto.e_registnum }</p>
            <p>전화번호: ${dto.e_tel }</p>
            <p>회사주소: ${dto.e_addr }</p>
            <p>이메일: ${dto.e_email }</p>
         </div>
      </div>

      <!-- 그래프-->
      <section class="mb-4 mt-5">
         <div class="cInfos">
            <div class="cInfo graphs">
               <h3>지원자 성별 분포도</h3>
               <div id="genderChart" style="width: 100%; height: 380px"></div>
            </div>
            <div class="cInfo graphs">
               <h3>지원자 연령 분포도</h3>
               <div id="ageChart" style="width: 100%; height: 380px"></div>
            </div>
         </div>
      </section>
      <br>
      <!-- 근무지정보-->
      <section class="mb-4 mt-5" style="border: 1px solid #e3f2c9">

         <h3>근무지정보</h3>
         <div style="width: 100%; height: 500px;">
            <span>기업명 : ${dto.e_name }</span><br> <span>회사주소 :
               ${dto.e_addr }</span><br> <br>
            <div style="width: 100%; height: 85%" id="enterMap"></div>
         </div>
      </section>

   </div>
   <button type="button" onclick="location.href='/posting/search?currentPage=${currentPage}'" class="btn btn-default" style="width: 100px;">뒤로가기</button>
   </div>
   </div>

   <script src="https://kit.fontawesome.com/2663817d27.js"
      crossorigin="anonymous"></script>

</body>
</html>