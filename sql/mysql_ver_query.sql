select * from user_info;
select * from user_auth;

select * from user_cart;
delete from user_info where userNum= 10;
delete from user_auth where authNum= 6;
commit;


select authkey,authStatus from user_info where email='sssu0000@gmail.com';
update user_info set authstatus=0 where userNum=1 and email='sssu0000@gmail.com';



select authNum,userNum,email,endTime from user_auth where email='sssu0000@gmail.com' and authkey='460172';

select a.authNum,a.userNum,a.email,a.endTime,b.authstatus 
from (select authNum ,userNum ,email ,endTime from user_auth as a where email='sssu0000@gmail.com' and authkey='644023') as a
join user_info as b on a.userNum = b.userNum;

update user_info set authStatus=0 where userNum=1;
update user_auth set endTime="2021-01-22 07:40:40" where authNum=1;

select email from user_info where id='sssu0000';
select userNum,id,pw,email,authStatus from user_info where id='sssu0000';
rollback;

select * from event_info;

update event_info set eventName = '랄랄2', eventMemo='랄랄수정' where eventNum=4;

SELECT a.eventNum, a.userNum, a.eventName,a.eventDate, a.alertDate, a.eventMemo, a.eventAlarm, b.name, b.email 
FROM event_info as a LEFT JOIN user_info as b 
ON a.userNum = b.userNum
where alertDate='2021-02-17 00:00:00';

delete from event_info where eventNum = 1;
commit;
select * from payment;



create table gds_tag(
	tagNum int auto_increment primary key,
    gdsNum int not null,
    gdsTag varchar(500) null
);

select * from gds_tag;
select * from gds_info;
select * from gds_tag
where gdsTag like "%생일%";


insert into gds_tag(gdsNum,gdsTag) values(1,'작약,피오니,핑크,분홍,오렌지,기념일,생일,선물,작약꽃,연인에게');
insert into gds_tag(gdsNum,gdsTag) values(2,'로즈,rose,장미,빨간장미,빨강색,핑크색,핑크,장미꽃,프로프user_cart즈,분홍장미,생일,100송이');
insert into gds_tag(gdsNum,gdsTag) values(3,'해바라기,sunflower,노란색,집들이선물,인테리어,플랜트인테리어');
insert into gds_tag(gdsNum,gdsTag) values(4,'동백꽃,plumBlossome,집들이선물,봄꽃,플랜트인테리어');
select * from gds_tag;

select a.gdsNum, a.gdsName, a.gdsColor, a.gdsDetail , b.cateName, a.gdsPrice , a.gdsStock, a.thumbImg, count(c.gdsNum) as review_count
from gds_info a 
left join gds_review c on a.gdsNum=c.gdsNum
left join cate_info b on a.catecode=b.catecode
left join gds_tag d on a.gdsNum = d.gdsNum
WHERE gdsTag like '%피오니%'
group by a.gdsNum, a.gdsName, b.cateName, a.gdsPrice, a.gdsStock, a.thumbImg, a.gdsColor, a.gdsDetail
order by a.gdsNum;


commit;

select * from payment;


SELECT @rownum:=@rownum+1 as rownum , A.payNum, A.userNum, A.ordName, A.ordNum, A.ordColor, A.ordCount, A.ordPrice, A.payDate, A.receiver, 
A.email, A.phone, A.depositor, A.addr1, A.addr2, A.addr3, A.message, A.bankName, A.payMethod, A.cal, 
A.myPoint, A.usePoint, A.useCouponCal, B.name,  B.id, B.tel FROM payment A 
left join user_info B on A.userNum = B.userNum 
where A.userNum = 2 and (@rownum:=0)=0 order by paynum desc limit 1;

select * from gds_info;

select a.gdsNum, b.thumbImg,b.gdsName, b.gdsDetail,c.gdsTag
 from user_like a,gds_info b , gds_tag c where a.gdsNum=b.gdsNum and b.gdsNum = c.gdsNum and userNum=2 order by a.gdsNum;

select * from gds_review;

select a.gdsNum, a.gdsName, b.cateName, a.gdsPrice, a.gdsColor, a.gdsStock, a.gdsDetail, a.gdsImg, a.thumbImg, a.gdsDesc, review_count 
from (select count(*) as review_count from gds_review where gdsNum=3) c,gds_info a,cate_info b where a.gdsNum=3 and a.catecode=b.catecode;
