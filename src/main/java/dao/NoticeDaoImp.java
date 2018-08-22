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
	public void readNoticeMethod(int user_code) {
		noticeSqlSession.update("notice.readNotice",user_code);
	}

	@Override
	public int selectNoticeCountMethod(int user_code) {
		return noticeSqlSession.selectOne("notice.cnt",user_code);
	}
}