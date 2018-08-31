package dao;

import java.util.List;
import java.util.Map;

import dto.PaymentDTO;
import dto.PointDTO;

public interface PointDAO {
	public List<PointDTO> pointListMethod(Map<String, Integer> map);
	public int selectPointMethod(int user_code);
	public void donateMethod(PointDTO pdto);
	public void chargeMehtod(PaymentDTO pdto);
}