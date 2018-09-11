package dao;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.ReplyDTO;
import dto.ReportDTO;
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
	public void insertScrapMethod(BoardDTO bdto);
	public void deleteScrapMethod(BoardDTO bdto);
	public int selectWriterMethod(BoardDTO bdto);
	public int checkBoardStateMethod(int board_num);
	public int postCountMethod(int user_code);
	public BoardDTO selectDetailMethod(HashMap<String, Integer> map);
	public int postMethod(BoardDTO bdto);
	public void deletePostMethod(int board_num);
	public void reportPostMethod(ReportDTO rdto);
	public void updatePostMethod(BoardDTO bdto);
	public List<ReplyDTO> selectReplyListMethod(ReplyDTO rdto);
	public void InsertReplyMethod(ReplyDTO rdto);
	public void deleteReplyMehtod(int reply_num);
	public void updateReplyMehtod(ReplyDTO rdto);
	public List<BoardDTO> selectTimelineMovieMethod(HashMap<String, Object> map);
	public List<BoardDTO> selectTimelineHashtagMethod(HashMap<String, Object> map);
	public List<BoardDTO> selectTimelineFollowMethod(HashMap<String, Object> map);
	public List<BoardDTO> selectTimelineLikeMethod(HashMap<String, Object> map);
}//end interface