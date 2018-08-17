package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.BoardDTO;
import dto.UserDTO;
import service.BoardService;

// http://localhost:8090/moons/list.do

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/timeline.do")
	public String list(Model model, HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		
		UserDTO udto = new UserDTO();
		udto.setUser_code(user_code);
		
		model.addAttribute("bList", boardService.selectListProcess(udto));
		
		System.out.println(boardService.selectListProcess(udto).size());
		
		return "timeline";
	}
	
	//좋아요 클릭시 +1증가시켜 ajax로 뿌리기 위한 메소드
	@RequestMapping(value="/likePro.do")
	public @ResponseBody int likePro(BoardDTO bdto, HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		
		bdto.setUser_code(user_code);
		
		if(bdto.getIsLike())
			boardService.deleteLikeProcess(bdto);
		else
			boardService.insertLikeProcess(bdto);
		
		return boardService.selectLikeProcess(bdto);
	}
	
	@RequestMapping(value="/sharePro.do")
	public @ResponseBody int sharePro(BoardDTO bdto, HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		
		bdto.setUser_code(user_code);
		
		if(bdto.getIsShare())
			boardService.deleteShareProcess(bdto);
		else
			boardService.insertShareProcess(bdto);
		
		return boardService.selectShareProcess(bdto);
	}
	
	@RequestMapping(value="/write.do")
	public String writeForm() {
		return "write";
	}
}