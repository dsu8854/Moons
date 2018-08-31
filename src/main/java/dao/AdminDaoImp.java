package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ChargeDTO;
import dto.ReportDTO;
import dto.WithdrawDTO;

public class AdminDaoImp implements AdminDAO {
	private SqlSessionTemplate adminSqlSession;
	
	public AdminDaoImp() {
		
	}
	
	public void setAdminSqlSession(SqlSessionTemplate adminSqlSession) {
		this.adminSqlSession = adminSqlSession;
	}

	@Override
	public List<ReportDTO> selectReportCountMethod(int report_state) {
		return adminSqlSession.selectList("admin.selReportCount",report_state);
	}

	@Override
	public List<ReportDTO> selectReportListMethod(ReportDTO rdto) {
		return adminSqlSession.selectList("admin.selReportList",rdto);
	}

	@Override
	public void updateReportMethod(ReportDTO rdto) {
		adminSqlSession.update("admin.uptReport",rdto);
	}

	@Override
	public List<WithdrawDTO> selectWithdrawListMethod(int withdraw_state) {
		return adminSqlSession.selectList("admin.selWithdrawList",withdraw_state);
	}

	@Override
	public List<ChargeDTO> selectChargeListMethod() {
		return adminSqlSession.selectList("admin.selChargeList");
	}

	@Override
	public void updateWithdrawMethod(WithdrawDTO wdto) {
		adminSqlSession.update("admin.uptWithdraw",wdto);
	}
}
