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

import dto.PointDTO;
import service.PointService;
import service.UserService;

@Controller
public class PaymentController {
	@Autowired
	private UserService userservice;
	@Autowired
	private PointService pointService;
	
	public PaymentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@RequestMapping("/payment.do")
	public String paymentForm(Model model, HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		
		Map<String, Integer> map= new HashMap<String,Integer>();
		map.put("user_code",user_code);
		map.put("start", 0);
		
		model.addAttribute("pointList",pointService.pointListProcess(map));
		model.addAttribute("user_code",user_code);
		model.addAttribute("user_photo",userservice.selectPhotoProcess(user_code));

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
	
	@RequestMapping("/payhistory.do")
	public ModelAndView payhistory() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main/payhistory");
		return mav;
	} 
	
	@RequestMapping("/paycharge.do")
	public String paycharge() {
		return "paymentPage";
	} 
	
	@RequestMapping("/paywithdraw.do")
	public String paywidthdraw() {
		return "paymentPage";
	} 
}
