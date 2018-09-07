CREATE TABLE moons_file (
   board_num     NUMBER   NULL,
   file_name     VARCHAR2(200) NOT NULL
);

-- file
ALTER TABLE moons_file
   ADD
      CONSTRAINT FK_moons_board_TO_moons_file -- board -> file
      FOREIGN KEY (
         board_num -- 게시물번호
      )
      REFERENCES moons_board ( -- board
         board_num -- num
      );


create sequence moons_user_code_seq
start with 1 
increment by 1
nocache
nocycle;

create sequence moons_board_num_seq
start with 1 
increment by 1
nocache
nocycle;

create sequence moons_reply_num_seq
start with 1 
increment by 1
nocache
nocycle;

create sequence moons_point_num_seq
start with 1 
increment by 1
nocache
nocycle;

create sequence moons_charge_num_seq
start with 1 
increment by 1
nocache
nocycle;

create sequence moons_withdraw_num_seq
start with 1 
increment by 1
nocache
nocycle;

select * from moons_board

select * from moons_rating

select * from moons_follow

CREATE TABLE moons_follow (
	user_code        NUMBER NULL, -- 유저식별코드
	follow_following NUMBER NULL  -- 팔로잉
);

insert into moons_follow values(1,2);
insert into moons_follow values(1,4);

select * from moons_user

update moons_user set user_photo='images/no-photo.png'
update moons_user set user_introduce='자기소개입니다 자기소개입니다 테스트1입니다. 자기소개~' where user_id='test2';	
select b.*
		from (select rownum rm, a.*
			from (select user_code, user_id, user_nickname, user_photo, user_introduce
				from moons_user
				where user_id LIKE '%테%' or user_nickname LIKE '%테%')a)b
		where rm>0 and rm<=4

select * from MOONS_CHARGE

CREATE TABLE moons_charge (
	charge_num    NUMBER NOT NULL, -- num
	user_code     NUMBER NULL,     -- 유저
<<<<<<< HEAD
	charge_amount NUMBER NOT NULL DEFAULT 0, -- 입금액
=======
	charge_amount NUMBER DEFAULT 0, -- 입금액
>>>>>>> 8225c35fc7c16b49d841d47c14ec3340bb2edb4c
	charge_date   DATE   NOT NULL  -- 날짜
);

select * from moons_withdraw 
order by sysdate desc

insert into moons_withdraw values(2,1,'테스트3','123456-1234567','10000','국민은행','121212121','테스트3',sysdate,1)

update MOONS_WITHDRAW set withdraw_state=1 where rownum<4 withdraw_date<'2018-08-26'

-- withdraw
CREATE TABLE moons_withdraw (
	withdraw_num         NUMBER        NOT NULL, -- num
	user_code            NUMBER        NULL,     -- 유저
	withdraw_name        VARCHAR2(20)  NOT NULL, -- 실명
	withdraw_identitynum VARCHAR2(15)  NOT NULL, -- 주민등록번호
	withdraw_amount      NUMBER        DEFAULT 0, -- 입금액
	withdraw_bank        VARCHAR2(20)  NOT NULL, -- 은행
	withdraw_account     VARCHAR2(100) NOT NULL, -- 계좌번호
	withdraw_holder      VARCHAR2(20)  NOT NULL, -- 예금주
	withdraw_date        DATE          NOT NULL, -- 날짜
	withdraw_state       NUMBER        NOT NULL  -- 신청상태
);

select b.*
from (select rownum rm, a.*
	from (select p.*, u.user_nickname
		from moons_point p, moons_user u
		where ((p.point_donater=1 and u.user_code=p.point_receiver) or (p.point_receiver=1 and u.user_code=p.point_donater))
			and ( point_date<'2018-8-1' and point_date>='2018-9-1')
		order by point_date desc)a)b
where rm>0 and rm<=10 
where rm>#{start} and rm<=#{start}+10


select b.*
from (select rownum rm, a.*
	from (select p.*, u.user_nickname
		from moons_point p, moons_user u
		where (p.point_donater=1 and u.user_code=p.point_receiver) or (p.point_receiver=1 and u.user_code=p.point_donater)
		order by point_date desc)a)b
