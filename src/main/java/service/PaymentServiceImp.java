package service;

import java.util.List;
import java.util.Map;

import dao.PaymentDAO;
import dto.ChargeDTO;
import dto.PointDTO;
import dto.WithdrawDTO;

public class PaymentServiceImp implements PaymentService{
	private PaymentDAO paymentDao;

	public PaymentServiceImp() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void setPaymentDao(PaymentDAO paymentDao) {
		this.paymentDao = paymentDao;
	}
	
	@Override
	public List<PointDTO> pointListProcess(Map<String, String> map) {
		return paymentDao.pointListMethod(map);
	}

	@Override
	public void withdrawinsertProcess(WithdrawDTO wdto) {
		paymentDao.withdrawinsertMethod(wdto);
		
	}

	@Override
	public List<WithdrawDTO> withdrawListProcess(Map<String, String> map) {
		return paymentDao.withdrawListMethod(map);
	}

	@Override
	public List<ChargeDTO> chargeListProcess(Map<String, String> map) {
		return paymentDao.chargeListMethod(map);
	}

	@Override
	public void chargeInsertProcess(ChargeDTO cdto) {
		paymentDao.chargeInsertMethod(cdto);
	}

}
