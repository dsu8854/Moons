package dto;

import java.util.Date;

/*
 -- withdraw
CREATE TABLE moons_withdraw (
	withdraw_num         NUMBER        NOT NULL, -- num
	user_code            NUMBER        NULL,     -- 유저
	withdraw_name        VARCHAR2(20)  NOT NULL, -- 실명
	withdraw_identitynum VARCHAR2(13)  NOT NULL, -- 주민등록번호
	withdraw_amount      NUMBER        NOT NULL DEFAULT 0, -- 입금액
	withdraw_bank        VARCHAR2(20)  NOT NULL, -- 은행
	withdraw_account     VARCHAR2(100) NOT NULL, -- 계좌번호
	withdraw_holder      VARCHAR2(20)  NOT NULL, -- 예금주
	withdraw_date        DATE          NOT NULL, -- 날짜
	withdraw_state       NUMBER        NOT NULL  -- 신청상태
); 
 */

public class WithdrawDTO {
	private int withdraw_num;
	private int user_code;
	private String withdraw_name;
	private String withdraw_identitynum;
	private int amount;
	private String withdraw_bank;
	private String withdraw_account;
	private String withdraw_holder;
	private Date withdraw_date;
	private int withdraw_state;
	
	public WithdrawDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getWithdraw_num() {
		return withdraw_num;
	}

	public void setWithdraw_num(int withdraw_num) {
		this.withdraw_num = withdraw_num;
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public String getWithdraw_name() {
		return withdraw_name;
	}

	public void setWithdraw_name(String withdraw_name) {
		this.withdraw_name = withdraw_name;
	}

	public String getWithdraw_identitynum() {
		return withdraw_identitynum;
	}

	public void setWithdraw_identitynum(String withdraw_identitynum) {
		this.withdraw_identitynum = withdraw_identitynum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getWithdraw_bank() {
		return withdraw_bank;
	}

	public void setWithdraw_bank(String withdraw_bank) {
		this.withdraw_bank = withdraw_bank;
	}

	public String getWithdraw_account() {
		return withdraw_account;
	}

	public void setWithdraw_account(String withdraw_account) {
		this.withdraw_account = withdraw_account;
	}

	public String getWithdraw_holder() {
		return withdraw_holder;
	}

	public void setWithdraw_holder(String withdraw_holder) {
		this.withdraw_holder = withdraw_holder;
	}

	public Date getWithdraw_date() {
		return withdraw_date;
	}

	public void setWithdraw_date(Date withdraw_date) {
		this.withdraw_date = withdraw_date;
	}

	public int getWithdraw_state() {
		return withdraw_state;
	}

	public void setWithdraw_state(int withdraw_state) {
		this.withdraw_state = withdraw_state;
	}
	
	
}

