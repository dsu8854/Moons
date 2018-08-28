package dto;

import java.util.Date;

public class PaymentDTO {
	private int payment_num;
	private int user_code;
	private int payment_deposit;
	private int payment_withdraw;
	private Date payment_date;
	
	public PaymentDTO() {
	}
	
	public int getPayment_num() {
		return payment_num;
	}
	
	public void setPayment_num(int payment_num) {
		this.payment_num = payment_num;
	}
	
	public int getUser_code() {
		return user_code;
	}
	
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	
	public int getPayment_deposit() {
		return payment_deposit;
	}
	
	public void setPayment_deposit(int payment_deposit) {
		this.payment_deposit = payment_deposit;
	}
	
	public int getPayment_withdraw() {
		return payment_withdraw;
	}
	
	public void setPayment_withdraw(int payment_withdraw) {
		this.payment_withdraw = payment_withdraw;
	}
	
	public Date getPayment_date() {
		return payment_date;
	}
	
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}	
}