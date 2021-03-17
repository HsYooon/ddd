<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${root }css/planty_main.css"/>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        $(document).ready(function(){
        // 해당영역에 마우스 올리면
        $(".area").mouseover(function(){
            $(".area").find(".tag").removeClass("active");
            $(this).find(".tag").addClass("active");
        });
        // 해당영역에 마우스 내리면
        $(".area").mouseleave(function(){
            $(this).find(".tag").removeClass("active");
        });
        // 회색영역에서 마우스 내리면
        $(".box_wrap").mouseleave(function(){
            $(".area").eq(1).find(".box").addClass("active");
        });
    });
    </script>
    <script>
    $(document).ready(function(){
  $('.section2_container').mouseover(function(){ 
     $('.leaf1').css('animation-name','ani-leaf1');
     $('.wrapper').css('display','none');
     $('.div1').css('display','block');
  });
  $('.section2_container').mouseleave(function(){ 
     $('.leaf1').css('animation-name','ani-leaf2');
     $('.wrapper').css('display','block');
     $('.div1').css('display','none');
  });
});
</script>
<%@include file="topBar.jsp"%>
<c:set var="user" value="${sessionScope.loginUser}" />
</head>

<body>
	<section class="section">
    <div class="main">
        <h2 class="semi-title">우리집을 환하게 만들어줄 새로운 식물</h2>
        <div class="container"> 
            
            <div class="thumbnail1"> 
                <img src="${root }images/main/1-1.jpg"/> 
            </div>
                <div class="area">
                    <div class="picker">
                        <div class="inner-picker"></div>
                    </div>
                    <div class="tag active">
                        <span style="display: inline-block; width: 80%;">NEW</span>
                        <svg focusable="false" viewBox="0 0 24 24" class="range-revamp-svg-icon" aria-hidden="true">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M16.4153 12.0003L8.41407 20.0011L6.9999 18.5868L13.5869 12.0002L7.00097 5.41339L8.41528 3.99927L16.4153 12.0003Z"></path>
                        </svg><br>
                        <a href="#">
                            스카비오사<br>
                        </a>
                        <span style="display: block;">산토끼꽃</span>
                        <span>2,500</span>
                    </div> 
                </div>
                <div class="area">
                    <div class="picker">
                        <div class="inner-picker"></div>
                    </div>
                    <div class="tag">
                        <span style="display: inline-block; width: 80%;">NEW</span>
                        <svg focusable="false" viewBox="0 0 24 24" class="range-revamp-svg-icon" aria-hidden="true">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M16.4153 12.0003L8.41407 20.0011L6.9999 18.5868L13.5869 12.0002L7.00097 5.41339L8.41528 3.99927L16.4153 12.0003Z"></path>
                        </svg><br>
                        <a href="#">
                            뉴던<br>
                        </a>
                        <span style="display: block;">장미</span>
                        <span>3,500</span>
                    </div> 
                </div>
      
        </div> 
        <div class="container2">
            <div class="container3">
                <div class="thumbnail2"> 
                    <img src="${root }images/main/2.jpg">  
                </div> 
                <div class="area">
                    <div class="picker">
                        <div class="inner-picker"></div>
                    </div>
                    <div class="tag active">
                        <span style="display: inline-block; width: 80%;">NEW</span>
                        <svg focusable="false" viewBox="0 0 24 24" class="range-revamp-svg-icon" aria-hidden="true">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M16.4153 12.0003L8.41407 20.0011L6.9999 18.5868L13.5869 12.0002L7.00097 5.41339L8.41528 3.99927L16.4153 12.0003Z"></path>
                        </svg><br>
                        <a href="#">
                            민트<br>
                        </a>
                        <span style="display: block;">허브</span>
                        <span>3,500</span>
                    </div> 
                </div>
                
            </div>
            <div class="container4">
                <div class="container5">
                    <div class="thumbnail3"> 
                        <img src="${root }images/main/3.jpg"> 
                    </div>
                    <div class="area">
                        <div class="picker">
                            <div class="inner-picker"></div>
                        </div>
                        <div class="tag active">
                            <span style="display: inline-block; width: 80%;">NEW</span>
                            <svg focusable="false" viewBox="0 0 24 24" class="range-revamp-svg-icon" aria-hidden="true">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M16.4153 12.0003L8.41407 20.0011L6.9999 18.5868L13.5869 12.0002L7.00097 5.41339L8.41528 3.99927L16.4153 12.0003Z"></path>
                            </svg><br>
                            <a href="#">
                                야곱세니<br>
                            </a>
                            <span style="display: block;">다육이</span>
                            <span>4,500</span>
                        </div> 
                    </div> 
                </div>
                <div class="container6">
                    <div class="thumbnail3"> 
                        <img src="${root }images/main/4.jpg"> 
                    </div> 
                    <div class="area">
                        <div class="picker">
                            <div class="inner-picker"></div>
                        </div>
                        <div class="tag active">
                            <span style="display: inline-block; width: 80%;">NEW</span>
                            <svg focusable="false" viewBox="0 0 24 24" class="range-revamp-svg-icon" aria-hidden="true">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M16.4153 12.0003L8.41407 20.0011L6.9999 18.5868L13.5869 12.0002L7.00097 5.41339L8.41528 3.99927L16.4153 12.0003Z"></path>
                            </svg><br>
                            <a href="${root }shop?gds=3">
                                맥시밀리언<br>
                            </a>
                            <span style="display: block;">해바라기</span>
                            <span>4,500</span>
                        </div> 
                    </div>
                </div>
            </div>
        
        </div>
    </div>
</section>
<hr style="margin: 50px;border:#ccc;"> 
<section class="section">
    <h2 class="semi-title">NEW 추천 아이템</h2>
    <div class="section2_container" >
        <div class="leaf1"><img src="${root }images/main/main_leaf1.png" ></div>
        <div class="leaf2"><img src="${root }images/main/main_leaf2.png"></div>
        <div class="leaf3"> <img src="${root }images/main/main_leaf3.png"></div>
        <div class="leaf4"> <img src="${root }images/main/main_leaf4.png" style="transform:rotate(-5deg)"></div>
        <div class="wrapper">
             <span class="section2_title">플랜트 인테리어</span>
             <span class="section2_desc">1월 추천 ITEM</span>
        </div>
        <div class="div1">
            <ul>
                <li><div class="box1"></div></li>
                <li><div class="box2"></div></li>
                <li><div class="box3"></div></li>
            </ul>
        </div>
        
    </div>
</section>
</body>
</html>
