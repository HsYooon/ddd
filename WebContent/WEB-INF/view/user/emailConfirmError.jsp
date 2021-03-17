<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    body{margin: 0; padding: 0;}
    .div-main{
        width: 500px;
        height: 500px;
        /* background-color: aliceblue; */
        margin-left: 30%;
        margin-top: 200px;
    }
    .title{
        text-align: center;
        display: block;
        font-size: 40px;
        font-weight: 600;
        /* background-color: beige; */
    }
    .sub-title{
        text-align: center;
        font-size: 23px;
        display: block;
        padding: 10px 5px;
        /* background-color: burlywood; */
    }
    .div-content label{
        font-size: 15px;
    }
    .div-input{
        
        text-align: center;
        margin-top: 10px;
    }
    .div-input input{
        padding: 8px 5px;
        width: 280px;
    }
    .btn{
        background-color: rgb(154, 199, 230);
        border: rgb(172, 170, 170) 1px solid;
        padding: 10px 20px;
        width: 300px;
        height: 45px;
        border-radius: 5px;
        margin-top: 10px;
    }
    .btn:hover{
        background-color: rgb(90, 129, 155);
        color: white;
        border: #ffffff 1px solid;
    }
    .email-area{
        height: 150px;    
    }
    .email-area span{
        display: block;
        font-size: 25px;
    }
    
</style>
<body>
    <div class="div-main">
        <div class="div-title">    
            <span class="title">만료된 키입니다</span>
            <span class="sub-title">다시 인증메일을 보내주세요</span> 
        </div>
        <div class="div-content">
            <div class="div-input">
                <input id="id" type="text" name="id" placeholder="아이디"/>
            </div>
            <div class="div-input">
                <input id="pw" type="password" name="pw" placeholder="비밀번호"/>
            </div> 
            <div class="div-input" id="btn-idpw" style="display:block">
                <input id="btn1" class="btn" type="button" onclick="findEmail();" value="확인"/>
            </div> 
            <div class="div-input" id="btn-email" style="display: none;">
                <div class="email-area">
                    <span id="email"></span>
                    <span>으로 재발송 합니다</span>
                    <input id="userNum" type="hidden" />
                    <input id="btn2" class="btn" type="button" onclick="sendEmail()" value="이메일전송"/>
                </div>
            </div>
            <div class="div-input" id="btn-error" style="display: none;">
                <div class="email-area">
                    <span id="error"></span>
                    <input class="btn" type="button" onclick="findEmail();" value="확인"/>
                </div>
            </div>
        </div>
    </div>

</body>
<script>
	
	function sendEmail(){
			
		let email = document.getElementById("email").innerText;
		let userNum = document.getElementById("userNum").value;
		
		let obj = new Array();
		obj.push(userNum);
		obj.push(email);
		
		let result={"info" : obj}
        let result_email;
        fetch('${root}join/resendEmail',{
    		method: 'POST',
    		headers:{
       			'Content-Type':'application/json;charset=utf-8' 
    		},
    		body:JSON.stringify(result) 
 			
            }).then(response => response.text())
 	    	  .then(data => resultView(data));
		
	}
	
	function resultView(data){
		
		if(data === 'success'){
			let message = confirm("인증메일이 발송됐습니다.메일을 확인해주세요");
			if(result){
			    location.href='/main';
			}else{
				location.href='/shopList';
			}
		}
	}
	
	
    function findEmail(){
        
        let id = document.getElementById("id").value;
        let pw = document.getElementById("pw").value;
        
        let result={"id" : id, "pw1": pw}
     
        fetch('${root}join/emailAuth',{
    		method: 'POST',
    		headers:{
       			'Content-Type':'application/json;charset=utf-8' 
    		},
    		body:JSON.stringify(result) 
 			
            }).then(response => response.text())
 	    	  .then(data => writeEmail(data));
 	
    }
    
    function writeEmail(data){
    	
    	let divI = document.getElementById("btn-idpw");
        let divE = document.getElementById("btn-email");
        let divEr = document.getElementById("btn-error");
        
         
    	if(data === "error"){
    		let error = document.getElementById("error");
    		error.innerText = "아이디 또는 비밀번호가 틀립니다";
    		
    		if(divI.style.display == 'block'){
        		divI.style.display = 'none';
        		divEr.style.display = 'block';
        
    	   }else{
    		   divEr.style.display = 'none';
    		   divI.style.display = 'block';
    		   
    		   setTimeout(function() {
    			   divI.style.display = 'none';
        		   divEr.style.display = 'block';   
    		   }, 800);
    		   
    	  }
    	
    	}else{
    		
    		let result = data.split('&');
    		
    		let email = document.getElementById("email");
    		email.innerText = result[1];
    		let userNum = document.getElementById("userNum");
    		userNum.value=result[0];
    		
        	if(divI.style.display == 'block'){
            		divI.style.display = 'none';
            		divE.style.display = 'block';
            
        	   }else{
        		    divEr.style.display = 'none'; 
            	    divE.style.display = 'block';
        	  }
    	}
    }
    
</script>
</html>