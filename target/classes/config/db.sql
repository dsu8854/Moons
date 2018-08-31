-- scrap
DROP TABLE moons_scrap;

-- follow
DROP TABLE moons_follow;

-- notice
DROP TABLE moons_notice;

-- reply
DROP TABLE moons_reply;

-- dm
DROP TABLE moons_dm;

-- share
DROP TABLE moons_share;

-- charge
DROP TABLE moons_charge;

-- withdraw
DROP TABLE moons_withdraw;

-- 한줄평
DROP TABLE moons_comment;

-- 평점
DROP TABLE moons_rating;

-- 좋아요
DROP TABLE moons_like;

-- 포인트
DROP TABLE moons_point;

-- report
DROP TABLE moons_report;

-- 파일
DROP TABLE moons_file;

-- board
DROP TABLE moons_board;

-- member
DROP TABLE moons_user;

drop sequence moons_user_code_seq;
drop sequence moons_board_num_seq;
drop sequence moons_reply_num_seq;
drop sequence moons_point_num_seq;
drop sequence moons_charge_num_seq;
drop sequence moons_withdraw_num_seq;

-- scrap
CREATE TABLE moons_scrap (
	user_code  NUMBER NULL,     -- 유저식별코드
	board_num  NUMBER NULL,     -- 게시물번호
	scrap_date DATE   NOT NULL  -- 날짜
);

-- follow
CREATE TABLE moons_follow (
	user_code        NUMBER NULL, -- 유저식별코드
	follow_following NUMBER NULL  -- 팔로잉
);

-- notice
CREATE TABLE moons_notice (
	user_code     NUMBER NULL,     -- 유저식별코드
	notice_actor  NUMBER NULL,     -- 행위유저
	board_num     NUMBER NULL,     -- 관련게시물번호
	reply_num     NUMBER NULL,     -- 관련리플번호
	notice_type   NUMBER NOT NULL, -- 알림유형
	notice_amount NUMBER NULL,     -- 후원금액
	notice_date   DATE   NOT NULL, -- 날짜
	notice_state  NUMBER NOT NULL  -- 알림 상태
);

-- reply
CREATE TABLE moons_reply (
	reply_num     NUMBER     NOT NULL, -- num
	board_num     NUMBER     NOT NULL, -- 게시판번호
	user_code     NUMBER     NOT NULL, -- 작성자
	reply_content VARCHAR2(2000) NULL,     -- 내용
	reply_date    DATE       NOT NULL, -- 날짜
	reply_ref     NUMBER     DEFAULT 0, -- 댓글순서
	reply_step    NUMBER     DEFAULT 0 -- 대댓글순서
);

-- reply
ALTER TABLE moons_reply
	ADD
		CONSTRAINT PK_moons_reply -- reply 기본키
		PRIMARY KEY (
			reply_num -- num
		);

-- dm
CREATE TABLE moons_dm (
	user_code   NUMBER     NULL,     -- 유저식별코드
	dm_receiver NUMBER     NULL,     -- 받는사람
	dm_content  VARCHAR2(2000) NOT NULL, -- 메세지내용
	dm_date     DATE       NOT NULL,  -- 날짜
	dm_state	NUMBER	   NOT NULL  -- 상태
);

-- board
CREATE TABLE moons_board (
	board_num     NUMBER        NOT NULL, -- num
	user_code     NUMBER        NULL,     -- 작성자
	board_movie   VARCHAR2(300) NOT NULL, -- 관련영화코드
	board_subject VARCHAR2(180) NOT NULL, -- 제목
	board_content CLOB     NULL,     -- 내용
	board_like    NUMBER        DEFAULT 0, -- 좋아요 수
    board_share   NUMBER        DEFAULT 0, -- 공유된 수
    board_reply   NUMBER        DEFAULT 0, -- 댓글 수
	board_date    DATE          NOT NULL, -- 날짜
	board_hashtag VARCHAR2(1000)    NULL,      -- 해시태그
	board_photo	  VARCHAR2(200) NULL,	-- 대표 이미지
	board_privacy NUMBER		NOT NULL,
	board_state	  NUMBER		NOT NULL
);

