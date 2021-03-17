


create table gds_info(
    gdsNum int AUTO_INCREMENT primary key,
    gdsName varchar(100) not null,
    cateCode int not null,
    gdsPrice int not null,
    gdsColor varchar(100) not null, 
    gdsStock int null,
    gdsDetail varchar(500) null,
    gdsImg varchar(500) not null,
    thumbImg varchar(100) not null,
    regDate timestamp,
    gdsDesc varchar(100) null
);
select * from gds_info;

select a.gdsNum, a.gdsName , b.cateName, a.gdsPrice , a.gdsStock, a.thumbImg, count(c.gdsNum) as review_count 
			from gds_info a 
			left join gds_review c on a.gdsNum=c.gdsNum 
			left join cate_info b on a.catecode=b.catecode 
			group by a.gdsNum, a.gdsName, b.cateName, a.gdsPrice, a.gdsStock, a.thumbImg 
			order by a.gdsNum;

insert into gds_info(gdsName,cateCode,gdsPrice,gdsColor,gdsStock,gdsDetail,gdsImg,thumbImg,regDate,gdsDesc) values('Peony',1,2000,'pink,orange',20,'작약','1.jpg','1_thumb.jpg',sysdate(),'1-description.jpg');
insert into gds_info(gdsName,cateCode,gdsPrice,gdsColor,gdsStock,gdsDetail,gdsImg,thumbImg,regDate,gdsDesc) values('Rose',2,2500,'red,pink',50,'뉴던','2.jpg','2_thumb.jpg',sysdate(),'2-description.jpg');
insert into gds_info(gdsName,cateCode,gdsPrice,gdsColor,gdsStock,gdsDetail,gdsImg,thumbImg,regDate,gdsDesc) values('Sunflower',3,5000,'yellow',999,'맥시밀리언','3.jpg','3_thumb.jpg',sysdate(),'3-description.jpg');
insert into gds_info(gdsName,cateCode,gdsPrice,gdsColor,gdsStock,gdsDetail,gdsImg,thumbImg,regDate,gdsDesc) values('Plum blossom',4,3000,'red,orange',300,'동백꽃','4.jpg','4_thumb.jpg',sysdate(),'1-description.jpg');
insert into gds_info(gdsName,cateCode,gdsPrice,gdsColor,gdsStock,gdsDetail,gdsImg,thumbImg,regDate,gdsDesc) values('Cosmos',3,2800,'purple,white',300,'코스모스','5.jpg','5_thumb.jpg',sysdate(),'3-description.jpg');
insert into gds_info(gdsName,cateCode,gdsPrice,gdsColor,gdsStock,gdsDetail,gdsImg,thumbImg,regDate,gdsDesc) values('Tulips',1,2200,'orange,red,yello',100,'튤립','6.jpg','6_thumb.jpg',sysdate(),'2-description.jpg');

commit;
/* [상품코드 테이블] */ 

create table cate_info(
  cateNum int primary key,
  cateName varchar(100) not null,
  cateCode int not null
);

insert into cate_info values(1,'Spring',1);
insert into cate_info values(2,'Summer',2);
insert into cate_info values(3,'Fall',3);
insert into cate_info values(4,'Winter',4);


/*[리뷰테이블]*/

create table gds_review (
    rvNum      int  AUTO_INCREMENT PRIMARY key,
    gdsNum     int  not null,
    id         varchar(50)   not null,
    rvText     varchar(2000)  not null,
    rvImg      varchar(200)  null,
    rvDate     timestamp,
    rvScore    int        not null
);

/*[회원테이블]*/

create table user_info(
    userNum int AUTO_INCREMENT primary key,
    name varchar(20) not null,
    id varchar(50) not null,
    pw varchar(100) not null,
    email varchar(50) not null unique,
    tel varchar(20) not null,
    regDate timestamp, 
    mAddr varchar(20) not null,
    lAddr varchar(200) not null,
    dlAddr varchar(100) not null,
    lastData timestamp,
    isAuthkey boolean default true,
    authStatus int default 0
);


