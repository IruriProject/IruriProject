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
  div a{
color: black;
}
div a:hover{
color:black;
text-decoration: none;
}
  div{
  border:0px solid gray;}
</style>
</head>
<body>
	

<div style="display:flex; flex-direction:row;">

	<div style="float:left; width: 150px; font-size: 1.5em;">
	<b>내 정보 수정</b><br><br>
	<a href="updatepw">비밀번호변경</a><br><br>
	<a href="deleteform">회원탈퇴</a>
	</div>


<div style="margin :0 auto; float:right;">
  <!-- Author: FormBold Team -->
  <!-- Learn More: https://formbold.com -->
  <div>
    <form action="updateUserInfo" method="POST">
	<!-- 히든? -->
	<input type="hidden" name="u_num" value="${dto.u_num }">
      <div class="formbold-input-wrapp formbold-mb-3">
        <label class="formbold-form-label"> 아이디 </label>
        <div>
          <input
            type="text"
            name="u_id"
            class="formbold-form-input"
            value="${sessionScope.loginId }"
            readonly="readonly"
          />
        </div>
      </div>
      
      <div class="formbold-mb-3">
        <label class="formbold-form-label"> 이름 </label>
        <input
          type="text"
          id="u_name"
          name="u_name"
          placeholder="이름을 입력해주세요"
          class="formbold-form-input"
          value="${sessionScope.loginName }"
          readonly="readonly"
        />
      </div>
      
      <div class="formbold-mb-3 formbold-input-wrapp">
        <label class="formbold-form-label"> 전화번호 </label>

        <div>
          <input
            type="text"
            name="u_hp"
            id="phone"
            placeholder="- 없이 핸드폰 번호를 입력해주세요"
            class="formbold-form-input"
            value="${dto.u_hp }"
          />

        </div>
      </div>

      <div class="formbold-mb-3">
        <label class="formbold-form-label">성별</label>

        <select class="formbold-form-input" name="u_gender">
        <c:if test="${dto.u_gender=='여'}">
          <option value="여">여성</option>
        </c:if>
        <c:if test="${dto.u_gender=='남'}">
          <option value="남">남성</option>
        </c:if>
        </select>
      </div>
      
      <div class="formbold-mb-3">
        <label class="formbold-form-label"> 생년월일 </label>
        <input type="date" name="u_birth" id="u_birth" class="formbold-form-input" value="${dto.u_birth }"/>
      </div>

      <div class="formbold-mb-3">
        <label class="formbold-form-label"> 이메일 </label>
        <input
          type="email"
          name="u_email"
          id="u_email"
          placeholder="example@email.com 형태로 입력해주세요"
          class="formbold-form-input"
          value="${dto.u_email }"
        />
      </div>

      <div class="formbold-mb-3">
        <label class="formbold-form-label"> 주소 </label>
        <div style="align-content: flex-end;">
        <input type="text" id="sample6_postcode" placeholder="우편번호" class="formbold-form-input" style="width: 300px;">
		<input type="button" class="formbold-btn btn-s" onclick="sample6_execDaumPostcode()" value="검색"><br>
        </div>
		<input type="text" id="sample6_address" name="addr1" placeholder="주소" class="formbold-form-input" readonly="readonly" ><br><br>
		<input type="text" id="sample6_detailAddress" name="addr2" placeholder="상세주소" class="formbold-form-input" >
		<input type="text" id="sample6_extraAddress" name="addr3" placeholder="참고항목" class="formbold-form-input" readonly="readonly" >
		
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

      <button class="formbold-btn btn-m">변경하기</button>
      <button class="formbold-btn btn-m" type="button" onclick="location.href='../mypage'">변경 취소</button>
    </form>
  </div>
  </div>
</div>
	
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
  
    
</script>
</html>