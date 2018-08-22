package service;

import java.util.List;
import java.util.Map;

import dao.PointDAO;
import dto.PointDTO;

public interface PointService{
	public List<PointDTO> pointListProcess(Map<String, Integer> map);
}
