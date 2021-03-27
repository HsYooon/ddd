# :rocket: Portfolio 
:white_check_mark: **Planty 바로가기** [Live Site Here](http://54.180.95.234:8888/planty) :arrow_right:  
:white_check_mark: **TEST 정보** ID: planty PW: planty00^

![Uploading 완2-883x480.gif…]()


## Description
 <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/> <img src="https://img.shields.io/badge/Java-B1361E?style=flat-square&logo=Java&logoColor=white"/> <img src="https://img.shields.io/badge/JavaScript-FF9900?style=flat-square&logo=JavaScript&logoColor=white"/> <img src="https://img.shields.io/badge/CSS-1572B6?style=flat-square&logo=CSS3&logoColor=white"/> <img src="https://img.shields.io/badge/MySQL-27A1C5?style=flat-square&logo=MySQL&logoColor=white"/> <img src="https://img.shields.io/badge/AWS-333333?style=flat-square&logo=Amazon-AWS&logoColor=white"/> <img src="https://img.shields.io/badge/Ubuntu-FC60A8?style=flat-square&logo=Ubuntu&logoColor=white"/> <img src="https://img.shields.io/badge/Apache Tomcat-9F55FF?style=flat-square&logo=Apache-Tomcat&logoColor=white"/>

> **Planty[플랜티]** 는 기념일을 잊지 않고 챙길 수 있도록 도와주는 생화 주문 웹 애플리케이션으로 
> 회원이 등록한 기념일 전에 미리 알림메일을 보내
> 사이트에서 꽃을 구매할 수 있는 쇼핑몰 입니다 

- **인증** 회원가입시 입력받은 이메일을 통해 인증코드 발송 30분 이내 인증을 완료시 가입을 승인합니다
- **기념일 관리** 회원의 기념일을 입력받고 `[추가 - 수정 - 변경 - 삭제]` 가 가능합니다 
- **알림 메일 발송** 회원이 설정한 알림 날짜에 알림 메일을 발송합니다
- **위시리스트 & 장바구니** - 위시리스트와 장바구니 상품의 `[추가 - 수정 -변경 - 삭제]` 가 가능합니다
- **결제** - 구매 상품에 대해 `적립금 & 쿠폰 적용` 이 가능하며 `전자 영수증 생성` 으로 주문을 확인할 수 있습니다 


```
public class MailUtils {
 private String from = "Amazon SES에서 인증받은 이메일을 넣어주세요";
 ...
}
```
