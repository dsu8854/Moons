package service;

import java.util.List;
import java.util.Map;

import dao.PointDAO;
import dto.PaymentDTO;
import dto.PointDTO;

public interface PointService{
	public List<PointDTO> pointListProcess(Map<String, Integer> map);
	public int selectPointProcess(int user_code);
	public void donateProcess(PointDTO pdto);
	public void chargeProcess(PaymentDTO pdto);
}