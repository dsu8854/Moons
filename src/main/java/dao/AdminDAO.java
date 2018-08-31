package dao;

import java.util.List;

import dto.ChargeDTO;
import dto.ReportDTO;
import dto.WithdrawDTO;

public interface AdminDAO {
	public List<ReportDTO> selectReportCountMethod(int report_state);
	public List<ReportDTO> selectReportListMethod(ReportDTO rdto);
	public void updateReportMethod(ReportDTO rdto);
	public List<WithdrawDTO> selectWithdrawListMethod(int withdraw_state);
	public List<ChargeDTO> selectChargeListMethod();
	public void updateWithdrawMethod(WithdrawDTO wdto);
}