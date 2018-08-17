package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.NoticeDTO;

public class NoticeDaoImp implements NoticeDAO{
	private SqlSessionTemplate noticeSqlSession;

	public NoticeDaoImp() {

	}
	
	public void setNoticeSqlSession(SqlSessionTemplate noticeSqlSession) {
		this.noticeSqlSession = noticeSqlSession;
	}

	@Override
	public List<NoticeDTO> noticeListMethod(Map<String, Integer> map) {
		return noticeSqlSession.selectList("notice.noticelist",map);
	}

	@Override
	public void noticeReadCheckMethod(int user_code) {
		noticeSqlSession.update("notice.readcheck",user_code);
	}
	
	
}
