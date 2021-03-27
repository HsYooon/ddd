<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Planty</title>
<%@include file="../topBar.jsp"%>
    <style>
        .login-result-container{text-align: center; margin-bottom: 50px}
        .login-result-container > img{
            width: 200px;
        }
        .login-result-span1{
            display:block;
            margin-top: 20px;
            font-size: 38px;
        }
        .login-result-span2{
            display:block;
            margin-top: 15px;
            font-size: 25px;
            margin-bottom: 50px;
            
        }
        .login-result-btn{
            
            border-radius: 15px;
            padding: 20px 15px;
            background-color: rgb(157, 235, 174);
            color: rgb(9, 44, 5);
            font-size: 18px;
            font-weight: 400;
            box-shadow: rgb(214, 214, 214) 2px 2px 8px 0px;
        }
        .login-result-btn:hover{
            background-color: rgb(80, 160, 96);
            color:rgb(255, 255, 255);
        }
    </style>
</head>
<body>
    <div class="login-result-container">
        <img src="images/error.png" alt="">
        <span class="login-result-span1">"가입되지 않은 사용자입니다"</span>
        <span class="login-result-span2" >지금 가입하세요!</span>
        <a href="${root}/join"><span class="login-result-btn">회원가입</span></a>
    </div>
    <%@include file="../footBar.jsp"%>
</body>
</html>