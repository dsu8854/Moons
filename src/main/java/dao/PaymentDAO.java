package dao;

import java.util.List;
import java.util.Map;

import dto.PointDTO;
import dto.WithdrawDTO;

public interface PaymentDAO {
	public List<PointDTO> pointListMethod(Map<String, String> map);
	
	public void withdrawinsertMethod(WithdrawDTO wdto);
}
