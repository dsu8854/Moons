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

-- board
DROP TABLE moons_board;

-- payment
DROP TABLE moons_payment;

-- member
DROP TABLE moons_user;

-- scrap
CREATE TABLE moons_scrap (
	user_code  NUMBER NOT NULL, -- 유저
	board_num  NUMBER NULL,     -- 게시물번호
	scrap_date DATE   NOT NULL  -- 날짜
);

-- scrap
ALTER TABLE moons_scrap
	ADD
		CONSTRAINT PK_moons_scrap -- scrap 기본키
		PRIMARY KEY (
			user_code -- 유저
		);

-- follow
CREATE TABLE moons_follow (
	user_code        NUMBER NOT NULL, -- 유저
	follow_following NUMBER NULL      -- 팔로잉
);

-- follow
ALTER TABLE moons_follow
	ADD
		CONSTRAINT PK_moons_follow -- follow 기본키2
		PRIMARY KEY (
			user_code -- 유저
		);

-- notice
CREATE TABLE moons_notice (
	user_code     NUMBER NOT NULL, -- 대상유저
	notice_actor  NUMBER NULL,     -- 행위유저
	board_num     NUMBER NULL,     -- 관련게시물번호
	reply_num     NUMBER NULL,     -- 관련리플번호
	notice_type   NUMBER NOT NULL, -- 알림유형
	notice_amount NUMBER NULL,     -- 후원금액
	notice_date   DATE   NOT NULL  -- 날짜
);

-- notice
ALTER TABLE moons_notice
	ADD
		CONSTRAINT PK_moons_notice -- notice 기본키
		PRIMARY KEY (
			user_code -- 대상유저
		);

-- reply
CREATE TABLE moons_reply (
	reply_num     NUMBER     NOT NULL, -- num
	board_num     NUMBER     NOT NULL, -- 게시판번호
	user_code     NUMBER     NOT NULL, -- 작성자
	reply_content VARCHAR2(4000) NULL,     -- 내용
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
	user_code   NUMBER     NOT NULL, -- 보내는사람
	dm_receiver NUMBER     NULL,     -- 받는사람
	dm_content  VARCHAR2(4000) NOT NULL, -- 메세지내용
	dm_date     DATE       NOT NULL  -- 날짜
);

-- dm
ALTER TABLE moons_dm
	ADD
		CONSTRAINT PK_moons_dm -- dm 기본키
		PRIMARY KEY (
			user_code -- 보내는사람
		);

-- board
CREATE TABLE moons_board (
	board_num     NUMBER        NOT NULL, -- num
	user_code     NUMBER        NULL,     -- 작성자
	board_movie   VARCHAR2(100) NOT NULL, -- 관련영화코드
	board_subject VARCHAR2(180) NOT NULL, -- 제목
	board_content VARCHAR2(4000)    NULL,     -- 내용
	board_file    VARCHAR2(4000)    NULL,     -- 첨부파일
	board_like    NUMBER        DEFAULT 0, -- 좋아요 수
	board_share   NUMBER        DEFAULT 0, -- 공유된 수
	board_date    DATE          NOT NULL, -- 날짜
	board_hashtag VARCHAR2(4000)    NULL      -- 해시태그
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
	user_code  NUMBER NOT NULL, -- 유저
	board_num  NUMBER NULL,     -- 게시물번호
	share_date DATE   NOT NULL  -- 날짜
);

-- share
ALTER TABLE moons_share
	ADD
		CONSTRAINT PK_moons_share -- share 기본키
		PRIMARY KEY (
			user_code -- 유저
		);

-- member
CREATE TABLE moons_user (
	user_code      NUMBER        NOT NULL, -- 유저식별코드
	user_type      varchar2(10)  NOT NULL, -- 가입유형
	user_id        VARCHAR2(20)  NOT NULL,     -- 아이디
	user_pass      VARCHAR2(20)  NULL, -- 패스워드
	user_nickname  VARCHAR2(30)  NOT NULL, -- 별명
	user_photo     VARCHAR2(200) NULL,     -- 프로필사진
	user_email     VARCHAR2(50)  NOT NULL,     -- 이메일
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

-- payment
CREATE TABLE moons_payment (
	payment_num      NUMBER NOT NULL, -- num
	user_code        NUMBER NULL,     -- 유저
	payment_deposit  NUMBER DEFAULT 0, -- 입금액
	payment_withdraw NUMBER DEFAULT 0, -- 출금액
	payment_date     DATE   NOT NULL  -- 날짜
);

-- payment
ALTER TABLE moons_payment
	ADD
		CONSTRAINT PK_moons_payment -- payment 기본키
		PRIMARY KEY (
			payment_num -- num
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
		CONSTRAINT FK_moons_user_TO_moons_scrap -- member -> scrap
		FOREIGN KEY (
			user_code -- 유저
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
		CONSTRAINT FK_moons_user_TO_moons_follow2 -- member -> follow2
		FOREIGN KEY (
			user_code -- 유저
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
		CONSTRAINT FK_moons_user_TO_moons_notice2 -- member -> notice
		FOREIGN KEY (
			user_code -- 대상유저
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
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
		CONSTRAINT FK_moons_user_TO_moons_dm2 -- member -> dm
		FOREIGN KEY (
			user_code -- 보내는사람
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
		CONSTRAINT FK_moons_user_TO_moons_share -- member -> share
		FOREIGN KEY (
			user_code -- 유저
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);

-- payment
ALTER TABLE moons_payment
	ADD
		CONSTRAINT FK_moons_user_TO_moons_payment -- member -> payment
		FOREIGN KEY (
			user_code -- 유저
		)
		REFERENCES moons_user ( -- member
			user_code -- 유저식별코드
		);
		
