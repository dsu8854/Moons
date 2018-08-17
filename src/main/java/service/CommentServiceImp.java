package service;

import java.util.List;

import dao.CommnetDAO;
import dto.CommentDTO;

public class CommentServiceImp implements CommentService{
	private CommnetDAO commentDao;
	
	public CommentServiceImp() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setCommentDao(CommnetDAO commentDao) {
		this.commentDao = commentDao;
	}


	@Override
	public List<CommentDTO> commentListProcess(String movie) {
		return commentDao.listMethod(movie);
	}

	@Override
	public List<CommentDTO> commentInsertProcess(String movie, CommentDTO dto) {
		commentDao.insertMethod(dto);
		return commentDao.listMethod(movie);
	}
}
