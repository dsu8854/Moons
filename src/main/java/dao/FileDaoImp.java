package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.EditorImageDTO;

public class FileDaoImp implements FileDAO{
	private SqlSessionTemplate fileSqlSession;
	
	public FileDaoImp() {
		
	}
	
	public void setFileSqlSession(SqlSessionTemplate fileSqlSession) {
		this.fileSqlSession = fileSqlSession;
	}
	
	@Override
	public void insertImageMethod(EditorImageDTO edto) {
		fileSqlSession.insert("post.insImg", edto);
	}
}
