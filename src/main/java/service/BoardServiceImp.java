package service;

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
	public List<BoardDTO> selectListProcess(UserDTO udto) {
		return boardDao.selectListMethod(udto);
	}

	@Override
	public int selectLikeProcess(BoardDTO bdto) {
		return boardDao.selectLikeMethod(bdto);
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
	public int selectShareProcess(BoardDTO bdto) {
		return boardDao.selectShareMethod(bdto);
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
}//end class
