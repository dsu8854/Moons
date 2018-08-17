package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.NoticeDTO;

public interface NoticeDAO {
	public List<NoticeDTO> noticeListMethod(Map<String, Integer> map);
	public void noticeReadCheckMethod(int user_code);
}
