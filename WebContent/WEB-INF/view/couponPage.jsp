<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<c:set var="user" value="${sessionScope.loginUser}"/>
<!DOCTYPE html>
<html lang="EUC-KR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${root}css/couponpage.css" />


<title>Document</title>

<%@include file="topBar.jsp"%>
</head>
<body>

	<div class="myMain">

	</div>
	<div class="cp_reg">
	
	<img src="${root}/images/coupon.png" style="margin-bottom:30px;">
	<br>
        <div class="reg">
            <form action="${root }regCoupon" method="post" >
                <input type="hidden" name="type">
                <input type="hidden" name="check_type" value="iframe">
                <input type=text size=6 maxlength=4 name="cpCode" style='text-align:center;text-transform : uppercase;'  class="input_offcoupon" />
                 - <input type=text size=6 maxlength=4 name="cpCode2" style='text-align:center;text-transform : uppercase;'  class="input_offcoupon" />
                 - <input type=text size=6 maxlength=4 name="cpCode3" style='text-align:center;text-transform : uppercase;'  class="input_offcoupon" />
                 - <input type=text size=6 maxlength=4 name="cpCode4" style='text-align:center;text-transform : uppercase;'  class="input_offcoupon" />
                 <input type="hidden" name="userNum" value="${user.userNum }">
                 <input type="submit"  value="쿠폰번호등록">
            </form>		
	    </div>
        <div class="txt">쿠폰번호는 영문자+숫자 조합이며, 총 16자리 입니다. 예) VVIP-VVIP-VVIP-VVIP</div>
    </div>
	
	
	
	
	
	<!-- 주문정보 간소화 -->
	<!-- 최근 주문 정보 -->
	<table class="shopping_cart_foot">
		<tr>
			<td colspan="8">

				<div class="lstOrdList">전체 쿠폰 목록</div>
				<div class="ordAllList"></div>

			</td>
		</tr>
	</table>
	<div id="contentWrapper">
		<div id="contentWrap">
			<table class="shopping_cart">

				<colgroup>
					<!-- 각 열의 데이터 길이를 고려해서, 최적의 너비값 설정 -->
					<col width="5%" />
					<col width="10%" />
					<col width="23%" />
					<col width="18%" />
					<col width="7%" />
					<col width="10%" />
					<col width="7%" />
					
				</colgroup>

				<thead>
					<tr>
						<th scope="row"><div class="tb-center">쿠폰번호</div></th>
                    <th class="ipt" scope="row"><div class="tb-center">쿠폰이름</div></th>
                    <th class="ipt" scope="row"><div class="tb-center">적용범위</div></th>
                    <th scope="row"><div class="tb-center">할인액(률)</div></th>
                    <th class="ipt" scope="row"><div class="tb-center">사용기간</div></th>
                    <th scope="row"><div class="tb-center">사용여부</div></th>
						
					</tr>
				</thead>
<c:forEach var="cl" items="${allCpList }"> 

				<!-- 상품 리스트 부분 -->
				<tbody>


						<tr>
						<td>${cl.cpNum}</td>
							<td >${cl.cpName }</td>
							<td style="text-align: center !important;">${cl.itemScope }</td>
							<td><fmt:formatNumber value="${cl.cpRate }" type="percent"/></td>
							<td>${cl.expDate }</td>
							<c:choose>
                     	<c:when test="${cl.useCp == '사용가능'}"><td><p style="color:#FF5D5D; ">${cl.useCp }</p></td></c:when>
                     	<c:when test="${cl.useCp == '사용완료'}"><td><p style="color:black; font-weight: normal;">${cl.useCp }</p></td></c:when>
                     </c:choose>
							
						</tr>

					 </c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<div id="contentWrapper"  style="height:100px !important;">
      <div id="contentWrap" >
      	<colgroup>
               <!-- 각 열의 데이터 길이를 고려해서, 최적의 너비값 설정 -->
               <col width="100%" />
        </colgroup>
      
      	<table class="shopping_cart"  style="border-style: hidden !important; ">
         <thead >
               <tr >
                  <th scope="row" style="background-color:white !important;"><div class="tb-center"  style="margin-bottom:40px !important;"><c:if test="${empty allCpList}">보유하고 계신 쿠폰 내역이 없습니다</c:if></div></th>
               </tr>
         </thead>
         	 <tbody>
         	<tr>
         		<td >
         		</td>
         	</tr>
         </tbody>
       
         </table>
      </div>
   </div>
	<br>
	<br>
	<br>

<%@include file="./footBar.jsp" %>
</body>
</html>