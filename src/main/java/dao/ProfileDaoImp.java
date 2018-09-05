package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.FollowDTO;
import dto.UserDTO;

public class ProfileDaoImp implements ProfileDAO {
	private SqlSessionTemplate profileSqlSession;
	// 생성자 또는 프로퍼티값을 통해 받아올 수 있다.
	// 프로퍼티면 set메서드를 통해 받아온다.

	public ProfileDaoImp() {
	}

	public void setProfileSqlSession(SqlSessionTemplate profileSqlSession) {
		this.profileSqlSession = profileSqlSession;
	}

	@Override
	public void update(UserDTO udto) {
		profileSqlSession.update("profile.update", udto);
	}

	/*@Override
	public void delete(UserDTO udto) {
		profileSqlSession.delete("profile.delete", udto);
	}*/

	@Override
	public String getFile(UserDTO udto) { // mapper.xml에서 사용했던값을 호출한다.
		return profileSqlSession.selectOne("profile.uploadFile", udto);
	}

	@Override
	public UserDTO content(UserDTO udto) { // 유저코드에 해당하는 레코드 값 출력
		return profileSqlSession.selectOne("profile.content", udto);
	}

	
}
