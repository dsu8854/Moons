package dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyDTO {
	private int reply_num;
	private int board_num;
	private int user_code;
	private String reply_content;
	//json 날짜형식을 지정해주기 위해 필요한 부분
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy년 MM월 dd일")
	private Date reply_date;
	private int reply_ref;
	private int reply_step;
	
	private String user_nickname; 	//댓글작성자 닉네임을 저장하기 위한 변수
	private String user_photo;
	
	public ReplyDTO() {
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	public int getReply_ref() {
		return reply_ref;
	}

	public void setReply_ref(int reply_ref) {
		this.reply_ref = reply_ref;
	}

	public int getReply_step() {
		return reply_step;
	}

	public void setReply_step(int reply_step) {
		this.reply_step = reply_step;
	}
	
	public String getUser_nickname() {
		return user_nickname;
	}
	
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_photo() {
		return user_photo;
	}

	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}
}//end class
