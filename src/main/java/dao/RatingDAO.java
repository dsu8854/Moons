package dao;

import dto.RatingDTO;

public interface RatingDAO {
	public double allRateMethod(String movie);
	public boolean checkallRateMethod(String movie);
	public int myRateMethod(RatingDTO rdto);
	public int checkmyRateMethod(RatingDTO rdto); //별점있는지확인
	public void insertRateMethod(RatingDTO rdto);
	public void deleteRateMethod(RatingDTO rdto);
	public void UpdateRateMethod(RatingDTO rdto);
}