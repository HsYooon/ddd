<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<c:set var="user" value="${sessionScope.loginUser}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%-- <link rel="stylesheet" href="${root}css/topBar.css"> --%>
<title>Planty : 특별한날 미리 주문하자</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="${root }js/topBar.js" defer></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>

<script>

function loginCheck(){
	if (${user.check eq false}){
		return true;
	}
	return false;
}


function moveTargetPage(url){
	if(loginCheck()){
		alert("로그인 후 이용가능합니다");
		location.href = "${root }login";
	}else{
		location.href = "${root}"+url;
	}

}
function searchToggle(obj, evt) {
	var container = $(obj).closest('.search-wrapper');
	if (!container.hasClass('active')) {
		container.addClass('active');
		evt.preventDefault();
	} else if (container.hasClass('active')
			&& $(obj).closest('.input-holder').length == 0) {
		container.removeClass('active');
		// clear input
		container.find('.search-input').val('');
	}
}
</script>

<style>
body{margin:0;padding:0; min-width: 800px; 
}
a{text-decoration: none;}
.topbar-a{
    color: rgb(48, 48, 48);
}
ul{
    list-style: none;   
}
.topbar-li{
    float: left;
}
.topbar-wrapper{
    width: 100%;
}
.topbar-section{
   
}
.logo-section{
    text-align: center;
}
.bottom-line{
    margin-top: 70px;
    border-bottom: 1px solid #ddd;
}
.logo-img{
	position:relative;
    width: auto;
    height: auto;
    max-width: 300px;
}
.ul-menu{
    float: left;
    
}
.ul-menu > .topbar-li{
	font-family: 'Nanum Gothic', sans-serif; 
    font-size: 20px;
    margin-left: 20px;
    
}
.ul-info{
    text-align: center;
    right: 20px;
    float: right;
    margin-right: 50px;
}
.ul-info > li{
font-family: 'Nanum Gothic', sans-serif; 
    font-size: 20px;
   padding-left: 20px;
   
}
.search{
    width: 230px;
    height: 30px;
    border: 4px solid rgb(50, 192, 15);
}
.search:active {
    border: 4px solid rgb(50, 192, 15);
}
.btn-login{
    width: 80px;
    height: 40px;
    border: none;
    border-radius: 20px;
}
.icon-img{
	position: relative;
	border-radius:20px;
	
    background-color: #eee;
    padding: 6px;
}
.icon-img:hover, 
.logo-img:hover{
	cursor: pointer;
}
</style>

</head>
<%-- 
<body style="zoom: 1;">
	<div id="header" class="headerBar">
		<div class="header2">
			<div id="headerTop">
				<h1 class="title">
					<a href="${root }" class="titleimg">TempTitle</a>
				</h1>
				<div class="loginOutReg">
					<ul>
					<c:choose>
					   <c:when test="${user.check eq false}">
      						 <li><a class="topbar_a" href="${root }login" class="login">로그인</a></li>
      						 <li><a class="topbar_a" href="${root }join" class="reg">회원가입</a></li>
   					   </c:when>
   					   <c:when test="${user.check eq true}">  		
      						 <li> ${user.name} 님 </li> <li> <a class="topbar_a" href="${root }logout" class="login">로그아웃</a></li> <br>
      						 <li>반갑습니다. </li>
      						 
   					   </c:when>
					</c:choose>
						
					</ul>
			</div>
			</div>

			<div id="headerNavWrap">
				<div id="headerNavArea">
					<div class="headerNav">
						<div class="navArea subListWrap">
							<div class="convenientList">
								<ul>
									<li><a  href="javascript:void(0);" onclick="moveTargetPage('myPage');" class="ic_info" title="마이페이지">마이페이지</a></li>
									<li><a  href="javascript:void(0);"  onclick="moveTargetPage('userlike');" class="ic_wish" title="위시리스트">위시리스트</a></li>
									<li><a href="javascript:void(0);"  onclick="moveTargetPage('cart');" class="ic_cart" title="장바구니">장바구니 </a></li>
									
								</ul>
							</div>
							
							
							
							
							<form action="list.do" method="get">
							
							
							<div class="search-wrapper">
								<div class="input-holder">
									
									
									<input type="text" autocomplete="off" class="search-input" name="keyword" id="keyword" value="${keyword}"
										placeholder="상품을 검색해주세요." /> 
										
										
									<button class="search-icon"
										onclick="searchToggle(this, event);">
										<span></span>
									</button>
								</div>
								<span class="close" onclick="searchToggle(this, event);"></span>
							</div>
							
							</form>
							
							
							<div class="menuList">
								<ul>
									<li><a class="topbar_a" href="${root }shoplist">All.전체상품</a></li>
									<li><a class="topbar_a" href="#">메뉴1</a></li>
									<li><a class="topbar_a" href="#">메뉴2</a></li>
									<li><a class="topbar_a" href="#">메뉴3</a></li>
									
									
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<!-- 사이드바 -->
	<div id="rightMenu">
		<div class="topBtmWrap">
		<ul>
			<li><a class="topbar_a" href="#" class="ico" style="display:block;">
			<span><button class="topBtm">맨 위로
			</button></span>
			
			</a></li>
		</ul>
		</div>
	</div>
	
	<div id="insertBody"></div>
	<div>
	</div>

</body> --%>
<body>
    <div class="topbar-wrapper">
        <div class="topbar-section logo-section">
            <div class="logo-wrapper">
                <img class="logo-img" onclick="location.href='${root}';"src="${root}images/planty_logo_main.png" alt="logo">
            </div>
        </div>
        <div class="topbar-section">
            <ul class="ul-menu">
                <li class="topbar-li"><a class="topbar-a" href="${root }shoplist">전체보기</a></li>
                <li class="topbar-li"><a class="topbar-a" href="#">#프로포즈데이</a></li>
                <li class="topbar-li"><a class="topbar-a" href="#">#집들이추천</a></li>
                <li class="topbar-li"><a class="topbar-a" href="#">#졸업식축하해</a></li>
            </ul>
            <ul class="ul-info">
           <li class="topbar-li">
           		<form name="search-form" action="list.do" method="get">
           		<input type="text" class="search" name="keyword" value="${keyword}" placeholder="상품을 검색하세요"
           		onKeypress="javascript:if(event.keyCode==13){search-form.submit}"/>
           		</form>
           </li>
                <c:choose>
					   <c:when test="${user.check eq false}">
      						 <li class="topbar-li"><a href="${root }login">로그인</a></li>
      						 <li class="topbar-li"><a href="${root }join">회원가입</a></li>
   					   </c:when>
   					   <c:when test="${user.check eq true}">  		
      						 <li class="topbar-li"> ${user.name} 님 </li> 
      						 <li class="topbar-li"><input type="button" value="로그아웃" class="btn-login"  onclick="location.href='${root }logout';"/></li>
      						 
   					   </c:when>
				</c:choose>
                
              	<li class="topbar-li"><img class="icon-img" src="${root}icon/ic_info.png" onclick="moveTargetPage('myPage');" alt="마이페이지"></li>
                <li class="topbar-li"><img class="icon-img" src="${root}icon/ic_wish.png" onclick="moveTargetPage('userlike');" alt="위시리스트"></li>
                <li class="topbar-li"><img class="icon-img" src="${root}icon/ic_cart.png" onclick="moveTargetPage('cart');" alt="장바구니"></li> 
               
            </ul>
            
        </div>
        <div class="bottom-line"> </div>
    </div>

    
</body>
</html>