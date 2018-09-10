package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;

import dto.BoardDTO;
import dto.ReplyDTO;
import dto.UserDTO;
import service.BoardService;
import service.UserService;
import socket.WebSocketHandler;

// http://localhost:8090/moons/list.do

@Controller
public class BoardController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/timeline.do")
	public String timeline(Model model, HttpSession session, int user_code) {
		/*HashMap<String, Integer> map_list = new HashMap<String, Integer>();
		HashMap<String, Integer> map_grid = new HashMap<String, Integer>();
		
		map_list.put("my_code", (int) session.getAttribute("user_code"));
		map_list.put("writer_code", user_code);
		map_list.put("start", 0);
		
		map_grid.put("writer_code",user_code);
		map_grid.put("start", 0);*/
		
		UserDTO udto = new UserDTO();
		udto.setUser_code(user_code);

		model.addAttribute("userInfo", userService.selectInfoProcess(user_code)); // 닉네임, 아이디, 사진, 자기소개, 게시물수, 팔로잉수, 팔로워수
		
		/*model.addAttribute("postCount", boardService.postCountProcess(user_code));
		model.addAttribute("following", userService.followCountProcess(udto));
		model.addAttribute("follower", userService.followerCountProcess(udto));
		model.addAttribute("bList", boardService.selectListProcess(map_list));
		model.addAttribute("bGrid", boardService.selectGridProcess(map_grid));*/
		return "timeline";
	}
	
	@RequestMapping(value="/timelineMenu.do")
	@ResponseBody
	public List<BoardDTO> timelineMenu(Model model, HttpSession session, int user_code, int listType, int viewType) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		if(viewType==1) {
			map.put("my_code", (int) session.getAttribute("user_code"));
			map.put("writer_code", user_code);
			map.put("start", 0);
			map.put("listType", listType);
			
			return boardService.selectListProcess(map);
		} else {			
			map.put("writer_code",user_code);
			map.put("start", 0);
			map.put("listType", listType);
			
			return boardService.selectGridProcess(map);
		}
	}
	
	@RequestMapping(value="/timelineAdd.do",method=RequestMethod.POST)
	public @ResponseBody List<BoardDTO> timelineList(Model model, HttpSession session, int user_code, int start, int listType, int viewType) {
		HashMap<String, Integer> map= new HashMap<String,Integer>();
		
		if(viewType==1) {
			map.put("my_code", (int) session.getAttribute("user_code"));
			map.put("writer_code", user_code);
			map.put("start", start);
			map.put("listType", listType);
			
			return boardService.selectListProcess(map);
		} else {			
			map.put("writer_code",user_code);
			map.put("start", start);
			map.put("listType", listType);
			
			return boardService.selectGridProcess(map);
		}
	}
	
	/*// List 형식
	@RequestMapping(value="/timelineList.do",method=RequestMethod.POST)
	public @ResponseBody List<BoardDTO> timelineList(Model model, HttpSession session, int user_code, int start) {
		HashMap<String, Integer> map= new HashMap<String,Integer>();
		map.put("my_code",user_code);
		map.put("writer_code", start);
		map.put("start", start);
	
		return boardService.selectListProcess(map);
	}
	
	// Grid 형식
	@RequestMapping(value="/timelineGrid.do",method=RequestMethod.POST)
	public @ResponseBody List<BoardDTO> timelineGrid(Model model, int user_code, int start){
		HashMap<String, Integer> map= new HashMap<String,Integer>();
		map.put("writer_code",user_code);
		map.put("start", start);
		
		return boardService.selectGridProcess(map);
	}*/
	
	@RequestMapping(value="/timelineDetail.do")
	public String detail(Model model, HttpSession session, int board_num) {		
		if(session.getAttribute("user_code")!=null) {
			int user_code = (int) session.getAttribute("user_code");
		
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("user_code",user_code);
			map.put("board_num", board_num);
			
			model.addAttribute("bdto", boardService.selectDetailProcess(map));
			model.addAttribute("userInfo", userService.selectInfoProcess(user_code));
		} else {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("board_num", board_num);
			
			model.addAttribute("bdto", boardService.selectDetailProcess(map));
		}
		
		return "timelineDetail";
	}
	

	@RequestMapping(value="/replyInsertList.do")
	@ResponseBody
	public List<ReplyDTO> replyIns(ReplyDTO rdto, HttpSession sesssion){
		int user_code=(int)sesssion.getAttribute("user_code");
		rdto.setUser_code(user_code);
		return boardService.insertReplyProcess(rdto);
	}
	
	//댓글삭제
	@RequestMapping(value="/replyDelete.do")
	@ResponseBody
	public List<ReplyDTO> replyDel(ReplyDTO rdto, int board_num) {
		rdto.setBoard_num(board_num);
		return boardService.deleteReplyProcess(rdto);
	}
	
	//댓글수정
	@RequestMapping(value="/replyUpdate.do")
	@ResponseBody
	public List<ReplyDTO> repModify(ReplyDTO rdto, int board_num){
		rdto.setBoard_num(board_num);
		return boardService.updateReplyProcess(rdto);
	}
		 
	//좋아요 클릭시 +1증가시켜 ajax로 뿌리기 위한 메소드
	@RequestMapping(value="/likePro.do")
	public @ResponseBody int likePro(BoardDTO bdto, HttpSession session) throws Exception {
		int user_code = (int) session.getAttribute("user_code");
		
		bdto.setUser_code(user_code);
		
		if(bdto.getIsLike())
			boardService.deleteLikeProcess(bdto);
		else {
			boardService.insertLikeProcess(bdto);
			WebSocketMessage<String> sendMsg = new TextMessage("5|"+boardService.selectWriterProcess(bdto));
			WebSocketHandler handler = WebSocketHandler.getInstance();
			if(handler.getUserList().get(String.valueOf(boardService.selectWriterProcess(bdto)))!=null)
				handler.handleMessage(handler.getUserList().get(String.valueOf(boardService.selectWriterProcess(bdto))), sendMsg);
		}
		
		return boardService.likeCountProcess(bdto);
	}
	
	@RequestMapping(value="/sharePro.do")
	public @ResponseBody int sharePro(BoardDTO bdto, HttpSession session) throws Exception {
		int user_code = (int) session.getAttribute("user_code");
		
		bdto.setUser_code(user_code);
		
		if(bdto.getIsShare())
			boardService.deleteShareProcess(bdto);
		else {
			boardService.insertShareProcess(bdto);
			WebSocketMessage<String> sendMsg = new TextMessage("5|"+boardService.selectWriterProcess(bdto));
			WebSocketHandler handler = WebSocketHandler.getInstance();
			if(handler.getUserList().get(String.valueOf(boardService.selectWriterProcess(bdto)))!=null)
				handler.handleMessage(handler.getUserList().get(String.valueOf(boardService.selectWriterProcess(bdto))), sendMsg);
		}
		
		return boardService.shareCountProcess(bdto);
	}
	
	@RequestMapping(value="/write.do")
	public String writeForm() {
		return "write";
	}
	
	@RequestMapping(value="/uploadFile.do",method=RequestMethod.POST)
	public @ResponseBody String uploadFile(Model model, HttpServletRequest request, MultipartFile file) {
		String root = request.getSession().getServletContext().getRealPath("/");
		
		//C:\job\workspace_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Moons\
		String saveDirectory = root + "images" + File.separator;
		
		if (!file.isEmpty()) { // 수정파일 있을시
			UUID random = UUID.randomUUID(); // 중복파일명을 처리하기 위해 난수값을 생성해서 받아온다.
			String fileName = file.getOriginalFilename();

			File ff = new File(saveDirectory, random + "_" + fileName);
			// 파일경로에 파일명으로 생성
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
				boardService.tempFileProcess(ff.getName());
				return ff.getName();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	@RequestMapping(value="/post.do",method=RequestMethod.POST)
	public String post(Model model, HttpSession session, BoardDTO bdto, String[] fileArray){
		int user_code = (int) session.getAttribute("user_code");
		bdto.setUser_code(user_code);
		
		ArrayList<String> fileList = new ArrayList<String>();
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		boardService.postProcess(bdto);
		int board_num = bdto.getBoard_num();
		
		for(int i=0; i<fileArray.length; i++)
			fileList.add(fileArray[i].replace("[", "").replace("]", "").replace("\"", ""));
		
		map.put("board_num", board_num);
		map.put("fileList", fileList);
		
		boardService.postFileProcess(map);
		model.addAttribute("board_num", board_num);
		
		return "redirect:/timelineDetail.do";
	}
	
	@RequestMapping(value="/deletePost.do",method=RequestMethod.POST)
	public String deletePost(Model model, HttpSession session, HttpServletRequest request, int board_num) {
		int user_code = (int) session.getAttribute("user_code");
		
		List<String> fList = boardService.selectFileProcess(board_num);
		
		String root = request.getSession().getServletContext().getRealPath("/");
		
		//C:\job\workspace_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Moons\
		String saveDirectory = root + "images" + File.separator;
		
		for(String str : fList) {
			File fe = new File(saveDirectory, str);
			if(fe.exists())
				fe.delete();
		}
		
		boardService.deletePostProcess(board_num);
	
		model.addAttribute("user_code", user_code);
		return "redirect:/timeline.do";
	}
	
	@RequestMapping(value="/timelineMovie.do")
	@ResponseBody
	public List<BoardDTO> timelineMovie(Model model, HttpSession session, String board_movie) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_code", (int) session.getAttribute("user_code"));
		map.put("board_movie", board_movie);
		map.put("start", 0);
		
		return boardService.selectTimelineMovieProcess(map);
	}
	
	@RequestMapping(value="/timelineMovieAdd.do")
	@ResponseBody
	public List<BoardDTO> timelineMovieAdd(Model model, HttpSession session, String board_movie, int start) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_code", (int) session.getAttribute("user_code"));
		map.put("board_movie", board_movie);
		map.put("start", start);
		
		return boardService.selectTimelineMovieProcess(map);
	}
	
	@RequestMapping(value="/timelineHashtag.do")
	public String timelineHashtag(Model model, String board_hashtag) {
		model.addAttribute("board_hashtag", board_hashtag);
		
		return "timelineHashtag";
	}
	
	@RequestMapping(value="/timelineHashtagList.do")
	@ResponseBody
	public List<BoardDTO> timelineHashtagList(Model model, HttpSession session, String board_hashtag) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_code", (int) session.getAttribute("user_code"));
		map.put("board_hashtag", board_hashtag);
		map.put("start", 0);
		
		model.addAttribute("board_hashtag", board_hashtag);
		
		return boardService.selectTimelineHashtagProcess(map);
	}
	
	@RequestMapping(value="/timelineHashtagAdd.do")
	@ResponseBody
	public List<BoardDTO> timelineHashtagAdd(HttpSession session, String board_hashtag, int start) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_code", (int) session.getAttribute("user_code"));
		map.put("board_hashtag", board_hashtag);
		map.put("start", start);
		
		return boardService.selectTimelineHashtagProcess(map);
	}
}