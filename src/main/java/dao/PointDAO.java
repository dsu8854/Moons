package dao;

import java.util.List;
import java.util.Map;

import dto.PointDTO;

public interface PointDAO {
	public List<PointDTO> pointListMethod(Map<String, Integer> map);
}
