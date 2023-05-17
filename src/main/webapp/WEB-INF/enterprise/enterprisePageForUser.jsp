<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">


<!-- Libraries Stylesheet -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="${root }/css/usercss/owl.carousel.min.css" rel="stylesheet">
<link href="${root }/css/usercss/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="${root }/css/usercss/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${root }/css/usercss/style.css" rel="stylesheet">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e307bbbc3f0eb499cc6f855a21cc9478&libraries=services"></script>
<style type="text/css">
.hi div {
	border: 1px solid gray;
}

.longsentence{
	word-break: break-all;
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.atag {
	padding: 8px;
}

.atag, .atag:hover {
	color: #416442;
	text-decoration: none;
}

.atag:hover {
	background-color: #e3f2c9;
	border-radius: 10px;
}

.counting{
	float:right;
	color: #416442;
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
</style>
<script>

/* 성별 분포도 */
google.charts.load('current', {   
  packages:['corechart']
}).then(function () {
         
  $.ajax({
    url: "/enterprise/gendergraph",
    data:{"e_num":${dto.e_num}},
    dataType: "JSON",
    success: function(result){
       if(result[0].count==0&&result[1].count==0){
          $("#genderChart").html("<span style='font-size:1.5em;'>해당 기업의 지원자가 없습니다.</span>");
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
       url: "/enterprise/agegraph",
       data:{"e_num":${dto.e_num}},
       dataType: "JSON",
       success: function(result){
          if(result[0].count==0&&result[1].count==0){
             $("#ageChart").html("<span style='font-size:1.5em;'>해당 기업의 지원자가 없습니다.</span>");
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
	<div>

		<!-- Content Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="row g-4 hi">
				<div class="col-sm-12 col-md-6 col-xl-7 w-25">
					<div style="width: 150px; height: 100%">
						<img src="${dto.e_logo }" width="100%">
					</div>

				</div>
				<div class="col-sm-12 col-md-6 col-xl-7 w-75">
					<div class="h-100 bg-light rounded p-4">
						기업명 : ${dto.e_name }&nbsp;&nbsp;&nbsp;
						<c:if test="${dto.e_auth==0 }">
							<span style="color: red; font-weight: 600; font-size: 0.8em;">기업미인증</span>
						</c:if>
						<c:if test="${dto.e_auth==1 }">
							<span style="color: green; font-weight: 600; font-size: 0.8em;">기업인증완료</span>
						</c:if>
						
						<br>
					</div>
					<br>
					<div class="h-100 bg-light rounded p-4">
						전화번호 : ${dto.e_tel } <br>
					</div>
					<br>
					<div class="h-100 bg-light rounded p-4">위치 : ${dto.e_addr }</div>
					<br>
					<div class="h-100 bg-light rounded p-4">관심기업으로 선정한 인재 : <span id="heartList">${heartCount } 명</span></div>
				</div>
			</div>
		</div>
		<!-- Profile End -->

		<!-- Recent Sales Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="bg-light text-center rounded p-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<h4 class="mb-5"><b>최근공고현황</b></h4>
					<a class="atag" href="/posting/postinglistforuser?e_num=${dto.e_num }">더보기</a>
				</div>
				<div class="table-responsive">
					<table
						class="table text-start align-middle table-bordered table-hover mb-0">
						<thead>
							<tr class="text-dark">
								<th scope="col" style="text-align: center" width="40%">공고제목</th>
								<th scope="col" style="text-align: center">직종</th>
								<th scope="col" style="text-align: center">공고일</th>
								<th scope="col" style="text-align: center">공고마감일</th>
								<th scope="col" style="text-align: center">공고상태</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${postingCount==0 }">
						<tr><td colspan="5">게시한 공고가 없습니다.</td></tr>
						</c:if>
							<c:forEach var="post" items="${postings }">
								<tr>
									<td style="text-align: left"><a class="atag"
										href="../posting/detailpage?p_num=${post.p_num }">&nbsp;&nbsp;<b>${post.p_title }</b></a>&nbsp;&nbsp;
										<span class="counting viewer" p_num=${post.p_num }></span>
										<span class="counting">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
										<span class="counting scrap" p_num=${post.p_num }></span>
									</td>
									<td>${post.p_type }</td>
									<td><fmt:formatDate value="${post.p_writeday }"
											pattern="yyyy-MM-dd" /></td>
									<td>${post.p_enddate }</td>
									<td>${post.p_status}</td>
								</tr>
								
								 <script type="text/javascript">
							        $(function(){
							            var p_num = "${post.p_num}";
							            $.ajax({
							                type:"get",
							                data:{"p_num":p_num},
							                dataType:"json",
							                url:"/enterprise/counting",
							                success:function(res){
							                    $(".viewer[p_num='"+p_num+"']").text("열람 : "+res.viewercounting+"명");
							                    $(".scrap[p_num='"+p_num+"']").text("스크랩 : "+res.scrapcounting+"명");
							                }
							            });
							        });
							    </script>
								
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<br>
			
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
			
			<!-- Recent Sales End -->
			<section class="mb-4 mt-5" style="border: 1px solid #e3f2c9">
	
		         <h3>근무지정보</h3>
		         <div style="width: 100%; height: 500px;">
		            <span>기업명 : ${dto.e_name }</span><br> <span>회사주소 :
		               ${dto.e_addr }</span><br> <br>
		            <div style="width: 100%; height: 85%" id="enterMap"></div>
		         </div>
	      	</section>
			
		</div>

	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="${root }/js/moment.min.js"></script>
	<script src="${root }/js/moment-timezone.min.js"></script>
	<script src="${root }/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="${root }/js/main.js"></script>
</body>

</html>