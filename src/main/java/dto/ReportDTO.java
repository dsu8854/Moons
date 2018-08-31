package dto;

import java.util.Date;

public class ReportDTO {
	private int board_num;
	private int report_reporter;
	private String report_reason;
	private Date report_date;
	private int report_state;
	private int report_count;
	
	public ReportDTO() {
		
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getReport_reporter() {
		return report_reporter;
	}

	public void setReport_reporter(int report_reporter) {
		this.report_reporter = report_reporter;
	}

	public String getReport_reason() {
		return report_reason;
	}

	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public int getReport_state() {
		return report_state;
	}

	public void setReport_state(int report_state) {
		this.report_state = report_state;
	}

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}
}
