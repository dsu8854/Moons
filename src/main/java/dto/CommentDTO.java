package dto;

import java.util.Date;

public class CommentDTO {
	/*
	 CREATE TABLE moons_comment (
			user_code       NUMBER        NULL,     -- 유저식별코드
			comment_movie   VARCHAR2(300) NOT NULL, -- 영화코드
			comment_content VARCHAR2(500) NOT NULL, -- 내용
			comment_date    DATE          NOT NULL  -- 날짜
		);
	*/
	
	private int user_code;
	private String comment_movie;
	private String comment_content;
	private Date comment_date;
	
	private String user_photo;
	private String user_nickname;

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public CommentDTO() {
		
	}

	public String getUser_photo() {
		return user_photo;
	}

	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public String getComment_movie() {
		return comment_movie;
	}

	public void setComment_movie(String comment_movie) {
		this.comment_movie = comment_movie;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

}
