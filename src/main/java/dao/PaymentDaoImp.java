package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ChargeDTO;
import dto.PointDTO;
import dto.WithdrawDTO;

public class PaymentDaoImp implements PaymentDAO{
	private SqlSessionTemplate paymentSqlSession;
	
	public void setPaymentSqlSession(SqlSessionTemplate paymentSqlSession) {
		this.paymentSqlSession = paymentSqlSession;
	}

	public PaymentDaoImp() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<PointDTO> pointListMethod(Map<String, String> map) {
		return paymentSqlSession.selectList("payment.pointlist",map);
	}

	@Override
	public void withdrawinsertMethod(WithdrawDTO wdto) {
		paymentSqlSession.insert("payment.withdrawins",	wdto);
		
	}

	@Override
	public List<WithdrawDTO> withdrawListMethod(Map<String, String> map) {
		return paymentSqlSession.selectList("payment.withdrawlist", map);
	}

	@Override
	public List<ChargeDTO> chargeListMethod(Map<String, String> map) {
		return paymentSqlSession.selectList("payment.chargelist", map);
	}

	@Override
	public void chargeInsertMethod(ChargeDTO cdto) {
		paymentSqlSession.insert("payment.chargeins",cdto);
		
	}

	
}