where rm>0 and rm<=10
<![CDATA[where rm>#{start} and rm<=#{start}+10]]>

select * from moons_user


update moons_user
set user_point=4000
where user_code=1
-- point
CREATE TABLE moons_point (
	point_num      NUMBER NOT NULL, -- num
	point_donater  NUMBER NULL,     -- 유저식별코드
	point_receiver NUMBER NULL,     -- 유저식별코드2
<<<<<<< HEAD
	point_donate   NUMBER NOT NULL DEFAULT 0, -- 후원한금액
=======
	point_donate   NUMBER DEFAULT 0, -- 후원한금액
>>>>>>> 8225c35fc7c16b49d841d47c14ec3340bb2edb4c
	point_date     DATE   NOT NULL  -- 날짜
);

select b.*
		from(
			select rownum rm,a.*
			from(	select n.*, a.user_photo, a.user_nickname
					from moons_notice n, moons_user u, moons_user a
					where n.user_code=1 and n.notice_actor=a.user_code and n.user_code=u.user_code
					order by n.notice_date desc)a)b
		where rm> and rm<=10

CREATE TABLE moons_notice (
	user_code     NUMBER NULL,     -- 유저식별코드
	notice_actor  NUMBER NULL,     -- 행위유저
	board_num     NUMBER NULL,     -- 관련게시물번호
	reply_num     NUMBER NULL,     -- 관련리플번호
	notice_type   NUMBER NOT NULL, -- 알림유형
	notice_amount NUMBER NULL,     -- 후원금액
	notice_date   DATE   NOT NULL  -- 날짜
);

delete from moons_notice

select * from moons_notice
insert into moons_notice values (1,2,1,0,0,0,sysdate,0)
update moons_notice set notice_type=3  
update moons_notice set notice_read=0


CREATE TABLE moons_payment (
	payment_num      NUMBER NOT NULL, -- num
	user_code        NUMBER NULL,     -- 유저
	payment_deposit  NUMBER DEFAULT 0, -- 입금액
	payment_withdraw NUMBER DEFAULT 0, -- 출금액
	payment_date     DATE   NOT NULL  -- 날짜
);

CREATE TABLE moons_point (
	point_num      NUMBER NOT NULL, -- num
	point_donater  NUMBER NULL,     -- 유저식별코드
	point_receiver NUMBER NULL,     -- 유저식별코드2
	point_donate   NUMBER DEFAULT 0, -- 후원한금액
	point_date     DATE   NOT NULL  -- 날짜
);

select * from moons_payment
select * from moons_point

insert into moons_payment values (1,1,2200,0,sysdate);
insert into moons_payment values (2,1,0,1300,sysdate);

insert into moons_point values(1,1,2,1000,sysdate);
insert into moons_point values(1,2,1,1000,sysdate);

insert into moons_point values(1,1,2,1000,'2018-04-03');

select m.user_code, 
		(select r.point_donate
		from moons_point d, moons_point r
		where d.point_donater=r.point_receiver and r.point_receiver=1) as point_receive,
		(select point_donate from moons_point where point_donater=1) as point_donate
from moons_payment m, moons_point p
where m.user_code=1 and
		

-- moons_payhistory
select 1 as user_code,
	(select payment_deposit from MOONS_PAYMENT where user_code=1 and payment_deposit>0) as point_deposit,
	(select payment_withdraw from MOONS_PAYMENT where user_code=1 and payment_withdraw>0) as point_withdraw,
	(select r.point_donate
	from moons_point d, moons_point r
	where d.point_donater=r.point_receiver and r.point_receiver=1) as point_receive,
	(select point_donate from moons_point where point_donater=1) as point_donate
from dual



select 1 as user_code,(select r.point_donate
from moons_point d, moons_point r
where d.point_donater=r.point_receiver and r.point_receiver=1) as point_receive,
(select point_donate from moons_point where point_donater=1) as point_donate
from dual



pointas point_donate,payment_deposit, payment_withdraw
from moons_payment.m, moons_point.p
where m.user_code=p.point_donator