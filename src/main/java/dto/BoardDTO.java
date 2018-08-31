package dto;

import java.util.Date;
import java.util.List;

public class BoardDTO {
	private int board_num;
	private int user_code;
	private String board_movie;
	private String board_subject;
	private String board_content;
	private int board_like;
	private int board_share;
	private int board_reply;
	private Date board_date;
	private String board_hashtag;
	private String board_photo;
	private int board_privacy;
	private List<ReplyDTO> replyList;
	
	private String user_photo; 		//작성자 프로필사진을 저장하기 위한 변수
	private String user_nickname; 	//작성자 닉네임을 저장하기 위한 변수
	private String user_introduce;	//작성자 소개를 저장하기 위한 변수
	private Boolean isLike;			//좋아요 여부
	private Boolean isShare;		//공유 여부 
	
	public BoardDTO() {
	
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

	public String getBoard_movie() {
		return board_movie;
	}

	public void setBoard_movie(String board_movie) {
		this.board_movie = board_movie;
	}

	public String getBoard_subject() {
		return board_subject;
	}

	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_like() {
		return board_like;
	}

	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}

	public int getBoard_share() {
		return board_share;
	}

	public void setBoard_share(int board_share) {
		this.board_share = board_share;
	}
	
	public int getBoard_reply() {
		return board_reply;
	}
	
	public void setBoard_reply(int board_reply) {
		this.board_reply = board_reply;
	}
	
	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	
	public String getBoard_hashtag() {
		return board_hashtag;
	}
	
	public void setBoard_hashtag(String board_hashtag) {
		this.board_hashtag = board_hashtag;
	}
	
	public String getBoard_photo() {
		return board_photo;
	}

	public void setBoard_photo(String board_photo) {
		this.board_photo = board_photo;
	}

	public int getBoard_privacy() {
		return board_privacy;
	}

	public void setBoard_privacy(int board_privacy) {
		this.board_privacy = board_privacy;
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
	
	public String getUser_introduce() {
		return user_introduce;
	}

	public void setUser_introduce(String user_introduce) {
		this.user_introduce = user_introduce;
	}

	public Boolean getIsLike() {
		return isLike;
	}

	public void setIsLike(Boolean isLike) {
		this.isLike = isLike;
	}

	public Boolean getIsShare() {
		return isShare;
	}

	public void setIsShare(Boolean isShare) {
		this.isShare = isShare;
	}
	
	public List<ReplyDTO> getReplyList() {
		return replyList;
	}
	
	public void setReplyList(List<ReplyDTO> replyList) {
		this.replyList = replyList;
	}
	
}// end class
