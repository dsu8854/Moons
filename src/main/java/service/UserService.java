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
	public UserDTO selectInfoProcess(int user_code);
	public String selectPhotoProcess(int user_code);
	public String selectNickProcess(int user_code);
	public String updateInfoProcess(UserDTO dto, HttpServletRequest request);

	public List<FollowDTO> selectFollowListProcess(UserDTO udto);
	public int followCountProcess(UserDTO udto);
	public List<FollowDTO> selectFollowerListProcess(UserDTO fdto);
	public int followerCountProcess(UserDTO udto);
	public void deleteFollowProcess(FollowDTO fdto);
	public void insertFollowProcess(FollowDTO fdto);
}