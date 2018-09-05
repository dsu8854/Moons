package service;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.UserDTO;


public interface BoardService {
	public List<BoardDTO> selectListProcess(HashMap<String, Integer> map);	
	public List<BoardDTO> selectGridProcess(HashMap<String, Integer> map);
	public int likeCountProcess(BoardDTO bdto);
	public void insertLikeProcess(BoardDTO bdto);
	public void deleteLikeProcess(BoardDTO bdto);
	public int shareCountProcess(BoardDTO bdto);
	public void insertShareProcess(BoardDTO bdto);
	public void deleteShareProcess(BoardDTO bdto);
	public int selectWriterProcess(BoardDTO bdto);
	public int postCountProcess(int user_code);
	public BoardDTO selectDetailProcess(HashMap<String, Integer> map);
	public int postProcess(BoardDTO bdto);
	
	/*
	public List<BoardDTO> selectScrapListProcess(HashMap<String, Integer> map);	
	public List<BoardDTO> selectScrapGridProcess(HashMap<String, Integer> map);	
	
	public List<BoardDTO> selectLikeListProcess(HashMap<String, Integer> map);
	public List<BoardDTO> selectLikeGridProcess(HashMap<String, Integer> map);
	*/
	
	
	
}//end interface