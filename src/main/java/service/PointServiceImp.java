package service;

import java.util.List;
import java.util.Map;

import dao.PointDAO;
import dto.PaymentDTO;
import dto.PointDTO;

public class PointServiceImp implements PointService{
	private PointDAO pointDao;

	public PointServiceImp() {
	}
	
	public void setPointDao(PointDAO pointDao) {
		this.pointDao = pointDao;
	}
	
	@Override
	public List<PointDTO> pointListProcess(Map<String, Integer> map) {
		return pointDao.pointListMethod(map);
	}

	@Override
	public int selectPointProcess(int user_code) {
		return pointDao.selectPointMethod(user_code);
	}

	@Override
	public void donateProcess(PointDTO pdto) {
		pointDao.donateMethod(pdto);
	}

	@Override
	public void chargeProcess(PaymentDTO pdto) {
		pointDao.chargeMehtod(pdto);
	}
}
