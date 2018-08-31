package service;

import java.util.List;

import dto.ChargeDTO;
import dto.ReportDTO;
import dto.WithdrawDTO;

public interface AdminService {
	public List<ReportDTO> selectReportCountProcess(int report_state);
	public List<ReportDTO> selectReportListProcess(ReportDTO rdto);
	public void updateReportProcess(ReportDTO rdto);
	public List<WithdrawDTO> selectWithdrawListProcess(int withdraw_state);
	public List<ChargeDTO> selectChargeListProcess();
	public void updateWithdrawProcess(WithdrawDTO wdto);
}