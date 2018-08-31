package dto;

import java.util.Date;

public class CommentDTO {
	private int user_code;
	private String comment_movie;
	private String comment_content;
	private Date comment_date;
	
	private String user_photo;
	private String user_nickname;

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
}