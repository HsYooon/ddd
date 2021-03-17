<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="root" value="${pageContext.request.contextPath}/" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">  
  <title>Insert title here</title>
  
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href="${root}css/footBar.css">
	<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<%@include file="../topBar.jsp"%>
	  <style>
        body{margin:0;}
        .login-a,.login-a:link{
            color: rgb(66, 66, 66);
            font-size: 15px;
        }
        .login-a:visited{color: rgb(10, 87, 42);}
        .login-container{
            width: 100%;
            
            /* background-color: beige; */
        }
        .login-wrapper{
            width: 30%;
            height: auto;
            margin-left: 35%;
            margin-top: 100px;
            text-align: center;
            
            background-color: rgb(117, 167, 168); 
            overflow: auto;
            border-radius: 7px;
            background: #ffffff;
            box-shadow:  5px 5px 36px #ebebeb, 
                        -5px -5px 36px #ffffff;
        }
        .login-inner{
            /* background-color: coral; */
            height: 50px;
            margin-top: 10px;
            position: relative;
            text-align: center;
        }
        .id{
            margin-top: 100px;
        }

        .login-id,.login-pw {
            width: 50%;
            /* padding: 12px 20px; */
            height: auto;
            
            box-sizing: border-box;
            border: none;
            border-bottom: 2px solid #ccc;
            -webkit-transition: 0.5s;
            transition: 0.5s;
            outline: none;
            
            padding: .8em .5em;
        }

        .login-id:focus,.login-pw:focus {
            border-bottom: 3px solid rgb(116, 116, 116);
        }
        input::placeholder{
  			color:rgb(0,0,0);
  			font-weight: bold;
		}
        input[type=button]{
            display: block;
            width: 60%;
            margin-left: 20%;   
            height: 38px;
            padding: 10px 30px;
            margin-top: 3px;
            margin-bottom: 3px;
            border-radius: 20px;
            background-color: rgb(89, 197, 95);
            border:none;
            font-size: 15px;
            font-weight: lighter;
            color: rgb(57, 87, 44);
        }
        input[type=button]:nth-child(2){
            background-color: rgb(216, 216, 216);
        }
        label{
            
            font-size: 18px;
            color: rgb(114, 114, 114);
            width: 50px;
            display: inline-block;
            text-align: left;
            
        }
        .login-btnWrapper{
            /* background-color: lightsalmon; */
            height: 55px;
            margin-top: 40px;
            margin-bottom: 10px;
            
        }
        .login-option{
            width: 50%;
            height: 80px;
            margin-left: 18%;
            
        }
        button{
            border: none;
            padding: 10px 50px;
            border-radius: 20px;
            background-color: rgb(89, 197, 95);
            color: rgb(255, 255, 255);
            font-size:15px;
            font-weight: bold;
        }
        button:hover{
            background-color: rgb(48, 99, 51);
            color: white;
        }
        .error{
            display: block;
            color:rgb(172, 69, 69);
            font-size: 13px;
            text-align:center;
        }
        .test{
        margin-top:100px;
        }
    </style>
</head>
<body>

	<div class="login-container">
        <div class="login-wrapper">
        <form:form action="${root}login/login_proc" method="post" modelAttribute="loginUserDTO">
            <div class="login-inner id">
                <form:input path="id" class="login-id" id="id" type="text" placeholder="아이디를 입력하세요"/>
                <form:errors path="id" class="error"></form:errors>
            </div>
            <div class="login-inner pw">
                <form:input path="pw1" class="login-pw" id="pw" type="password" placeholder="비밀번호를 입력하세요"/>
                <form:errors path="pw1" class="error"></form:errors>
            </div>
            <div class="login-btnWrapper">
                <button type="submit">Login</button>
                <button onclick="location.href='${root}join'" type="button">Sign up</button>
            </div>
          </form:form>
          <div class="login-option">
                <a class="login-a" href="${root}user/idSearch">아이디 찾기</a>
                <a class="login-a" href="${root}user/pwSearch">비밀번호 찾기</a>
            </div>
    	</div>
    </div>
	<div class="test">
 	<%@include file="../footBar.jsp" %>
 	</div>
</body>
</html>