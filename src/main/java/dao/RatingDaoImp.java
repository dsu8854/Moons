package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.RatingDTO;

public class RatingDaoImp implements RatingDAO{
	private SqlSessionTemplate ratingSqlSession;
	
	public RatingDaoImp() {

	}

	public void setRatingSqlSession(SqlSessionTemplate sqlSession) {
		this.ratingSqlSession = sqlSession;
	}

	@Override
	public double allRateMethod(String movie) {
		return ratingSqlSession.selectOne("movie.allrate", movie);
	}
	
	@Override
	public int myRateMethod(RatingDTO rdto) {
		return ratingSqlSession.selectOne("movie.myrate",rdto);
	}
	
	@Override
	public int checkmyRateMethod(RatingDTO rdto) {
		return ratingSqlSession.selectOne("movie.checkmyrate", rdto);
	}
	
	@Override
	public void insertRateMethod(RatingDTO rdto) {
		ratingSqlSession.insert("movie.rateins", rdto);
	}

	@Override
	public void deleteRateMethod(RatingDTO rdto) {
		ratingSqlSession.delete("movie.ratedel", rdto);
	}

	@Override
	public void UpdateRateMethod(RatingDTO rdto) {
		ratingSqlSession.update("movie.rateupt", rdto);
	}

	@Override
	public boolean checkallRateMethod(String movie) {
		return ratingSqlSession.selectOne("movie.checkallrate", movie);
	}
}
