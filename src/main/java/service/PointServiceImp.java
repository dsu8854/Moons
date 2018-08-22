package service;

import java.util.List;
import java.util.Map;

import dao.PointDAO;
import dto.PointDTO;

public class PointServiceImp implements PointService{
	private PointDAO pointDao;

	public PointServiceImp() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void setPointDao(PointDAO pointDao) {
		this.pointDao = pointDao;
	}
	
	@Override
	public List<PointDTO> pointListProcess(Map<String, Integer> map) {
		return pointDao.pointListMethod(map);
	}
}
