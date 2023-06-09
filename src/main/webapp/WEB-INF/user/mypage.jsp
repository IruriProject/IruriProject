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
<script src="https://kit.fontawesome.com/b80cb5e2d1.js" crossorigin="anonymous"></script>

<!-- Customized Bootstrap Stylesheet -->
<link href="${root }/css/usercss/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${root }/css/usercss/style.css" rel="stylesheet">
<style type="text/css">
div {
   border: 0px solid gray;
}
div span{
color:#416442;
}

.fa-heart {
   color: red;
}
.fa-star{
   color: yellow;
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
.text-dark th{
text-align: center;
}
div a{
color:#416442;
}
div a:hover{
color:#416442;
text-decoration: none;
}
.myresume{
font-size: 1.2em;
font-weight: 600;
line-height:60px;
}

div td{
   border: 0px solid gray;

.myresume2{
font-size: 1.2em;
font-weight: 600;
}
div{
border:0px solid gray;

}
</style>
</head>

<body>
   <div>
      <!-- Content Start -->
      <div class="container-fluid pt-4 px-4">
         <div class="row g-4"style="border: 1px solid #f0f9de; background-color:#f9ffef; border-radius: 10px; padding:20px 0px 20px 25px;">
            <div class="col-sm-12 col-md-3 col-xl-4 w-25" style="text-align: center;">
               <c:if test="${dto.u_photo==null }">
                  <img src="/image/nophoto.png"
                  style="width: 170px; height: 170px; border-radius: 500px; margin-bottom: 4px;">
               </c:if>
               <c:if test="${dto.u_photo!=null }">
                     <img alt="" src="/photo/${dto.u_photo}"
                     style="width: 170px; height: 170px; border-radius: 500px; margin-bottom: 4px;">
               </c:if><br>
               <b style="font-size: 1.2em;">${sessionScope.loginName } &nbsp;</b>
               <c:if test="${dto.u_gender!=null && dto.u_birth!=null }">
                  ${dto.u_gender } /
                  <c:set var="now" value="<%=new java.util.Date()%>" />
                  <c:set var="year"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
                  <c:set var="birth"><fmt:formatDate value="${dto.u_birth }" pattern="yyyy"/></c:set>
                  ${year-birth+1 }세
                  <br><br>
               </c:if>
               
               <c:if test="${dto.u_gender==null || dto.u_birth==null }">
                  <b style="color: red">개인정보를 수정해주세요.</b>
               </c:if>
               
               <button type="button" class="sm-border-btn" data-toggle="modal" data-target="#myPhoto">사진
                  변경</button>
               <button type="button" class="sm-border-btn" onclick="location.href='update'">정보수정</button>
               <div>
                  <!-- Modal -->
                  <div class="modal fade" id="myPhoto" role="dialog">
                     <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                           <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                              <h4 class="modal-title">사진 변경</h4>
                           </div>
                           <div class="modal-body">
                              <input type="file" id="inputFile">

                           </div>
                           <div class="modal-footer">
                              <button type="button" class="btn btn-default" id="uPhoto"
                                 loginId="${sessionScope.loginId}">등록</button>
                              <button type="button" class="btn btn-default"
                                 data-dismiss="modal">닫기</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

				<div class="col-sm-12 col-md-6 col-xl-7 w-50" >
					<div class="h-100 rounded p-4">
						<div data-rnum="${rdto.r_num}">
							<c:if test="${rdto.r_title==null}">
								<span style="font-size: 2em; color: #416442; font-weight: 600;
							white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">대표이력서가 없습니다.</span><br>
								<button type="button" class="sm-border-btn" style="width:150px;" onclick="location.href='resumelist'">대표이력서
									설정하기</button>
								<!-- 이력서 목록 페이지로 -->
							</c:if>
							<c:if test="${rdto.r_title!=null}">
							<span style="font-size: 2em; color: #416442; font-weight: 600;
							white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">${rdto.r_title}</span><br>
								<c:set var="writeday"><fmt:formatDate value="${rdto.r_writeday }" pattern="yyyy-MM-dd"/></c:set>
								<span style="font-size: 1.2em; font-weight: 600; color: #416442;">최종수정일 : ${writeday }</span><br>
							</c:if>
						</div>
					</div>
					<script type="text/javascript">
						$(".setPrivate").click(function() {
							var r_num = $(this).closest("div").data("rnum");
							$.ajax({
								type : "post",
								dataType : "html",
								data : {
									"r_num" : r_num
								},
								url : "/updatePrivate",
								success : function() {
									location.reload();
								}
							})
						})

                  $(".setPublic").click(function() {
                     var r_num = $(this).closest("div").data("rnum");
                     $.ajax({
                        type : "post",
                        dataType : "html",
                        data : {
                           "r_num" : r_num
                        },
                        url : "/updatePublic",
                        success : function() {
                           location.reload();
                        }
                     })
                  })
               </script>
               <div class="myresume" style="border: 0px solid gray; width:650px; display: flex;">
               
                    <div style="cursor:pointer; width:140px; height:140px; text-align: center; background-color:white;
                          border:0px solid green; border-radius:200%; padding:20px;" onclick="location.href='insertresume'">
                     <span class="spanbutton" >
                     <img alt="" src="/image/resume.png" style="width:40px; height:40px;">
                     <h4>이력서 등록</h4>
                     </span>
                  </div>
                  
                  <div style="cursor:pointer; width:140px; height:140px; text-align: center; background-color:white;
                        border:0px solid green; border-radius:200%; padding:20px; margin-left:40px;" onclick="location.href='resumelist'">
                     <span class="spanbutton"  >
                     <img alt="" src="/image/list.png" style="width:40px; height:40px; margin-bottom:5px;">
                     <h4>이력서 목록</h4>
                     </span>
                  </div>
                  
                  <div style="cursor:pointer; width:140px; height:140px; text-align: center; background-color:white;
                        border:0px solid green; border-radius:200%; padding:20px; margin-left:40px;" onclick="location.href='applicationstate'">
                     <span class="spanbutton">
                     <img alt="" src="/image/mail.png" style="width:50px; height:50px; margin-bottom:5px;">
                     <h4>지원 현황</h4>
                     </span>
                  </div>
               </div>
            </div>
               <div class="myresume2" style="border: 0px solid gray; text-align: center; float:right; margin-right:40px;"><br>
                  <div style="cursor:pointer; width: 110px;  background-color: white; border-radius:10px; padding:5px 20px 10px;"
                   onclick="location.href='enterLike'">                  
                  <span class="spanbutton"><h4>관심기업</h4> 
                  <img alt="" src="/image/heart.png" style="width:16px; height:16px; margin-bottom: 5px;">
                  ${countLikeEnter }
                  </span>
                  </div><br>
                  <div style="cursor:pointer; width: 110px;  background-color: white; border-radius:10px; padding:5px 20px 10px;"
                   onclick="location.href='scrap'">
                    <span class="spanbutton"><h4>스크랩</h4>
                    <img alt="" src="/image/star.png" style="width:18px; height:18px; margin-bottom: 5px;">
                     ${countPosting }
                    </span>
                </div>
               </div>
         </div>
      </div>
      <script src="https://kit.fontawesome.com/2663817d27.js"
      crossorigin="anonymous"></script><!-- 아이콘에 필요한거니 삭제말것 -->
      <!-- Profile End -->

      <!-- 쪽지함 -->
      <div class="container-fluid pt-4 px-4">
         <div class="row g-4">
            <div class="col-sm-12 col-md-6 col-xl-4">
               <div class="h-100 bg-light rounded p-4">
                  <div
                     class="d-flex align-items-center justify-content-between mb-2">
                     <h4 class="mb-5"><b>쪽지함</b></h4>
                     <a href="mymessage">더보기</a>
                  </div>
                  
                  <c:if test="${mlist.size()==0 }">
                     <div class="w-100" align="center">
                        <br>
                        <span style="color: gray">쪽지내역이 존재하지 않습니다.</span>
                     </div>
                  </c:if>
                  <c:forEach var="mdto" items="${mlist }" varStatus="i">
                  <c:if test="${i.count<=3 }">
                  
                  
                  
                  <div class="d-flex align-items-center border-bottom py-3 atag mt-3">
                     <img class="rounded-circle flex-shrink-0" src="/photo/${mdto.e_logo}"
                     alt="" style="width: 40px; height: 40px;"><!-- 이미지 -->
                     <a class="atag" href="/mymessage">
                     <div class="w-100 ms-3">
                        <div class="d-flex w-100 justify-content-between">
                           <h5 class="mb-0"><b>${mdto.e_name }</b></h5>
                           <small><fmt:formatDate value="${mdto.m_day}" pattern="yy-MM-dd"/></small>
                        </div>
                        <span class="longsentence">${mdto.m_content }</span>
                     </div>
                     </a>
                  </div>
                  </c:if>
                  </c:forEach>
               </div>
            </div>
            
            
            <div class="col-sm-12 col-md-6 col-xl-4">
               <div class="h-100 bg-light rounded p-4">
                  <div id="calender"></div>
               </div>
            </div>
         </div>
      </div>
      <!-- Widgets End -->

  <!-- 내가 쓴 게시글  -->
	  <!-- Recent Sales Start -->
      <div class="container-fluid pt-4 px-4">
         <div class="bg-light text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
            </div>
            <div class="table-responsive">
               <table
                  class="table"
                  style="table-layout: fixed">
                  <thead>
                  <caption style=" margin-bottom : 10px;">
                     <h4 class="mb-5" style="color: black; display: inline;"><b>내가 쓴 게시글</b></h4>
                     <a href="/myboardlist" style="float: right;">더보기</a>
                  </caption>
                        <tr class="text-dark tb" >
                           <th scope="col" style="text-align: center; width: 160px;">번호</th>
                           <th scope="col" style="text-align: center; width: 600px;">제목</th>
                           <th scope="col" style="text-align: center; width: 150px;">작성일</th>
                     </tr>
                  </thead>
                    <c:if test="${getMypageBoard.size()==0 }">
                     <tr align="center">
                        <td colspan="3" style="color: #416442; font-weight: 600">등록된 게시글이 없습니다. <br>
                        게시글을 등록해보세요!</td>
                     </tr>
                    
                    </c:if>
                     <c:forEach var="dto" items="${getMypageBoard }" varStatus="i">
                      <c:if test="${i.count<=3 }">
                  
                     <tr>
                        <td style="text-align: center; width: 160px;">${i.count}</td>
                        <td style=" width: 600px">
                        <a href="#" style="float:left; text-align:left; color: #416442; font-weight: 600">${dto.b_title}</a></td>
                        <td style="text-align: center; width: 150px;">
                        <fmt:formatDate value="${dto.b_writeday }" pattern="yyyy-MM-dd"/>
                        </td>
                     </tr>
                     </c:if>
              
                     </c:forEach>
               </table>
            </div>
         </div>
      </div>
      <!-- Recent Sales End -->
	


      <!-- 이력서 목록 -->
      <!-- Recent Sales Start -->
      <div class="container-fluid pt-4 px-4">
         <div class="bg-light text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
            </div>
            <div class="table-responsive">
               <table
                  class="table"
                  style="table-layout: fixed">
                  <thead>
                  <caption style=" margin-bottom : 10px;">
                     <h4 class="mb-5" style="color: black; display: inline;"><b>이력서 목록</b></h4>
                     <a href="/resumelist" style="float: right;">더보기</a>
                  </caption>
                     <tr class="text-dark">
                        <th scope="col" style="width: 50px;">번호</th>
                        <th scope="col" style="width: 200px;">제목</th>
                        <th scope="col" style="width: 110px;">설정관리</th>
                        <th scope="col" style="width: 90px;">대표 설정</th>
                     </tr>
                  </thead>
                  <c:if test="${list.size()==0 }">
                     <tr align="center">
                        <td colspan="4" style="color: #416442; font-weight: 600">이력서가 존재하지 않습니다.<br>
                        대표 이력서를 등록해보세요!</td>
                     </tr>
                  </c:if>
                  <c:forEach var="dto" items="${list }" varStatus="i">
                     <c:if test="${i.count<=3 }">
                        <tr data-rnum="${dto.r_num}", data-rpresume="${dto.r_presume }", data-rprivate="${dto.r_private }">
                           <td style="text-align: center; height:32px; line-height:32px;">${i.count}</td>
                           <td style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden; height:32px; line-height:32px;">
                              
                                 <c:if test="${dto.r_private==1}">
                                 <a href="resume/detail?r_num=${dto.r_num }">[비공개]${dto.r_title}</a>
                                 </c:if>
                                 
                                 <c:if test="${dto.r_presume==1 && dto.r_private==0}">
                                 <a href="resume/detail?r_num=${dto.r_num }"><b>[대표][공개]${dto.r_title}</b></a>
                                 </c:if>
                                 
                                 <c:if test="${dto.r_presume==0 && dto.r_private==0}">
                                 <a href="resume/detail?r_num=${dto.r_num }">[공개]${dto.r_title}</a>
                                 </c:if>
                           </td>

                           <td style="text-align:center;">
                              <!-- if문 --> <c:if test="${dto.r_private==1}">
                                 <button type="button" class="sm-color-btn setPublic">공개 전환</button>
                              </c:if> <c:if test="${dto.r_private==0}">
                                 <button type="button" class="sm-border-btn setPrivate">비공개 전환</button>
                              </c:if>
                           </td>

                           <td style="text-align:center;">
                              <c:if test="${dto.r_presume==0}">
                                 <button type="button" class="sm-border-btn setMainOn">대표 설정</button>
                              </c:if> <c:if test="${dto.r_presume==1}">
                                 <button type="button" class="sm-color-btn setMainOff">대표 해제</button>
                              </c:if>
                           </td>
                        </tr>
                     </c:if>
                  </c:forEach>
               </table>
            </div>
         </div>
      </div>
      <!-- Recent Sales End -->

      <!-- Recent Sales Start -->
      <div class="container-fluid pt-4 px-4">
         <div class="bg-light text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
            </div>
            <div class="table-responsive">
               <table class="table" id="basic-list">
                  <thead>
                  <caption style=" margin-bottom : 10px;">
                     <h4 class="mb-5" style="color: black; display: inline;"><b>관심 기업</b></h4>
                     <a href="/enterLike" style="float: right;">더보기</a>   
                  </caption>
                     <tr class="text-dark">
                        <th scope="col" style="text-align: center; width: 100px;">기업명</th>
                        <th scope="col" style="text-align: center; width: 240px;">주소</th>
                        <th scope="col" style="text-align: center; width: 100px;">전화번호</th>
                        <th scope="col" style="text-align: center; width: 180px;">이메일</th>
                     </tr>
                  </thead>
                  
                  <c:if test="${countLikeEnter==0}">
                  <tr align="center">
                        <td colspan="4" style="color: #416442; font-weight: 600">관심 기업이 없습니다. <br>
                        관심 기업을 추가해보세요!</td>
                     </tr>
                  </c:if>   
                  <c:forEach var="edto" items="${getMypageLikeEnter }">               
                  <c:if test="${countLikeEnter>0}">
                     <tr>
                        <td style="text-align: center; width: 100px;">
                        <a href="/enterprise/enterprisepage?e_num=${edto.e_num }" style="color: #416442; font-weight: 600">${edto.e_name}</a></td>
                        <td style="text-align: center; width: 240px;">${edto.e_addr}</td>
                        <td style="text-align: center; width: 100px;">${edto.e_tel}</td>
                        <td style="text-align: center; width: 180px;">${edto.e_email}</td>
                     </tr>
                  </c:if>
                  </c:forEach>
               </table>
            </div>
         </div>
      </div>
      <!-- Recent Sales End -->

      <!-- Recent Sales Start -->
      <div class="container-fluid pt-4 px-4">
         <div class="bg-light text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
            </div>
            <div class="table-responsive">
               <table class="table" id="basic-list">
                  <thead>
                  <caption style=" margin-bottom : 10px;">
                     <h4 class="mb-5" style="color: black; display: inline;"><b>스크랩</b></h4>
                     <a href="/scrap" style="float: right;">더보기</a>                  
                  </caption>
                     <tr class="text-dark tb" >
                           <th scope="col" style="text-align: center; width: 200px;">기업명</th>
                           <th scope="col" style="text-align: center; width: 500px;">공고 제목</th>
                           <th scope="col" style="text-align: center; width: 150px;">직무</th>
                           <th scope="col" style="text-align: center; width: 110px;">급여</th>
                           <th scope="col" style="text-align: center; width: 100px;">계약기간</th>
                           <th scope="col" style="text-align: center; width: 120px;">근무요일</th>
                           <th scope="col" style="text-align: center; width: 250px;">근무시간</th>
                           <th scope="col" style="text-align: center; width: 100px;">고용형태</th>
                     </tr>
                  </thead>
                  
                  <c:if test="${countPosting==0}">
                  <tr align="center">
                        <td colspan="8" style="color: #416442; font-weight: 600">관심 공고가 없습니다. <br>
                        관심 공고를 추가해보세요!</td>
                     </tr>
                  </c:if>   
                     <c:forEach var="pdto" items="${getMypageScrapPosting }">
                     <c:if test="${countPosting>0}">
                     <tr>
                        <td style="text-align: center; width: 200px;">${pdto.e_name }</td>
                        <td style="text-align: center; width: 500px">
                        <a href="posting/detailpage?p_num=${pdto.p_num}" style="color: #416442; font-weight: 600">${pdto.p_title}</a></td>
                        <td style="text-align: center; width: 150px;">${pdto.p_type }</td>
                        <td style="text-align: center; width: 110px;">${pdto.p_pay }</td>
                        <td style="text-align: center; width: 100px;">${pdto.p_period }</td>
                        <td style="text-align: center; width: 120px;">
                        <c:if test="${pdto.p_workday=='월/화/수/목/금'}">평일</c:if> 
						<c:if test="${pdto.p_workday=='토/일'}">주말</c:if>
						<c:if test="${pdto.p_workday=='월/화/수/목/금/토/일'}">전일</c:if> 
						<c:if test="${pdto.p_workday!='토/일' && pdto.p_workday!='월/화/수/목/금' && pdto.p_workday!='월/화/수/목/금/토/일' }">${pdto.p_workday }</c:if>
						</td>
                        
                        </td>
                        <td style="text-align: center; width: 250px;">${pdto.p_starttime } ~ ${pdto.p_endtime }</td>
                        <td style="text-align: center; width: 100px;">${pdto.p_employtype}</td>
                     </tr>
                     </c:if>   
                     </c:forEach>
               </table>
            </div>
         </div>
      </div>
      <!-- Recent Sales End -->


   </div>
   <!-- Content End -->


   <!-- JavaScript Libraries -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script src="${root }/js/moment.min.js"></script>
   <script src="${root }/js/moment-timezone.min.js"></script>
   <script src="${root }/js/tempusdominus-bootstrap-4.min.js"></script>

   <!-- Template Javascript -->
   <script src="${root }/js/main.js"></script>

   <!-- 사진 등록 Ajax -->
   <script type="text/javascript">
      $(document).on("click", "#uPhoto", function() {
         var u_id = $(this).attr("loginId"); //본인의 num을 호출
         var form = new FormData();
         form.append("u_photo", $("#inputFile")[0].files[0]);//선택한 한 개만 반드시 추가해준다.
         form.append("u_id", u_id);
         $.ajax({
            type : "post",
            dataType : "text",
            url : "/updatePhoto",
            processData : false,
            contentType : false,
            data : form,
            success : function() {
               location.reload();
            }
         })
      })
   </script>
   <!-- 대표/공개 설정 -->
   <script type="text/javascript">
   $(".deleteRes").click(function(){
      var r_num = $(this).closest("tr").data("rnum");
      var result = confirm("정말 삭제하시겠습니까?");
      if(result==true){
         $.ajax({
            data:{"r_num":r_num},
            dataType:"html",
            url:"deleteResume",
            success:function(){
               alert("삭제되었습니다.");
               location.reload();
            },error: function() {
                 alert("에러!");
             }
         })
      }
   })
      $(".setMainOff").click(function() {
         var r_num = $(this).closest("tr").data("rnum");
         $.ajax({
            type : "post",
            dataType : "html",
            data : {
               "r_num" : r_num
            },
            url : "/updateMainOff",
            success : function() {
               location.reload();
            }
         })
      })
      $(".setMainOn").click(function(){
      var r_num = $(this).closest("tr").data("rnum");
      var r_private = $(this).closest("tr").data("rprivate");
      if(r_private==1){
         var result = confirm("비공개된 이력서를 대표설정 시 공개상태로 전환됩니다.\n대표이력서로 변경하시겠습니까?");
         if(result==true){
            $.ajax({
               type:"post",
               dataType:"html",
               data:{"r_num":r_num},
               url:"/updateMainOn",
               success:function(){
                  location.reload();
               }
            })
         }else{
            return false;
         }
      }else{
         $.ajax({
            type:"post",
            dataType:"html",
            data:{"r_num":r_num},
            url:"/updateMainOn",
            success:function(){
               location.reload();
            }
         })
      }
      
   })
      $(".setPrivate").click(function(){
       var r_num = $(this).closest("tr").data("rnum");
       var r_presume = $(this).closest("tr").data("rpresume");
       if(r_presume==1){
          alert("대표이력서는 비공개 설정이 불가능합니다.");
          return false;
       }
      $.ajax({
         type:"post",
         dataType:"html",
         data:{"r_num":r_num},
         url:"/updatePrivate",
         success:function(){
            location.reload();
         }
      })
   })

      $(".setPublic").click(function(){
       var r_num = $(this).closest("tr").data("rnum");
       var result = confirm("이력서를 공개로 전환하시겠습니까?");
       if(result==true){
         $.ajax({
            type:"post",
            dataType:"html",
            data:{"r_num":r_num},
            url:"/updatePublic",
            success:function(){
               location.reload();
            }
         }) 
       }else{
          return false;
       }
   })
   </script>
</body>

</html>