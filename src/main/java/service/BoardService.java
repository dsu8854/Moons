package service;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.ReplyDTO;
import dto.ReportDTO;

public interface BoardService {
	public List<BoardDTO> selectListProcess(HashMap<String, Integer> map);	
	public List<BoardDTO> selectGridProcess(HashMap<String, Integer> map);
	public int likeCountProcess(BoardDTO bdto);
	public void insertLikeProcess(BoardDTO bdto);
	public void deleteLikeProcess(BoardDTO bdto);
	public int shareCountProcess(BoardDTO bdto);
	public void insertShareProcess(BoardDTO bdto);
	public void deleteShareProcess(BoardDTO bdto);
	public void insertScrapProcess(BoardDTO bdto);
	public void deleteScrapProcess(BoardDTO bdto);
	public int selectWriterProcess(BoardDTO bdto);
	public int checkBoardStateProcess(int board_num);
	public int postCountProcess(int user_code);
	public BoardDTO selectDetailProcess(HashMap<String, Integer> map);
	public int postProcess(BoardDTO bdto);
	public void deletePostProcess(int board_num);
	public void reportPostProcess(ReportDTO rdto);
	public void updatePostProcess(BoardDTO bdto);
	public List<ReplyDTO> selectReplyProcess(ReplyDTO rdto);
	public void insertReplyProcess(ReplyDTO rdto);
	public void deleteReplyProcess(ReplyDTO rdto);
	public void updateReplyProcess(ReplyDTO rdto);
	public List<BoardDTO> selectTimelineMovieProcess(HashMap<String, Object> map);
	public List<BoardDTO> selectTimelineHashtagProcess(HashMap<String, Object> map);
	public List<BoardDTO> selectTimelineFollowProcess(HashMap<String, Object> map);
	public List<BoardDTO> selectTimelineLikeProcess(HashMap<String, Object> map);
	public List<BoardDTO> selectTimelineAllProcess(HashMap<String, Object> map);
}//end interface