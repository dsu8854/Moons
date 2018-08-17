package dto;

public class FollowDTO {
	private int user_code;
	private int follow_following;

	private boolean checkFollow;	// 맞팔 확인
	private String user_photo; //유저사진을 받아오기 위한 변수
	private String user_nickname; //유저닉네임을 받아오기 위한 변수
	private String user_introduce;
	
	public FollowDTO() {
		
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public int getFollow_following() {
		return follow_following;
	}

	public void setFollow_following(int follow_following) {
		this.follow_following = follow_following;
	}

	public boolean isCheckFollow() {
		return checkFollow;
	}

	public void setCheckFollow(boolean checkFollow) {
		this.checkFollow = checkFollow;
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

	public String getUser_introduce() {
		return user_introduce;
	}

	public void setUser_introduce(String user_introduce) {
		this.user_introduce = user_introduce;
	}
}
