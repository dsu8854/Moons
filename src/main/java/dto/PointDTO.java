package dto;

import java.util.Date;

/*
-- point
CREATE TABLE moons_point (
	point_num      NUMBER NOT NULL, -- num
	point_donater  NUMBER NULL,     -- 유저식별코드
	point_receiver NUMBER NULL,     -- 유저식별코드2
	point_donate   NUMBER NOT NULL DEFAULT 0, -- 후원한금액
	point_date     DATE   NOT NULL  -- 날짜
);
 */

public class PointDTO {
	private int point_num;
	private int point_donater;
	private int point_receiver;
	private int point_donate;
	private Date point_date;
	
	private String user_nickname;

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public PointDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPoint_num() {
		return point_num;
	}

	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}

	public int getPoint_donater() {
		return point_donater;
	}

	public void setPoint_donater(int point_donater) {
		this.point_donater = point_donater;
	}

	public int getPoint_receiver() {
		return point_receiver;
	}

	public void setPoint_receiver(int point_receiver) {
		this.point_receiver = point_receiver;
	}

	public int getPoint_donate() {
		return point_donate;
	}

	public void setPoint_donate(int point_donate) {
		this.point_donate = point_donate;
	}

	public Date getPoint_date() {
		return point_date;
	}

	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}
	
	
}


