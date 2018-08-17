package dao;

import java.util.List;

import dto.CommentDTO;

public interface CommnetDAO {
	public List<CommentDTO> listMethod(String movie);
	public void insertMethod(CommentDTO dto);
}
