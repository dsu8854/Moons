package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.ReplyDTO;
import dto.UserDTO;


public class BoardDaoImp implements BoardDAO{
	private SqlSessionTemplate boardSqlSession;

	public BoardDaoImp() {

	}

	public void setBoardSqlSession(SqlSessionTemplate boardSqlSession) {
		this.boardSqlSession = boardSqlSession;
	}

	@Override
	public List<BoardDTO> selectListMethod(HashMap<String, Integer> map) {
		return boardSqlSession.selectList("board.selList", map);
	}
	
	@Override
	public List<BoardDTO> selectGridMethod(HashMap<String, Integer> map) {
		return boardSqlSession.selectList("board.selGrid", map);
	}
	
	@Override
	public int likeCountMethod(BoardDTO bdto) {
		return boardSqlSession.selectOne("board.likeCount",bdto);
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
	public int shareCountMethod(BoardDTO bdto) {
		return boardSqlSession.selectOne("board.shareCount",bdto);
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

	@Override
	public int postCountMethod(int user_code) {
		return boardSqlSession.selectOne("board.postCount",user_code);
	}

	@Override
	public BoardDTO selectDetailMethod(HashMap<String, Integer> map) {
		return boardSqlSession.selectOne("board.selDetail",map);
	}

	@Override
	public int postMethod(BoardDTO bdto) {
		return boardSqlSession.insert("board.post",bdto);
	}

	@Override
	public void tempFileMethod(String file_name) {
		boardSqlSession.insert("board.tempFile",file_name);
	}
	
	@Override
	public void postFileMethod(HashMap<String, Object> map) {
		boardSqlSession.insert("board.postFile",map);
	}

	@Override
	public List<String> selectFileMethod(int board_num) {
		return boardSqlSession.selectList("board.selFile",board_num);
	}
	
	@Override
	public void deletePostMethod(int board_num) {
		boardSqlSession.delete("board.delPost",board_num);
	}

	@Override
	public List<ReplyDTO> selectReplyListMethod(ReplyDTO rdto) {
		return boardSqlSession.selectList("board.selRepList", rdto);
	}

	@Override
	public void InsertReplyMethod(ReplyDTO rdto) {
		boardSqlSession.insert("board.insReply", rdto);
	}
}//end class
