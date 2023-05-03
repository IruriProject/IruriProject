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
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
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
    background: #6a64f1;
    border-color: #6a64f1;
  }

  .formbold-main-wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 48px;
  }

  .formbold-form-wrapper {
    margin: 0 auto;
    max-width: 570px;
    width: 100%;
    background: white;
    padding: 40px;
  }

  .formbold-img {
    display: block;
    margin: 0 auto 45px;
  }

  .formbold-input-wrapp > div {
    display: flex;
    gap: 20px;
  }

  .formbold-input-flex {
    display: flex;
    gap: 20px;
    margin-bottom: 15px;
  }
  .formbold-input-flex > div {
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
  .formbold-form-input::placeholder,
  select.formbold-form-input,
  .formbold-form-input[type='date']::-webkit-datetime-edit-text,
  .formbold-form-input[type='date']::-webkit-datetime-edit-month-field,
  .formbold-form-input[type='date']::-webkit-datetime-edit-day-field,
  .formbold-form-input[type='date']::-webkit-datetime-edit-year-field {
    color: rgba(83, 99, 135, 0.5);
  }

  .formbold-form-input:focus {
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
    color: #6a64f1;
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

  .formbold-btn {
    font-size: 16px;
    border-radius: 5px;
    border: none;
    background-color: #cce891;
    color: white;
    cursor: pointer;
  }
  
  .btn-s {
    font-weight: 400;
    width: 100px;
    height: 50px;
  }
  
  .btn-m {
    padding: 14px 25px;
    font-weight: 500;
    margin-top: 25px;
  }
  
  .formbold-btn:hover {
    box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
  }

  .formbold-w-45 {
    width: 45%;
  }
  
  #idcheck,#pwcheck{
    color: red;
  }
</style>
		
<title>Insert title here</title>
</head>
<body>

<div class="formbold-main-wrapper">
  <!-- Author: FormBold Team -->
  <!-- Learn More: https://formbold.com -->
  <div class="formbold-form-wrapper">
    <form action="action" method="POST" name="joinform" onsubmit="return check()">

      <div class="formbold-input-wrapp formbold-mb-3">
        <label class="formbold-form-label"> 아이디 </label>
        <div>
          <input
            type="text"
            name="u_id"
            id="u_id"
            placeholder="영문, 숫자로 구성된 6-12자의 아이디를 입력해주세요"
            min="6" max="12" required
            onkeyup="characterCheck(this);idcheckClean();" onkeydown="characterCheck(this);idcheckClean();"
            class="formbold-form-input"
          />
          <button type="button" class="formbold-btn btn-s" id="btn-idcheck">중복확인</button>
          </div>
          <div>
          <div id="idcheck"></div>
          <input type="hidden" value="idUnchecked" name="isDuplication" id="isDuplication">
          </div>
      </div>
      
      <script type="text/javascript">
      //아이디
      
        function idcheckClean(){
        	$("#idcheck").html("");
        	$("#isDuplication").val("isUnchecked");
        	$("#isDuplication").removeAttr("disabled");
        	$("#btn-idcheck").css("background-color","#cce891");
        }
      
	    //중복체크 버튼 클릭시
      	$("#btn-idcheck").click(function(){
      		
      		const u_id=$("#u_id").val();
      		
      		if(u_id.length<6 || u_id.length>12){
      			$("#idcheck").text("아이디는 6자 이상 12자 이하만 가능합니다.");
      			return false;
      		}
      		
	  		$.ajax({
	  			type:"get",
	  			url:"/user/idcheck",
	  			dataType:"json",
	  			data:{"u_id":u_id},
	  			success:function(res){
	  				if(res.count==0){
	  					$("#idcheck").text("가입이 가능한 아이디입니다.");
	  					$("#isDuplication").val("isChecked");
	  					$("#isDuplication").attr("disabled","true");
	  					$("#btn-idcheck").css("background-color","lightgray");
	  				}else{
	  					$("#idcheck").text("중복된 아이디입니다.");
	  					
	  				}
	  			}
	  		})
	  		
      	})
      	
      	//특수문자감지
      	function characterCheck(obj){
      		
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 

		if( regExp.test(obj.value) ){
			$("#idcheck").html("특수문자는 입력하실수 없습니다.");
			obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지우기
			}
		}
      
      </script>

      <div class="formbold-mb-3">
        <label class="formbold-form-label"> 비밀번호 </label>
        <input
          type="password"
          id="pw1"
          name="u_pw" 
          min="6" max="12" required
          placeholder="비밀번호를 입력해주세요"
          class="formbold-form-input"
        />
      </div>

      <div class="formbold-mb-3">
        <label class="formbold-form-label"> 비밀번호 확인 </label>
        <input
          type="password"
          id="pw2"
          min="6" max="12" required
          placeholder="비밀번호를 다시 입력해주세요"
          class="formbold-form-input"
        />
      <div id="pwcheck"></div>
      <input type="hidden" id="pwChecked" value="ok">
      </div>
      
      <script type="text/javascript">
      //비밀번호
      
      $("#pw2").change(function(){
	      pw1=$("#pw1").val();
	      pw2=$("#pw2").val();
	      
	      if(pw1!=pw2){
    		  $("#pwcheck").html("비밀번호가 일치하지 않습니다.");
    	  }else{
    		  $("#pwcheck").html("유효한 비밀번호입니다.");
    		  $("#pwcheck").css("color","green");
    		  $("#pwChecked").val("no");
    	  }
      })
            
      </script>

      <div class="formbold-mb-3">
        <label class="formbold-form-label"> 이름 </label>
        <input
          type="text"
          id="u_name"
          name="u_name" required
          placeholder="이름을 입력해주세요"
          class="formbold-form-input"
        />
      </div>
      
      <div class="formbold-mb-3 formbold-input-wrapp">
        <label class="formbold-form-label"> 전화번호 </label>

        <div>
          <input
            type="text"
            name="u_hp"
            id="phone"
            placeholder="- 없이 입력해주세요" required
            class="formbold-form-input"
          />
          <button type="button" id="sms-btn" class="formbold-btn btn-s">인증번호발송</button>
          
          <input
            type="text"
            id="sms-id"
            placeholder="인증번호입력" required
            class="formbold-form-input"
          />
          <button type="button" class="formbold-btn btn-s">확인</button>
          
        </div>
      </div>

      <div class="formbold-mb-3">
        <label class="formbold-form-label">성별</label>

        <select class="formbold-form-input" name="u_gender">
          <option value="남">남성</option>
          <option value="여">여성</option>
        </select>
      </div>
      
      <div class="formbold-mb-3">
        <label class="formbold-form-label"> 생년월일 </label>
        <input type="date" name="u_birth" id="u_birth" class="formbold-form-input" required />
      </div>

      <div class="formbold-mb-3">
        <label class="formbold-form-label"> 이메일 </label>
        <input
          type="email"
          name="u_email"
          id="u_email"
          placeholder="example@email.com 형태로 입력해주세요" required
          class="formbold-form-input"
        />
      </div>

      <div class="formbold-mb-3">
        <label class="formbold-form-label"> 주소 </label>
        <div style="align-content: flex-end;">
        <input type="text" id="sample6_postcode" placeholder="우편번호" class="formbold-form-input" style="width: 300px;" required>
		<input type="button" class="formbold-btn btn-s" onclick="sample6_execDaumPostcode()" value="검색"><br>
        </div>
		<input type="text" id="sample6_address" name="addr1" placeholder="주소" class="formbold-form-input" disabled ><br><br>
		<input type="text" id="sample6_detailAddress" name="addr2" placeholder="상세주소" class="formbold-form-input">
		<input type="text" id="sample6_extraAddress" name="addr3" placeholder="참고항목" class="formbold-form-input" disabled >
      </div>

	<br><br>

      <div class="formbold-checkbox-wrapper">
        <label class="formbold-checkbox-label">
          <div class="formbold-relative">
            <input
              type="checkbox"
              id="supportCheckbox"
              name="u_email_agree"
              class="formbold-input-checkbox"
            />
            <div class="formbold-checkbox-inner">
              <span class="formbold-opacity-0">
                <svg
                  width="11"
                  height="8"
                  viewBox="0 0 11 8"
                  class="formbold-stroke-current"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M8.81868 0.688604L4.16688 5.4878L2.05598 3.29507C1.70417 2.92271 1.1569 2.96409 0.805082 3.29507C0.453266 3.66742 0.492357 4.24663 0.805082 4.61898L3.30689 7.18407C3.54143 7.43231 3.85416 7.55642 4.16688 7.55642C4.47961 7.55642 4.79233 7.43231 5.02688 7.18407L10.0696 2.05389C10.4214 1.68154 10.4214 1.10233 10.0696 0.729976C9.71776 0.357624 9.17049 0.357625 8.81868 0.688604Z"
                    fill="white"
                  />
                </svg>
              </span>
            </div>
          </div>
          광고성 메일을 받습니다.
        </label>
      </div>

      <button class="formbold-btn btn-m" id="btnjoin">가입하기</button>
    </form>
  </div>
</div>

</body>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	//가입시 중복확인 버튼 클릭 여부 확인
	$("#btnjoin").click(function(){
		if(document.joinform.isDuplication.value!='isChecked'){
			alert("아이디 중복확인을 해주세요");
			return false;
		};
	})


	//주소 api
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
  
    
    //문자발송
     $("#sms-btn").click(function(){
    	
	    const msgModule = require('coolsms-node-sdk').default
	
		// 인증을 위해 발급받은 본인의 API Key를 사용합니다.
		const apiKey = 'NCSXNDMDJQXS14ZS'
		const apiSecret = 'PB0HDL4TIDTSIA3NG8ZWH5DGC9DNASSY'
		const messageService = new msgModule(apiKey, apiSecret);
		
		const params = {
		  text: '[쿨에스엠에스 테스트] hello world!', // 문자 내용
		  to: $("#phone").val(), // 수신번호 (받는이)
		  from: '01023953374' // 발신번호 (보내는이)
		}
		messageService.sendMany([params]).then(console.log).catch(console.error)
		
    })
    
</script>

</html>