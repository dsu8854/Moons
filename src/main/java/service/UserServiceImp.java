package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import dao.UserDAO;
import dto.BoardDTO;
import dto.FollowDTO;
import dto.UserDTO;

public class UserServiceImp implements UserService {
	private UserDAO userDao;
	
	public UserServiceImp() {
		
	}
	
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	@Override
	public void insertProcess(UserDTO udto) {
		userDao.insertMethod(udto);
	}

	@Override
	public void deleteProcess(UserDTO udto) {
		userDao.deleteMethod(udto);
	}

	@Override
	public boolean checkIdProcess(UserDTO udto) {
		return userDao.checkIdMethod(udto);
	}

	@Override
	public int codeProcess(UserDTO udto) {
		return userDao.codeMethod(udto);
	}

	@Override
	public boolean checkIdPassProcess(UserDTO udto) {
		return userDao.checkIdPassMethod(udto);
	}
	
	@Override
	public boolean checkCodePassProcess(UserDTO udto) {
		return userDao.checkCodePassMethod(udto);
	}

	@Override
	public boolean checkEmailProcess(UserDTO udto) {
		return userDao.checkEmailMethod(udto);
	}
	
	@Override
	public boolean checkEmailDupProcess(String user_email) {
		return userDao.checkEmailDupMethod(user_email);
	}
	
	@Override
	public int checkStateProcess(UserDTO udto) {
		return userDao.checkStateMethod(udto);
	}

	@Override
	public String passProcess(UserDTO udto) {
		return userDao.passMethod(udto);
	}
	
	public void setProfileDao(UserDAO userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public String selectPhotoProcess(int user_code) {
		return userDao.selectPhotoMethod(user_code);
	}
	
	@Override
	public int selectPointProcess(int user_code) {
		return userDao.selectPointMethod(user_code);
	}
	
	@Override
	public String selectNickProcess(int user_code) {
		return userDao.selectNickMethod(user_code);
	}
	
	@Override
	public UserDTO selectAllInfoProcess(int user_code) {
		return userDao.selectAllInfoMethod(user_code);
	}
	
	@Override
	public UserDTO selectInfoProcess(int user_code) {
		return userDao.selectInfoMethod(user_code);
	}
	
	@Override
	public UserDTO selectUpdateInfoProcess(int user_code) {
		return userDao.selectUpdateInfoMethod(user_code);
	}
	
	@Override
	public void updateProfilePhotoProcess(UserDTO udto) {
		 userDao.updateProfilePhotoMethod(udto);
	}
	
	@Override
	public void updateInfoProcess(UserDTO udto) {
		userDao.updateInfoMethod(udto);		// 업데이트 실행 
	}
	
	@Override
	public void updatePassProcess(UserDTO udto) {
		userDao.updatePassMethod(udto);
	}

	@Override
	public List<FollowDTO> selectFollowListProcess(HashMap<String,Integer> map) {
		return userDao.selectFollowListMethod(map);
	}

	@Override
	public int followCountProcess(UserDTO udto) {
		return userDao.followCountMethod(udto);
	}

	@Override
	public List<FollowDTO> selectFollowerListProcess(HashMap<String,Integer> map) {
		return userDao.selectFollowerListMethod(map);
	}
	
	/*@Override
	public List<FollowDTO> selectFollowerListProcess(UserDTO udto) {
		return userDao.selectFollowerListMethod(udto);
	}*/

	@Override
	public int followerCountProcess(UserDTO udto) {
		return userDao.followerCountMethod(udto);
	}

	@Override
	public void deleteFollowProcess(FollowDTO fdto) {
		userDao.deleteFollowMethod(fdto);
	}

	@Override
	public void insertFollowProcess(FollowDTO fdto) {
		userDao.insertFollowMethod(fdto);
	}

	@Override
	public List<BoardDTO> selectMainTopProcess() {
		return userDao.selectMainTopMethod();
	}

	@Override
	public List<BoardDTO> selectMainBottomProcess() {
		return userDao.selectMainBottomMethod();
	}
	
	@Override
	public List<UserDTO> searchUserProcess(Map<String, String> map) {
		return userDao.searchUserMethod(map);
	}
	
	@Override
	public boolean followCheckProcess(Map<String, Integer> map) {
		return userDao.followCheckMethod(map);
	}
}