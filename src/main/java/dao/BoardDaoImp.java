package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.ReplyDTO;
import dto.ReportDTO;
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
	public void insertScrapMethod(BoardDTO bdto) {
		boardSqlSession.insert("board.insScrap",bdto);
	}

	@Override
	public void deleteScrapMethod(BoardDTO bdto) {
		boardSqlSession.delete("board.delScrap",bdto);
	}

	@Override
	public int selectWriterMethod(BoardDTO bdto) {
		return boardSqlSession.selectOne("board.selWriter",bdto);
	}
	
	@Override
	public int checkBoardStateMethod(int board_num) {
		try {
			return boardSqlSession.selectOne("board.chkBoardState",board_num);
		} catch(Exception e) {
			return 0;
		}
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
	public void deletePostMethod(int board_num) {
		boardSqlSession.update("board.delPost",board_num);
	}
	
	@Override
	public void updatePostMethod(BoardDTO bdto) {
		boardSqlSession.update("board.uptPost", bdto);
	}

	@Override
	public List<ReplyDTO> selectReplyListMethod(ReplyDTO rdto) {
		return boardSqlSession.selectList("board.selRepList", rdto);
	}

	@Override
	public void InsertReplyMethod(ReplyDTO rdto) {
		boardSqlSession.insert("board.insReply", rdto);
	}
	
	@Override
	public void deleteReplyMehtod(int reply_num) {
		boardSqlSession.delete("board.delReply", reply_num);
	}

	@Override
	public void updateReplyMehtod(ReplyDTO rdto) {
		boardSqlSession.update("board.uptReply", rdto);
	}

	@Override
	public List<BoardDTO> selectTimelineMovieMethod(HashMap<String, Object> map) {
		return boardSqlSession.selectList("board.selTimelineMovie", map);
	}

	@Override
	public List<BoardDTO> selectTimelineHashtagMethod(HashMap<String, Object> map) {
		return boardSqlSession.selectList("board.selTimelineHashtag", map);
	}

	@Override
	public void reportPostMethod(ReportDTO rdto) {
		boardSqlSession.insert("board.repPost",rdto);
	}

	@Override
	public List<BoardDTO> selectTimelineFollowMethod(HashMap<String, Object> map) {
		return boardSqlSession.selectList("board.selTimelineFollow", map);
	}
	
	@Override
	public List<BoardDTO> selectTimelineLikeMethod(HashMap<String, Object> map) {
		return boardSqlSession.selectList("board.selTimelineLike", map);
	}
}//end class
