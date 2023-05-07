<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>이루리_ 공고상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<c:set var="root" value="<%=request.getContextPath()%>" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="${root }/css/postingDetailStyles.css" rel="stylesheet" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e307bbbc3f0eb499cc6f855a21cc9478"></script>
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

</script>
</head>
<body>
	<!-- Page content-->
	<div class="mt-5">
		<div class="row">
			<div>
				<!-- Post content-->
				<article>
					<!-- Post header-->
					<header class="mb-4">
						<!-- Post title-->
						<div class="withbtn">
							<div class="withbtnTitle fw-bolder mb-1"
								style="color: #41644a; font-size: 2em">${dto.p_title }</div>
								<input type="hidden" id="p_num" value="${dto.p_num }">
							<div>
								<c:if
									test="${sessionScope.loginStatus!=null&&sessionScope.loginStatus=='user' }">
									<button type="button" class="btn btn-info mt-2">지원하기</button>
									<button type="button" id="btnscrap" class="btn btn-info mt-2">공고 스크랩</button>
								</c:if>
								<c:if
									test="${sessionScope.loginStatus=='enterprise'&&sessionScope.loginId==dto.e_id }">
									<button type="button" class="btn btn-info mt-2" onclick="location.href='/posting/update?p_num=${dto.p_num}'">수정</button>
									<button type="button" class="btn btn-info mt-2" onclick="location.href='confirmpw?p_num=${dto.p_num}'">삭제</button>
									<button type="button" class="btn btn-info mt-2" onclick="reloadAlert()">끌어올리기</button>
								</c:if>
								<button type="button" class="btn btn-info mt-2" onclick="copyUrl()">링크 복사</button>
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
						
						</script>

						<!-- Post meta content-->
						<div class="text-muted fst-italic mb-2"><b>${dto.e_name }</b>
							/ 공고일 :
							<fmt:formatDate value="${dto.p_writeday }" pattern="yyyy-MM-dd" />
							<span style="float: right">&nbsp;&nbsp;/&nbsp;&nbsp;스크랩 : ${scrapCount}명</span> <span style="float: right">열람 : ${viewerCount }명</span>
						</div>
						
					</header>

					<!-- Post content-->
					<section class="mb-4">
						<div class="postingContents">
							<div class="postingContent">
								<fmt:formatNumber value="${dto.p_pay }" type="currency" />
							</div>
							<div class="postingContent">${dto.p_period }</div>
							<div class="postingContent">${dto.p_workday }</div>
							<div class="postingContent"><fmt:formatDate value="${dto.p_starttime }" pattern="HH:mm"/>&nbsp;~&nbsp;<fmt:formatDate value="${dto.p_endtime }" pattern="HH:mm"/> </div>
						</div>
					</section>
					<br>

					<!-- 스크롤스파이 -->
					<div class="scroll mb-4" data-bs-spy="scroll"
						data-bs-target=".navbar" data-bs-offset="50">
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
							<p>${dto.p_content }</p>
						</div>

						<div id="section3" class="container-fluid scpy">
							<div class="withbtn">
								<div class="withbtnTitle">기업정보</div>
								<div class="likeEnter">
								<c:if
									test="${sessionScope.loginStatus!=null&&sessionScope.loginStatus=='user' }">
									<button type="button" u_id=${sessionScope.loginId} e_num=${dto.e_num }
									id="btnLikeEnter" class="btn btn-info glyphicon glyphicon-heart-empty ">기업 찜하기</button>
								</c:if>
								</div>
							</div>

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
					<section class="mb-4 mt-5">
						<h3>근무지정보</h3>
						<div class="cInfos">
							<div class="cInfo">
								<span>기업명: ${dto.e_name }</span><br> <span>회사주소:
									${dto.e_addr }</span><br>
								<div>지도</div>
							</div>
							<div class="cInfo">
								<span>근처역1</span><br> <span>근처역2</span><br>
								<div>근처역3</div>
							</div>
						</div>
					</section>
				</article>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
			
			//로그인 안했을 때 기업 찜 버튼 누르면 로그인 해주세요
			$("#btnLikeEnter").click(function(){
				
				//alert("로그인 해줘잉");
				
				var e_num=$(this).attr("e_num");
				var u_id=$(this).attr("u_id");
				//alert(e_num);
				//alert(u_id);
				
				$.ajax({
					
					type:"post",
					dataType:"json",
					data:{
						
						"e_num":e_num,
						"u_id":u_id
					},
					url:"/hinsert",
					success:function(res){
						alert("좋아요 성공");
						
					}
				})
			});
			
			
			//스크랩
			$("#btnscrap").click(function(){
				
				alert("스크랩할거임?");
			});
			
			
			
			
			
			
		
	
	
	</script>
	
	
	
	
	
	
	
</body>
</html>