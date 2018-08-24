package service;

import java.util.List;
import java.util.Map;

import dao.PaymentDAO;
import dto.PointDTO;
import dto.WithdrawDTO;

public interface PaymentService{
	public List<PointDTO> pointListProcess(Map<String, String> map);
	
	public void withdrawinsertProcess(WithdrawDTO wdto);
}
