<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <style>
      #messages {
        height: 600px;
        border: 1px solid lightgray;
      }
      .msg-left {
        border: 2px solid #cce891;
        border-radius: 25px;
        padding: 30px;
        margin: 5px;
        width: 70%;
        float: left;
        margin: 30px;
        border-top-left-radius: 0;
        font-size: 18px;
      }

      .msg-right {
        background: #e3f2c9;
        padding: 30px;
        border-radius: 25px;
        text-align: right;
        color: black;
        margin: 5px;
        width: 70%;
        float: right;
        margin: 30px;
        font-size: 18px;
        border-top-right-radius: 0;
      }
    </style>
</head>
<body>
 <div id="messages">
      <!-- <div class="msg-left">
        <img
          src="https://modo-phinf.pstatic.net/20210723_122/1627028806407Dfqxr_PNG/mosarHvgbl.png?type=f320_320"
          width="30"
          style="border-radius: 100%"
        />
        <b>마로블루</b><br /><br /><span style="margin-left: 10px"
          >안녕하세요. 마로블루입니다.</span
        ><br /><span style="margin-left: 10px"
          >박예은님 면접을 진행하고자 연락드렸습니다.<br /></span
        ><span style="margin-left: 10px"
          >010-2352-3242 혹은 maro@gmail.com으로 연락바랍니다.</span
        >
      </div> -->
      <div class="msg-right">
        <img
          src="/photo/${dto.u_photo }"
          width="30"
          style="border-radius: 100%"
        /><b>${dto.u_name }님</b><br /><br />
        <span style="margin-left: 10px">${dto.m_content }</span
        >
      </div>
    </div>
</body>
</html>