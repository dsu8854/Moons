package service;

import java.util.HashMap;
import java.util.List;

import dao.BoardDAO;
import dto.BoardDTO;
import dto.UserDTO;


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
	public int selectWriterProcess(BoardDTO bdto) {
		return boardDao.selectWriterMethod(bdto);
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
}//end class
