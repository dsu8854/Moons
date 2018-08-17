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
	
	
}//end class
