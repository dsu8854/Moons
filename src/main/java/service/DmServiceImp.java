package service;

import java.util.List;

import dao.DmDAO;
import dto.DmDTO;
import dto.UserDTO;

public class DmServiceImp implements DmService{
	private DmDAO dmDao;

	public DmServiceImp() {

	}

	public void setDmDao(DmDAO dmDao) {
		this.dmDao = dmDao;
	}

	@Override
	public List<DmDTO> selectDmProcess(DmDTO ddto) {
		return dmDao.selectDmMethod(ddto);
	}
	
	@Override
	public int insertDmProcess(DmDTO ddto) {
		return dmDao.insertDmMethod(ddto);
	}

	@Override
	public DmDTO selectYourInfoProcess(DmDTO ddto) {
		return dmDao.selectYourInfoMethod(ddto);
	}

	@Override
	public List<DmDTO> selectListProcess(DmDTO ddto) {
		return dmDao.selectListMethod(ddto);
	}

	@Override
	public int selectDmCountProcess(int user_code) {
		return dmDao.selectDmCountMethod(user_code);
	}
	
	@Override
	public int selectDmRoomCountProcess(DmDTO ddto) {
		return dmDao.selectDmRoomCountMethod(ddto);
	}

	@Override
	public void readDmProcess(DmDTO ddto) {
		dmDao.readDmMethod(ddto);
	}
}//end class