package service;

import java.util.List;

import dto.DmDTO;

public interface DmService {
	public List<DmDTO> selectDmProcess(DmDTO ddto);
	public int insertDmProcess(DmDTO ddto);
	public DmDTO selectYourInfoProcess(DmDTO ddto);
	public List<DmDTO> selectListProcess(DmDTO ddto);
}//end interface









