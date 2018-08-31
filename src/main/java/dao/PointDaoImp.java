package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.PaymentDTO;
import dto.PointDTO;

public class PointDaoImp implements PointDAO{
	private SqlSessionTemplate pointSqlSession;
	
	public void setPointSqlSession(SqlSessionTemplate pointSqlSession) {
		this.pointSqlSession = pointSqlSession;
	}

	public PointDaoImp() {
	}

	@Override
	public List<PointDTO> pointListMethod(Map<String, Integer> map) {
		return pointSqlSession.selectList("payment.pointlist",map);
	}

	@Override
	public int selectPointMethod(int user_code) {
		return pointSqlSession.selectOne("payment.selPoint",user_code);
	}

	@Override
	public void donateMethod(PointDTO pdto) {
		pointSqlSession.insert("payment.donate",pdto);
	}

	@Override
	public void chargeMehtod(PaymentDTO pdto) {
		pointSqlSession.insert("payment.charge", pdto);
	}
}
