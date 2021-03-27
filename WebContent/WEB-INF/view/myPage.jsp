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
<%-- <link rel="stylesheet" href="${root}css/mypage.css" /> --%>
<!-- <link rel="preconnect" href="https://fonts.gstatic.com"> -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<link rel="stylesheet" href="${root}css/mypage_2.css" />
<title>Planty | 마이페이지</title>
<%@include file="topBar.jsp"%>

</head>
<body>

   <div>
        <section class="mypage-section"> 
            <table class="info-table" >
                <colgroup>
                    <col width="20%">
                    <col width="3%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    <col width="3%">
                </colgroup>
                <thead>
                    <tr height="30">
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr height="50">
                        <td rowspan="2">
                            <span class="info-span">${user.name }&nbsp;<button class="info-btn-edit">Edit</button></span>
                            <span class="info-span">${user.email }</span>
                        </td>
                        <td rowspan="2" class="line"></td>
                        <td>장바구니</td>
                        <td>위시리스트</td>
                        <td>쿠폰</td>
                        <td>적립금</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="info-td"><a class="mypage-info-a" href="${root}cart">${cartCount}</a></td>
                        <td class="info-td"><a class="mypage-info-a" href="${root}userlike">${userLikeListCount }</a></td>
                        <td class="info-td"><a class="mypage-info-a" href="${root }couponPage">${cpCount}</a></td>
                        <td class="info-td">
                        <c:set var="tp" value="${totalPoint}" />
                        <c:choose>
                        <c:when test="${empty tp}">0</c:when>
    				 	<c:otherwise><fmt:formatNumber value="${totalPoint.totalPoint }" type="number" maxFractionDigits="3" />
    				 	</c:otherwise>
    				 	</c:choose>원</td>
                        <td class="info-td"></td>
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
                        <th></th>
                    </tr>
                </tfoot>   
            </table>
        </section>
        <section class="mypage-section">
            <div class="cal-wrap">
                <div class="calendar">
                    <table class="cal-table" align="center" >
                        <colgroup>
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">

                        </colgroup>
                        
                        <thead>
                            <tr class="btn-wrap clearfix" >
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
                <!--달력 끝 -->

                <!--이벤트 없을때 -->
                <div class="event" id="noneEvent" style="display: inline-block;">
                <form name="eventForm" action="${root }addEvent" method="POST" >
                <input type="hidden" name="userNum" value="${user.userNum}"/>
                <input type="hidden" id="day" name="day"/>
                <input type="hidden" id="month" name="month"/>
                <input type="hidden" id="year" name="year"/>
                    <table class="setting-table" >
                        <colgroup>
                            <col width="10%">
                            <col width="40%">
                            <col width="13%">
                        </colgroup>
                        <tr>
                            <td colspan="3">
                                <span id="selected-day"></span>
                                <span id="selected-month"></span>
                            </td>
                            
                            
                        </tr>
                        <tr>
                            <td class="setting-attr">기념일</td>
                            <td colspan="2"><input id="input-eventName" type="text" name="eventName"></td>
                        </tr>
                        <tr>
                            <td class="setting-attr">메모</td>
                            <td class="setting-attr" colspan="2">
                                <textarea id="input-eventMemo" name="eventMemo"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="setting-attr">알람</td>
                            <td>
                                <select name="eventAlarm" id="alarm">
                                    <option value="5">5일 전</option>
                                    <option value="3">3일 전</option>
                                    <option value="1">1일 전</option>
                                </select>
                            </td>
                            <td>
                                <input type="submit" class="setting-btn-save" value="저장" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
                
                <!--이벤트가 있을때-->
     <div id="existEvent" class="event" style="display: none;"> 
         <table class="exist-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                            
                        </colgroup>
          	 <tr>
                <td colspan="2">
                    
               </td>
             </tr>
           	 <tr>
                <td colspan="2">
                    <span id="event-day">5</span>
                    <span id="event-month">May</span>
               </td>
             </tr>
         
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
                <td colspan="2">
                <input type="button" value="수정" class="setting-btn-save" onclick="updateEvent()"/>
                <td>
              </tr>
              
              <tr>
              	<td colspan="2">
                <input type="button" value="삭제" class="setting-btn-save" onclick="deleteEvent()"/>
                </td>
                
              </tr>
          
        </table>
      </div> 

                <div class="event-list">
                    <table class="event-list-table">
                        <colgroup>
                            <col width="60%">
                            <col width="20%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                            <tr height="45">
                                <td>기념일</td>
                                <td>D-DAY</td>
                                <td>삭제</td>
                            </tr>
                        </thead>
                        <tbody>
                        <c:set var="list" value="0"/>
                        <c:forEach var="el" items="${eventList }">
                            <tr height="40">    
                                <td onClick="eventDetail(${el.eventNum})">${el.eventName }</td>
                                <td>${el.eventDateString }</td>
                                <td><input class="list-btn-delete" type="button" value="x" onclick="deleteOneEvent(${el.eventNum})"></td>
                            </tr>
                        </c:forEach> 
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>
    
 	<section class="mypage-section">
            
            <div class="order-list-wrapper">
                <span class="order-title">최근 주문 정보</span>
                <table style="width: 90%;text-align: center;min-width: 800px;
                max-width: 1200px;font-size: 19px;color: rgb(0, 17, 48);font-weight: bold;">
                    <colgroup>
                        <col width="5%" />
                        <col width="10%" />
                        <col width="23%" />
                        <col width="18%" />
                        <col width="7%" />
                        <col width="10%" />
                        <col width="7%" />
                        <col width="7%" />
                    </colgroup>
                    <tr>
                        <td></td>
                        <td></td><td></td><td></td><td></td><td></td><td></td>
                        <td><a>전체보기</a></td>
                    </tr>
                </table>
                <table class="order-list" > 
                    <colgroup>
                        <col width="5%" />
                        <col width="10%" />
                        <col width="23%" />
                        <col width="18%" />
                        <col width="7%" />
                        <col width="10%" />
                        <col width="7%" />
                        <col width="7%" />
                    </colgroup>
                    <thead>
                        <tr>
                           <th>번호</th>
                           <th>주문번호</th>
                           <th>상품명</th>
                           <th>주문일자</th>
                           <th>결제금액</th>
                           <th>결제방법</th>
                           <th>영수증</th>
                        </tr>
                     </thead>
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
                     
                     <td>
								<form action="${root }paymentView" method="post" target="POPUPW"  modelAttribute="paymentDTO"
    									onsubmit="POPUPW = window.open('about:blank','POPUPW', 'width=450,height=700');">
								<input type="hidden" name="payNum" value="${mp.payNum }" />
								                             <input type="submit" name="sub" value="확인" class="btn-receipt">
								</form>
					</td>
                  </tr>

               </c:forEach>
                         
                     </tbody>
                </table>
            </div>
        </section>

 	

         
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
    document.getElementById(tempId).style.backgroundColor = "#e8eb92";
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
      		
      		
        // form 클리어 하게 하고 액션 조정하기 
        document.getElementById("input-eventName").value = "";
		document.getElementById("input-eventMemo").innerText = "";
		document.getElementById("alarm").selectedIndex = 0;
	
        let formMode = document.eventForm;
      	formMode.action = "${root }addEvent";
      	
      	// 일반달력 클릭시 이벤트가 있는지 여부 판단 
       	for(let i=0; i<eventList.length;i++){
      		  let obj = eventList[i];
      		  if(obj.year == Y && obj.month == M){
      			  if(obj.date == this.id){
      				if(document.getElementById("noneEvent").style.display == "inline-block"){
      					document.getElementById("noneEvent").style.display = "none";
      				    document.getElementById("existEvent").style.display = "inline-block";
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
				document.getElementById("noneEvent").style.display = "inline-block";
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
    	
        document.getElementById(tempId).style.backgroundColor = "#e8eb92";  
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
  
  function deleteOneEvent(eventNum){
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
	let day = 	document.getElementById("event-day").innerText;
	let month = document.getElementById("event-month").innerText;
	let index = ["5","3","1"];
	
	
	if(document.getElementById("noneEvent").style.display == "none"){
		  document.getElementById("noneEvent").style.display = "inline-block";
		  document.getElementById("existEvent").style.display = "none";
	  }
	
	document.getElementById("input-eventName").value = eventName;
	document.getElementById("input-eventMemo").innerText = eventMemo;
	document.getElementById("alarm").selectedIndex = Number(index.indexOf(eventAlarm));
	
	document.getElementById("selected-day").innerText = day;
	document.getElementById("selected-month").innerText = month;

	   
	
	let formMode = document.eventForm;
	formMode.action = "${root}updateEvent?num="+eventNum;
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
			  
			  if(document.getElementById("noneEvent").style.display == "inline-block"){
				  document.getElementById("noneEvent").style.display = "none";
				  document.getElementById("existEvent").style.display = "inline-block";
			  }
			  
			  document.getElementById("eventName").innerText= obj.eventName;
			  document.getElementById("eventMemo").innerText= obj.eventMemo;
			  document.getElementById("eventAlarm").innerText= obj.eventAlarm;
			  document.getElementById("eventNum").value = obj.eventNum;
			  document.getElementById("event-day").innerText= obj.date;
			  document.getElementById("event-month").innerText = document.getElementById("current-month").innerText;
			  
		  }
  		
  	}
  }

</script>
</html>