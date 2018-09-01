package service;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.ReplyDTO;
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
	public void tempFileProcess(String file_name);
	public void postFileProcess(HashMap<String, Object> map);
	public List<String> selectFileProcess(int board_num);
	public void deletePostProcess(int board_num);
	public List<ReplyDTO> selectReplyListProcess(ReplyDTO rdto);
}//end interface