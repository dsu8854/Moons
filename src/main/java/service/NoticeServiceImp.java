package service;

import java.util.List;
import java.util.Map;

import dao.NoticeDAO;
import dto.NoticeDTO;

public class NoticeServiceImp implements NoticeService{
	private NoticeDAO noticeDao;

	public NoticeServiceImp() {

	}
	
	public void setNoticeDao(NoticeDAO noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public List<NoticeDTO> noticeListProcess(Map<String, Integer> map) {
		return noticeDao.noticeListMethod(map);
	}

	@Override
	public void readNoticeProcess(int user_code) {
		noticeDao.readNoticeMethod(user_code);
	}

	@Override
	public int selectNoticeCountProcess(int user_code) {
		return noticeDao.selectNoticeCountMethod(user_code);
	}
}
