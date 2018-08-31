package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.DmDTO;

public class DmDaoImp implements DmDAO{
	private SqlSessionTemplate dmSqlSession;

	public DmDaoImp() {

	}

	public void setDmSqlSession(SqlSessionTemplate dmSqlSession) {
		this.dmSqlSession = dmSqlSession;
	}

	@Override
	public List<DmDTO> selectDmMethod(DmDTO ddto) {
		return dmSqlSession.selectList("dm.sel", ddto);
	}

	@Override
	public int insertDmMethod(DmDTO ddto) {
		return dmSqlSession.insert("dm.ins", ddto);
	}

	@Override
	public DmDTO selectYourInfoMethod(DmDTO ddto) {
		return dmSqlSession.selectOne("dm.selYourInfo", ddto);
	}

	@Override
	public List<DmDTO> selectListMethod(DmDTO ddto) {
		return dmSqlSession.selectList("dm.selList", ddto);
	}

	@Override
	public int selectDmCountMethod(int user_code) {
		return dmSqlSession.selectOne("dm.cntAll", user_code);
	}
	
	@Override
	public int selectDmRoomCountMethod(DmDTO ddto) {
		return dmSqlSession.selectOne("dm.cntRoom", ddto);
	}

	@Override
	public void readDmMethod(DmDTO ddto) {
		dmSqlSession.update("dm.readDm", ddto);
	}
}//end class
