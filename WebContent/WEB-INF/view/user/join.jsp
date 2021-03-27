<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="root" value="/"></c:url>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}css/join_new.css">
<link rel="stylesheet" href="${root}css/footBar.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<script>
  function checkUserId(){
  	const id = $("#id").val();
  	
  	if(id.length == 0){
  		alert('아이디를 입력해 주세요');
  		return;
  	}
  	
  	$.ajax({
  		url : '${root}join/checkUserId/'+id,
  		type : 'get',
  		dataType : 'text',
  		success : function(result){
  			if(result.trim() == 'true'){
  				alert('사용할 수 있는 아이디입니다');
  				$("#checkId").val('true')
  			}else{
  				alert('사용할 수 없는 아이디입니다');
  				$("#checkId").val('false')
  			}
  		}
  	})
  }
  function resetUserId(){
  	$("#checkId").val("false");
  }

        $(document).ready(function(){
        $(".input-text").focus(function(){
            $(this).next().css('font-size','12px');
            $(this).next().css('top','20%');
        });
        $(".input-text").focusout(function(){
            if($(this).val()==''){
                $(this).next().css('font-size','15px');
                $(this).next().css('top','38%');
            }
        });
        
    });
    </script>
</head>
<body>
 <section>
        <div class="join-container1">  
            <img class="join-back" src="${root }icon/undo-24px.svg" onclick="location.href='javascript:history.back()'"/>
            <div class="join-box">
                
                <span class="join-title">가입 후 더 많은 혜택을 누리세요</span>
                <img src="${root }images/leaf.png" alt="">
                <span class="join-title">지금 Planty 해보세요</span>
                
            </div>
         
        </div>
        <div class="join-container2">
        <form:form action="${root }join/join_proc" method="post" modelAttribute="userDTO">
		<form:hidden path="checkId"/>
            <div class="property">
                <div class="property-input">
                    <form:input path="name" name="name" id="name" class="input-text" type="text"/>
                    <label for="name">이름</label>
                </div>
                <div class="property-warning">
                    <span><form:errors path="name" class="error"/></span>
                    
                </div>
            </div>
            <div class="property">
                <div class="property-input">
                    <form:input path="id" id="id" name="id" class="input-text" type="text" />
                    <label for="id">아이디</label> 
                    <button onclick="checkUserId();" class="btnALl" type="button">중복확인</button>
                </div>
                <div class="property-warning">
                    <form:errors path="id" class="error"/>
                </div>
            </div>
            <div class="property">
                <div class="property-input">
                    <form:input path="pw1" id="pw1" name="pw1" class="input-text" type="password" />
                    <label for="pw1">비밀번호</label>
                </div>
                <div class="property-warning">
                    <span><form:errors path="pw1" class="error"/></span>
                    
                </div>
            </div>
            <div class="property">
                <div class="property-input">
                    <form:input path="pw2" id="pw2" name="pw2" class="input-text" type="password" />
                    <label for="pw2">비밀번호 확인</label>
                </div>
                <div class="property-warning">
                    <span><form:errors path="pw2" class="error"/></span>
                    
                </div>
            </div>
            <div class="property">
                <div class="property-input">
                    <form:input path="email" id="email" name="email" class="input-text" type="text" />
                    <label for="email">이메일</label>
                </div>
                <div class="property-warning">
                    <span><form:errors path="email" class="error"/></span>
                    
                </div>
            </div>
            <div class="property">
                <div class="property-input">
                    <form:input path="tel" id="tel" name="tel" class="input-text" type="text" />
                    <label for="tel">휴대폰 번호</label>
                </div>
                <div class="property-warning">
                    <span><form:errors path="tel" class="error"/></span>
                    
                </div>
            </div>
            <div class="property address">
                <div class="property-input">
                    <label>주소</label>
                    <button type="button" class="btnALl" id="postcodify_search_button">검색</button>
                    <form:input path="mAddr" name="mAddr" type="text" class="input-text postcodify_postcode5" />
                
                    	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
						<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
						<script>
							$(function() {
								$("#postcodify_search_button").postcodifyPopUp();
							});
						</script>
				    <form:input path="lAddr" name="lAddr" type="text"  class="input-text postcodify_address" />
                    <form:input path="dlAddr" name="dlAddr" type="text" class="input-text postcodify_details"/>
                </div>
                <div class="property-warning">
                    <span><form:errors path="mAddr" class="addrerror"/></span>
                    
                </div>
            </div>
            <div class="property">
                <button class="btn-submit" type="submit">회원가입</button>
            </div>
		 </form:form>
        </div>
    </section>
    <footer>
        <hr class="footer-line">
        <div class="top">
      <div class="footTop">
        <ul class="Wrap1">
          <b>Info</b><br>
          <li class="line"></li>
          <li>MONDAY-FRIDAY 09:00 - 18:00<br>
            LUNCH 12:00 - 14:00<br>
            WEEKEND, HOLIDAY OFF<br>
          </li>
        </ul>
        <ul class="Wrap2">
          <b>Address</b><br>
          <li class="line"></li>
          <li>
            537-17, Achasan-ro<br>
            GwangJin-gu, Seoul,<br>
            Republic of Korea
          </li>
        </ul>
        <ul class="Wrap3">
          <b>SNS</b><br>
          <li>
          <li class="line"></li>
          <li>
            <a href="https://ko-kr.facebook.com/" target="_blank">Facebook</a> <br>
            <a href="https://www.instagram.com/" target="_blank">Instagram</a><br>
            <a href="https://section.blog.naver.com/BlogHome.nhn" target="_blank">Blog</a>
          </li>
        </ul>
        <ul class="Wrap4">
          <b>About Us</b><br>
          <li class="line"></li>
          <li>
            MAIL : sssu0000@gmail.com<br>
          	PHONE : 010-3553-0549<br>
          </li>
        </ul>
      </div>
    
    </div>
    </footer>
 
  
</body>
</html>