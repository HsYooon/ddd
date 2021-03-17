<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="root" value="/"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}css/joinResult.css">
<%@include file="../topBar.jsp"%>
<style>
        .join-result-container{text-align: center; margin-bottom: 50px}
        .join-result-container > img{
            width: 200px;
        }
        .join-result-span1{
            display:block;
            margin-top: 20px;
            font-size: 38px;
        }
        .join-result-span2{
            display:block;
            margin-top: 15px;
            font-size: 25px;
            margin-bottom: 50px;
            
        }
        .join-result-btn{
            
            border-radius: 15px;
            padding: 20px 15px;
            background-color: rgb(157, 235, 174);
            color: rgb(9, 44, 5);
            font-size: 18px;
            font-weight: 400;
            box-shadow: rgb(214, 214, 214) 2px 2px 8px 0px;
        }
        .join-result-btn:hover{
            background-color: rgb(80, 160, 96);
            color:rgb(255, 255, 255);
        }
    </style>
</head>
<body>
	<div class="join-result-container">
        <img src="images/email.png" alt="">
        <span class="join-result-span1">"인증메일이 발송됐습니다"</span>
        <span class="join-result-span2" >30분내에 인증해야 회원가입이 완료됩니다</span>
        <a href="${root}"><span class="join-result-btn">메인으로</span></a>
    </div>
 <%@include file="../footBar.jsp"%>
</body>
</html>