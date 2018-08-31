package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;

import dto.PaymentDTO;
import dto.PointDTO;
import service.PointService;
import service.UserService;
import socket.WebSocketHandler;

@Controller
public class PaymentController {
	@Autowired
	private PointService pointService;
	
	public PaymentController() {
		
	}

	@RequestMapping("/payment.do")
	public String paymentForm(Model model, HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		
		Map<String, Integer> map= new HashMap<String,Integer>();
		map.put("user_code",user_code);
		map.put("start", 0);
		
		model.addAttribute("pointList",pointService.pointListProcess(map));
		model.addAttribute("user_point", pointService.selectPointProcess(user_code));

		return "paymentPage";
	} 
	
	@RequestMapping("/pointListOpen.do")
	@ResponseBody
	public List<PointDTO> pointListProcess(HttpSession session, int start){
		int user_code = (int) session.getAttribute("user_code");
		Map<String, Integer> map= new HashMap<String,Integer>();
		map.put("user_code",user_code);
		map.put("start", start);
		return pointService.pointListProcess(map);
	}
	
	@RequestMapping("/paymentHistory.do")
	public String payhistory() {
		return "paymentHistory";
	} 
	
	@RequestMapping("/chargeForm.do")
	public String chargeForm() {
		return "chargeForm";
	} 
	
	@RequestMapping("/chargePro.do")
	public @ResponseBody boolean chargePro(HttpSession session, PaymentDTO pdto) {
		int user_code = (int) session.getAttribute("user_code");
		pdto.setUser_code(user_code);
		
		pointService.chargeProcess(pdto);
		return true;
	} 
	
	@RequestMapping("/pointDraw.do")
	public String pointDraw() {
		return "redirect:/payment.do";
	} 
	
	@RequestMapping("/donateForm.do")
	public String donateForm(Model model, int point_receiver) {
		model.addAttribute("point_receiver", point_receiver);
		return "donateForm";
	}
	
	@RequestMapping("/donatePro.do")
	public @ResponseBody boolean donatePro(HttpSession session, PointDTO pdto) {
		int user_code = (int) session.getAttribute("user_code");
		
		try {
		pdto.setPoint_donater(user_code);
		pointService.donateProcess(pdto);
		WebSocketMessage<String> sendMsg = new TextMessage("5|"+pdto.getPoint_receiver());
		WebSocketHandler handler = WebSocketHandler.getInstance();
		if(handler.getUserList().get(String.valueOf(pdto.getPoint_receiver()))!=null)
			handler.handleMessage(handler.getUserList().get(String.valueOf(pdto.getPoint_receiver())), sendMsg);
		return true;
		}
		catch(Exception e) {
			return false;
		}
	}
}