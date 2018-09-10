package service;

import java.util.List;

import dto.CommentDTO;

public interface CommentService {
	public List<CommentDTO> commentListProcess(String movie);
	public void commentInsertProcess(CommentDTO dto);
}
