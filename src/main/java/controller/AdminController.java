package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.BoardDTO;
import dto.ChargeDTO;
import dto.LinkDTO;
import dto.ReportDTO;
import dto.WithdrawDTO;
import service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/adminMain.do")
	public String adminMain() {
		return "adminMain";
	}
	
	@RequestMapping(value="/adminReport.do")
	public String adminReport(RedirectAttributes redirectAttributes, ReportDTO rdto) {
		if(rdto.getReport_state()!=0) {
			redirectAttributes.addFlashAttribute("report_state", rdto.getReport_state());
		}		
		return "adminReport";
	}
	
	@RequestMapping(value="/adminReportCount.do")
	public @ResponseBody List<ReportDTO> adminReportCount(int report_state) {
		return adminService.selectReportCountProcess(report_state);
	}
	
	@RequestMapping(value="/adminReportList.do")
	public @ResponseBody List<ReportDTO> adminReportDetail(ReportDTO rdto) {
		return adminService.selectReportListProcess(rdto);
	}
	
	@RequestMapping(value="/adminReportUpdate.do")
	public String adminReportUpdate(RedirectAttributes redirectAttributes, ReportDTO rdto) {
		adminService.updateReportProcess(rdto);
		
		redirectAttributes.addFlashAttribute("report_state", rdto.getReport_state());
		return "redirect:/adminReport.do";
	}
	
	@RequestMapping(value="/adminWithdraw.do")
	public String adminWithdraw(RedirectAttributes redirectAttributes, WithdrawDTO wdto) {
		if(wdto.getWithdraw_state()!=0) {
			redirectAttributes.addFlashAttribute("withdraw_state", wdto.getWithdraw_state());
		}	
		return "adminWithdraw";
	}
	
	@RequestMapping(value="/adminWithdrawList.do")
	public @ResponseBody List<WithdrawDTO> adminWithdrawList(int withdraw_state) {
		return adminService.selectWithdrawListProcess(withdraw_state);
	}
	
	@RequestMapping(value="/adminChargeList.do")
	public @ResponseBody List<ChargeDTO> adminChargeList() {
		return adminService.selectChargeListProcess();
	}
	
	@RequestMapping(value="/adminWithdrawUpdate.do")
	public String adminWithdrawUpdate(RedirectAttributes redirectAttributes, WithdrawDTO wdto) {
		adminService.updateWithdrawProcess(wdto);
		
		redirectAttributes.addFlashAttribute("withdraw_state", wdto.getWithdraw_state());
		return "redirect:/adminWithdraw.do";
	}
	
	@RequestMapping(value="/adminBoard.do")
	public String adminBoard() {
		return "adminBoard";
	}
	
	@RequestMapping(value="/adminBoardList.do")
	@ResponseBody
	public List<BoardDTO> adminBoardList(int search_type) {
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		
		map.put("search_type", search_type);
		map.put("start",0);
		
		return adminService.selectBoardListProcess(map);
	}
	
	/*@RequestMapping(value="/adminBoardAdd.do")
	@ResponseBody
	public List<BoardDTO> adminBoardAdd(int search_type, int start) {
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		
		map.put("search_type", search_type);
		map.put("start",start);
		
		return adminService.selectBoardListProcess(map);
	}*/
	
	@RequestMapping(value="/adminLinkUpdate.do")
	@ResponseBody
	public boolean adminLinkUpdate(LinkDTO ldto) {
		try {
			adminService.updateLinkProcess(ldto);
			return true;
		} catch(Exception e) {
			return false;
		}
	}
}