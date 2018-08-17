package dto;

public class RatingDTO {
	/*
	CREATE TABLE moons_rating (
			user_code    NUMBER        NULL,     -- 유저식별코드
			rating_movie VARCHAR2(300) NOT NULL, -- 영화코드
			rating_score NUMBER        NULL      -- 평점
		);
	*/
	
	private int user_code;
	private String rating_movie;
	private int rating_score;
	
	public RatingDTO() {

	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public String getRating_movie() {
		return rating_movie;
	}

	public void setRating_movie(String rating_movie) {
		this.rating_movie = rating_movie;
	}

	public int getRating_score() {
		return rating_score;
	}

	public void setRating_score(int rating_score) {
		this.rating_score = rating_score;
	}

	
	
}
