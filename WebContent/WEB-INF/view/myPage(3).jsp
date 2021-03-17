<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="EUC-KR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${root}css/mypage.css" />
<title>Planty | 마이페이지</title>
<%@include file="topBar.jsp"%>
<style>
html, body{
    margin: 0;
    background-color: #ffffff;
    font-family: 'Nanum Gothic', sans-serif;
  }
.main{
    width: 100%;
    margin-top: 200px;
}
.container-cal{
        width: 80%;
        margin: 0 auto;
        
}
.cal-left{
    width: 50%;
    /* background-color: rgb(233, 232, 232); */
    height: 400px;
    float: left;
}
.cal-right{
    width: 50%;
    /* background-color: rgb(87, 153, 101); */
    height: 400px;
    margin-left: 55%;
}

.cal-table{
    text-align: center;
    padding: 20px 30px;
    min-width: 400px;
    min-height: 400px;
    color: rgb(34, 88, 52);
    border-radius: 66px;
background: #ffffff;
box-shadow:  9px 9px 39px #ebebeb,
             -9px -9px 39px #ffffff;
                
}

.cal-day{
    height: 50px;
    width: 50px;
}
.cal-year-month{
    height: 70px;
}
.cal-title{
    display: inline-block;
    font-size: 30px;
    text-align: center;
    margin-top: 10px;
    font-weight: 800;
    margin-bottom: 10px;
    
}
label{
    font-size: 30px;
    font-weight: 400;
}

.setting-table{
    text-align: center;
    padding: 20px 30px;
    min-width: 420px;
    min-height: 400px;
    color: rgb(34, 88, 52);
    border-radius: 66px;
background: #ffffff;
box-shadow:  9px 9px 39px #ebebeb,
             -9px -9px 39px #ffffff;
                
    
}
.setting-title :nth-child(1){
    font-size: 30px;
    font-weight: 800;
}
.setting-title :nth-child(2){
    font-size: 18px;
    font-weight: 800;
}
.setting-attr{
    font-size: 15px;
    text-align: left;
}
.setting-attr > textarea{
    width: 100%;
    height: 100px;
    background: none;
}
.setting-attr + td > input[type=text]{
    background: none;
    border: none;
    width: 100%;
    border-bottom:1px solid rgb(42, 71, 55);
}
.setting-attr + td > input[type=text]:focus,
.setting-attr > textarea:focus,
.setting-attr + td > select:focus
{
    outline: 3px solid blanchedalmond;
    border: none;
}
.setting-attr + td > select{
    width: 100%;
    height: 30px;
    background: none;
}
.setting-btn-save{
    width: 100%;
    height: 50px;
    border: 1px solid rgba(10, 56, 21,0.8);
    border-radius: 25px;
    font-size: 18px;
    font-weight: 700;
    background: none;
}
.setting-btn-save:hover{
    background-color: rgba(228, 250, 133,0.7);
    border: none;
}

.cal-bottom{
    margin-top: 50px;
    margin-left: 100px;
    margin-bottom: 100px;
}
.bottom-table{
    text-align: center;
    padding: 20px 35px;
    min-width: 500px;
    
    color: rgb(34, 88, 52);
    border-radius: 66px;
    
 background: #ffffff;
box-shadow:  9px 9px 39px #ebebeb,
             -9px -9px 39px #ffffff;
                
}



</style>