/*[이메일 인증정보]*/

create table user_auth(
	authNum int auto_increment primary key,
    userNum int not null,
    email varchar(50) not null unique,
    authkey varchar(10),
    regTime timestamp,
    endTime timestamp
);

/*[장바구니테이블]*/ 

commit;
create table user_cart(
    cartNum int AUTO_INCREMENT primary key,
    userNum int not null, 
    gdsNum  int not null, 
    cartCount int not null,
    cartColor varchar(100) not null
);

/*[찜테이블]*/

create table user_like(
  likeNum int AUTO_INCREMENT primary key,
  gdsNum int not null,
  userNum int not null
);


/*[쿠폰테이블]*/

drop table mgrcoupon;

create table mgrCoupon(
    mgrCp int primary key,
    cpName varchar(100) not null,
    itemScope varchar(100) not null,
    cpRate int not null,
    expDate varchar(100) not null,
    cpCode varchar(20) not null,
    cpCode2 varchar(20) not null,
    cpCode3 varchar(20) not null,
    cpCode4 varchar(20) not null
);


insert into mgrCoupon(mgrCp, cpName, itemScope, cpRate, expDate, cpCode, cpCode2, cpCode3, cpCode4)
VALUES(1,'VVIP','전체상품 적용가능',0.5,'2021.12.31','VVIP','VVIP','VVIP','VVIP');

insert into mgrCoupon(mgrCp,cpName, itemScope, cpRate, expDate, cpCode, cpCode2, cpCode3, cpCode4)
            VALUES(2,'블랙프라이데이','전체상품 적용가능',0.3,'2020.12.31','AB12','AA11','BB22','12AB');

insert into mgrCoupon (mgrCp,cpName, itemScope, cpRate, expDate, cpCode, cpCode2, cpCode3, cpCode4)
VALUES(3,'회원가입축하','전체상품 적용가능',0.15,'2021.01.01','CD23','CC22','DD33','23CD');


create table coupon(
    cpNum int AUTO_INCREMENT primary key,
    cpCode varchar(50) not null,
    userNum int not null,
    useCp varchar(500) not null
);

commit;
/*[결제 테이블]*/



create table payment(
  payNum int AUTO_INCREMENT primary key,
  userNum int not null,
  ordName varchar(500),
  ordNum varchar(500),
  ordColor varchar(500), 
  ordCount varchar(500),
  ordPrice varchar(500),
  payDate timestamp,
  receiver varchar(100), 
  email varchar(100),
  phone varchar(100),
  addr1 varchar(100),
  addr2 varchar(200), 
  addr3 varchar(100),
  message varchar(200),
  depositor varchar(100),
  bankName  varchar(100),
  payMethod varchar(100),
  cal int,
  myPoint int,
  usePoint int,
  useCouponCal int,
  cpNum int
);


/*기념일 테이블*/
 drop table event_info;
 
create table event_info(
    eventNum int AUTO_INCREMENT primary key,
    userNum int not null,
    eventName varchar(100) not null,
    eventDate  timestamp not null,
    alertDate timestamp null,
    eventMemo varchar(500) null,
    eventAlarm int null
);

/*태그 테이블*/

create table gds_tag(
	tagNum int auto_increment primary key,
    gdsNum int not null,
    gdsTag varchar(500) null
);

insert into gds_tag(gdsNum,gdsTag) values(1,'작약,피오니,핑크,분홍,오렌지,기념일,생일,선물,작약꽃,연인에게');
insert into gds_tag(gdsNum,gdsTag) values(2,'로즈,rose,장미,빨간장미,빨강색,핑크색,핑크,장미꽃,프로프user_cart즈,분홍장미,생일,100송이');
insert into gds_tag(gdsNum,gdsTag) values(3,'해바라기,sunflower,노란색,집들이선물,인테리어,플랜트인테리어');
insert into gds_tag(gdsNum,gdsTag) values(4,'동백꽃,plumBlossome,집들이선물,봄꽃,플랜트인테리어');