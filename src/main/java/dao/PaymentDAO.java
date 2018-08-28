package dao;

import java.util.List;
import java.util.Map;

import dto.ChargeDTO;
import dto.PointDTO;
import dto.WithdrawDTO;

public interface PaymentDAO {
	public List<PointDTO> pointListMethod(Map<String, String> map);
	
	public List<WithdrawDTO> withdrawListMethod(Map<String, String> map);
	public void withdrawinsertMethod(WithdrawDTO wdto);
	
	public List<ChargeDTO> chargeListMethod(Map<String,String> map);
	public void chargeInsertMethod(ChargeDTO cdto);
}
