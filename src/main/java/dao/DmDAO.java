package dao;

import java.util.List;

import dto.DmDTO;
import dto.UserDTO;


public interface DmDAO {
	public List<DmDTO> selectDmMethod(DmDTO ddto);
	public int insertDmMethod(DmDTO ddto);
	public DmDTO selectYourInfoMethod(DmDTO ddto);
	public List<DmDTO> selectListMethod(DmDTO ddto);
	public int selectDmCountMethod(int user_code);
	public int selectDmRoomCountMethod(DmDTO ddto);
	public void readDmMethod(DmDTO ddto);
}//end interface