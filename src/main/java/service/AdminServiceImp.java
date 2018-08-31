package service;

import java.util.List;

import dao.AdminDAO;
import dto.ChargeDTO;
import dto.ReportDTO;
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
}
