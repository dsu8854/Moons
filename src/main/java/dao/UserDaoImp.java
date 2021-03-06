package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.FollowDTO;
import dto.UserDTO;

public class UserDaoImp implements UserDAO {
	private SqlSessionTemplate userSqlSession;
	
	public UserDaoImp() {
		
	}
	
	public void setUserSqlSession(SqlSessionTemplate sqlSession) {
		this.userSqlSession = sqlSession;
	}

	@Override
	public void insertMethod(UserDTO udto) {
		userSqlSession.insert("user.ins",udto);
	}

	@Override
	public void deleteMethod(UserDTO udto) {
		userSqlSession.delete("user.del",udto);
	}

	@Override
	public boolean checkIdMethod(UserDTO udto) {
		return userSqlSession.selectOne("user.chkId",udto);
	}

	@Override
	public int codeMethod(UserDTO udto) {
		return userSqlSession.selectOne("user.code",udto);
	}

	@Override
	public boolean checkIdPassMethod(UserDTO udto) {
		return userSqlSession.selectOne("user.chkIdPass",udto);
	}
	
	@Override
	public boolean checkCodePassMethod(UserDTO udto) {
		return userSqlSession.selectOne("user.chkCodePass",udto);
	}

	@Override
	public boolean checkEmailMethod(UserDTO udto) {
		return userSqlSession.selectOne("user.chkEmail",udto);
	}
	
	@Override
	public boolean checkEmailDupMethod(String user_email) {
		return userSqlSession.selectOne("user.chkEmailDup",user_email);
	}
	
	@Override
	public int checkStateMethod(UserDTO udto) {
		return userSqlSession.selectOne("user.chkState",udto);
	}

	@Override
	public String passMethod(UserDTO udto) {
		return userSqlSession.selectOne("user.pass",udto);
	}
	
	public void setProfileSqlSession(SqlSessionTemplate userSqlSession) {
		this.userSqlSession = userSqlSession;
	}

	@Override
	public String selectPhotoMethod(int user_code) {
		return userSqlSession.selectOne("user.selPhoto", user_code);
	}
	
	@Override
	public int selectPointMethod(int user_code) {
		return userSqlSession.selectOne("user.selPoint", user_code);
	}
	
	@Override
	public String selectNickMethod(int user_code) {
		return userSqlSession.selectOne("user.selNick", user_code);
	}

	@Override
	public UserDTO selectAllInfoMethod(int user_code) {
		return userSqlSession.selectOne("user.selAllInfo", user_code);
	}
	
	@Override
	public UserDTO selectInfoMethod(int user_code) {
		return userSqlSession.selectOne("user.selInfo", user_code);
	}
	
	@Override
	public UserDTO selectUpdateInfoMethod(int user_code) {
		return userSqlSession.selectOne("user.selUptInfo", user_code);
	}
	
	@Override
	public void updateInfoMethod(UserDTO udto) {
		userSqlSession.update("user.uptInfo", udto);
	}
	
	@Override
	public void updatePassMethod(UserDTO udto) {
		userSqlSession.update("user.uptPass",udto);
		
	}

	@Override
	public List<FollowDTO> selectFollowListMethod(HashMap<String,Integer> map) {
		return userSqlSession.selectList("user.selFollow",map);
	}

	@Override		
	public int followCountMethod(UserDTO udto) {
		return userSqlSession.selectOne("user.followCount",udto);
	}
	
	@Override
	public List<FollowDTO> selectFollowerListMethod(HashMap<String,Integer> map) {
		return userSqlSession.selectList("user.selFollower",map);
	}
	
	/*@Override
	public List<FollowDTO> selectFollowerListMethod(UserDTO udto) {
		return userSqlSession.selectList("user.selFollower",udto);
	}*/

	@Override
	public int followerCountMethod(UserDTO udto) {
		return userSqlSession.selectOne("user.followerCount",udto);
	}

	@Override
	public void deleteFollowMethod(FollowDTO fdto) {
		userSqlSession.delete("user.delFollow",fdto);	
	}

	@Override
	public void insertFollowMethod(FollowDTO fdto) {
		userSqlSession.insert("user.insFollow",fdto);
	}
	
	@Override
	public void updateProfilePhotoMethod(UserDTO udto) {
		userSqlSession.update("user.profile_photo",udto);
	}

	@Override
	public List<BoardDTO> selectMainTopMethod() {
		return userSqlSession.selectList("user.selMainTop");
	}

	@Override
	public List<BoardDTO> selectMainBottomMethod() {
		return userSqlSession.selectList("user.selMainBottom");
	}
	
	@Override
	public List<UserDTO> searchUserMethod(Map<String, String> map) {
		return userSqlSession.selectList("user.searchUser", map);
	}
		
	// 추가
	@Override
	public boolean followCheckMethod(Map<String, Integer> map) {
		return userSqlSession.selectOne("user.followCheck", map);
	}
}