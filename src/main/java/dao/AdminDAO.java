package dao;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.ChargeDTO;
import dto.LinkDTO;
import dto.ReportDTO;
import dto.UserDTO;
import dto.WithdrawDTO;

public interface AdminDAO {
	public List<ReportDTO> selectReportCountMethod(int report_state);
	public List<ReportDTO> selectReportListMethod(ReportDTO rdto);
	public void updateReportMethod(ReportDTO rdto);
	public List<WithdrawDTO> selectWithdrawListMethod(int withdraw_state);
	public List<ChargeDTO> selectChargeListMethod();
	public void updateWithdrawMethod(WithdrawDTO wdto);
	public void updateLinkMethod(LinkDTO ldto);
	public List<BoardDTO> selectBoardListMethod(HashMap<String,Integer> map);
	public int selectReportCountAllMethod();
	public int selectWithdrawCountAllMethod();
	public List<UserDTO> selectMemberListMethod(HashMap<String,Integer> map);
	public List<String> selectEmailAllMethod();
}