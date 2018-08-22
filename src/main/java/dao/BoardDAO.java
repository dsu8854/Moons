package dao;

import java.util.List;

import dto.BoardDTO;
import dto.UserDTO;

public interface BoardDAO {
	public List<BoardDTO> selectListMethod(UserDTO udto);
	public int selectLikeMethod(BoardDTO bdto);
	public void insertLikeMethod(BoardDTO bdto);
	public void deleteLikeMethod(BoardDTO bdto);
	public int selectShareMethod(BoardDTO bdto);
	public void insertShareMethod(BoardDTO bdto);
	public void deleteShareMethod(BoardDTO bdto);
	public int selectWriterMethod(BoardDTO bdto);
}//end interface