</head>
<body>

   <div class="myMain">
      <div class="subTitle">마이페이지</div>
      <br> <br>
      <div class="info">
         <div class="order">
            <table class="myPageUserInfo">

               <colgroup>
                  <!-- 각 열의 데이터 길이를 고려해서, 최적의 너비값 설정 -->
                  <col width="10%" />
                  <col width="10%" />
                  <col width="10%" />
                  <col width="10%" />
                  <col width="10%" />
                  <col width="10%" />
                  <col width="10%" />
               </colgroup>

               <thead>
                  <tr height="50">
                     <th>${user.name } 님</th>
                     <th>기념일</th>
                     <th>장바구니</th>
                     <th>위시리스트</th>
                     <th>적립금</th>
                     <th>쿠폰</th>
                  </tr>
               </thead>

               <!-- 상품 리스트 부분 -->
               <tbody>
                  <tr height="100">
                     <td style="padding-left: 50px; border-left: 0px;"><div class="base"
                           style="text-align: left;">
                           ${user.tel }<br>  ${user.email }<br>
                        </div></td>
                     <td><div class="base"><a href="${root}event">${cartCount}개</a></div></td>
                     <td><div class="base">${cartCount}개</div></td>
                     <td><div class="base">${userLikeListCount }개</div></td>
                     <td><div class="base">
                     	<c:set var="tp" value="${totalPoint}" />
					 	<c:choose>
    				 	<c:when test="${empty tp}">0원</c:when>
    				 	<c:otherwise>${totalPoint.totalPoint }원</c:otherwise>
    				 	</c:choose>
                     	</div>
                     </td>
                     <td><div class="base"><a href="${root }couponPage">${cpCount}장</a></div></td>
                     </tr>
                     </tbody>

               <tfoot>
                  <tr height="30">
                     <th></th>
                     <th></th>
                     <th></th>
                     <th></th>
                     <th></th>
                     <th></th>
                  </tr>
               </tfoot>

            </table>
         </div>
      </div>
      <!--달력 넣기 -->
      
      <div class="main">
      
      <div class="container-cal">
    <div class="cal-left">
        <!-- 달력 / 테이블 -->
        <table class="cal-table" align="center" >
            <thead>
                <tr class="btn-wrap clearfix">
                    <td>
                      <label id="prev" onclick="prev()">
                          &#60;
                      </label>
                    </td>
                    <td align="center" class="cal-year-month" id="current-year-month" colspan="5">
                      <span class="cal-title" id="current-year"></span>
                      <span class="cal-title" id="current-month"></span>
                    </td>
                    <td>
                      <label id="next" onclick="next()">
                          &#62;
                      </label>
                    </td>
                  </tr>
                <tr>
                    <td class="cal-day">Sun</td>
                    <td class="cal-day">Mon</td>
                    <td class="cal-day">Tue</td>
                    <td class="cal-day">Wed</td>
                    <td class="cal-day">Thu</td>
                    <td class="cal-day">Fri</td>
                    <td class="cal-day">Sat</td>
                </tr>
            </thead>
            <tbody id="calendar-day">
            </tbody>
        </table>
    </div>
    
    <div class="cal-right">
    <div id="existEvent" style="display: none;"> 
        <table class="setting-table">
          <thead>
            <tr>
              <td class="setting-title" colspan="2">
                <span>1</span>
                <span >Feb</span>
              </td>
            </tr>
          </thead>
          <tbody>
              <tr>
                <td class="setting-attr">기념일</td>
                <td id="eventName"></td>
              </tr>
              <tr>
                <td class="setting-attr">메모</td>
                <td id="eventMemo"></td>
              </tr>
              <tr>
                <td class="setting-attr">알람일</td>
                <td id="eventAlarm"></td>
              </tr>
              <tr>
              		<input id="eventNum" type="hidden" />
                <td><input type="button" value="수정하기" onclick="updateEvent()"/></td>
                <td><input type="button" value="삭제하기" onclick="deleteEvent()"/></td>
              </tr>
          </tbody>
        </table>
      </div>
    <div id="noneEvent" style="display: block;">
    <form action="${root }addEvent" method="POST" >
      <input type="hidden" name="userNum" value="${user.userNum}"/>
      <table class="setting-table" >
        <thead>
          <tr>
            <td class="setting-title" colspan="2">
              <span id="selected-day"></span>
              <span id="selected-month"></span>
              <input type="hidden" id="day" name="day"/>
              <input type="hidden" id="month" name="month"/>
              <input type="hidden" id="year" name="year"/>
            </td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="setting-attr">기념일</td>
            <td><input id="input-eventName" type="text" name="eventName" /></td>
          </tr>
          <tr>
            <td class="setting-attr">메모</td>
            <td class="setting-attr"><textarea id="input-eventMemo" name="eventMemo"></textarea></td>
          </tr>
          <tr>
            <td class="setting-attr">알람</td>
            <td><select name="eventAlarm" id="alarm">
                  <option value="5">5일 전</option>
                  <option value="3">3일 전</option>
                  <option value="1">1일 전</option>
                </select>
            </td>
          </tr>
          <tr>
              <td colspan="2"><input class="setting-btn-save" type="submit" value="저장"/></td>
          </tr>
        </tbody>
      </table>
      </form>
      </div>
    </div>
   <div class="cal-bottom">
      <table class="bottom-table">
        <thead>
          <tr>
            <td>기념일</td>
            <td>날짜</td>
            <td>메모</td>
            <td>알람</td>
          </tr>
        </thead>
        <tbody>
          
          <c:set var="list" value="0"/>
          <c:forEach var="el" items="${eventList }">
          <tr>
          	<td onClick="eventDetail(${el.eventNum})">${el.eventName }</td>
          	<td>${el.eventDateString }</td>
          	<td>${el.eventMemo }</td>
          	<td>${el.eventAlarm }</td>
          </tr>
          </c:forEach> 
        </tbody>
      </table>
    </div>
  </div>
      </div>
      
      <!--주문내역-->

      <div class="mypage_menu">
         <div class="myMenu">
            <ul class="baseBox">


               <li><a href="${root }paymentViewAll">주문내역</a></li>
               <li><a href="${root }pointView">적립금</a></li>
               <li><a href="${root }couponPage">쿠폰</a></li>
               <li><a href="#">관심상품</a></li>
               <li><a href="#">1:1문의</a></li>
               <li><a href="#">회원정보수정</a></li>
               <li><a href="#">회원탈퇴</a></li>

            </ul>
         </div>
      </div>
      <!-- //myMenu -->
      <br> <br>
   </div>
   <!-- 주문정보 간소화 -->
   <!-- 최근 주문 정보 -->
   <table class="shopping_cart_foot">
      <tr>
         <td colspan="8">

            <div class="lstOrdList">최근 주문 정보</div>
            <div class="ordAllList">
               <a  href="${root }paymentViewAll">전체보기</a>
            </div>

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
               <col width="7%" />
               <col width="7%" />
            </colgroup>

            <thead >
               <tr >
                  <th >번호</th>
                  <th>주문번호</th>
                  <th>상품명</th>
                  <th>주문일자</th>
                  <th>결제금액</th>
                  <th>결제방법</th>
                  <th>배송상태</th>
                  <th>전자영수증</th>
               </tr>
            </thead>

            <!-- 상품 리스트 부분 -->
            <tbody>
               <c:forEach var="mp" items="${mp }" end="4">
					
                  <tr>
                  
                     <td>${mp.payNum }</td>
                     <td>${mp.ordNum }_${mp.userNum}</td>
                     <td>${fn:split(mp.ordName,',')[0]}
                     	<c:if test="${not empty fn:split(mp.ordName,',')[1]}"> 외 ${fn:length(fn:split(mp.ordName, ","))-1} 개</c:if>
                     </td>
                     <td><fmt:formatDate value="${mp.payDate}"
                           pattern="yyyy-MM-dd" /></td>
                     <td><fmt:formatNumber value="${mp.cal }" type="number" />원</td>
                     <td>무통장입금</td>
                     <td>배달완료</td>
                     <td>
								<form action="${root }paymentView" method="post" target="POPUPW"  modelAttribute="paymentDTO"
    									onsubmit="POPUPW = window.open('about:blank','POPUPW', 'width=450,height=700');">
								<input type="hidden" name="payNum" value="${mp.payNum }" />
								<div class="field"><input type="submit" name="sub" value="발 급" class="blue_button"></div>
								</form>
					</td>
                  </tr>

               </c:forEach>
               
            </tbody>
            
         </table>
         
