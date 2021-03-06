package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import dto.BoardDTO;
import dto.FollowDTO;
import dto.UserDTO;

public interface UserService {
	public void insertProcess(UserDTO udto);
	public void deleteProcess(UserDTO udto);
	public boolean checkIdProcess(UserDTO udto);
	public int codeProcess(UserDTO udto);
	public boolean checkIdPassProcess(UserDTO udto);
	public boolean checkCodePassProcess(UserDTO udto);
	public boolean checkEmailProcess(UserDTO udto);
	public boolean checkEmailDupProcess(String user_email);
	public int checkStateProcess(UserDTO udto);
	public String passProcess(UserDTO udto);
	public UserDTO selectAllInfoProcess(int user_code);
	public UserDTO selectInfoProcess(int user_code);
	public UserDTO selectUpdateInfoProcess(int user_code);
	public String selectPhotoProcess(int user_code);
	public int selectPointProcess(int user_code);
	public String selectNickProcess(int user_code);
	public void updateInfoProcess(UserDTO udto);
	public void updatePassProcess(UserDTO udto);
	public List<FollowDTO> selectFollowListProcess(HashMap<String,Integer> map);
	public int followCountProcess(UserDTO udto);
	public List<FollowDTO> selectFollowerListProcess(HashMap<String,Integer> map);
	public int followerCountProcess(UserDTO udto);
	public void deleteFollowProcess(FollowDTO fdto);
	public void insertFollowProcess(FollowDTO fdto);
	
	public void updateProfilePhotoProcess(UserDTO udto);
	public List<BoardDTO> selectMainTopProcess();
	public List<BoardDTO> selectMainBottomProcess();
	public List<UserDTO> searchUserProcess(Map<String, String> map);
	public boolean followCheckProcess(Map<String, Integer> map); // 추가
}