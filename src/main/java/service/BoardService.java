package service;

import java.util.List;

import dto.BoardDTO;
import dto.UserDTO;


public interface BoardService {
	public List<BoardDTO> selectListProcess(UserDTO udto);	
	public int selectLikeProcess(BoardDTO bdto);
	public void insertLikeProcess(BoardDTO bdto);
	public void deleteLikeProcess(BoardDTO bdto);
	public int selectShareProcess(BoardDTO bdto);
	public void insertShareProcess(BoardDTO bdto);
	public void deleteShareProcess(BoardDTO bdto);
	public int selectWriterProcess(BoardDTO bdto);
}//end interface









