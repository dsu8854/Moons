package dao;

import dto.FollowDTO;
import dto.UserDTO;

public interface ProfileDAO {
	public void update(UserDTO dto); // 수정
	public String getFile(UserDTO dto); // 아이디를 통해 파일 가져오기
	public UserDTO content(UserDTO udto); // id에 해당하는 레코드값 가져오기(리스트가 아닌?)
	
	
}