package controller;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;

import dto.PointDTO;
import service.UserService;
import socket.WebSocketHandler;

import dto.ChargeDTO;
import dto.UserDTO;
import dto.WithdrawDTO;
import service.PaymentService;

@Controller
public class PaymentController {
	@Autowired
	private UserService userservice;
	
	@Autowired
	private PaymentService paymentService;
	
	public PaymentController() {
		
	}

	@RequestMapping("/payment.do")
	public String paymentForm(Model model, HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		UserDTO ulist = userservice.selectInfoProcess(user_code);
		
		Map<String, String> map= new HashMap<String,String>();
		map.put("user_code",Integer.toString(user_code));
		map.put("start", "0");
		Calendar c = new GregorianCalendar();
		c.setTime(new Date());
		String startterm=Integer.toString(c.get(Calendar.YEAR))+'-'
						+Integer.toString(c.get(Calendar.MONTH))+'-'
						+Integer.toString(c.get(Calendar.DATE));
		String endterm=Integer.toString(c.get(Calendar.YEAR))+'-'
					+Integer.toString(c.get(Calendar.MONTH)+1)+'-'
					+Integer.toString(c.get(Calendar.DATE));
		map.put("startterm",startterm);
		map.put("endterm",endterm);
		
		model.addAttribute("pointList",paymentService.pointListProcess(map));
		model.addAttribute("user_code",user_code);
		model.addAttribute("user_photo",ulist.getUser_photo());
		model.addAttribute("user_point",ulist.getUser_point());
		
		return "paymentPage";
	} 
	
	@RequestMapping("/pointListOpen.do")
	@ResponseBody
	public List<PointDTO> pointListCalProcess(HttpSession session, int start, String startterm, String endterm){
		int user_code = (int) session.getAttribute("user_code");
		Map<String, String> map= new HashMap<String, String>();
		map.put("user_code",Integer.toString(user_code));
		map.put("start", Integer.toString(start));
		map.put("startterm", startterm);
		map.put("endterm", endterm);
		return paymentService.pointListProcess(map);
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
		paymentService.donateProcess(pdto);
		System.out.println("여기는 들어오니?");
		WebSocketMessage<String> sendMsg = new TextMessage("5|"+pdto.getPoint_receiver());
		System.out.println(sendMsg.getPayload());
		WebSocketHandler handler = WebSocketHandler.getInstance();
		if(handler.getUserList().get(String.valueOf(pdto.getPoint_receiver()))!=null) {
			handler.handleMessage(handler.getUserList().get(String.valueOf(pdto.getPoint_receiver())), sendMsg);
		}
		return true;
		}
		catch(Exception e) {
			return false;
		}
	}
	
	@RequestMapping("/paywithdraw.do")
	public String paywidthdraw(Model model, HttpSession session) {
		return "paywithdraw";
	} 
	
	@RequestMapping("/paywithdrawprocess.do")
	public String paywidthdrawinsertproccess(Model model, HttpSession session, 
			String name, String identitynum0, String identitynum1, int point, String bank, String account, String holder) {
		int user_code = (int) session.getAttribute("user_code");
		WithdrawDTO wdto = new WithdrawDTO();
		wdto.setUser_code(user_code);
		wdto.setWithdraw_name(name);
		wdto.setWithdraw_identitynum(identitynum1+'-'+identitynum1);
		wdto.setWithdraw_amount(point);
		wdto.setWithdraw_account(account);
		wdto.setWithdraw_bank(bank);
		wdto.setWithdraw_holder(holder);
		paymentService.withdrawinsertProcess(wdto);
		return "paywithdraw";
	} 
	
	@RequestMapping("/paywithdrawlist.do")
	public String paywidthdrawlist(Model model, HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		
		Map<String, String> map= new HashMap<String,String>();
		map.put("user_code",Integer.toString(user_code));
		map.put("start", "0");
		model.addAttribute("withdrawlist", paymentService.withdrawListProcess(map));
		return "paywithdrawlist";
	} 
	
	@RequestMapping("/withdrawListOpen.do")
	@ResponseBody
	public List<WithdrawDTO> withdrawListProcess(HttpSession session, int start){
		int user_code = (int) session.getAttribute("user_code");
		Map<String, String> map= new HashMap<String, String>();
		map.put("user_code",Integer.toString(user_code));
		map.put("start", Integer.toString(start));
		return paymentService.withdrawListProcess(map);
	}
	
	@RequestMapping("/paycharge.do")
	public String paycharge(Model model, HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		
		return "paycharge";
	} 

	@RequestMapping("/paychargeprocess.do")
	@ResponseBody
	public boolean paychargeprocess(Model model, HttpSession session, int charge) {
		int user_code = (int) session.getAttribute("user_code");
		ChargeDTO cdto = new ChargeDTO();
		cdto.setUser_code(user_code);
		cdto.setCharge_amount(charge);
		paymentService.chargeInsertProcess(cdto);
		return true;
	} 	
	
	@RequestMapping("/paychargelist.do")
	public String paychargelist(Model model, HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		
		Map<String, String> map= new HashMap<String,String>();
		map.put("user_code",Integer.toString(user_code));
		map.put("start", "0");
		model.addAttribute("chargelist", paymentService.chargeListProcess(map));
		System.out.println(paymentService.chargeListProcess(map).size());
		return "paychargelist";
	} 
	
	@RequestMapping("/chargeListOpen.do")
	@ResponseBody
	public List<ChargeDTO> chargeListProcess(HttpSession session, int start){
		int user_code = (int) session.getAttribute("user_code");
		Map<String, String> map= new HashMap<String, String>();
		map.put("user_code",Integer.toString(user_code));
		map.put("start", Integer.toString(start));
		System.out.println("listopen:"+paymentService.chargeListProcess(map).size());
		return paymentService.chargeListProcess(map);
	}
}