-- board
ALTER TABLE moons_board
	ADD
		CONSTRAINT PK_moons_board -- board 기본키
		PRIMARY KEY (
			board_num -- num
		);

-- share
CREATE TABLE moons_share (
	user_code  NUMBER NULL,     -- 유저식별코드
	board_num  NUMBER NULL,     -- 게시물번호
	share_date DATE   NOT NULL  -- 날짜
);

-- member
CREATE TABLE moons_user (
	user_code      NUMBER        NOT NULL, -- 유저식별코드
	user_type      varchar2(10)  NOT NULL, -- 가입유형
	user_id        VARCHAR2(20)  NOT NULL,     -- 아이디
	user_pass      VARCHAR2(20)  NULL, -- 패스워드
	user_nickname  VARCHAR2(30)  NOT NULL, -- 별명
	user_photo     VARCHAR2(200) NULL,     -- 프로필사진
	user_email     VARCHAR2(50)  NULL,     -- 이메일
	user_point     NUMBER        DEFAULT 0, -- 포인트
	user_introduce VARCHAR2(600) NULL      -- 자기소개
);

-- member
ALTER TABLE moons_user
	ADD
		CONSTRAINT PK_moons_user -- member 기본키
		PRIMARY KEY (
			user_code -- 유저식별코드
		);

-- 한줄평
CREATE TABLE moons_comment (
	user_code       NUMBER        NULL,     -- 유저식별코드
	comment_movie   VARCHAR2(300) NOT NULL, -- 영화코드
	comment_content VARCHAR2(500) NOT NULL, -- 내용
	comment_date    DATE          NOT NULL  -- 날짜
);

-- 평점
CREATE TABLE moons_rating (
	user_code    NUMBER        NULL,     -- 유저식별코드
	rating_movie VARCHAR2(300) NOT NULL, -- 영화코드
	rating_score NUMBER        NULL      -- 평점
);

-- 좋아요
CREATE TABLE moons_like (
   user_code  NUMBER NULL,     -- 유저식별코드
   board_num  NUMBER NULL,     -- num
   like_date DATE   NOT NULL  -- 날짜
);

-- point
CREATE TABLE moons_point (
   point_num      NUMBER NOT NULL, -- num
   point_donater  NUMBER NOT NULL,     -- 유저식별코드
   point_receiver NUMBER NOT NULL,     -- 유저식별코드2
   point_donate   NUMBER DEFAULT 0, -- 후원한금액
   point_date     DATE   NOT NULL  -- 날짜
);

-- point
ALTER TABLE moons_point
	ADD
		CONSTRAINT PK_moons_point -- point 기본키
		PRIMARY KEY (
			point_num -- num
		);

CREATE TABLE moons_file (
   board_num	  NUMBER	NULL,
   file_name	  VARCHAR2(200) NOT NULL
);

-- 충전
CREATE TABLE moons_charge (
	charge_num    NUMBER NOT NULL, -- num
	user_code     NUMBER NULL,     -- 유저
	charge_amount NUMBER DEFAULT 0, -- 입금액
	charge_date   DATE   NOT NULL  -- 날짜
);

-- 충전
ALTER TABLE moons_charge
	ADD
		CONSTRAINT PK_moons_charge -- 충전 기본키
		PRIMARY KEY (
			charge_num -- num
		);
		
-- withdraw
CREATE TABLE moons_withdraw (
	withdraw_num         NUMBER        NOT NULL, -- num
	user_code            NUMBER        NULL,     -- 유저
	withdraw_name        VARCHAR2(20)  NOT NULL, -- 실명
	withdraw_identitynum VARCHAR2(15)  NOT NULL, -- 주민등록번호
	withdraw_amount      NUMBER        DEFAULT 0, -- 출금액
	withdraw_bank        VARCHAR2(20)  NOT NULL, -- 은행
	withdraw_account     VARCHAR2(100) NOT NULL, -- 계좌번호
	withdraw_holder      VARCHAR2(20)  NOT NULL, -- 예금주
	withdraw_date        DATE          NOT NULL, -- 날짜
	withdraw_state       NUMBER        NOT NULL  -- 신청상태
);