<%@include file="footBar.jsp" %>
</body>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

  let TODAY = new Date();
  // let FIRSTDAY = new Date(TODAY.getFullYear(),TODAY.getMonth(),1);
  let MONTH = ["January","February","March","April","May","June","July","August","September","October","November","December"];
  let DAY = ["Sunday","Monday","Tuesday","Wedsday","Thursday","Friday","Saturday"];
  let LEAP = [31,29,31,30,31,30,31,31,30,31,30,31];
  let NORMAL = [31,28,31,30,31,30,31,31,30,31,30,31];
  let M = 0;
  let Y = 0;

  let eventList = new Array();

  $(document).ready(function() {

    setCalendar(Y,M);
    let tempId = "" + TODAY.getDate();
    document.getElementById("selected-month").innerText = MONTH[TODAY.getMonth()];
    document.getElementById("selected-day").innerText = TODAY.getDate();
    document.getElementById(tempId).style.backgroundColor = "rgba(228, 250, 133,0.7)";
    document.getElementById(tempId).style.fontWeight = "700";
    
    
    <c:forEach var="el" items="${eventList }">
    	eventList.push(new Object({
    		eventNum : ${el.eventNum},
    		eventName : "${el.eventName}",
    		eventMemo : "${el.eventMemo}",
    		eventAlarm : ${el.eventAlarm},
    		year : ${el.year},
    		month : ${el.month},
    		date : ${el.date}
 
    	}));
    	
    </c:forEach>
    
    	for(let i=0; i<eventList.length;i++){
    		console.log(eventList[i].eventName);
    	}
    
    }); 


  
  function setToday(Y,M){
    return new Date(Number(TODAY.getFullYear()+Y),Number(TODAY.getMonth()+M));
  }
  function setFirstDay(today){
    return new Date(today.getFullYear(),today.getMonth(),1);
  }
  function setCalendar(Y,M){
    
    let FIRSTDAY = setFirstDay(setToday(Y,M));
    let year = FIRSTDAY.getFullYear();
    let yearType = NORMAL;
    let month = FIRSTDAY.getMonth(); 

    if(CalLeapYear(year) == true){
      yearType = LEAP;
    }  

    let currentYear = document.getElementById("current-year");
    let currentMonth = document.getElementById("current-month");
    currentYear.innerText = year;
    currentMonth.innerText = MONTH[month];
    
    // 오늘 날짜를 기준으로 1일이 무슨요일인지 계산하기
    // tr 부터 시작  
    let calrendarDay = document.getElementById("calendar-day");
    let thisTr = "";
    let totalDay = yearType[month];
    let startDay = FIRSTDAY.getDay();
    let trCnt = calCntTr(totalDay,startDay);
    
    let cnt = 1;
    
    let num=0;
    for(let i=0;i<trCnt;i++){
      
      let t = calrendarDay.appendChild(createTr());
      thisTr = "tr"+i;
      
      t.setAttribute("id",thisTr);
      if(i==0){
      
        for(let j=0;j<7;j++){
          
          let d = t.appendChild(createTd());
          num++;
            if(num <= startDay){
              
              continue;
            }
            d.textContent = cnt;
            d.setAttribute("id",cnt);
      
            cnt++;
             
        }
        
      }else{
        for(let j=0;j<7;j++){
          if(cnt<=totalDay){
            let d = t.appendChild(createTd());
            d.textContent = cnt;
            d.setAttribute("id",cnt);
            cnt++;
          }else{
            let d = t.appendChild(createTd());
        
          }
        }
      }    
    }
    for(let k=1;k<=totalDay;k++){
    	let tempId = ""+k;
    	let event = false;
      	document.getElementById(tempId).addEventListener("click",function(){
      		
      	
      	
      	// 일반달력 클릭시 이벤트가 있는지 여부 판단 
       	for(let i=0; i<eventList.length;i++){
      		  let obj = eventList[i];
      		  if(obj.year == Y && obj.month == M){
      			  if(obj.date == this.id){
      				if(document.getElementById("noneEvent").style.display == "block"){
      					document.getElementById("noneEvent").style.display = "none";
      				    document.getElementById("existEvent").style.display = "block";
      				 }
      				 document.getElementById("eventNum").innerText = obj.evnetNum;
      				 document.getElementById("eventName").innerText= obj.eventName;
      				 document.getElementById("eventMemo").innerText= obj.eventMemo;
      				 document.getElementById("eventAlarm").innerText= obj.eventAlarm;
      				 event = true;
      			  }
      		  }
      			  
      	}
       
      	if(event == false){
      		if(document.getElementById("noneEvent").style.display == "none"){
				document.getElementById("noneEvent").style.display = "block";
		    	document.getElementById("existEvent").style.display = "none";
			} 
			 
		
        	document.getElementById("selected-month").innerText = MONTH[month];
        	document.getElementById("selected-day").innerText = this.id;
        	document.getElementById("day").value=this.id;
        	document.getElementById("month").value= month;
        	document.getElementById("year").value= year;
        
        	setSelectedBgColor(totalDay,k);
      	}
      });
      
    }
  }

  function setSelectedBgColor(totalDay,td){
    for(let k=1;k<=totalDay;k++){
      let tempId = ""+k;
      if(k==td){
    	
        document.getElementById(tempId).style.backgroundColor = "rgba(228, 250, 133,0.7)";  
        document.getElementById(tempId).style.fontWeight = "700";
        continue;
      }
      document.getElementById(tempId).style.background = "none";
      document.getElementById(tempId).style.fontWeight = "400";
      
    }
  }

  function prev(){
    let node = document.getElementById("calendar-day");
    while(node.hasChildNodes()){
      node.removeChild(node.firstChild);
    }
    M -= 1;
    if(M<0){
      M = 11;
      Y -= 1;
    }

    setCalendar(Y,M);
  }
  function next(){
    
    let node = document.getElementById("calendar-day");
    while(node.hasChildNodes()){
      node.removeChild(node.firstChild);
    }
    M += 1;
    if(M>11){
      M=0;
      Y+=1;
    }

    setCalendar(Y,M);
  }
  

  function calCntTr(totalDay,startDay){
    let result=1;
    let one = totalDay-(7-startDay);
    if(one%7==0){
      result += parseInt(one/7);
      return result;
    }else{
      result += (parseInt(one/7)+1);
      return result;
    }
  }

  function createTr(){
    return document.createElement("tr");
  }
  function createTd(){
    return document.createElement("td");
  }

  //윤년 판독 함수
  function CalLeapYear(year){
    // 4로 나누어떨어지면 윤년, 그중 100으로 나누어떨어지면 평년, 그중 400으로 나누어 떨어지면 윤년
    // return 값 true : 윤년 / false : 평년   
    if(year % 4 == 0){
      if(year % 100 == 0){
        if(year % 400 == 0){
          return true;
        }
        return false;
      }
      return true;
    }
    return false;
  }

  
  //이벤트 삭제 함수
  function deleteEvent(){
	  
	  let eventNum = document.getElementById("eventNum").value;

	  if (confirm("이벤트를 삭제하시겠습니까?") == true){    

		    location.href= "${root}deleteEvent?num="+eventNum;

		}else{  

		    return;}
  }
  
  //이벤트 수정 함수 
  function updateEvent(){
	 
	  // eventNum필요함 
	 //값을 저장한 후 
	 // 폼이 있는 div로 바꾸기 
	 // 데이터 옮기기 
	let eventNum = document.getElementById("eventNum").value;
	let eventName = document.getElementById("eventName").innerText;
	let eventMemo = document.getElementById("eventMemo").innerText;
	let eventAlarm = document.getElementById("eventAlarm").innerText;
	let index = ["5","3","1"];
	
	
	if(document.getElementById("noneEvent").style.display == "none"){
		  document.getElementById("noneEvent").style.display = "block";
		  document.getElementById("existEvent").style.display = "none";
	  }
	
	document.getElementById("input-eventName").value = eventName;
	document.getElementById("input-eventMemo").innerText = eventMemo;
	document.getElementById("alarm").selectedIndex = index.indexOf(eventAlarm);
	
  } 
  
  // 이벤트 상세 함수 
  function eventDetail(selectedEventNum){
	  
	  let node = document.getElementById("calendar-day");
	    while(node.hasChildNodes()){
	      node.removeChild(node.firstChild);
	    }
	  
	  for(let i=0; i<eventList.length;i++){
		  let obj = eventList[i];
		  
		  //선택된 날짜가 같으면
		  if(obj.eventNum == selectedEventNum){
			  
			  setCalendar(obj.year,obj.month);
			  
			  // Y와M을 다시 세팅하는 부분 함수로 세팅 하기 
			  Y = obj.year;
			  M = obj.month;
			  
			  document.getElementById(obj.date).style.backgroundColor = "rgba(228, 250, 133,0.7)";
			  document.getElementById(obj.date).style.fontWeight = "700";
			  
			  if(document.getElementById("noneEvent").style.display == "block"){
				  document.getElementById("noneEvent").style.display = "none";
				  document.getElementById("existEvent").style.display = "block";
			  }
			  
			  document.getElementById("eventName").innerText= obj.eventName;
			  document.getElementById("eventMemo").innerText= obj.eventMemo;
			  document.getElementById("eventAlarm").innerText= obj.eventAlarm;
			  document.getElementById("eventNum").value = obj.eventNum;
			 
		  }
  		
  	}
  }

</script>
</html>