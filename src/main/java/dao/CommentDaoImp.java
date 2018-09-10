package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CommentDTO;

public class CommentDaoImp implements CommnetDAO{
	private SqlSessionTemplate commentSqlSession;

	public CommentDaoImp() {

	}

	public void setCommentSqlSession(SqlSessionTemplate SqlSession) {
		this.commentSqlSession = SqlSession;
	}


	@Override
	public List<CommentDTO> listMethod(String movie) {
		return commentSqlSession.selectList("movie.commlist", movie);
	}

	@Override
	public void insertMethod(CommentDTO dto) {
		commentSqlSession.insert("movie.commins", dto);	
	}
}