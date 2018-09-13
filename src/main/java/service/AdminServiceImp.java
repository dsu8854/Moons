package service;

import java.util.HashMap;
import java.util.List;

import dao.AdminDAO;
import dto.BoardDTO;
import dto.ChargeDTO;
import dto.LinkDTO;
import dto.ReportDTO;
import dto.UserDTO;
import dto.WithdrawDTO;

public class AdminServiceImp implements AdminService {
	private AdminDAO adminDao;
	
	public AdminServiceImp() {
		
	}
	
	public void setAdminDao(AdminDAO adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public List<ReportDTO> selectReportCountProcess(int report_state) {
		return adminDao.selectReportCountMethod(report_state);
	}

	@Override
	public List<ReportDTO> selectReportListProcess(ReportDTO rdto) {
		return adminDao.selectReportListMethod(rdto);
	}

	@Override
	public void updateReportProcess(ReportDTO rdto) {
		adminDao.updateReportMethod(rdto);
	}

	@Override
	public List<WithdrawDTO> selectWithdrawListProcess(int withdraw_state) {
		return adminDao.selectWithdrawListMethod(withdraw_state);
	}

	@Override
	public List<ChargeDTO> selectChargeListProcess() {
		return adminDao.selectChargeListMethod();
	}

	@Override
	public void updateWithdrawProcess(WithdrawDTO wdto) {
		adminDao.updateWithdrawMethod(wdto);
	}

	@Override
	public void updateLinkProcess(LinkDTO ldto) {
		adminDao.updateLinkMethod(ldto);
	}

	@Override
	public List<BoardDTO> selectBoardListProcess(HashMap<String, Integer> map) {
		return adminDao.selectBoardListMethod(map);
	}

	@Override
	public int selectReportCountAllProcess() {
		return adminDao.selectReportCountAllMethod();
	}

	@Override
	public int selectWithdrawCountAllProcess() {
		return adminDao.selectWithdrawCountAllMethod();
	}

	@Override
	public List<UserDTO> selectMemberListProcess(HashMap<String, Integer> map) {
		return adminDao.selectMemberListMethod(map);
	}

	@Override
	public List<String> selectEmailAllProcess() {
		return adminDao.selectEmailAllMethod();
	}
}
