package dto;

import java.util.Date;

/*
CREATE TABLE moons_notice (
	user_code     NUMBER      NULL,     -- 유저식별코드
	notice_actor  NUMBER      NULL,     -- 행위유저
	board_num     NUMBER      NULL,     -- 관련게시물번호
	reply_num     NUMBER      NULL,     -- 관련리플번호
	notice_type   NUMBER      NOT NULL, -- 알림유형
	notice_amount NUMBER      NULL,     -- 후원금액
	notice_date   DATE        NOT NULL, -- 날짜
	notice_read   VARCHAR2(1) DEFAULT 0 -- 읽음여부
); 
 */

public class NoticeDTO {
	private int user_code;
	private int notice_actor;
	private int board_num;
	private int reply_num;
	private int notice_type;
	private int notice_amount;
	private Date notice_date;
	private String notice_read;
	
	public NoticeDTO() {

	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public int getNotice_actor() {
		return notice_actor;
	}
	public void setNotice_actor(int notice_actor) {
		this.notice_actor = notice_actor;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(int notice_type) {
		this.notice_type = notice_type;
	}
	public int getNotice_amount() {
		return notice_amount;
	}
	public void setNotice_amount(int notice_amount) {
		this.notice_amount = notice_amount;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_read() {
		return notice_read;
	}
	public void setNotice_read(String notice_read) {
		this.notice_read = notice_read;
	}
	
	
}
