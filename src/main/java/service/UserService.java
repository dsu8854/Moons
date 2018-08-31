package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.FollowDTO;
import dto.UserDTO;

public interface UserService {
	public void insertProcess(UserDTO udto);
	public void deleteProcess(UserDTO udto);
	public boolean checkIdProcess(UserDTO udto);
	public boolean checkNickProcess(UserDTO udto);
	public int codeProcess(UserDTO udto);
	public boolean checkIdPassProcess(UserDTO udto);
	public boolean checkEmailProcess(UserDTO udto);
	public String passProcess(UserDTO udto);
	public UserDTO selectAllInfoProcess(int user_code);
	public UserDTO selectInfoProcess(int user_code);
	public UserDTO selectUpdateInfoProcess(int user_code);
	public String selectPhotoProcess(int user_code);
	public String selectNickProcess(int user_code);
	public void updateInfoProcess(UserDTO udto);

	public List<FollowDTO> selectFollowListProcess(UserDTO udto);
	public int followCountProcess(UserDTO udto);
	public List<FollowDTO> selectFollowerListProcess(UserDTO fdto);
	public int followerCountProcess(UserDTO udto);
	public void deleteFollowProcess(FollowDTO fdto);
	public void insertFollowProcess(FollowDTO fdto);
	
	public void updateProfilePhotoProcess(UserDTO udto);
	
}