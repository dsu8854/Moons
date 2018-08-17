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
		//테스트를 위한 리스트출력부분
		/*List<DmDTO> list=dao.dmViewMethod(user_code);
		for(DmDTO dto: list) {
			System.out.printf("%d / %d / %s / %s / %s / %s\n",
					dto.getUser_code(), dto.getDm_receiver(), dto.getDm_content(), dto.getDm_date(), dto.getUser_nickname(), dto.getUser_photo());
		}
		*/
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
}//end class