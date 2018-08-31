package dto;

import java.util.Date;

/*
CREATE TABLE moons_charge (
	charge_num    NUMBER NOT NULL, -- num
	user_code     NUMBER NULL,     -- 유저
	charge_amount NUMBER NOT NULL DEFAULT 0, -- 입금액
	charge_date   DATE   NOT NULL  -- 날짜
);
*/

public class ChargeDTO {
	private int charge_num;
	private int user_code;
	private int charge_amount;
	private Date charge_date;
	
	public ChargeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCharge_num() {
		return charge_num;
	}

	public void setCharge_num(int charge_num) {
		this.charge_num = charge_num;
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public int getCharge_amount() {
		return charge_amount;
	}

	public void setCharge_amount(int charge_amount) {
		this.charge_amount = charge_amount;
	}

	public Date getCharge_date() {
		return charge_date;
	}

	public void setCharge_date(Date charge_date) {
		this.charge_date = charge_date;
	}
	
	
}
