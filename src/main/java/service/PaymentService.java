package service;

import java.util.List;
import java.util.Map;

import dao.PaymentDAO;
import dto.ChargeDTO;
import dto.PointDTO;
import dto.WithdrawDTO;

public interface PaymentService{
	public List<PointDTO> pointListProcess(Map<String, String> map);
	
	public List<WithdrawDTO> withdrawListProcess(Map<String, String> map);
	public void withdrawinsertProcess(WithdrawDTO wdto);
	
	public List<ChargeDTO> chargeListProcess(Map<String,String> map);
	public void chargeInsertProcess(ChargeDTO cdto);
	
	public void donateProcess(PointDTO pdto);
}
