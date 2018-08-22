package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.UserDTO;


public class BoardDaoImp implements BoardDAO{
	private SqlSessionTemplate boardSqlSession;

	public BoardDaoImp() {

	}

	public void setBoardSqlSession(SqlSessionTemplate boardSqlSession) {
		this.boardSqlSession = boardSqlSession;
	}

	@Override
	public List<BoardDTO> selectListMethod(UserDTO udto) {
		return boardSqlSession.selectList("board.sel", udto);
	}
	
	@Override
	public int selectLikeMethod(BoardDTO bdto) {
		return boardSqlSession.selectOne("board.selLike",bdto);
	}

	@Override
	public void insertLikeMethod(BoardDTO bdto) {
		boardSqlSession.insert("board.insLike",bdto);
	}

	@Override
	public void deleteLikeMethod(BoardDTO bdto) {
		boardSqlSession.delete("board.delLike",bdto);
	}

	@Override
	public int selectShareMethod(BoardDTO bdto) {
		return boardSqlSession.selectOne("board.selShare",bdto);
	}

	@Override
	public void insertShareMethod(BoardDTO bdto) {
		boardSqlSession.insert("board.insShare",bdto);
	}

	@Override
	public void deleteShareMethod(BoardDTO bdto) {
		boardSqlSession.delete("board.delShare",bdto);
	}

	@Override
	public int selectWriterMethod(BoardDTO bdto) {
		return boardSqlSession.selectOne("board.selWriter",bdto);
	}
}//end class
