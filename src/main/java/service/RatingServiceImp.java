package service;

import dao.RatingDAO;
import dto.RatingDTO;

public class RatingServiceImp implements RatingService{
	private RatingDAO ratingDao;
	
	public RatingServiceImp() {
		
	}
	
	public void setRatingDao(RatingDAO ratingDao) {
		this.ratingDao = ratingDao;
	}

	@Override
	public double allRatingProcess(String movie) {
		return ratingDao.allRateMethod(movie);
	}

	@Override
	public int myRateProcess(RatingDTO rdto) {
		return ratingDao.myRateMethod(rdto);
	}
	
	@Override
	public boolean checkmyRateProcess(RatingDTO rdto) {
		return ratingDao.checkmyRateMethod(rdto)>0 ? true : false ;
	}
	
	@Override
	public void insertRateProcess(RatingDTO rdto) {
		ratingDao.insertRateMethod(rdto);
	}

	@Override
	public void deleteRateProcess(RatingDTO rdto) {
		ratingDao.deleteRateMethod(rdto);
	}

	@Override
	public void UpdateRateProcess(RatingDTO rdto) {
		ratingDao.UpdateRateMethod(rdto);
	}

	@Override
	public boolean checkAllRateProcess(String movie) {
		return ratingDao.checkallRateMethod(movie);
	}

}
