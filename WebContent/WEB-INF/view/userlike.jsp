<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="ko">
<head>
    <title>위시리스트</title>
    <meta charset="utf-8">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <%@include file="topBar.jsp"%>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
  
  <style>
        body{margin: 0;padding: 0;
            font-family: 'Nanum Gothic', sans-serif;
        }
        .wish-container{
            margin-top: 100px;
            margin-bottom:100px;
            width: 100%;
            
            
        }
        .wish-wrapper{
        	margin-top:50px;
            margin-left: 300px;
            max-width: 900px;
            min-width: 600px;
            border-radius: 5px;
            background-color: rgb(248, 240, 227);
        }
        .wish-table{
            
            width: 100%;
            padding: 15px 15px;
            border-spacing: 10px;
            
        }
        
        .wish-table-thumb{
            width: 250px;
            min-width: 100px;
        }
        .wish-table-gdsNum{
            background-color: rgb(224, 184, 138);
            border-radius: 15px;
            font-size: 13px;
            padding: 5px 10px;
        }
        .wish-table-btn-delete{
            width: 100%;
            min-height: 250px;
            border: none;
            font-size: 40px;
            color: wheat;
            background-color: rgb(135, 179, 118);
        }
        
        .wish-table-btn-delete:hover{
            background-color: rgb(83, 124, 67);
        }
        .wish-table-tag{
            display: inline-block;
            padding: 15px 20px;
            background-color: rgb(243, 243, 243);
            border: 1px solid rgb(219, 219, 219);
            margin: 4px 8px;
            border-radius: 30px;
            
            
        }
        .wish-table-tag:hover{background-color: rgb(210, 210, 210);}
        .wish-table-Tagtd{
            text-align: center;
        }
        
        
        .default-span{
            font-size: 40px;
            margin-top: 20px;
            font-weight: 200;
            margin-bottom: 50px;
        }
    </style>
</head>

<body>
<body>
    <div class="wish-container">
    <c:set var="listLen" value="${UserLikeList }"/>
		<c:choose>
			<c:when test="${fn:length(listLen) eq 0}">
			 <div class="defalut-wishlist" style="text-align: center;">
           <div class="default-div"><img src="images/like.png" style="width: 180px;" /></div>
           <span class="default-span" style="display: block;">"마음에 드는 상품을 담아보세요"</span>
    </div>
			</c:when>
		</c:choose>
		
   
    
    <c:forEach var="userlike" items="${UserLikeList }">
        <div class="wish-wrapper">
            <table  class="wish-table">
                <colgroup>
                    <col width="30%" />
                    <col width="60%" />
                    <col width="10%" /> 
                </colgroup>
                    <tr>
                        <td rowspan="3"><img class="wish-table-thumb" src="images/${userlike.thumbImg }"/></td>
                        <td style="height: 10%">&nbsp;&nbsp;&nbsp;&nbsp;
                            <span class="wish-table-gdsNum">상품번호 : ${userlike.gdsNum }</span>
                        </td>
                        <td rowspan="3"><input class="wish-table-btn-delete" type="button" value="X" onClick="deleteUserLike(${userlike.gdsNum })"/></td>
                    </tr>
                    <tr>
                        <td style="height: 18%;font-size: 30px;">
                            &nbsp;&nbsp;&nbsp;<span style="font-weight: 400;">${userlike.gdsName }</span>
                            <span style="font-size: 18px;">${userlike.gdsDetail }</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="wish-table-Tagtd">
                        
                        <c:forEach var="tag" items="${userlike.gdsTagList}">
                            <span class="wish-table-tag"><a href="${root }list.do?keyword=${tag}">#${tag}</a></span>
                            
                        </c:forEach>
                        </td>
                    </tr>

                
            </table>
        </div>
        </c:forEach>
                    
    </div>
             
<%@include file="footBar.jsp" %>
</body>

<%-- 
    <div id="contentWrapper">
        <div id="contentWrap">
            <table class="userLikeList">
				<h2></h2>
                <colgroup>
                    <!-- 각 열의 데이터 길이를 고려해서, 최적의 너비값 설정 -->
                    <col width="5%" />
                    <col width="10%" />
                    <col width="33%" />
                    <col width="18%" />
                    <col width="7%" />
                    <col width="10%" />
                    <col width="7%" />
                    <col width="10%" />
                </colgroup>
				
                <thead>
                    <tr>
                        <th><input class="userLike_00" type="checkbox" name="chk_01" value="userLike_01"></th>
                        <th>사진</th>
                        <th class="userLikeleft">상품번호</th>
                        <th>상품명</th>
                       
                    </tr>
                </thead>
			
                <!-- 상품 리스트 부분 -->
                
                <tbody>
           	        <c:set var="userLike" value="0"/>
                    <c:forEach var="userlike" items="${UserLikeList }">
    
              		<tr>
                    	<td><input class="userlike_02" type="checkbox" data-gdsNum="userlike.gdsNum" name="userlike_02" value="userlike.gdsNum"></td>
                    	<td><a href="#"><img src="images/${userlike.thumbImg }" alt="장바구니_상품3"></a></td>
                    <td>
                    	상품번호 :${userlike.gdsNum }
                    </td>
                    <td>
                   	 	상품명 :${userlike.gdsName }
                    </td>
                 
                    </tr>
              		
            		</c:forEach>
                    
                    
                </tbody>
                <tfoot class="userLikeListFootLine">
                	<table class="userLikeList_foot">
		                <tr>
		                    <td colspan="8">
		                        <div class="btnDeleteCtr">
		                            <a href="" class="gdsDeleteBtn">선택상품 삭제</a>
		                        </div>
		                    </td>
		                </tr>
                </tfoot>
            </table>
         </div>
    </div>
</body> --%>
<script>

function deleteUserLike(gdsNum){
	location.href='${root}userlike.do?gdsNum=' + gdsNum; 
}

</script>
</html>