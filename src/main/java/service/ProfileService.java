package service;

import javax.servlet.http.HttpServletRequest;

import dto.FollowDTO;
import dto.UserDTO;

public interface ProfileService {
	public String getFileProcess(UserDTO udto);
	public UserDTO contentProcess(UserDTO udto);
	public String updateProcess(UserDTO dto, HttpServletRequest request);
	
	
}