-- withdraw
ALTER TABLE moons_withdraw
	ADD
		CONSTRAINT PK_moons_withdraw -- withdraw 기본키
		PRIMARY KEY (
			withdraw_num -- num
		);

-- report
CREATE TABLE moons_report (
	board_num		NUMBER			NOT NULL,
	report_reporter	NUMBER			NOT NULL,
	report_reason	VARCHAR2(500) 	NOT NULL,
	report_date		DATE			NOT NULL,
	report_state	NUMBER			NOT NULL
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

-- scrap
ALTER TABLE moons_scrap
	ADD
		CONSTRAINT FK_moons_board_TO_moons_scrap -- board -> scrap
		FOREIGN KEY (
			board_num -- 게시물번호
		)
		REFERENCES moons_board ( -- board
			board_num -- num
		);

-- scrap
ALTER TABLE moons_scrap
	ADD
		CONSTRAINT FK_moons_user_TO_moons_scrap2 -- member -> scrap2
		FOREIGN KEY (
			user_code -- 유저식별코드
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- follow
ALTER TABLE moons_follow
	ADD
		CONSTRAINT FK_moons_user_TO_moons_follow -- member -> follow
		FOREIGN KEY (
			follow_following -- 팔로잉
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- follow
ALTER TABLE moons_follow
	ADD
		CONSTRAINT FK_moons_user_TO_moons_follow3 -- member -> follow3
		FOREIGN KEY (
			user_code -- 유저식별코드
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- notice
ALTER TABLE moons_notice
	ADD
		CONSTRAINT FK_moons_user_TO_moons_notice -- member -> notice2
		FOREIGN KEY (
			notice_actor -- 행위유저
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- notice
ALTER TABLE moons_notice
	ADD
		CONSTRAINT FK_moons_board_TO_moons_notice -- board -> notice
		FOREIGN KEY (
			board_num -- 관련게시물번호
		)
		REFERENCES moons_board ( -- board
			board_num -- num
		);

-- notice
ALTER TABLE moons_notice
	ADD
		CONSTRAINT FK_moons_reply_TO_moons_notice -- reply -> notice
		FOREIGN KEY (
			reply_num -- 관련리플번호
		)
		REFERENCES moons_reply ( -- reply
			reply_num -- num
		);

-- notice
ALTER TABLE moons_notice
	ADD
		CONSTRAINT FK_moons_user_TO_moons_notice2 -- member -> notice
		FOREIGN KEY (
			user_code -- 유저식별코드
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- reply
ALTER TABLE moons_reply
	ADD
		CONSTRAINT FK_moons_user_TO_moons_reply -- member -> reply
		FOREIGN KEY (
			user_code -- 작성자
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- reply
ALTER TABLE moons_reply
	ADD
		CONSTRAINT FK_moons_board_TO_moons_reply -- board -> reply
		FOREIGN KEY (
			board_num -- 게시판번호
		)
		REFERENCES moons_board ( -- board
			board_num -- num
		);

-- dm
ALTER TABLE moons_dm
	ADD
		CONSTRAINT FK_moons_user_TO_moons_dm -- member -> dm2
		FOREIGN KEY (
			dm_receiver -- 받는사람
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- dm
ALTER TABLE moons_dm
	ADD
		CONSTRAINT FK_moons_user_TO_moons_dm3 -- member -> dm3
		FOREIGN KEY (
			user_code -- 유저식별코드
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- board
ALTER TABLE moons_board
	ADD
		CONSTRAINT FK_moons_user_TO_moons_board -- member -> board
		FOREIGN KEY (
			user_code -- 작성자
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- share
ALTER TABLE moons_share
	ADD
		CONSTRAINT FK_moons_board_TO_moons_share -- board -> share
		FOREIGN KEY (
			board_num -- 게시물번호
		)
		REFERENCES moons_board ( -- board
			board_num -- num
		);
		
-- share
ALTER TABLE moons_share
	ADD
		CONSTRAINT FK_moons_user_TO_moons_share2 -- member -> share2
		FOREIGN KEY (
			user_code -- 유저식별코드
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- 충전
ALTER TABLE moons_charge
	ADD
		CONSTRAINT FK_moons_user_TO_moons_charge -- member -> 충전
		FOREIGN KEY (
			user_code -- 유저
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- 한줄평
ALTER TABLE moons_comment
	ADD
		CONSTRAINT FK_moons_user_TO_moons_comment -- member -> 한줄평
		FOREIGN KEY (
			user_code -- 유저식별코드
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- 평점
ALTER TABLE moons_rating
	ADD
		CONSTRAINT FK_moons_user_TO_moons_rating -- member -> 평점
		FOREIGN KEY (
			user_code -- 유저식별코드
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);
		
-- 좋아요
ALTER TABLE moons_like
   ADD
      CONSTRAINT FK_moons_user_TO_moons_like -- member -> 좋아요
      FOREIGN KEY (
         user_code -- 유저식별코드
      )
      REFERENCES moons_user ( -- member
         user_code -- 유저식별코드
      );		

-- 좋아요
ALTER TABLE moons_like
   ADD
      CONSTRAINT FK_moons_board_TO_moons_like -- board -> 좋아요
      FOREIGN KEY (
         board_num -- num
      )
      REFERENCES moons_board ( -- board
         board_num -- num
      );
      
-- point
ALTER TABLE moons_point
	ADD
		CONSTRAINT FK_moons_user_TO_moons_point -- member -> point
		FOREIGN KEY (
			point_donater -- 유저식별코드
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- point
ALTER TABLE moons_point
	ADD
		CONSTRAINT FK_moons_user_TO_moons_point2 -- member -> point2
		FOREIGN KEY (
			point_receiver -- 유저식별코드2
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);      

-- withdraw
ALTER TABLE moons_withdraw
	ADD
		CONSTRAINT FK_moons_user_TO_withdraw -- member -> withdraw
		FOREIGN KEY (
			user_code -- 유저
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);				
		
-- report
ALTER TABLE moons_report
	ADD
		CONSTRAINT FK_moons_board_TO_moons_report -- board -> scrap
		FOREIGN KEY (
			board_num -- 게시물번호
		)
		REFERENCES moons_board ( -- board
			board_num -- num
		)
		ON DELETE CASCADE;
		
-- report
ALTER TABLE moons_report
	ADD
		CONSTRAINT FK_moons_user_TO_moons_report -- board -> scrap
		FOREIGN KEY (
			report_reporter -- 게시물번호
		)
		REFERENCES moons_user ( -- board
			user_code -- num
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

------------------------------------------------------------------
------------------------------------------------------------------ 여기까지

-- 팔로우 받았을 때 알림 추가
create or replace trigger notice_follow
after insert on moons_follow
for each row
  begin
	insert into moons_notice(user_code,notice_actor,notice_type,notice_date,notice_state) values(:new.user_code,:new.follow_following,1,sysdate,1);
  end;
/

-- 팔로우 취소했을 때 알림 제거
create or replace trigger notice_follow_cancel
after delete on moons_follow
for each row
  begin
	delete from moons_notice where user_code=:old.user_code and notice_actor=:old.follow_following and notice_type=1;
  end;
/

-- 내 글이 공유됐을 때 알림 추가
create or replace trigger notice_share
after insert on moons_share
for each row
  declare
  	share_actor NUMBER;
  begin
	select user_code into share_actor from moons_board where board_num=:new.board_num;
	insert into moons_notice(user_code,notice_actor,board_num,notice_type,notice_date,notice_state) values(share_actor,:new.user_code,:new.board_num,2,sysdate,1);
	update moons_board set board_share = board_share+1 where board_num=:new.board_num;
  end;
/

-- 내 글이 공유 취소됐을 때 알림 제거
create or replace trigger notice_share_cancel
after delete on moons_share
for each row
  declare
  	share_actor NUMBER;
  begin
	select user_code into share_actor from moons_board where board_num=:old.board_num;
	delete from moons_notice where user_code=share_actor and notice_actor=:old.user_code and board_num=:old.board_num and notice_type=2;
	update moons_board set board_share = board_share-1 where board_num=:old.board_num;
  end;
/

-- 내 글이 좋아요 받았을 때 알림 추가
create or replace trigger notice_like
after insert on moons_like
for each row
  declare
  	like_actor NUMBER;
  begin
	select user_code into like_actor from moons_board where board_num=:new.board_num;
	insert into moons_notice(user_code,notice_actor,board_num,notice_type,notice_date,notice_state) values(like_actor,:new.user_code,:new.board_num,3,sysdate,1);
	update moons_board set board_like = board_like+1 where board_num=:new.board_num;
  end;
/

-- 내 글에 좋아요 취소됐을 때 알림 제거
create or replace trigger notice_like_cancel
after delete on moons_like
for each row
  declare
  	like_actor NUMBER;
  begin
	select user_code into like_actor from moons_board where board_num=:old.board_num;
	delete from moons_notice where user_code=like_actor and notice_actor=:old.user_code and board_num=:old.board_num and notice_type=3;
	update moons_board set board_like = board_like-1 where board_num=:old.board_num;
  end;
/

-- 내 글에 리플이 달렸을 때 알림 추가
create or replace trigger notice_reply_board
after insert on moons_reply
for each row
  declare
  	reply_actor NUMBER;
  begin	  
	select user_code into reply_actor from moons_board where board_num=:new.board_num;  
	insert into moons_notice(user_code,notice_actor,board_num,reply_num,notice_type,notice_date,notice_state) values(reply_actor,:new.user_code,:new.board_num,:new.reply_num,4,sysdate,1);
	update moons_board set board_reply = board_reply+1 where board_num=:new.board_num;
  end;
/

-- 내 글에 달린 리플이 삭제됐을 때 알림 제거
create or replace trigger notice_reply_board_cancel
after delete on moons_reply
for each row
  declare
  	reply_actor NUMBER;
  begin	  
	select user_code into reply_actor from moons_board where board_num=:old.board_num;  
	delete from moons_notice where user_code=reply_actor and notice_actor=:old.user_code and board_num=:old.board_num and reply_num=:old.reply_num and notice_type=4;
	update moons_board set board_reply = board_reply-1 where board_num=:old.board_num;
  end;
/

-- 내 리플에 리리플이 달렸을 때 알림 추가 (나중에)
create or replace trigger notice_reply_reply
after insert on moons_reply
for each row
  declare
  	reply_actor NUMBER;
  begin	  
	select user_code into reply_actor from moons_reply where board_num=:new.board_num and reply_ref=:new.reply_ref;
	insert into moons_notice(user_code,notice_actor,board_num,reply_num,notice_type,notice_date,notice_state) values(reply_actor,:new.user_code,:new.board_num,:new.reply_num,5,sysdate,1);
	update moons_board set board_reply = board_reply+1 where board_num=:new.board_num;
  end;
/

-- 내 리플에 달린 리리플이 삭제됐을 때 알림 제거
create or replace trigger notice_reply_reply_cancel
after delete on moons_reply
for each row
  declare
  	reply_actor NUMBER;
  begin	  
	select user_code into reply_actor from moons_reply where board_num=:old.board_num and reply_ref=:old.reply_ref;
	delete from moons_notice where user_code=reply_actor and notice_actor=:old.user_code and board_num=:old.board_num and reply_num=:old.reply_num and notice_type=5;
	update moons_board set board_reply = board_reply-1 where board_num=:old.board_num;
  end;
/

/*
-- 내 이름이 태그되었을 때 알림 추가 (나중에)
create or replace trigger notice_tag
after insert on moons_follow
for each row
  begin
	insert into moons_notice(user_code,notice_actor,notice_type,notice_date) values(new.user_code,new.follow_following,6,sysdate)
  end;
/
*/
-- 누군가가 나한테 후원했을 때 알림 추가 (나중에)
create or replace trigger notice_donate
after insert on moons_point
for each row
  begin
	insert into moons_notice(user_code,notice_actor,notice_type,notice_amount,notice_date,notice_state) values(:new.point_receiver,:new.point_donater,7,:new.point_donate,sysdate,1);
	update moons_user set user_point=user_point+:new.point_donate where user_code=:new.point_receiver;
	update moons_user set user_point=user_point-:new.point_donate where user_code=:new.point_donater;
  end;
/

/*
-- 누군가가 내 글에 후원했을 때 알림 추가 (나중에)
create or replace trigger notice_payment_board
after insert on moons_follow
for each row
  begin
	insert into moons_notice(user_code,notice_actor,notice_type,notice_date) values(new.user_code,new.follow_following,8,sysdate)
  end;
/
*/
-- 포인트를 충전했을 때 결제내역 추가
create or replace trigger point_charge
after insert on moons_charge
for each row
  begin
	update moons_user set user_point=user_point+:new.charge_amount where user_code=:new.user_code;
  end;
/

-- 포인트를 환전했을 때 결제내역 추가
create or replace trigger point_withdraw
after insert on moons_withdraw
for each row
  begin
	update moons_user set user_point=user_point-:new.withdraw_amount where user_code=:new.user_code;
  end;
/

-- 게시글 삭제 시 안에서 사용된 파일들 삭제
create or replace trigger board_file_delete
after delete on moons_board
for each row
  begin
	delete from moons_file where board_num=:old.board_num;
  end;
/

-- 신고에 의한 게시글 삭제
create or replace trigger report_board_delete
after update of report_state on moons_report
for each row
  when(new.report_state=2)
  declare
  	writer NUMBER;
  begin
	select user_code into writer from moons_board where board_num=:new.board_num;
	update moons_board set board_state=2 where board_num=:new.board_num;
	insert into moons_notice(user_code,board_num,notice_type,notice_date,notice_state) values(writer,:new.board_num,8,sysdate,1);
  end;
/

-- 본인에 의한 게시글 삭제 시 신고내역 수정
create or replace trigger user_board_delete
after update of board_state on moons_board
for each row
  begin
	update moons_report set report_state=4 where board_num=:new.board_num and (report_state=1 or report_state=3);
  end;
/

-- 신고에 의한 삭제된 게시글 복원
create or replace trigger report_board_restore
after update of report_state on moons_report
for each row
  when(new.report_state=3 and old.report_state=2)
  declare
  	writer NUMBER;
  begin
	select user_code into writer from moons_board where board_num=:new.board_num;  
	update moons_board set board_state=1 where board_num=:new.board_num;
	insert into moons_notice(user_code,board_num,notice_type,notice_date,notice_state) values(writer,:new.board_num,9,sysdate,1);
  end;
/

-- 관리자가 환전 요청을 처리했을 때 알림 추가
create or replace trigger withdraw_complete
after update of withdraw_state on moons_withdraw
for each row
  declare
  begin
	insert into moons_notice(user_code,notice_type,notice_amount,notice_date,notice_state) values(:new.user_code,10,:new.withdraw_amount,sysdate,1);
  end;
/

------------------------------------------------------------------
------------------------------------------------------------------ 여기까지

-- 트리거 진행상황
<알림 테이블 추가>
1. notice_follow		팔로우 받았을 때
2. notice_share			내 글이 공유됐을 때 
3. notice_like			내 글이 좋아요 받았을 때
4. notice_reply_board		내 글에 리플이 달렸을 때 
5. notice_reply_reply		내 리플에 리리플이 달렸을 때 
6. notice_tag			내 이름이 태그되었을 때
7. notice_payment_profile	누군가가 나한테 후원했을 때
8. notice_board_delete	내 글이 신고에 의해 삭제되었을 때
9. notice_board_restore 내 글이 신고에 의해 삭제되었다가 복원되었을 때
10.notice_point_withdraw 포인트 환전이 완료되었을 때

deposit		포인트를 충전했을 때 결제내역 추가
withdraw		포인트를 환전했을 때 결제내역 추가

select * from moons_scrap;
select * from moons_follow;
select * from moons_notice;
select * from moons_reply;
select * from moons_dm;
select * from moons_share;
select * from moons_point;
select * from moons_comment;
select * from moons_rating;
select * from moons_like;
select * from moons_board;
select * from moons_user;
select * from moons_charge;
select * from moons_withdraw;
select * from moons_file;
select * from moons_report;

select * from user_triggers;

-- 관리자 계정
insert into moons_user values(0,'default','admin','admin','admin',NULL,NULL,0,NULL);
insert into moons_follow values(1,2);
insert into moons_follow values(9,1);
insert into moons_like values(1,13,sysdate);
insert into moons_like values(1,14,sysdate);
insert into moons_board values(moons_board_num_seq.nextval,1,'신과함께','재미있네요','십점 만점에 백점 드립니다.',0,0,sysdate,'#하정우 #마동석');
insert into moons_share values(2,1,sysdate);
insert into moons_reply values(moons_reply_num_seq.nextval,1,2,'퍼가요',sysdate,0,0);
insert into moons_dm values(2,1,'안녕',sysdate,1);
insert into moons_report values(7,1,'그냥',sysdate,1);

delete from moons_dm;
delete from moons_user;
delete from moons_board;
delete from moons_follow;
delete from moons_reply;
delete from moons_like;
delete from moons_share;
delete from moons_notice;
delete from moons_user where user_code=6;
delete from moons_point;
delete from moons_charge;
delete from moons_withdraw;
delete from moons_report where board_num=9

-- 노티스 중복 제거
DELETE FROM moons_notice
WHERE rowid not in
(SELECT MIN(rowid)
FROM moons_notice
GROUP BY user_code,notice_actor,notice_type);

-- 맞팔 확인
select user_code, 1 as chk
from moons_follow
where follow_following = 1 and user_code in (select follow_following
											 from moons_follow
											 where user_code=1)
union
select user_code, 0 as chk
from moons_follow
where follow_following = 1 and user_code not in (select follow_following
											 from moons_follow
											 where user_code=1)
											 
		select board_num, m.user_code, board_movie, board_subject, board_content, board_like, board_share, board_reply,
		to_char(board_date, 'YYYY-MM-DD HH24:MI:SS') as board_date, board_hashtag,
		user_nickname, user_photo,
		(select case when count(*) > 0 then 1 else 0 end 
        from moons_like
		where user_code=1 and board_num=m.board_num) as isLike,
		(select case when count(*) > 0 then 1 else 0 end 
        from moons_share
		where user_code=1 and board_num=m.board_num) as isShare,
		(select case when count(*) > 0 then 1 else 0 end 
		 from moons_report
		 where report_reporter=1 and board_num=m.board_num) as isReport
		from moons_board m, moons_user u
		where m.user_code=u.user_code and m.user_code=1
		order by board_date desc	
		
		select board_num, m.user_code, board_movie, board_subject, board_content, board_like, board_share, board_reply,
		to_char(board_date, 'YYYY-MM-DD HH24:MI:SS') as board_date, board_hashtag, board_photo,
		u.user_nickname, u.user_photo, u.user_introduce,
		(select case when count(*) > 0 then 1 else 0 end 
		 from moons_like
		 where user_code=1 and board_num=m.board_num) as isLike,
		(select case when count(*) > 0 then 1 else 0 end 
		 from moons_share
		 where user_code=1 and board_num=m.board_num) as isShare
		from moons_board m, moons_user u
		where board_num=16 and m.user_code=u.user_code

select b.*
		from(
			select rownum rm,a.*
			from(	select n.*, a.user_photo, a.user_nickname
					from moons_notice n, moons_user a
					where n.user_code=1 and n.user_code=a.user_code
					order by n.notice_date desc)a)b
		where rm>0 and rm<=10
		