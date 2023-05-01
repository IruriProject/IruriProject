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
  @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  body {
    font-family: 'Inter', sans-serif;
    flex-direction: row;
    display: flex;
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
    font-weight: 500;
    font-size: 16px;
    color: #536387;
    outline: none;
    resize: none;
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


  .formbold-btn {
    font-size: 16px;
    border-radius: 5px;
    padding: 14px 25px;
    border: none;
    font-weight: 500;
    background-color: #4E9F3D;
    color: white;
    cursor: pointer;
  }
  .formbold-btn:hover {
    box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
  }

  .formbold-w-45 {
    width: 45%;
  }
</style>
<title>login</title>
</head>
<body>

<!-- 개인로그인 -->
<div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form action="login/user" method="POST">

      <div class="formbold-mb-3">
        <label for="login" class="formbold-form-label"> 일반회원 로그인 </label>

        <input
          type="text"
          name="u_id"
          placeholder="아이디를 입력하세요"
          class="formbold-form-input formbold-mb-3"
        />
        <input
          type="password"
          name="u_pw"
          placeholder="비밀번호를 입력하세요"
          class="formbold-form-input"
        />
      </div>

      <button type="submit" class="formbold-btn">로그인</button>
    </form>
  </div>
</div>

<!-- 기업로그인 -->
<div class="formbold-main-wrapper">
  <div class="formbold-form-wrapper">
    <form action="login/enterprise" method="POST">

      <div class="formbold-mb-3">
        <label for="login" class="formbold-form-label"> 기업회원 로그인 </label>

        <input
          type="text"
          name="e_id"
          placeholder="아이디를 입력하세요"
          class="formbold-form-input formbold-mb-3"
        />
        <input
          type="password"
          name="e_pw"
          placeholder="비밀번호를 입력하세요"
          class="formbold-form-input"
        />
      </div>

      <button type="submit" class="formbold-btn">로그인</button>
    </form>
  </div>
</div>

</body>

</html>