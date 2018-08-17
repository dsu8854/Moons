package service;

import java.util.List;
import java.util.Map;

import dto.NoticeDTO;

public interface NoticeService {
	public List<NoticeDTO> noticeListProcess(Map<String, Integer> map);
	public void noticeReadCheckProcess(int user_code);
}
