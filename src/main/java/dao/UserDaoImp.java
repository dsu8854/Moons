package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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
	public boolean checkNickMethod(UserDTO udto) {
		return userSqlSession.selectOne("user.chkNick",udto);
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
	public boolean checkEmailMethod(UserDTO udto) {
		return userSqlSession.selectOne("user.chkEmail",udto);
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
	public String selectNickMethod(int user_code) {
		return userSqlSession.selectOne("user.selNick", user_code);
	}

	@Override
	public UserDTO selectInfoMethod(int user_code) {
		return userSqlSession.selectOne("user.selInfo", user_code);
	}
	
	@Override
	public void updateInfoMethod(UserDTO udto) {
		userSqlSession.update("user.uptInfo", udto);
	}

	@Override
	public List<FollowDTO> selectFollowListMethod(UserDTO udto) {
		return userSqlSession.selectList("user.selFollow",udto);
	}

	@Override		
	public int followCountMethod(UserDTO udto) {
		return userSqlSession.selectOne("user.followCount",udto);
	}
	
	@Override
	public List<FollowDTO> selectFollowerListMethod(UserDTO udto) {
		return userSqlSession.selectList("user.selFollower",udto);
	}

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
}