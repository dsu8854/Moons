package service;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.ChargeDTO;
import dto.LinkDTO;
import dto.ReportDTO;
import dto.UserDTO;
import dto.WithdrawDTO;

public interface AdminService {
	public List<ReportDTO> selectReportCountProcess(int report_state);
	public List<ReportDTO> selectReportListProcess(ReportDTO rdto);
	public void updateReportProcess(ReportDTO rdto);
	public List<WithdrawDTO> selectWithdrawListProcess(int withdraw_state);
	public List<ChargeDTO> selectChargeListProcess();
	public void updateWithdrawProcess(WithdrawDTO wdto);
	public void updateLinkProcess(LinkDTO ldto);
	public List<BoardDTO> selectBoardListProcess(HashMap<String,Integer> map);
	public int selectReportCountAllProcess();
	public int selectWithdrawCountAllProcess();
	public List<UserDTO> selectMemberListProcess(HashMap<String,Integer> map);
	public List<String> selectEmailAllProcess();
}