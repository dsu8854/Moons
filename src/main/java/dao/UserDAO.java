package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.BoardDTO;
import dto.FollowDTO;
import dto.UserDTO;

public interface UserDAO {
	public void insertMethod(UserDTO udto);
	public void deleteMethod(UserDTO udto);
	public boolean checkIdMethod(UserDTO udto);
	public int codeMethod(UserDTO udto);
	public boolean checkIdPassMethod(UserDTO udto);
	public boolean checkCodePassMethod(UserDTO udto);
	public boolean checkEmailMethod(UserDTO udto);
	public boolean checkEmailDupMethod(String user_email);
	public int checkStateMethod(UserDTO udto);
	public String passMethod(UserDTO udto);
	public String selectPhotoMethod(int user_code); // 아이디를 통해 파일 가져오기
	public int selectPointMethod(int user_code);
	public String selectNickMethod(int user_code);
	public UserDTO selectAllInfoMethod(int user_code);
	public UserDTO selectInfoMethod(int user_code);
	public UserDTO selectUpdateInfoMethod(int user_code);
	public void updateInfoMethod(UserDTO dto); // 수정
	public void updatePassMethod(UserDTO udto); // 수정
	
	public List<FollowDTO> selectFollowListMethod(HashMap<String,Integer> map);	// 팔로잉 리스트
	public int followCountMethod(UserDTO udto);			// 팔로우 수
	public List<FollowDTO> selectFollowerListMethod(HashMap<String,Integer> map);
	public int followerCountMethod(UserDTO udto);		// 팔로워 수		
	public void deleteFollowMethod(FollowDTO fdto);		// 팔로잉 취소
	public void insertFollowMethod(FollowDTO fdto);		// 팔로우 신청
	
	public void updateProfilePhotoMethod(UserDTO udto);
	public List<BoardDTO> selectMainTopMethod();
	public List<BoardDTO> selectMainBottomMethod();
	public List<UserDTO> searchUserMethod(Map<String, String> map);
	public boolean followCheckMethod(Map<String, Integer> map); 	// 추가
}