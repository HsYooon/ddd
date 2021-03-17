<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<c:set var="root" value="${pageContext.request.contextPath }/" />
<c:set var="user" value="${sessionScope.loginUser}" />
<html lang="ko">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width">
  <link rel="stylesheet" href="${root}css/event.css">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
  <title>Event | Planty</title>
  <%@include file="topBar.jsp"%>
</head>
<body>
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