package dto;

import org.springframework.web.multipart.MultipartFile;

public class UserDTO {
	private int user_code;
	private String user_type;
	private String user_id;
	private String user_pass;
	private String user_nickname;
	private String user_photo;
	private String user_email;
	private int user_point;
	private String user_introduce;
	private MultipartFile filename;
	
	private int postCount;
	private int followCount;
	private int followerCount;
	private int follow_check;
	
	private int user_post;
	private int user_like;
	private int user_share;
	private int user_donate;
	
	public UserDTO() {
		
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pass() {
		return user_pass;
	}

	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
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

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public String getUser_introduce() {
		return user_introduce;
	}

	public void setUser_introduce(String user_introduce) {
		this.user_introduce = user_introduce;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}

	public int getPostCount() {
		return postCount;
	}

	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}

	public int getFollowCount() {
		return followCount;
	}

	public void setFollowCount(int followCount) {
		this.followCount = followCount;
	}

	public int getFollowerCount() {
		return followerCount;
	}

	public void setFollowerCount(int followerCount) {
		this.followerCount = followerCount;
	}
	
	public int getFollow_check() {
		return follow_check;
	}
	
 	public void setFollow_check(int follow_check) {
		this.follow_check = follow_check;
	}

	public int getUser_post() {
		return user_post;
	}

	public void setUser_post(int user_post) {
		this.user_post = user_post;
	}

	public int getUser_like() {
		return user_like;
	}

	public void setUser_like(int user_like) {
		this.user_like = user_like;
	}

	public int getUser_share() {
		return user_share;
	}

	public void setUser_share(int user_share) {
		this.user_share = user_share;
	}

	public int getUser_donate() {
		return user_donate;
	}

	public void setUser_donate(int user_donate) {
		this.user_donate = user_donate;
	}
}