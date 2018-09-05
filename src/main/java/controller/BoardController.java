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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;

import dto.BoardDTO;
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
		
		HashMap<String, Integer> map_list = new HashMap<String, Integer>();
		HashMap<String, Integer> map_grid = new HashMap<String, Integer>();
		// 리퀘스트 바디로 리스트형식으로 출력하도록 하자
		
		map_list.put("my_code", (int) session.getAttribute("user_code"));
		map_list.put("writer_code",user_code);
		map_list.put("start", 0);
		
		map_grid.put("writer_code",user_code);
		map_grid.put("start", 0);

		UserDTO udto = new UserDTO();
		udto.setUser_code(user_code);
		
		
		map_list.put("type",1);
		model.addAttribute("bList", boardService.selectListProcess(map_list)); 
		map_grid.put("type",1);
		model.addAttribute("bGrid", boardService.selectGridProcess(map_grid));
		
		
		map_list.put("type",2);
		model.addAttribute("listScrap",boardService.selectListProcess(map_list)); 
		map_grid.put("type",2);
		model.addAttribute("gridScrap",boardService.selectGridProcess(map_grid));
		
		map_list.put("type",3);
		model.addAttribute("listLike",boardService.selectListProcess(map_list)); 
		map_grid.put("type",3);
		model.addAttribute("gridLike",boardService.selectGridProcess(map_grid));
		
		
		
		model.addAttribute("postCount", boardService.postCountProcess(user_code));
		model.addAttribute("following", userService.followCountProcess(udto));
		model.addAttribute("follower", userService.followerCountProcess(udto));
		System.out.println("여기");
		System.out.println("여기");

		return "timeline";
	}
	
	
	
	/*@RequestMapping(value="/timelineScrap.do")
	public String timelineScrap(Model model, HttpSession session,int user_code) {
		HashMap<String, Integer> map_list = new HashMap<String, Integer>();
		HashMap<String, Integer> map_grid = new HashMap<String, Integer>();
		// 리퀘스트 바디로 리스트형식으로 출력하도록 하자
		map_list.put("my_code",(int) session.getAttribute("user_code"));
		map_list.put("writer_code",user_code);
		map_list.put("start",0);
		
		map_grid.put("writer_code",user_code);
		map_grid.put("start",0);
		
		model.addAttribute("listScrap",boardService.selectScrapListProcess(map_list));
		model.addAttribute("gridScrap", boardService.selectScrapGridProcess(map_grid));
			
		return "timelineScrap";
	}
	
	@RequestMapping(value="/timelineLike.do")
	public String timelineLike(Model model, HttpSession session,int user_code) {
		
		HashMap<String, Integer> map_list = new HashMap<String, Integer>();
		HashMap<String, Integer> map_grid = new HashMap<String, Integer>();
		// 리퀘스트 바디로 리스트형식으로 출력하도록 하자
		map_list.put("my_code",(int) session.getAttribute("user_code"));
		map_list.put("writer_code",user_code);
		map_list.put("start",0);
		
		map_grid.put("writer_code",user_code);
		map_grid.put("start",0);
		
		
		UserDTO udto = new UserDTO();
		udto.setUser_code(user_code);
		
		// 클릭하는 값이 맨 처음값인지 클릭해서 나온 값인지 확인해야한다.
			model.addAttribute("listLike",boardService.selectLikeListProcess(map_list));
			model.addAttribute("gridLike", boardService.selectLikeGridProcess(map_grid));
		
			return "main/timelineLike";
		
	}*/
	
	
	
	@RequestMapping(value="/timelineDetail.do")
	public String detail(Model model, HttpSession session, int board_num) {
		int user_code = (int) session.getAttribute("user_code");
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_code",user_code);
		map.put("board_num", board_num);
		
		model.addAttribute("bdto", boardService.selectDetailProcess(map));
		return "timelineDetail";
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
	
	// List 형식  start 타입 변수 추가
	@RequestMapping(value="/timelineList.do",method=RequestMethod.POST)
	public @ResponseBody List<BoardDTO> timelineList(Model model, HttpSession session, int user_code, int start,int type) {
		HashMap<String, Integer> map= new HashMap<String,Integer>();
		map.put("my_code", (int) session.getAttribute("user_code"));
		map.put("writer_code", user_code);
		map.put("start", start);
		map.put("type", type);
		
		return boardService.selectListProcess(map);
	}
	
	
	// Grid 형식
	@RequestMapping(value="/timelineGrid.do",method=RequestMethod.POST)
	public @ResponseBody List<BoardDTO> timelineGrid(Model model, int user_code, int start,int type){
		HashMap<String, Integer> map= new HashMap<String,Integer>();
		map.put("writer_code",user_code);
		map.put("start", start);
		map.put("type",type);
		
		return boardService.selectGridProcess(map);
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
				return ff.getName();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	@RequestMapping(value="/post.do",method=RequestMethod.POST)
	public String post(Model model, HttpSession session, BoardDTO bdto){
		int user_code = (int) session.getAttribute("user_code");
		bdto.setUser_code(user_code);
		
		System.out.println(bdto.getBoard_photo());
		
		boardService.postProcess(bdto);
		model.addAttribute("board_num", bdto.getBoard_num());
		
		return "redirect:/timelineDetail.do";
	}
}