package service;

import dto.RatingDTO;

public interface RatingService {
	public double allRatingProcess(String movie);
	public boolean checkAllRateProcess(String movie); 
	public int myRateProcess(RatingDTO rdto);
	public boolean checkmyRateProcess(RatingDTO rdto);
	public void insertRateProcess(RatingDTO rdto);
	public void deleteRateProcess(RatingDTO rdto);
	public void UpdateRateProcess(RatingDTO rdto);
}
