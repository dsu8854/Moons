package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.PointDTO;

public class PointDaoImp implements PointDAO{
	private SqlSessionTemplate pointSqlSession;
	
	public void setPointSqlSession(SqlSessionTemplate pointSqlSession) {
		this.pointSqlSession = pointSqlSession;
	}

	public PointDaoImp() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<PointDTO> pointListMethod(Map<String, Integer> map) {
		return pointSqlSession.selectList("payment.pointlist",map);
	}
	
}
