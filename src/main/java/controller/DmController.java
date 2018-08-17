package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;

import dto.DmDTO;
import service.DmService;
import socket.WebSocketHandler;

@Controller
public class DmController {
	@Autowired
	private DmService dmService;
	
	@RequestMapping(value="/dmList.do")
	public String dmList(Model model, HttpSession session) throws Exception {
		int user_code = (int) session.getAttribute("user_code");
		
		DmDTO ddto = new DmDTO();
		ddto.setUser_code(user_code);
		model.addAttribute("dmList", dmService.selectListProcess(ddto));
		
		return "dmList";
	}
	
	@RequestMapping(value="/dmRoom.do")
	public String dmRoom(Model model, HttpSession session, DmDTO ddto) throws Exception {
		int user_code = (int) session.getAttribute("user_code");		
		ddto.setUser_code(user_code);

		model.addAttribute("nowUser", ddto.getUser_code());
		model.addAttribute("dm_receiver", ddto.getDm_receiver());
		model.addAttribute("yourInfo", dmService.selectYourInfoProcess(ddto));
		model.addAttribute("dmList", dmService.selectDmProcess(ddto));
		
		return "dmRoom";
	}
	
	@RequestMapping(value="/dmIns.do")
	public @ResponseBody DmDTO dmInsert(DmDTO ddto) throws Exception {
		if(dmService.insertDmProcess(ddto)==1) {
			WebSocketMessage<String> sendMsg = new TextMessage("6|"+ddto.getDm_receiver()+"|"+ddto.getUser_code()+"|"+ddto.getDm_content());
			WebSocketHandler handler = WebSocketHandler.getInstance();
			if(handler.getUserList().get(String.valueOf(ddto.getDm_receiver()))!=null)
				handler.handleMessage(handler.getUserList().get(String.valueOf(ddto.getDm_receiver())), sendMsg);
			return ddto;
		} else {
			return null;
		}
	}
}