package dao;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.UserDTO;

public interface BoardDAO {
	public List<BoardDTO> selectListMethod(HashMap<String, Integer> map);
	public List<BoardDTO> selectGridMethod(HashMap<String, Integer> map);
	public int likeCountMethod(BoardDTO bdto);
	public void insertLikeMethod(BoardDTO bdto);
	public void deleteLikeMethod(BoardDTO bdto);
	public int shareCountMethod(BoardDTO bdto);
	public void insertShareMethod(BoardDTO bdto);
	public void deleteShareMethod(BoardDTO bdto);
	public int selectWriterMethod(BoardDTO bdto);
	public int postCountMethod(int user_code);
	public BoardDTO selectDetailMethod(HashMap<String, Integer> map);
	public int postMethod(BoardDTO bdto);
		
	
}//end interface
