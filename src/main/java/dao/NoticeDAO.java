package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.NoticeDTO;

public interface NoticeDAO {
	public List<NoticeDTO> noticeListMethod(Map<String, Integer> map);
	public void readNoticeMethod(int user_code);
	public int selectNoticeCountMethod(int user_code);
}
