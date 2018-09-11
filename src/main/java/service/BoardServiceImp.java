package service;

import java.util.HashMap;
import java.util.List;

import dao.BoardDAO;
import dto.BoardDTO;
import dto.ReplyDTO;
import dto.ReportDTO;

public class BoardServiceImp implements BoardService{
	private BoardDAO boardDao;

	public BoardServiceImp() {

	}

	public void setBoardDao(BoardDAO boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public List<BoardDTO> selectListProcess(HashMap<String, Integer> map) {
		return boardDao.selectListMethod(map);
	}
	
	@Override
	public List<BoardDTO> selectGridProcess(HashMap<String, Integer> map) {
		return boardDao.selectGridMethod(map);
	}

	@Override
	public int likeCountProcess(BoardDTO bdto) {
		return boardDao.likeCountMethod(bdto);
	}
	
	@Override
	public void insertLikeProcess(BoardDTO bdto) {
		boardDao.insertLikeMethod(bdto);
	}

	@Override
	public void deleteLikeProcess(BoardDTO bdto) {
		boardDao.deleteLikeMethod(bdto);
	}

	@Override
	public int shareCountProcess(BoardDTO bdto) {
		return boardDao.shareCountMethod(bdto);
	}

	@Override
	public void insertShareProcess(BoardDTO bdto) {
		boardDao.insertShareMethod(bdto);
	}

	@Override
	public void deleteShareProcess(BoardDTO bdto) {
		boardDao.deleteShareMethod(bdto);
	}
	
	@Override
	public void insertScrapProcess(BoardDTO bdto) {
		boardDao.insertScrapMethod(bdto);
	}

	@Override
	public void deleteScrapProcess(BoardDTO bdto) {
		boardDao.deleteScrapMethod(bdto);
	}

	@Override
	public int selectWriterProcess(BoardDTO bdto) {
		return boardDao.selectWriterMethod(bdto);
	}
	
	@Override
	public int checkBoardStateProcess(int board_num) {
		return boardDao.checkBoardStateMethod(board_num);
	}

	@Override
	public int postCountProcess(int user_code) {
		return boardDao.postCountMethod(user_code);
	}

	@Override
	public BoardDTO selectDetailProcess(HashMap<String, Integer> map) {
		return boardDao.selectDetailMethod(map);
	}

	@Override
	public int postProcess(BoardDTO bdto) {
		return boardDao.postMethod(bdto);
	}

	@Override
	public void deletePostProcess(int board_num) {
		boardDao.deletePostMethod(board_num);
	}
	
	@Override
	public void updatePostProcess(BoardDTO bdto) {
		boardDao.updatePostMethod(bdto);
	}
	
	@Override
	public void reportPostProcess(ReportDTO rdto) {
		boardDao.reportPostMethod(rdto);
	}
	
	@Override
	public List<ReplyDTO> insertReplyProcess(ReplyDTO rdto) {
		boardDao.InsertReplyMethod(rdto);
		return boardDao.selectReplyListMethod(rdto);
	}
	
	@Override
	public List<ReplyDTO> deleteReplyProcess(ReplyDTO rdto) {
		boardDao.deleteReplyMehtod(rdto.getReply_num());
		return boardDao.selectReplyListMethod(rdto);
	}

	@Override
	public List<ReplyDTO> updateReplyProcess(ReplyDTO rdto) {
		boardDao.updateReplyMehtod(rdto);
		return boardDao.selectReplyListMethod(rdto);
	}

	@Override
	public List<BoardDTO> selectTimelineMovieProcess(HashMap<String, Object> map) {
		return boardDao.selectTimelineMovieMethod(map);
	}

	@Override
	public List<BoardDTO> selectTimelineHashtagProcess(HashMap<String, Object> map) {
		return boardDao.selectTimelineHashtagMethod(map);
	}

	@Override
	public List<BoardDTO> selectTimelineFollowProcess(HashMap<String, Object> map) {
		return boardDao.selectTimelineFollowMethod(map);
	}
	
	@Override
	public List<BoardDTO> selectTimelineLikeProcess(HashMap<String, Object> map) {
		return boardDao.selectTimelineLikeMethod(map);
	}
}//end class
