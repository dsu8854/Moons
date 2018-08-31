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

import dto.NoticeDTO;
import service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;

	public NoticeController() {
	}

	@RequestMapping("/notice.do")
	public String noticeForm(Model model, HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		
		Map<String, Integer> map =new HashMap<String, Integer>();
		map.put("user_code",user_code);
		map.put("start", 0);
		
		model.addAttribute("notice_list",noticeService.noticeListProcess(map));
		System.out.println("notice:"+noticeService.noticeListProcess(map).size());
		return "notice"; 
	}
	
	@RequestMapping("/noticelistopen.do")
	@ResponseBody
	public List<NoticeDTO> noticeOpenProcess(String start, String read, HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		Map<String, Integer> map =new HashMap<String, Integer>();
		map.put("user_code",user_code);
		map.put("start", Integer.parseInt(start));
		System.out.println("read:"+read);
		if(read.equals("y") || noticeService.noticeListProcess(map).size()==0) {
			System.out.println("readcheck");
			noticeService.readNoticeProcess(user_code);
		}
		return noticeService.noticeListProcess(map);
	}
	
	@RequestMapping("/noticeRead.do")
	@ResponseBody
	public void noticeRead(HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		
		noticeService.readNoticeProcess(user_code);
	}
	
	@RequestMapping("/noticeCount.do")
	public @ResponseBody int noticeCount(HttpSession session) {
		int user_code = (int) session.getAttribute("user_code");
		
		return noticeService.selectNoticeCountProcess(user_code);
	}
}