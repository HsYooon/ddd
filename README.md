
# :rocket: Portfolio 
:point_down: **Site Preview.gif**

![planty-883x480](https://user-images.githubusercontent.com/52145267/112725889-cbde3500-8f5d-11eb-97e9-542380077bd2.gif)



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

#### [주요 구현 내용]

| Service | Issue | Content |
| ------  | ------ | ------ |
| 회원 가입 | 비밀번호 보안 | ``` Spring Security ``` BCryptPasswordEncoder 를 이용해 encode와 matches로 암호화 시켜 비밀번호 확인 |
| 기념일 알림 | 이메일 발송 | ``` AWS SDK ``` AmazonSimpleEmailService 사용하여 인증받은 메일로 이벤트 알림 발송 |
| 장바구니 / 위시리스트 | 추가 및 삭제시 비동기 처리 | JQeury ajax , fetch API 를 사용해 비동기 처리 구현 |
| 상품 리뷰 관리 | 이미지 업로드 및 불러오기 | MultipartFile 인터페이스를 이용해 파일 이름을 추출, 업로드 날짜와 시간을 붙인 새로운 파일 생성해 중복 파일을 관리 |
