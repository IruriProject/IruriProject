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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<c:set var="root" value="<%=request.getContextPath()%>" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="${root }/css/postingDetailStyles.css" rel="stylesheet" />
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
	height: 200px;
	border: 1px solid #e3f2c9;
	margin: 10px;
}

.graphs {
	text-align: center;
	line-height: 200px;
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

.modal-header{
	justify-content: flex-end;
}

.heart{
	cursor: pointer;
	font-weight: 500px;
	
}

.fa-heart{
	color: red;
}

.fa-star{
	color: yellow;
}
</style>
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

									<button type="button" class="btn btn-info mt-2" data-toggle="modal" data-target="#myModal">지원하기</button>

									<!-- 기스크랩 시 스크랩 해제 -->
									<c:if test="${sdto.s_num!=null }">
									<input type="hidden" id="s_num" value="${s_num }">
										<span id="btnUnScrap">공고 스크랩 해제<i class="fa-solid fa-star"></i></span>
									</c:if>
									
									<!-- 비스크랩 시 스크랩 가능 -->
									<c:if test="${sdto.s_num==null }">
										<span id="btnScrap">공고 스크랩<i class="fa-regular fa-star"></i></span>
									</c:if>
									
								</c:if>

								<c:if
									test="${sessionScope.loginStatus=='enterprise'&&sessionScope.loginId==dto.e_id }">
									<button type="button" class="btn btn-info mt-2" onclick="location.href='/posting/update?p_num=${dto.p_num}'">수정</button>
									<button type="button" class="btn btn-info mt-2" onclick="location.href='confirmpw?p_num=${dto.p_num}'">삭제</button>
									<button type="button" class="btn btn-info mt-2" onclick="reloadAlert()">끌어올리기</button>
								</c:if>
								<button type="button" class="btn btn-info mt-2" onclick="copyUrl()">링크 복사</button>
								<span onclick="copyUrl()">링크 복사</span>
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
									type:"post",
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
					          <h4 class="modal-title"> ${dto.p_title } - ${dto.e_name } 회사에 지원하기 &nbsp;</h4>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        <div class="modal-body">
					          <p>지원하기</p>
					        </div>
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
								<input type="hidden" id="u_num" value="${u_num }">
								<input type="hidden" id="e_num" value="${dto.e_num }">
								<c:if
									test="${sessionScope.loginStatus!=null&&sessionScope.loginStatus=='user' }">

									<!-- 기좋아요 시 좋아요 해제 -->
									<c:if test="${hdto.h_num!=null }">
									<input type="hidden" id="h_num" value="${h_num }">
										<span class="heart" id="btnUnLikeEnter">좋아요 <i class="fa-solid fa-heart"></i></span>
									</c:if>
									
									<!-- 비좋아요 시 좋아요 가능 -->
									<c:if test="${hdto.h_num==null }">
										<span class="heart" id="btnLikeEnter">좋아요 <i class="fa-regular fa-heart" ></i></span>
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
					alert("❤️기업 좋아요❤️");
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
						alert("💔기업 좋아요 해제💔");
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
								<div>지원자 남녀 비율</div>
							</div>
							<div class="cInfo graphs">
								<div>지원자 연령별 그래프</div>
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
	
	<script src="https://kit.fontawesome.com/2663817d27.js" crossorigin="anonymous"></script>
	
</body>
</html>