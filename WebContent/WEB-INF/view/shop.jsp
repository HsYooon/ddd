<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<c:set var="user" value="${sessionScope.loginUser}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
		.shop-tab-a{text-decoration: none;}
		.shop-tab-a:link{color:#374047}
		.shop-a{text-decoration: none;}
        .shop-a:link{color: rgb(255, 255, 255);}
        
        .shop-main{
        	margin: 50px 0;
            text-align: center;
        }
        .box1{
           
            display: inline-block;
            height: 600px;
            overflow: hidden;
        }
        .box1 > img{
            
            max-width: 450px;
        }
        .box2{
            display: inline-block;
            margin-left: 50px;
            padding-bottom: 200px;
        }
        .shop-table{
            width: 500px;
            
            text-align: left;
            border-spacing: 15px;
            font-size: 20px;
           /*  border: 1px solid #ddd; */
            
        }
        .gds-title{
            font-size: 30px;
            font-weight: bold;
        }
        .gds-number{
            font-size: 15px;
        }
        .gds-detail{
            font-size: 16px;
            color: #000009;
        }
        .gds-detail-span{
            padding: 5px 5px;
            border-radius: 10px;
            background-color: #ddccf5;;
        }
        .gds-price{
            font-size: 28px;
        }
        .btn-order {
	        text-align: center;
	        border-radius: 30px;
	        padding: 20px 50px;
            color: white;
	        background-color: #b48ee8;	
	        border-radius: 15px;
        }
        .btn-order:hover{
            background-color: #a172e3;
        }

        .btn-cart {
            text-align: center;
        	border-radius: 50%;
        	width: 65px;
        	height: 65px;
        	background: linear-gradient(145deg, #ffffff, #e6e6e6);
        	box-shadow: 5px 5px 0px #fcfcfc, -5px -5px 0px #ffffff; 
        }
        select {
	        font-family: "Noto Sansf KR", sans-serif;
	        font-size: 1rem;
	        font-weight: 400;
	        line-height: 1.5;
	        color: #444;
	        background-color: #fff;
	        padding: 0.6em 1.4em 0.5em 0.8em;
	        margin: 0;
	        border: 1px solid #aaa;
	        border-radius: 0.5em;
	        box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
        }
        
        .customCount{
           
            width: 155px;
            height: 35px;
            border: 1px solid #aaa;
            border-radius: 0.5em;
            color: #444;
        	box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
        }
        
        
        

.tab {
	text-align: center;
	width: 100%;
	height: 80px;
}

.select-tab {
	font-size: 1.5em;
	display: inline-block;
	border-style: none;
	margin-left: auto;
	width: 49.7%;
	height: 100%;
	background-color: rgb(132, 185, 209);
}

.tab-container {
	width: 100%;
	height: 500px;
}

.tab-name {
	font-weight: bold;
	display: block;
	margin-top: 20px;
}

.tab1 {
	background-color: #cfd3d7;
}

.tab2 {
	background-color: white;
}

.tab-container input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.tab-container label {
	margin-left: 20%;
	margin-top: 5%;
	text-align: center;
	display: block;
	width: 20%;
	padding: 10px 20px;
	color: rgb(109, 109, 109);
	background-color: #ffffff;
	cursor: pointer;
	border: 1px solid rgb(132, 185, 209);
	border-radius: 5px;
	position: absolute;
}

.score-section {
	display: block;
	margin-top: 5%;
	position: absolute;
	margin-left: 45%;
}

.thumb-section {
	text-align: center;
}

.content-section {
	text-align: center;
	width: 100%;
	height: 250px;
}

.btn-review {
	width: 10%;
	padding: 10px 20px;
	margin-top: 5%;
	display: block;
	cursor: pointer;
	border-radius: 5px;
	border: 1px solid rgb(132, 185, 209);
	color: rgb(109, 109, 109);
	background-color: #ffffff;
	position: absolute;
	margin-left: 65%;
}

.btn-review:hover {
	color: white;
	background-color: rgb(132, 185, 209);
	position: absolute;
}

.review-table {
	width: 60%;
	margin-left: 20%;
	border-bottom: 1px solid rgb(132, 185, 209);
}

.btn-review-write {
	width: 30%;
	padding: 10px 20px;
	margin-top: 5%;
	cursor: pointer;
	border-radius: 5px;
	border: 1px solid rgb(132, 185, 209);
	color: rgb(109, 109, 109);
	background-color: #ffffff;
	font-size: 1.5em;
}

.btn-review-write:hover {
	color: white;
	background-color: rgb(132, 185, 209);
}

.gds-description {
	margin-top:50px;
	height: auto;
	text-align:center;
}

.gds-description img {
	display: block;
    width: 60%;
    margin-left: 20%;
}
</style>
<%@include file="topBar.jsp"%>
</head>
<body>
	<div class="shop-main">
		<div class="box1">
			<img src="images/${GdsDetail.gdsImg }" />
		</div>
		<div class="box2">
		
		<table  class="shop-table">
                <colgroup>
                    <col width="25%" />
                    <col width="25%" />
                    <col width="25%" />
                    <col width="25%" />
                </colgroup>
                <tr>
                    <td colspan="4">
                    	<c:choose>
							<c:when test="${UserLikeGds eq true}">
								<div class="like" id="userlike" value="dislike">
									<img src="images/favorite-black.svg" class="unactive" width="35px"/>
								</div>
						</c:when>
						<c:when test="${UserLikeGds eq false}">
							<div class="like" id="userlike" value="like">
								<img src="images/favorite_border.svg" class="unactive" width="35px" />
							</div>
						</c:when>
					</c:choose>                      
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="gds-number">상품번호:&nbsp<span id="num" >${GdsDetail.gdsNum }</span></td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="2" id="name" class="gds-title">${GdsDetail.gdsName }</td>
                    <td colspan="2" class="gds-price">&#8361<span id="price">${GdsDetail.gdsPrice }</span></td>
                </tr>
                <tr>
                    <td colspan="4" class="gds-detail"><span class="gds-detail-span">${GdsDetail.gdsDetail }</span></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label for="color">색상</label> 
                        <select id="color">
                            <option>--선택하세요--</option>
                            <c:set var="gdsColor" value="${GdsDetail.gdsColor}" />
							<c:forEach var="option" items="${fn:split(gdsColor, ',') }">
								<option value="${option }">${option }</option>
							</c:forEach>
                        </select>
                    </td>
                    <td colspan="2">
                        <label for="count">수량</label> 
                        <select id="count" onchange="gdsCountSelect();">
                       
					        <option value="#">--선택하세요--</option>
					        <option value="10">10</option>
					        <option value="20">20</option>
					        <option value="30">30</option>
					        <option value="20">40</option>
					        <option value="50">50</option>
                            <option value="custom">직접입력</option>
                            
				        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td colspan="2" align="center"><input class="customCount" type="hidden" id="customCount" onchange="customCount(this.value);" /></td>
                </tr>
                <tr>
                
                	<c:choose>
					<c:when test="${GdsDetail.gdsStock > 0 }">
						<td colspan="3"><div class="btn-order">
						<a class="shop-a" href="javascript:void(0)" onclick="order()"><span
							style="font-size: 1.3em; font-weight: bold;">구매하기</span></a>
						</div></td>
                    	<td colspan="1" align="center"><div class="btn-cart">
							<a href="" onclick="cart()"><img style="margin-top: 20px;"
							src="images/shopping_basket-24px.svg"></a>
						</div></td>
					</c:when>
					<c:when test="${GdsDetail.gdsStock < 1 }">
					<td colspan="4"><div class="btn-order">
						<a class="shop-a" href="javascript:void(0)"><span
							style="font-size: 1.3em; font-weight: bold;">Sold Out</span></a>
						</div></td>
						
					</c:when>
					</c:choose>
                    
                </tr>
            </table>
		</div>
	</div>
	<div class="shop_bottom">

		<div class="tab">
			<a class="shop-tab-a" href="javascript:void(0)" onclick="openTab('info')"><div
					class="select-tab tab1">
					<span class="tab-name">상품정보</span>
				</div></a> <a class="shop-tab-a" href="javascript:void(0)" onclick="openTab('review')"><div
					class="select-tab tab2">
					<span class="tab-name tab2">리뷰작성</span>
				</div></a>

		</div>

		<div id="info" class="tab-container select">
			<h2 style="margin-top: 10%; text-align: center">_</h2>
			<p style="margin-top: 20px; font-size: 2em; text-align: center">Planty(플랜티)</p>
			<p style="margin-top: 20px; text-align: center">이벤트 알림 설정하고 기념일을 챙겨보세요</p>
			<h2 style="text-align: center">_</h2>
			<div class="gds-description">
				<img alt="" src="images/${GdsDetail.gdsDesc}" />
			</div>
		</div>

		<div id="review" class="tab-container select" style="display: none">
			<c:if test="${sessionScope.loginUser.check eq true}">
				<div id="bf-review-write"
					style="width: 80%; margin-left: 10%; margin-bottom: 50px; text-align: center;">
					<button class="btn-review-write" onclick="writeReview()">리뷰쓰기</button>
				</div>
			</c:if>
			<div id="review-write" style="display: none;">
				<div style="position: relative; width: 100%; height: 150px;">
				<form name="fileForm" action="${root }review" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="gdsNum" value="${GdsDetail.gdsNum }" />
						<label for="uploadFiles">업로드</label> <input id="uploadFiles"
							multiple="multiple" type="file" name="filenames"
							onchange="upload()" />

						<div class="score-section">
							<span style="font-weight: bold; font-size: large;">평 점</span> <input
								type="radio" name="score" value="1">1 <input
								type="radio" name="score" value="2">2 <input
								type="radio" name="score" value="3">3 <input
								type="radio" name="score" value="4">4 <input
								type="radio" name="score" value="5" checked="checked">5
						</div>
						<button type="submit" class="btn-review">Send</button>
				</div>
				<div id="thumbimgs" class="thumb-section"></div>
				<div class="content-section">
					<textarea id="content" name="content"
						style="width: 60%; height: 200px; border-color: rgb(132, 185, 209);"></textarea>
			   </form>
				</div>
			</div>

			<c:set var="avgScore" value="0" />
			<c:choose>
				<c:when test="${fn:length(ReviewList) eq 0}">
					<c:set var="len" value="0" />
				</c:when>
				<c:when test="${fn:length(ReviewList) ne 0}">
					<c:set var="len" value="${fn:length(ReviewList)}" />
				</c:when>
			</c:choose>
			
			<c:forEach var="score" items="${ReviewList }">
				<c:set var="avgScore" value="${avgScore+score.rvScore  }" />
			</c:forEach>

			<span
				style="display: block; margin: 20px 20px; text-align: center; font-size: 1.5em;">총
				평점: <c:choose>
					<c:when test="${GdsDetail.review_count eq 0}">
						0.0 (${GdsDetail.review_count}개의 리뷰)
					</c:when>
					<c:when test="${GdsDetail.review_count ne 0}">
						${avgScore/len} (${GdsDetail.review_count}개의 리뷰)
					</c:when>
				</c:choose></span>
			<c:forEach var="rdto" items="${ReviewList }">
				<table class="review-table">
					<tr>
						<td style="height: 50px;"><span
							style="font-size: 1.2em; font-color: gray"> ID ${rdto.id }
								| 작성일: ${rdto.rvDate} | 평 점: ${rdto.rvScore}</span></td>
					</tr>
					<tr>
						<c:set var="rvImgArr" value="${fn:split(rdto.rvImg,',')}" />
						<td><c:forEach var="rvImg" items="${rvImgArr }">
								<c:if test="${rvImg ne '' }">
									<div
										style="display: inline-block; margin: 10px 10px; width: 200px; height: 200px; overflow: hidden;">
										<img src="/uploadimg/${GdsDetail.gdsNum }/${rvImg }"
											width="200px" />
									</div>
								</c:if>

							</c:forEach></td>
					</tr>
					<tr>
						<td style="height: 100px;">${rdto.rvText}</td>
					</tr>

				</table>
			</c:forEach>
			
				<%@include file="footBar.jsp"%>
		
		</div>
	</div>
</body>
<script>

$(document).ready(function() {
    $(".like > img").on("click", function() {
    		let like = document.getElementById("userlike");
    		let gdsNum = document.getElementById('num').innerHTML; 
			let check= "<c:out value='${sessionScope.loginUser.check}'/>";
			if(check === "false"){
				alert("로그인 후 사용가능합니다");
				location.href='${root}login';
				return false;
			}
			
			let userNum = "<c:out value='${sessionScope.loginUser.userNum}'/>";
			let result={"gdsNum" : gdsNum, "userNum": userNum}
    		
    		if(like.getAttribute('value')=='like'){
    		
    			fetch('${root}shop/like',{
            		method: 'POST',
            		headers:{
               			'Content-Type':'application/json;charset=utf-8' 
            		},
            		body:JSON.stringify(result) 
         		})
         		
         		$(this).prop("src", "images/favorite-black.svg");
     			like.setAttribute('value','dislike');
    	 	
    		}else{
    			
    			fetch('${root}shop/dislike',{
            		method: 'POST',
            		headers:{
               			'Content-Type':'application/json;charset=utf-8' 
            		},
            		body:JSON.stringify(result) 
         		})
    	    	
    	    	$(this).prop("src", "images/favorite_border.svg");
    	    	like.setAttribute('value','like');
    	    	
    	    	
    	    }
            
		});
   
});

function gdsCountSelect(){
    let select = document.getElementById("count");
    if(select.options[select.selectedIndex].value == 'custom'){
        let c = document.getElementById("customCount")
        c.type = "text";
    }
}
function customCount(customValue){
    let select = document.getElementById("count");
    select.options[6].value = customValue;
        
}

function openTab(tabName) {
    let i;
    let x = document.getElementsByClassName("select");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";  
    }
    document.getElementById(tabName).style.display = "block";  
  }
  function writeReview(){
 	//상품 구매 여부 확인하기 
	let userNum = "<c:out value='${sessionScope.loginUser.userNum}'/>";
	let gdsNum = "<c:out value='${GdsDetail.gdsNum }'/>";
	console.log("gdsNum"  + gdsNum);
	console.log("userNum" +  userNum);
	let result={"gdsNum" : gdsNum, "userNum": userNum}
	/*
	fetch('${root}shop/purchaseCheck',{
            	method: 'POST',
            	headers:{
               	'Content-Type':'application/json;charset=utf-8' 
            	},
            	body:JSON.stringify(result) 
         		}).then(function(response){
         			console.log(response.result);
         		});
	*/
	

	fetch('${root}shop/purchaseCheck', {
	  method: 'POST', // or 'PUT'
	  headers: {
	    'Content-Type': 'application/json',
	  },
	  body: JSON.stringify(result),
	})
	.then(response => response.json())
	.then(data => {
	  console.log('Success:', data);
	})
	.catch((error) => {
	  console.error('Error:', error);
	});
	
    let x = document.getElementById("bf-review-write").style.display="none";
    let y = document.getElementById("review-write").style.display="block"; 
    
  }
  
    //필드에서 값 확인하기
    function getData(){
        let num = document.getElementById("num").innerHTML; //상품번호
        let name = document.getElementById("name").innerHTML;
        let price = document.getElementById("price").innerHTML; //상품금액
        let color = document.getElementById("color"); //tag 선택  
        let selectColor = color.options[color.selectedIndex].value; // 상품색상
        let count = document.getElementById("count");
        let selectCount = count.options[count.selectedIndex].value;
        let area = document.getElementById("area");
        let priceAll = selectCount*price;
        let thumbImg = "<c:out value='${GdsDetail.thumbImg}'/>";
        
        let result = {"num":num, "name":name, "price":price,"color":selectColor,"count": selectCount,"priceAll":priceAll,"thumbImg":thumbImg}
		
        return result;
    }
    
    //선택한 값 출력하기
    function select(){

        let result = getData();
        
        let price = result.price;
        let color = result.color;
        let count = result.count;
        let priceAll = result.priceAll;
        

        if(color == "#" || count == "#"){
            alert("select");
        }

        let text = area.innerHTML="<hr width=\"500px\">"+"<h3>"+price+" x "+count+"(ea)"+" = "+priceAll + "<br>" + "</h3>" 
        + `<button type=\"button\" id=\"btn2\" onclick=\"cart();\">Add Cart</button>`+`<button type=\"button\" id=\"btn3\" onclick=\"order();\">Buy Now</button>`;
        

    }

    //장바구니 넣기
    function cart(){
    	
        let result = getData();
        let num = result.num;
        let price = result.price;
        let color = result.color;
        let count = result.count;
        let priceAll = result.priceAll;
        let userNum = "<c:out value='${sessionScope.loginUser.userNum}'/>";

        let json= {"userNum":userNum, "gdsNum":num,"cartColor":color,"cartCount":count,"cartPrice":priceAll}; // 장바구니로 이동되는 값 json 형식의 data 

        let xhttp = new XMLHttpRequest(); 
        let url = "${root}order/add"; // root지정하는거로 바꾸기
        
        xhttp.onreadystatechange = function(){
        	if(xhttp.readyState == 4){
             if(xhttp.status == 200){
            	 
            	let result = confirm("장바구니로 이동하실래요?");
                if(result){
                    location.href='${root}cart';
                 }else{
                 	console.log("이동안함");
                 }
             }
            }
        };
        
        xhttp.open("POST", url);
        xhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhttp.send(JSON.stringify(json));
           
    }
    
    // 구매하기

    function order(){
    	let result = getData();
    	let name = result.name;
    	let num = result.num; //gdsNum
        let color = result.color; //ordColor
        let count = result.count; //ordCount
        let price = result.price; //ordPrice
        let thumbImg = result.thumbImg;
        
        let json= {"gdsName":name, "gdsNum":num,"ordColor":color,"ordCount":count,"ordPrice":price,"thumbImg":thumbImg}; // 구매하기 
        console.log("json: " + json);
        submitPost("${root}order",json);
       
    	
    	
    	
    		
    }
    
    function submitPost(url,params){
    	method = 'POST';
    	let form = document.createElement("form");
    	form.setAttribute("method",method);
    	form.setAttribute("action",url);
    	for(let key in params){
    		let hiddenField = document.createElement("input");
    		hiddenField.setAttribute("type","hidden");
    		hiddenField.setAttribute("name", key);
    		hiddenField.setAttribute("value",params[key]);
    		form.appendChild(hiddenField);
    	}
    	
    	document.body.appendChild(form);
    	form.submit();
    }
    
    
    // 찜하기 
    function favorite(){
    	let img = document.getElementById("like").src="images/favorite-black.svg";
    }
    
    
    // 리뷰쓰기 
    
    let filenames = [];
	function sendReview(){

    	let scoreObj = document.getElementsByName("score");
    	let score;

    	for(i=0; i<scoreObj.length; i++){
       	 if(scoreObj[i].checked){
           	 score = scoreObj[i].value;
        		}
   		 }
    
    	let title = document.getElementById("title").value;
    	let content = document.getElementById("content").value;
    
    	//값 확인하기
    	//let testarea = document.getElementById("test").innerText ="score: " + score + "title: "+title+"content: "+ content+ "filenames: " + filenames;
    	
    	
    	let result = getData();
    	let json= {"gdsNum": result.num,"id": "관리자","rvText":content,"rvImg":filenames,"rvScore":score};
    	submitPost("${root}review",json);
    	
   
    	
		}
		function upload(){
    		let files = document.getElementById("uploadFiles").files;
    
   		function readAndPreview(files){
        
        	let reader = new FileReader();
        	let maxSize = 3 * 1024 * 1024;  
        	let fileSize = 0;
        	reader.addEventListener("load",function(){

        		console.log(files.size);
        		if(files.size > maxSize){
        			alert("3MB이하의 파일만 업로드 할수 있습니다");
        			return false;
        		}
            	let image = new Image();
            	image.width = "200";
            	image.height = "200";
            	image.title = files.name;
            	image.src = this.result;
            	filenames.push(image.title);
            
            	document.getElementById("thumbimgs").appendChild(image);
        	},false);

        	if(files){
            	reader.readAsDataURL(files);
        		}
			}

    		if(files){
    			if(files.length > 3){
    				alert("3개 이하만 업로드 가능합니다 ");
    				return false;
    		}
       			[].forEach.call(files,readAndPreview); 
    			}
			}
  
    
</script>
</html>