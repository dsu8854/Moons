package dao;

import java.util.List;

import dto.FollowDTO;
import dto.UserDTO;

public interface UserDAO {
	public void insertMethod(UserDTO udto);
	public void deleteMethod(UserDTO udto);
	public boolean checkIdMethod(UserDTO udto);
	public boolean checkNickMethod(UserDTO udto);
	public int codeMethod(UserDTO udto);
	public boolean checkIdPassMethod(UserDTO udto);
	public boolean checkEmailMethod(UserDTO udto);
	public String passMethod(UserDTO udto);
	public String selectPhotoMethod(int user_code); // 아이디를 통해 파일 가져오기
	public String selectNickMethod(int user_code);
	public UserDTO selectInfoMethod(int user_code); // id에 해당하는 레코드값 가져오기(리스트가 아닌?)
	public void updateInfoMethod(UserDTO dto); // 수정
	
	public List<FollowDTO> selectFollowListMethod(UserDTO udto);	// 팔로잉 리스트
	public int followCountMethod(UserDTO udto);			// 팔로우 수
	public List<FollowDTO> selectFollowerListMethod(UserDTO udto);	// 팔로워 리스트
	public int followerCountMethod(UserDTO udto);		// 팔로워 수		
	public void deleteFollowMethod(FollowDTO fdto);		// 팔로잉 취소
	public void insertFollowMethod(FollowDTO fdto);		// 팔로우 신청
}