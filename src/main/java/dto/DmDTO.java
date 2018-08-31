package dto;

import java.util.Date;

public class DmDTO {
	private int user_code;
	private int dm_receiver;
	private String dm_content;
	private Date dm_date;
	
	private String user_photo; //유저사진을 받아오기 위한 변수
	private String user_nickname; //유저닉네임을 받아오기 위한 변수
	
	private int dm_state;
	private int dm_count;

	public DmDTO() {
		
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public int getDm_receiver() {
		return dm_receiver;
	}

	public void setDm_receiver(int dm_receiver) {
		this.dm_receiver = dm_receiver;
	}

	public String getDm_content() {
		return dm_content;
	}

	public void setDm_content(String dm_content) {
		this.dm_content = dm_content;
	}

	public Date getDm_date() {
		return dm_date;
	}

	public void setDm_date(Date dm_date) {
		this.dm_date = dm_date;
	}

	public String getUser_photo() {
		return user_photo;
	}

	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public int getDm_state() {
		return dm_state;
	}

	public void setDm_state(int dm_state) {
		this.dm_state = dm_state;
	}
	
	public int getDm_count() {
		return dm_count;
	}

	public void setDm_count(int dm_count) {
		this.dm_count = dm_count;
	}
}//end class
