-- board
drop table moons_board;
drop sequence moons_board_num_seq

select * from moons_board

-- board 테이블 생성
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
   board_hashtag VARCHAR2(1000)    NULL      -- 해시태그
);
-------------------------------------------

-- board 시퀀스 생성
create sequence moons_board_num_seq
start with 1 
increment by 1
nocache
nocycle;

select * from moons_follow

insert into moons_follow values(1,3);

-- board 테스트테이블
insert into moons_board values(
	moons_board_num_seq.nextval, --게시물번호
	3, --작성자코드
	'영화코드2', --관련영화코드
	'리뷰제목11리뷰제목11리뷰제목11리뷰제목11리뷰제목11뒤에는잘림',--제목 50byte까지 표시
	'11내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트',--310byte까지 표시
	0, --좋아요수
	0, --공유된수
	0, --댓글수
	sysdate,
	'태그1,태그2,태그3,태그4'
);

insert into moons_board values(
	moons_board_num_seq.nextval, --게시물번호
	100, --작성자코드
	'영화코드2', --관련영화코드
	'리뷰제목22리뷰제목22리뷰제목22리뷰제목22리뷰제목22뒤에는잘림',--제목 50byte까지 표시
	'22내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트',--310byte까지 표시
	12, --좋아요수
	22, --공유된수
	32, --댓글수
	sysdate,
	'태그1,태그2,태그3,태그4'
);

insert into moons_board values(
	moons_board_num_seq.nextval, --게시물번호
	200, --작성자코드
	'영화코드3', --관련영화코드
	'리뷰제목33리뷰제목33리뷰제목33리뷰제목33리뷰제목33뒤에는잘림',--제목 50byte까지 표시
	'33내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트',--310byte까지 표시
	13, --좋아요수
	23, --공유된수
	33, --댓글수
	sysdate,
	'태그1,태그2,태그3,태그4'
);

insert into moons_board values(
	moons_board_num_seq.nextval, --게시물번호
	200, --작성자코드
	'영화코드4', --관련영화코드
	'리뷰제목44리뷰제목44리뷰제목44리뷰제목44리뷰제목44뒤에는잘림',--제목 50byte까지 표시
	'44내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트',--310byte까지 표시
	14, --좋아요수
	24, --공유된수
	34, --댓글수
	sysdate,
	'태그1,태그2,태그3,태그4'
);

insert into moons_board values(
	moons_board_num_seq.nextval, --게시물번호
	100, --작성자코드
	'영화코드5', --관련영화코드
	'리뷰제목55리뷰제목55리뷰제목55리뷰제목55리뷰제목55뒤에는잘림',--제목 50byte까지 표시
	'55내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트',--310byte까지 표시
	15, --좋아요수
	25, --공유된수
	35, --댓글수
	sysdate,
	'태그1,태그2,태그3,태그4'
);

insert into moons_board values(
	moons_board_num_seq.nextval, --게시물번호
	300, --작성자코드
	'영화코드6', --관련영화코드
	'리뷰제목66리뷰제목66리뷰제목66리뷰제목66리뷰제목66뒤에는잘림',--제목 60byte까지 표시
	'66내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.내용을 입력하세요.최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트중최대출력테스트',--310byte까지 표시
	16, --좋아요수
	26, --공유된수
	36, --댓글수
	sysdate,
	'태그1,태그2,태그3,태그4'
);


-----------------------------------------------------------

drop table moons_user;
drop sequence moons_user_num_seq;
select * from moons_user

-- member 테이블 생성
CREATE TABLE moons_user (
	user_code      NUMBER        NOT NULL, -- 유저식별코드
	user_type      varchar2(10)  NOT NULL, -- 가입유형
	user_id        VARCHAR2(20)  NULL,     -- 아이디
	user_pass      VARCHAR2(20)  NOT NULL, -- 패스워드
	user_nickname  VARCHAR2(30)  NOT NULL, -- 별명
	user_photo     VARCHAR2(200) NULL,     -- 프로필사진
	user_email     VARCHAR2(50)  NULL,     -- 이메일
	user_point     NUMBER        DEFAULT 0, -- 포인트
	user_introduce VARCHAR2(600) NULL      -- 자기소개
);

-- member 시퀀스 생성
create sequence moons_user_num_seq
start with 1 
increment by 1
nocache
nocycle;

-- member 테스트 테이블 생성
insert into moons_user values(100, 'sns', 'id11', 'pass11', '유저1', 'images/a.jpg', 'id11@gmail.com', 111, '유저1입니다');
insert into moons_user values(200, 'sns', 'id22', 'pass22', '유저2', 'images/cover1.jpg', 'id22@gmail.com', 222, '유저2입니다');
insert into moons_user values(300, 'sns', 'id33', 'pass33', '유저3', 'images/cover1.jpg', 'id33@gmail.com', 333, '유저3입니다');

------------------------------------------------------------------

select * from moons_follow
drop table moons_follow


-- follow
CREATE TABLE moons_follow (
	user_code        NUMBER NULL, -- 유저식별코드
	follow_following NUMBER NULL  -- 팔로잉
);

insert into moons_follow values(100, 200);
insert into moons_follow values(200, 100);
insert into moons_follow values(100, 300);

------------------------------------------------------------------
-- 좋아요 DB연결은 아직 구현안된 상태라 안만들고 실행해도 결과나옴!

-- 좋아요
DROP TABLE moons_like;

-- 좋아요
CREATE TABLE moons_like (
   user_code  NUMBER NULL,     -- 유저식별코드
   board_num  NUMBER NULL,     -- num
   share_date DATE   NOT NULL  -- 날짜
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

--------------------------------------------------------------------      
      
DROP TABLE moons_dm;
      
-- dm
CREATE TABLE moons_dm (
	user_code   NUMBER     NULL,     -- 유저식별코드
	dm_receiver NUMBER     NULL,     -- 받는사람
	dm_content  VARCHAR2(4000) NOT NULL, -- 메세지내용
	dm_date     DATE       NOT NULL  -- 날짜
);

--1번으로 로그인했을때
INSERT INTO moons_dm VALUES(1, 2, '1번이 2번에게 보내는 1번째 메세지입니다.', sysdate); --우측
INSERT INTO moons_dm VALUES(2, 1, '2번이 1번에게 보내는 1번째 메세지입니다.', sysdate); --좌측      

select * from moons_dm

select b.* 
from(select rownum rm,a.*
	 from(select *
		  from moons_notice
		  where user_code=1
		  order by notice_date desc)a)b
where rm>0 and rm<10